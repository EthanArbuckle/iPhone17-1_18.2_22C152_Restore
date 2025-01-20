@interface HMIVideoFragment
+ (BOOL)canFragmentData:(id)a3;
+ (BOOL)isInitializationSegment:(id)a3 combinableWithInitializationSegment:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (void)fragmentData:(id)a3 handler:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)baseDecodeTimeStamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($94156A41BB1A692D44714D0EDB14C87A)audioTrackTimeRange;
- ($94156A41BB1A692D44714D0EDB14C87A)timeRange;
- ($94156A41BB1A692D44714D0EDB14C87A)videoTrackTimeRange;
- (BOOL)frameReorderingRequired;
- (BOOL)isCombinableWithFragment:(id)a3;
- (HMIVideoFragment)initWithCoder:(id)a3;
- (HMIVideoFragment)initWithData:(id)a3;
- (HMIVideoFragment)initWithData:(id)a3 timeRange:(id *)a4;
- (HMIVideoFragment)initWithFragments:(id)a3;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 sequenceNumbers:(id)a5;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 firstVideoSampleByteRange:(_NSRange)a6;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6;
- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6 firstVideoSampleByteRange:(_NSRange)a7;
- (NSArray)sequenceNumbers;
- (NSData)data;
- (NSData)initializationSegment;
- (NSData)sanitizedData;
- (NSData)sanitizedSeperableSegment;
- (NSData)separableSegment;
- (_NSRange)firstVideoSampleByteRange;
- (id)attributeDescriptions;
- (id)redactedCopy;
- (id)redactedCopyWithMetadata;
- (opaqueCMFormatDescription)audioFormatDescription;
- (opaqueCMFormatDescription)videoFormatDescription;
- (unint64_t)sequenceNumber;
- (void)_ensureAttributes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoFragment

- (HMIVideoFragment)initWithData:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
  v5[0] = *MEMORY[0x263F010C0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
  return [(HMIVideoFragment *)self initWithData:a3 timeRange:v5];
}

- (HMIVideoFragment)initWithData:(id)a3 timeRange:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  v8 = [v6 data];
  long long v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  v10 = [(HMIVideoFragment *)self initWithInitializationSegment:v8 separableSegment:v7 timeRange:v12];

  return v10;
}

- (HMIVideoFragment)initWithFragments:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 firstObject];
    v6 = [MEMORY[0x263EFF990] data];
    id v7 = [MEMORY[0x263EFF980] array];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__HMIVideoFragment_initWithFragments___block_invoke;
    v16[3] = &unk_26477D268;
    id v17 = v5;
    id v18 = v6;
    id v19 = v7;
    id v8 = v7;
    id v9 = v6;
    id v10 = v5;
    objc_msgSend(v4, "na_each:", v16);
    v11 = [v10 initializationSegment];
    v12 = [(HMIVideoFragment *)self initWithInitializationSegment:v11 separableSegment:v9];

    return v12;
  }
  else
  {
    uint64_t v14 = _HMFPreconditionFailure();
    __38__HMIVideoFragment_initWithFragments___block_invoke(v14, v15);
  }
  return result;
}

void __38__HMIVideoFragment_initWithFragments___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCombinableWithFragment:"))
  {
    long long v3 = *(void **)(a1 + 40);
    id v4 = [v9 separableSegment];
    [v3 appendData:v4];

    v5 = *(void **)(a1 + 48);
    v6 = [v9 sequenceNumbers];
    [v5 addObjectsFromArray:v6];
  }
  else
  {
    id v7 = (HMIVideoFragment *)_HMFPreconditionFailure();
    [(HMIVideoFragment *)v7 redactedCopy];
  }
}

- (id)redactedCopy
{
  long long v3 = [HMIVideoFragment alloc];
  id v4 = [MEMORY[0x263EFF8F8] data];
  v5 = [MEMORY[0x263EFF8F8] data];
  [(HMIVideoFragment *)self timeRange];
  v6 = [(HMIVideoFragment *)self sequenceNumbers];
  uint64_t v7 = [(HMIVideoFragment *)self firstVideoSampleByteRange];
  id v9 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](v3, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v4, v5, &v11, v6, v7, v8);

  return v9;
}

- (id)redactedCopyWithMetadata
{
  long long v3 = [MEMORY[0x263EFF990] data];
  id v4 = [(HMIVideoFragment *)self separableSegment];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__HMIVideoFragment_redactedCopyWithMetadata__block_invoke;
  _OWORD v12[3] = &unk_26477D290;
  id v13 = v3;
  id v5 = v3;
  HMIMP4Parse(v4, 0, v12);

  v6 = [HMIVideoFragment alloc];
  uint64_t v7 = [(HMIVideoFragment *)self initializationSegment];
  [(HMIVideoFragment *)self timeRange];
  uint64_t v8 = [(HMIVideoFragment *)self sequenceNumbers];
  id v9 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](v6, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v7, v5, v11, v8, 0, 0);

  return v9;
}

uint64_t __44__HMIVideoFragment_redactedCopyWithMetadata__block_invoke(uint64_t a1, int a2)
{
  if (a2 != 1835295092) {
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  }
  return 1;
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
  v6[0] = *MEMORY[0x263F010C0];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
  return [(HMIVideoFragment *)self initWithInitializationSegment:a3 separableSegment:a4 timeRange:v6];
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 sequenceNumbers:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
  *(_OWORD *)v23 = *MEMORY[0x263F010C0];
  *(_OWORD *)&v23[16] = v11;
  long long v24 = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
  v12 = [(HMIVideoFragment *)self initWithInitializationSegment:v8 separableSegment:v9 timeRange:v23];
  id v13 = v12;
  if (v12)
  {
    if ([(NSArray *)v12->_sequenceNumbers count] && HMFEqualObjects())
    {
      uint64_t v14 = (void *)MEMORY[0x22A641C70]();
      v15 = v13;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        sequenceNumbers = v13->_sequenceNumbers;
        *(_DWORD *)v23 = 138543874;
        *(void *)&v23[4] = v17;
        *(_WORD *)&v23[12] = 2112;
        *(void *)&v23[14] = v10;
        *(_WORD *)&v23[22] = 2112;
        *(void *)&v23[24] = sequenceNumbers;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@Provided sequenceNumbers: %@, don't match fragment's sequenceNumbers: %@", v23, 0x20u);
      }
    }
    uint64_t v19 = [v10 copy];
    v20 = v13->_sequenceNumbers;
    v13->_sequenceNumbers = (NSArray *)v19;

    v13->_videoFormatDescription = 0;
    v13->_audioFormatDescription = 0;
    v13->_attributesLoaded = 0;
    uint64_t v21 = MEMORY[0x263F01090];
    *(_OWORD *)&v13->_baseDecodeTimeStamp.value = *MEMORY[0x263F01090];
    v13->_baseDecodeTimeStamp.epoch = *(void *)(v21 + 16);
    v13->_frameReorderingRequired = 1;
  }

  return v13;
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", a3, a4, v7, 0, 0);
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 firstVideoSampleByteRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  id v12 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  id v13 = [MEMORY[0x263EFF980] array];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke;
  v19[3] = &unk_26477D2E0;
  uint64_t v21 = v22;
  id v14 = v13;
  id v20 = v14;
  HMIMP4Parse(v12, 0, v19);
  long long v15 = *(_OWORD *)&a5->var0.var3;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v15;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  v16 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", v11, v12, v18, v14, location, length);

  _Block_object_dispose(v22, 8);
  return v16;
}

uint64_t __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  if (a2 == 1836019558)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_2;
    v10[3] = &unk_26477D2E0;
    long long v9 = *(_OWORD *)(a1 + 32);
    id v7 = (id)v9;
    long long v11 = v9;
    HMIMP4Parse(a4, 0, v10);
  }
  return 1;
}

uint64_t __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_3;
  _OWORD v7[3] = &unk_26477D2B8;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v8 = v6;
  HMIMP4ParseMFHD(a3, v7);

  return 0;
}

void __103__HMIVideoFragment_initWithInitializationSegment_separableSegment_timeRange_firstVideoSampleByteRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6
{
  long long v6 = *(_OWORD *)&a5->var0.var3;
  v8[0] = *(_OWORD *)&a5->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a5->var1.var1;
  return -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:sequenceNumbers:firstVideoSampleByteRange:", a3, a4, v8, a6, 0, 0);
}

- (HMIVideoFragment)initWithInitializationSegment:(id)a3 separableSegment:(id)a4 timeRange:(id *)a5 sequenceNumbers:(id)a6 firstVideoSampleByteRange:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMIVideoFragment;
  id v17 = [(HMIVideoFragment *)&v25 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initializationSegment, a3);
    objc_storeStrong((id *)&v18->_separableSegment, a4);
    long long v20 = *(_OWORD *)&a5->var0.var3;
    long long v19 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v18->_timeRange.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&v18->_timeRange.start.epoch = v20;
    *(_OWORD *)&v18->_timeRange.duration.timescale = v19;
    uint64_t v21 = [v16 copy];
    sequenceNumbers = v18->_sequenceNumbers;
    v18->_sequenceNumbers = (NSArray *)v21;

    v18->_firstVideoSampleByteRange.NSUInteger location = location;
    v18->_firstVideoSampleByteRange.NSUInteger length = length;
    int v23 = (_OWORD *)MEMORY[0x263F01090];
    v18->_baseDecodeTimeStamp.epoch = *(void *)(MEMORY[0x263F01090] + 16);
    *(_OWORD *)&v18->_baseDecodeTimeStamp.value = *v23;
  }

  return v18;
}

- (void)_ensureAttributes
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_attributesLoaded) {
    return;
  }
  CFTypeRef v26 = 0;
  CFTypeRef v27 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  CFTypeRef v25 = 0;
  CFArrayRef theArray = 0;
  CFTypeRef cf = 0;
  CFTypeRef v20 = 0;
  CFTypeRef v21 = 0;
  id v3 = [(HMIVideoFragment *)self data];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v5 = v3;
  long long v6 = (void *)[v5 bytes];
  size_t v7 = [v5 length];
  CMTimeFlags v8 = CMBlockBufferCreateWithMemoryBlock(v4, v6, v7, (CFAllocatorRef)*MEMORY[0x263EFFB28], 0, 0, [v5 length], 2u, &blockBufferOut);
  if (!v8)
  {
    CMTimeFlags v8 = CMByteStreamCreateForBlockBuffer();
    if (!v8)
    {
      Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F12420], @"video/mp4");
      CFRelease(@"video/mp4");
      CMTimeFlags v15 = FigFormatReaderCreateForStreamReturningResults();
      if (v15)
      {
LABEL_28:
        CMTimeFlags v9 = v15;
        goto LABEL_5;
      }
      CMTimeFlags v16 = FigFormatReaderCopyTrackByType((uint64_t)v25, 1986618469, (uint64_t)&v27);
      if (v16 != -12843)
      {
        CMTimeFlags v9 = v16;
        if (v16) {
          goto LABEL_5;
        }
        CMTimeFlags v15 = FigTrackReaderCopyProperty((uint64_t)v27, *MEMORY[0x263F12478], (uint64_t)v4, (uint64_t)&theArray);
        if (v15) {
          goto LABEL_28;
        }
        CMTimeFlags v9 = FigTrackReaderCopyProperty((uint64_t)v27, *MEMORY[0x263F12480], (uint64_t)v4, (uint64_t)&v21);
        if (v21) {
          self->_frameReorderingRequired = CFBooleanGetValue((CFBooleanRef)v21) != 0;
        }
        else {
          self->_frameReorderingRequired = 1;
        }
        if (v9) {
          goto LABEL_5;
        }
        if (CFArrayGetCount(theArray) >= 1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
          self->_videoFormatDescription = (opaqueCMFormatDescription *)CFRetain(ValueAtIndex);
        }
        if (theArray) {
          CFRelease(theArray);
        }
        CFArrayRef theArray = 0;
        getTimeRangeAssetTrackProperty((uint64_t)v25, (uint64_t)v27, &self->_videoTrackTimeRange.start.value);
        CMTimeFlags v15 = FigTrackReaderCopyProperty((uint64_t)v27, *MEMORY[0x263F12488], (uint64_t)v4, (uint64_t)&v20);
        if (v15) {
          goto LABEL_28;
        }
        if (v20)
        {
          CMTimeMakeFromDictionary((CMTime *)&buf, (CFDictionaryRef)v20);
          self->_baseDecodeTimeStamp = buf;
        }
      }
      CMTimeFlags v18 = FigFormatReaderCopyTrackByType((uint64_t)v25, 1936684398, (uint64_t)&v26);
      if (v18 != -12843)
      {
        CMTimeFlags v9 = v18;
        if (v18) {
          goto LABEL_5;
        }
        CMTimeFlags v15 = FigTrackReaderCopyProperty((uint64_t)v26, *MEMORY[0x263F12478], (uint64_t)v4, (uint64_t)&theArray);
        if (v15) {
          goto LABEL_28;
        }
        if (CFArrayGetCount(theArray) >= 1)
        {
          long long v19 = CFArrayGetValueAtIndex(theArray, 0);
          self->_audioFormatDescription = (opaqueCMFormatDescription *)CFRetain(v19);
        }
        if (theArray) {
          CFRelease(theArray);
        }
        CFArrayRef theArray = 0;
        getTimeRangeAssetTrackProperty((uint64_t)v25, (uint64_t)v26, &self->_audioTrackTimeRange.start.value);
      }
      CMTimeFlags v9 = 0;
      goto LABEL_5;
    }
  }
  CMTimeFlags v9 = v8;
  Mutable = 0;
LABEL_5:
  self->_attributesLoaded = 1;
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v9)
  {
    long long v11 = (void *)MEMORY[0x22A641C70]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      LODWORD(buf.value) = 138543618;
      *(int64_t *)((char *)&buf.value + 4) = (int64_t)v14;
      LOWORD(buf.flags) = 1024;
      *(unsigned int *)((char *)&buf.flags + 2) = v9;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to read fragment data, err: %d", (uint8_t *)&buf, 0x12u);
    }
  }
}

- ($94156A41BB1A692D44714D0EDB14C87A)videoTrackTimeRange
{
  result = ($94156A41BB1A692D44714D0EDB14C87A *)[(HMIVideoFragment *)self _ensureAttributes];
  long long v6 = *(_OWORD *)&self->_videoTrackTimeRange.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->_videoTrackTimeRange.start.value;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->_videoTrackTimeRange.duration.timescale;
  return result;
}

- ($94156A41BB1A692D44714D0EDB14C87A)audioTrackTimeRange
{
  result = ($94156A41BB1A692D44714D0EDB14C87A *)[(HMIVideoFragment *)self _ensureAttributes];
  long long v6 = *(_OWORD *)&self->_audioTrackTimeRange.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->_audioTrackTimeRange.start.value;
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->_audioTrackTimeRange.duration.timescale;
  return result;
}

- (opaqueCMFormatDescription)videoFormatDescription
{
  return self->_videoFormatDescription;
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  return self->_audioFormatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)baseDecodeTimeStamp
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(HMIVideoFragment *)self _ensureAttributes];
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_baseDecodeTimeStamp;
  return result;
}

- (BOOL)frameReorderingRequired
{
  return self->_frameReorderingRequired;
}

- (BOOL)isCombinableWithFragment:(id)a3
{
  id v4 = a3;
  int v5 = CMFormatDescriptionEqual(-[HMIVideoFragment videoFormatDescription](self, "videoFormatDescription"), (CMFormatDescriptionRef)[v4 videoFormatDescription]);
  long long v6 = [(HMIVideoFragment *)self audioFormatDescription];
  size_t v7 = (const opaqueCMFormatDescription *)[v4 audioFormatDescription];

  int v8 = CMFormatDescriptionEqual(v6, v7);
  if (v5) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  return !v9;
}

- (NSData)data
{
  id v3 = [(HMIVideoFragment *)self initializationSegment];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = [(HMIVideoFragment *)self separableSegment];
  [v4 appendData:v5];

  long long v6 = (void *)[v4 copy];
  return (NSData *)v6;
}

- (NSData)sanitizedData
{
  id v3 = [MEMORY[0x263EFF990] data];
  id v4 = [(HMIVideoFragment *)self data];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__HMIVideoFragment_sanitizedData__block_invoke;
  _OWORD v7[3] = &unk_26477D290;
  id v5 = v3;
  id v8 = v5;
  HMIMP4Parse(v4, 0, v7);

  return (NSData *)v5;
}

uint64_t __33__HMIVideoFragment_sanitizedData__block_invoke(uint64_t a1, int a2)
{
  if (a2 != 1835295092) {
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  }
  return 1;
}

- (NSData)sanitizedSeperableSegment
{
  uint64_t v3 = [MEMORY[0x263EFF990] data];
  id v4 = [(HMIVideoFragment *)self separableSegment];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HMIVideoFragment_sanitizedSeperableSegment__block_invoke;
  _OWORD v7[3] = &unk_26477D290;
  id v5 = v3;
  id v8 = v5;
  HMIMP4Parse(v4, 0, v7);

  return (NSData *)v5;
}

uint64_t __45__HMIVideoFragment_sanitizedSeperableSegment__block_invoke(uint64_t a1, int a2)
{
  if (a2 != 1835295092) {
    objc_msgSend(*(id *)(a1 + 32), "appendData:", v2, v3);
  }
  return 1;
}

+ (BOOL)isInitializationSegment:(id)a3 combinableWithInitializationSegment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    size_t v7 = v6;
    if (v6)
    {
      id v8 = [HMIVideoFragment alloc];
      BOOL v9 = [MEMORY[0x263EFF8F8] data];
      id v10 = [(HMIVideoFragment *)v8 initWithInitializationSegment:v5 separableSegment:v9];

      long long v11 = [HMIVideoFragment alloc];
      uint64_t v12 = [MEMORY[0x263EFF8F8] data];
      uint64_t v13 = [(HMIVideoFragment *)v11 initWithInitializationSegment:v7 separableSegment:v12];

      LOBYTE(v12) = [(HMIVideoFragment *)v10 isCombinableWithFragment:v13];
      return (char)v12;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  CMTimeFlags v15 = (void *)_HMFPreconditionFailure();
  +[HMIVideoFragment fragmentData:v17 handler:v18];
  return result;
}

+ (void)fragmentData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 canFragmentData:v6])
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__4;
    v21[4] = __Block_byref_object_dispose__4;
    id v22 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__4;
    void v19[4] = __Block_byref_object_dispose__4;
    id v20 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__4;
    v17[4] = __Block_byref_object_dispose__4;
    id v18 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    int v16 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke;
    v9[3] = &unk_26477D358;
    long long v11 = v21;
    uint64_t v12 = v19;
    uint64_t v13 = v17;
    id v14 = v15;
    id v10 = v7;
    HMIMP4Parse(v6, 0, v9);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
  }
  else
  {
    id v8 = [[HMIVideoFragment alloc] initWithData:v6];
    (*((void (**)(id, HMIVideoFragment *))v7 + 2))(v7, v8);
  }
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke(void *a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2 <= 1836019557)
  {
    if (a2 != 1718909296)
    {
      if (a2 == 1835295092)
      {
        id v10 = (void *)MEMORY[0x22A641C70]();
        long long v11 = [MEMORY[0x263EFF990] dataWithData:*(void *)(*(void *)(a1[5] + 8) + 40)];
        [v11 appendData:*(void *)(*(void *)(a1[6] + 8) + 40)];
        uint64_t v12 = [MEMORY[0x263EFF990] dataWithData:*(void *)(*(void *)(a1[7] + 8) + 40)];
        [v12 appendData:v8];
        uint64_t v13 = a1[4];
        id v14 = [HMIVideoFragment alloc];
        long long v15 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
        v21[0] = *MEMORY[0x263F010C0];
        v21[1] = v15;
        v21[2] = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
        int v16 = [(HMIVideoFragment *)v14 initWithInitializationSegment:v11 separableSegment:v12 timeRange:v21];
        (*(void (**)(uint64_t, HMIVideoFragment *))(v13 + 16))(v13, v16);

        uint64_t v17 = *(void *)(a1[7] + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = 0;
      }
      goto LABEL_11;
    }
    uint64_t v19 = a1[5];
LABEL_9:
    objc_storeStrong((id *)(*(void *)(v19 + 8) + 40), a3);
    goto LABEL_11;
  }
  if (a2 == 1836019558)
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke_2;
    void v22[3] = &unk_26477D330;
    v22[4] = a1[8];
    HMIMP4Parse(v9, 0, v22);
    goto LABEL_11;
  }
  if (a2 == 1836019574)
  {
    uint64_t v19 = a1[6];
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__HMIVideoFragment_fragmentData_handler___block_invoke_3;
  v4[3] = &unk_26477D308;
  v4[4] = *(void *)(a1 + 32);
  HMIMP4ParseMFHD(a3, v4);
  return 0;
}

uint64_t __41__HMIVideoFragment_fragmentData_handler___block_invoke_3(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)canFragmentData:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 1718909296;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__HMIVideoFragment_canFragmentData___block_invoke;
  _OWORD v6[3] = &unk_26477D380;
  v6[4] = &v7;
  v6[5] = &v11;
  v6[6] = &v15;
  HMIMP4Parse(v3, 0, v6);
  BOOL v4 = *((unsigned char *)v12 + 24) && *((_DWORD *)v8 + 6) == 1836019558 && *((_DWORD *)v16 + 6) > 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

BOOL __36__HMIVideoFragment_canFragmentData___block_invoke(void *a1, int a2)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  int v3 = *(_DWORD *)(v2 + 24);
  if (v3 == a2)
  {
    if (a2 > 1836019557)
    {
      if (a2 == 1836019558)
      {
        *(_DWORD *)(v2 + 24) = 1835295092;
        uint64_t v2 = *(void *)(a1[6] + 8);
        int v5 = *(_DWORD *)(v2 + 24) + 1;
        goto LABEL_12;
      }
      int v4 = 1836019574;
    }
    else
    {
      if (a2 == 1718909296)
      {
        int v5 = 1836019574;
        goto LABEL_12;
      }
      int v4 = 1835295092;
    }
    if (a2 == v4)
    {
      int v5 = 1836019558;
LABEL_12:
      *(_DWORD *)(v2 + 24) = v5;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  return v3 == a2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  [(HMIVideoFragment *)self timeRange];
  if ((v10 & 1) == 0
    || ([(HMIVideoFragment *)self timeRange], (v9 & 1) == 0)
    || ([(HMIVideoFragment *)self timeRange], v8[14])
    || ([(HMIVideoFragment *)self timeRange], (v8[6] & 0x8000000000000000) != 0))
  {
    int v5 = &v7;
    BOOL result = [(HMIVideoFragment *)self videoTrackTimeRange];
  }
  else
  {
    int v5 = v8;
    BOOL result = [(HMIVideoFragment *)self timeRange];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v5;
  retstr->var3 = v5[2];
  return result;
}

- (unint64_t)sequenceNumber
{
  int v3 = [(HMIVideoFragment *)self sequenceNumbers];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  int v5 = [(HMIVideoFragment *)self sequenceNumbers];
  id v6 = [v5 firstObject];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)dealloc
{
  videoFormatDescription = self->_videoFormatDescription;
  if (videoFormatDescription) {
    CFRelease(videoFormatDescription);
  }
  audioFormatDescription = self->_audioFormatDescription;
  if (audioFormatDescription) {
    CFRelease(audioFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoFragment;
  [(HMIVideoFragment *)&v5 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoFragment)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_initializationSegment);
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  char v9 = NSStringFromSelector(sel_separableSegment);
  char v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  uint64_t v11 = NSStringFromSelector(sel_timeRange);
  if (v4)
  {
    [v4 decodeCMTimeRangeForKey:v11];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = NSStringFromSelector(sel_firstVideoSampleByteRange);
  char v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
  NSRange v15 = NSRangeFromString(v14);

  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  int v16 = -[HMIVideoFragment initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:](self, "initWithInitializationSegment:separableSegment:timeRange:firstVideoSampleByteRange:", v7, v10, v18, v15.location, v15.length);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMIVideoFragment *)self initializationSegment];
  id v6 = NSStringFromSelector(sel_initializationSegment);
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(HMIVideoFragment *)self separableSegment];
  uint64_t v8 = NSStringFromSelector(sel_separableSegment);
  [v4 encodeObject:v7 forKey:v8];

  [(HMIVideoFragment *)self timeRange];
  char v9 = NSStringFromSelector(sel_timeRange);
  [v4 encodeCMTimeRange:&v12 forKey:v9];

  v13.NSUInteger location = [(HMIVideoFragment *)self firstVideoSampleByteRange];
  char v10 = NSStringFromRange(v13);
  uint64_t v11 = NSStringFromSelector(sel_firstVideoSampleByteRange);
  [v4 encodeObject:v10 forKey:v11];
}

- (id)attributeDescriptions
{
  v23[5] = *MEMORY[0x263EF8340];
  int v3 = NSString;
  id v4 = [(HMIVideoFragment *)self sequenceNumbers];
  uint64_t v5 = [v4 componentsJoinedByString:@", "];
  long long v21 = [v3 stringWithFormat:@"[%@]", v5];

  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  unint64_t v7 = [(HMIVideoFragment *)self initializationSegment];
  uint64_t v8 = (void *)[v6 initWithName:@"Initialization Segment Data" value:v7];
  v23[0] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  char v10 = [(HMIVideoFragment *)self separableSegment];
  uint64_t v11 = (void *)[v9 initWithName:@"Separable Segment Data" value:v10];
  v23[1] = v11;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F424F8]) initWithName:@"Sequence Numbers" value:v21];
  v23[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIVideoFragment *)self timeRange];
  char v14 = HMICMTimeRangeDescription(v22);
  NSRange v15 = (void *)[v13 initWithName:@"Time Range" value:v14];
  v23[3] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  v25.NSUInteger location = [(HMIVideoFragment *)self firstVideoSampleByteRange];
  uint64_t v17 = NSStringFromRange(v25);
  int v18 = (void *)[v16 initWithName:@"First Video Sample Byte Range" value:v17];
  v23[4] = v18;
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];

  return v19;
}

- (NSData)initializationSegment
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)separableSegment
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- ($94156A41BB1A692D44714D0EDB14C87A)timeRange
{
  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (NSArray)sequenceNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (_NSRange)firstVideoSampleByteRange
{
  objc_copyStruct(v4, &self->_firstVideoSampleByteRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumbers, 0);
  objc_storeStrong((id *)&self->_separableSegment, 0);
  objc_storeStrong((id *)&self->_initializationSegment, 0);
}

@end