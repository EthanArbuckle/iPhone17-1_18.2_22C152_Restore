@interface AVTimedMetadataGroup
- (AVTimedMetadataGroup)init;
- (AVTimedMetadataGroup)initWithItems:(NSArray *)items timeRange:(CMTimeRange *)timeRange;
- (AVTimedMetadataGroup)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (AVTimedMetadataGroupInternal)_timedMetadataGroupInternal;
- (BOOL)isEqual:(id)a3;
- (CMMetadataFormatDescriptionRef)copyFormatDescription;
- (CMTimeRange)timeRange;
- (NSArray)items;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (opaqueCMSampleBuffer)_createSerializedRepresentationWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVTimedMetadataGroup

- (AVTimedMetadataGroup)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] array];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  v6[0] = *MEMORY[0x1E4F1FA20];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  return [(AVTimedMetadataGroup *)self initWithItems:v3 timeRange:v6];
}

- (AVTimedMetadataGroup)initWithItems:(NSArray *)items timeRange:(CMTimeRange *)timeRange
{
  v12.receiver = self;
  v12.super_class = (Class)AVTimedMetadataGroup;
  v6 = [(AVTimedMetadataGroup *)&v12 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVTimedMetadataGroupInternal);
    v6->_priv = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_priv->items = (NSArray *)[(NSArray *)items copy];
      priv = v6->_priv;
      long long v10 = *(_OWORD *)&timeRange->start.epoch;
      long long v9 = *(_OWORD *)&timeRange->duration.timescale;
      *(_OWORD *)&priv->timeRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&priv->timeRange.start.epoch = v10;
      *(_OWORD *)&priv->timeRange.duration.timescale = v9;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVTimedMetadataGroup)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  uint64_t v3 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v15.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v15.start.epoch = v4;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if (!sampleBuffer) {
    goto LABEL_16;
  }
  if (!self) {
    return v3;
  }
  v6 = (void *)[MEMORY[0x1E4F1C978] array];
  CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer);
  memset(&v19, 0, sizeof(v19));
  CMSampleBufferGetOutputPresentationTimeStamp(&v19, sampleBuffer);
  memset(&v18, 0, sizeof(v18));
  CMSampleBufferGetOutputDuration(&v18, sampleBuffer);
  if (DataBuffer)
  {
    MetadataItemsFromSampleBuffer = (void *)FigMetadataCreateMetadataItemsFromSampleBuffer();
    CMTime v17 = v19;
    CMTime v16 = v18;
    v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    memset(duration, 0, sizeof(duration));
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [MetadataItemsFromSampleBuffer countByEnumeratingWithState:duration objects:start count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = **(void **)&duration[16];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (**(void **)&duration[16] != v11) {
            objc_enumerationMutation(MetadataItemsFromSampleBuffer);
          }
          v13 = objc_msgSend(+[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(void *)(*(void *)&duration[8] + 8 * v12), *(_OWORD *)&v15.start.value, *(_OWORD *)&v15.start.epoch, *(_OWORD *)&v15.duration.timescale), "mutableCopy");
          CMTime v20 = v17;
          [v13 setTime:&v20];
          CMTime v20 = v16;
          [v13 setDuration:&v20];
          [v6 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [MetadataItemsFromSampleBuffer countByEnumeratingWithState:duration objects:start count:16];
      }
      while (v10);
    }
    if (MetadataItemsFromSampleBuffer) {
      CFRelease(MetadataItemsFromSampleBuffer);
    }
  }
  start[0].start = v19;
  *(CMTime *)duration = v18;
  CMTimeRangeMake(&v15, &start[0].start, (CMTime *)duration);
  if (!DataBuffer)
  {
LABEL_16:

    return 0;
  }
  start[0] = v15;
  uint64_t v3 = [(AVTimedMetadataGroup *)v3 initWithItems:v6 timeRange:start];
  if (v3) {
    v3->_priv->backingSBuf = (opaqueCMSampleBuffer *)CFRetain(sampleBuffer);
  }
  return v3;
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    long long v4 = self->_priv;
    if (v4->backingSBuf)
    {
      CFRelease(v4->backingSBuf);
      long long v4 = self->_priv;
    }
    CFRelease(v4);
    priv = self->_priv;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVTimedMetadataGroup;
  [(AVTimedMetadataGroup *)&v5 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  long long v4 = +[AVMutableTimedMetadataGroup allocWithZone:a3];
  objc_super v5 = [(AVTimedMetadataGroup *)self items];
  if (self) {
    [(AVTimedMetadataGroup *)self timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  return [(AVMutableTimedMetadataGroup *)v4 initWithItems:v5 timeRange:v7];
}

- (id)description
{
  uint64_t v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(AVTimedMetadataGroup *)self timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, timeRange=%@, items=%@>", v5, self, (id)CMTimeRangeCopyDescription(v6, &range), -[AVTimedMetadataGroup items](self, "items")];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v16 = v3;
    uint64_t v17 = v4;
    if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v7 = 0uLL;
      memset(&v15, 0, sizeof(v15));
      if (self)
      {
        [(AVTimedMetadataGroup *)self timeRange];
        long long v7 = 0uLL;
      }
      *(_OWORD *)&v14.start.epoch = v7;
      *(_OWORD *)&v14.duration.timescale = v7;
      *(_OWORD *)&v14.start.value = v7;
      [a3 timeRange];
      v8 = [(AVTimedMetadataGroup *)self items];
      uint64_t v9 = [a3 items];
      CMTimeRange range1 = v15;
      CMTimeRange v12 = v14;
      int v10 = CMTimeRangeEqual(&range1, &v12);
      if (v10)
      {
        if (v8 == (NSArray *)v9) {
          LOBYTE(v10) = 1;
        }
        else {
          LOBYTE(v10) = [(NSArray *)v8 isEqual:v9];
        }
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  memset(v8, 0, sizeof(v8));
  long long v7 = 0u;
  if (self) {
    [(AVTimedMetadataGroup *)self timeRange];
  }
  *(_OWORD *)&v6.value = v7;
  v6.epoch = *(void *)&v8[0];
  CMTimeEpoch v3 = CMTimeHash(&v6);
  CMTime v6 = *(CMTime *)((char *)v8 + 8);
  CMTimeEpoch v4 = CMTimeHash(&v6) ^ v3;
  return v4 ^ [(NSArray *)[(AVTimedMetadataGroup *)self items] hash];
}

- (AVTimedMetadataGroupInternal)_timedMetadataGroupInternal
{
  return self->_priv;
}

- (CMTimeRange)timeRange
{
  CMTimeEpoch v3 = *(_OWORD **)&self->start.timescale;
  long long v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (NSArray)items
{
  return self->_priv->items;
}

- (CMMetadataFormatDescriptionRef)copyFormatDescription
{
  backingSBuf = self->_priv->backingSBuf;
  if (!backingSBuf
    || (CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(backingSBuf)) == 0
    || (CMMetadataFormatDescriptionRef result = (CMMetadataFormatDescriptionRef)CFRetain(FormatDescription)) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVTimedMetadataGroup;
    return [(AVMetadataGroup *)&v6 copyFormatDescription];
  }
  return result;
}

- (opaqueCMSampleBuffer)_createSerializedRepresentationWithFormatDescription:(opaqueCMFormatDescription *)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  backingSBuf = self->_priv->backingSBuf;
  if (backingSBuf)
  {
    CMSampleBufferGetFormatDescription(backingSBuf);
    if (FigCFEqual())
    {
      CMMetadataFormatDescriptionRef result = self->_priv->backingSBuf;
      if (result) {
        CMMetadataFormatDescriptionRef result = (opaqueCMSampleBuffer *)CFRetain(result);
      }
      uint64_t v9 = 0;
      goto LABEL_65;
    }
  }
  obj = [(AVTimedMetadataGroup *)self items];
  [(AVTimedMetadataGroup *)self timeRange];
  CFTypeRef cf = 0;
  CMSampleBufferRef v66 = 0;
  if (!a3)
  {
    uint64_t v9 = 0;
LABEL_62:
    CMMetadataFormatDescriptionRef result = 0;
    goto LABEL_63;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  signed int v11 = FigBoxedMetadataCreateForConstruction();
  if (v11) {
    goto LABEL_41;
  }
  formatDescription = a3;
  v53 = a4;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v54 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  uint64_t v9 = 0;
  if (!v54) {
    goto LABEL_39;
  }
  uint64_t v56 = *(void *)v62;
  uint64_t v48 = *MEMORY[0x1E4F1EFC8];
  uint64_t v49 = *MEMORY[0x1E4F1C3C8];
  uint64_t v50 = *MEMORY[0x1E4F1F028];
  uint64_t v51 = *MEMORY[0x1E4F1F008];
  CMTimeRange v12 = &selRef_addTrackAssociationWithTrackOfInput_type_;
  v13 = &selRef_decodeIntegerForKey_;
  CFAllocatorRef v45 = v10;
  while (2)
  {
    uint64_t v14 = 0;
    v46 = v12[400];
    aSelector = v13[303];
    do
    {
      if (*(void *)v62 != v56) {
        objc_enumerationMutation(obj);
      }
      CMTimeRange v15 = *(void **)(*((void *)&v61 + 1) + 8 * v14);
      v69 = 0;
      uint64_t v16 = FigBoxedMetadataGetFormatDescription();
      uint64_t v17 = [v15 identifier];
      CMTime v18 = (__CFString *)[v15 _serializationDataType];
      uint64_t v19 = [v15 extendedLanguageTag];
      uint64_t v20 = [v15 value];
      if (!v17)
      {
        v32 = NSString;
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        uint64_t v35 = [v32 stringWithFormat:@"Metadata item %p has no identifier.  If the item was given a key and key space, use +[%@ %@] to check whether an identifier can be made from that key and key space", v15, v34, NSStringFromSelector(aSelector)];
LABEL_47:
        uint64_t v36 = v35;
LABEL_49:
        uint64_t v39 = AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:v49 reason:v36 userInfo:0]);
        a4 = v53;
        goto LABEL_50;
      }
      if (!v18)
      {
        uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"Metadata item %p has no data type", v15, v43, sampleSizeArray);
        goto LABEL_47;
      }
      v21 = (void *)v20;
      if (!v20)
      {
        uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"Metadata item %p has no value", v15, v43, sampleSizeArray);
        goto LABEL_47;
      }
      if (!FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        uint64_t v36 = [NSString stringWithFormat:@"No entry in format description %p for metadata item %p with identifier %@, data type %@ and extended language tag %@.  If you created this format description using -[%@ %@], make sure the instance of %@ used to create the format description contains a representative sample of metadata items which includes an item with the same combination of identifier, dataType, and extended language tag as this one", v16, v15, v17, v18, v19, v38, NSStringFromSelector(v46), v38];
        goto LABEL_49;
      }
      *(_OWORD *)v68 = *MEMORY[0x1E4F1DAD8];
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)&sampleTimingArray.duration.epoch = v22;
      long long v67 = *MEMORY[0x1E4F1DB30];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGPointFromNSValue(v21, v68))
      {
        if (![(__CFString *)v18 isEqualToString:v51]) {
          goto LABEL_59;
        }
        signed int appended = FigBoxedMetadataAppendCGPoint();
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGRectFromNSValue(v21, &sampleTimingArray))
      {
        if (![(__CFString *)v18 isEqualToString:v50]) {
          goto LABEL_59;
        }
        signed int appended = FigBoxedMetadataAppendCGRect();
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && AVCGSizeFromNSValue(v21, &v67))
      {
        if ([(__CFString *)v18 isEqualToString:v48])
        {
          signed int appended = FigBoxedMetadataAppendCGSize();
LABEL_29:
          v24 = 0;
          goto LABEL_32;
        }
LABEL_59:
        v40 = NSString;
        v41 = (objc_class *)objc_opt_class();
        uint64_t v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:v49, objc_msgSend(v40, "stringWithFormat:", @"Value \"%@\" of class %@ in metadata item %p is not compatible with base data type %@", v21, NSStringFromClass(v41), v15, v18), 0 reason userInfo];
        uint64_t v39 = AVErrorForClientProgrammingError(v42);
        v69 = (void *)v39;
LABEL_50:
        if (v39) {
          uint64_t v9 = (void *)v39;
        }
        goto LABEL_52;
      }
      uint64_t v25 = [v15 _copyValueAsCFTypeWithFormatDescription:v16 error:&v69];
      if (!v25)
      {
        uint64_t v39 = (uint64_t)v69;
        goto LABEL_50;
      }
      v24 = (const void *)v25;
      signed int appended = FigBoxedMetadataAppendCFTypedValue();
LABEL_32:
      if (appended)
      {
        if (appended == -16328)
        {
          CFStringRef BaseDataTypeForConformingDataType = CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(v18);
          v28 = NSString;
          v29 = (objc_class *)objc_opt_class();
          uint64_t v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:v49, objc_msgSend(v28, "stringWithFormat:", @"Value \"%@\" of class %@ in metadata item %p is not compatible with base data type %@", v21, NSStringFromClass(v29), v15, BaseDataTypeForConformingDataType), 0 reason userInfo];
          uint64_t v31 = AVErrorForClientProgrammingError(v30);
        }
        else
        {
          uint64_t v31 = AVLocalizedErrorWithUnderlyingOSStatus(appended, 0);
        }
        a4 = v53;
        v69 = (void *)v31;
        if (v31) {
          uint64_t v9 = (void *)v31;
        }
        if (v24) {
          CFRelease(v24);
        }
        goto LABEL_52;
      }
      if (v69) {
        uint64_t v9 = v69;
      }
      if (v24) {
        CFRelease(v24);
      }
      ++v14;
    }
    while (v54 != v14);
    CFAllocatorRef v10 = v45;
    uint64_t v54 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    CMTimeRange v12 = &selRef_addTrackAssociationWithTrackOfInput_type_;
    v13 = &selRef_decodeIntegerForKey_;
    if (v54) {
      continue;
    }
    break;
  }
LABEL_39:
  signed int v11 = FigBoxedMetadataEndConstruction();
  if (v11
    || (BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer(),
        *(_OWORD *)&sampleTimingArray.duration.value = v58,
        sampleTimingArray.duration.epoch = v59,
        sampleTimingArray.presentationTimeStamp = v57,
        sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8],
        v68[0] = CMBlockBufferGetDataLength(BlockBuffer),
        (signed int v11 = CMSampleBufferCreate(v10, BlockBuffer, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, v68, &v66)) != 0))
  {
LABEL_41:
    uint64_t v9 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
  }
LABEL_52:
  CMMetadataFormatDescriptionRef result = v66;
  if (!v66) {
    goto LABEL_62;
  }
  uint64_t v9 = 0;
LABEL_63:
  if (cf)
  {
    CFRelease(cf);
    CMMetadataFormatDescriptionRef result = v66;
  }
LABEL_65:
  if (a4)
  {
    if (!result) {
      *a4 = v9;
    }
  }
  return result;
}

@end