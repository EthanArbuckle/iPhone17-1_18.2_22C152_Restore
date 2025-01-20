@interface AVAudioPCMBuffer
- (AVAudioFrameCount)frameCapacity;
- (AVAudioFrameCount)frameLength;
- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format bufferListNoCopy:(const AudioBufferList *)bufferList deallocator:(void *)deallocator;
- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format frameCapacity:(AVAudioFrameCount)frameCapacity;
- (BOOL)appendDataFromBuffer:(id)a3;
- (BOOL)appendDataFromBuffer:(id)a3 channel:(int64_t)a4;
- (NSArray)averagePowerPerChannel;
- (NSArray)peakPowerPerChannel;
- (NSUInteger)stride;
- (float)calculatePower:(unint64_t)a3 forFloatData:(float *)a4 stride:(int64_t)a5 frameLength:(unsigned int)a6;
- (float)floatChannelData;
- (id)calculatePower:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)splitIntoSingleChannelBuffers;
- (int16_t)int16ChannelData;
- (int32_t)int32ChannelData;
- (void)_initChannelPtrs;
- (void)setByteLength:(unsigned int)a3;
- (void)setFrameLength:(AVAudioFrameCount)frameLength;
@end

@implementation AVAudioPCMBuffer

- (float)calculatePower:(unint64_t)a3 forFloatData:(float *)a4 stride:(int64_t)a5 frameLength:(unsigned int)a6
{
  if (a3 == 1)
  {
    float v8 = 0.0;
    vDSP_rmsqv(a4, a5, &v8, a6);
    float v7 = v8;
  }
  else
  {
    if (a3) {
      return result;
    }
    float __C = 0.0;
    vDSP_maxv(a4, a5, &__C, a6);
    float v7 = __C;
  }
  if (v7 < 0.00000001) {
    float v7 = 0.00000001;
  }
  return log10f(v7) * 20.0;
}

- (id)calculatePower:(unint64_t)a3
{
  id v5 = (id)objc_opt_new();
  if (![(AVAudioPCMBuffer *)self floatChannelData])
  {
    if ([(AVAudioPCMBuffer *)self int16ChannelData])
    {
      float v8 = (float *)malloc_type_malloc(4 * [(AVAudioPCMBuffer *)self frameLength], 0x100004052888210uLL);
      if ([(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount])
      {
        unint64_t v9 = 0;
        do
        {
          vDSP_vflt16([(AVAudioPCMBuffer *)self int16ChannelData][8 * v9], [(AVAudioPCMBuffer *)self stride], v8, [(AVAudioPCMBuffer *)self stride], [(AVAudioPCMBuffer *)self frameLength]);
          float __B = 32767.0;
          vDSP_vsdiv(v8, [(AVAudioPCMBuffer *)self stride], &__B, v8, [(AVAudioPCMBuffer *)self stride], [(AVAudioPCMBuffer *)self frameLength]);
          v10 = NSNumber;
          [(AVAudioPCMBuffer *)self calculatePower:a3 forFloatData:v8 stride:[(AVAudioPCMBuffer *)self stride] frameLength:[(AVAudioPCMBuffer *)self frameLength]];
          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "numberWithFloat:"));
          ++v9;
        }
        while (v9 < [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount]);
      }
    }
    else
    {
      if (![(AVAudioPCMBuffer *)self int32ChannelData]) {
        return v5;
      }
      float v8 = (float *)malloc_type_malloc(4 * [(AVAudioPCMBuffer *)self frameLength], 0x100004052888210uLL);
      if ([(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount])
      {
        unint64_t v11 = 0;
        do
        {
          vDSP_vflt32([(AVAudioPCMBuffer *)self int32ChannelData][8 * v11], [(AVAudioPCMBuffer *)self stride], v8, [(AVAudioPCMBuffer *)self stride], [(AVAudioPCMBuffer *)self frameLength]);
          float v14 = 2147500000.0;
          vDSP_vsdiv(v8, [(AVAudioPCMBuffer *)self stride], &v14, v8, [(AVAudioPCMBuffer *)self stride], [(AVAudioPCMBuffer *)self frameLength]);
          v12 = NSNumber;
          [(AVAudioPCMBuffer *)self calculatePower:a3 forFloatData:v8 stride:[(AVAudioPCMBuffer *)self stride] frameLength:[(AVAudioPCMBuffer *)self frameLength]];
          objc_msgSend(v5, "addObject:", objc_msgSend(v12, "numberWithFloat:"));
          ++v11;
        }
        while (v11 < [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount]);
      }
    }
    free(v8);
    return v5;
  }
  if ([(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount])
  {
    unint64_t v6 = 0;
    do
    {
      float v7 = NSNumber;
      [(AVAudioPCMBuffer *)self calculatePower:a3 forFloatData:[(AVAudioPCMBuffer *)self floatChannelData][8 * v6] stride:[(AVAudioPCMBuffer *)self stride] frameLength:[(AVAudioPCMBuffer *)self frameLength]];
      objc_msgSend(v5, "addObject:", objc_msgSend(v7, "numberWithFloat:"));
      ++v6;
    }
    while (v6 < [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount]);
  }
  return v5;
}

- (NSArray)peakPowerPerChannel
{
  return (NSArray *)[(AVAudioPCMBuffer *)self calculatePower:0];
}

- (NSArray)averagePowerPerChannel
{
  return (NSArray *)[(AVAudioPCMBuffer *)self calculatePower:1];
}

- (id)splitIntoSingleChannelBuffers
{
  if ([(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount] < 2
    || [(AVAudioFormat *)[(AVAudioBuffer *)self format] isInterleaved])
  {
    return 0;
  }
  id v3 = (id)objc_opt_new();
  if ([(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount])
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = [AVAudioFormat alloc];
      [(AVAudioFormat *)[(AVAudioBuffer *)self format] sampleRate];
      float v7 = -[AVAudioFormat initStandardFormatWithSampleRate:channels:](v6, "initStandardFormatWithSampleRate:channels:", 1);
      float v8 = [[AVAudioPCMBuffer alloc] initWithPCMFormat:v7 frameCapacity:[(AVAudioPCMBuffer *)self frameLength]];

      [(AVAudioPCMBuffer *)v8 appendDataFromBuffer:self channel:v5];
      [v3 addObject:v8];

      ++v5;
    }
    while (v5 < [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount]);
  }
  return v3;
}

- (BOOL)appendDataFromBuffer:(id)a3 channel:(int64_t)a4
{
  impl = self->super._impl;
  if (*((unsigned char *)impl + 56)) {
    uint64_t v8 = impl[6] + 48;
  }
  else {
    uint64_t v8 = impl[12];
  }
  unint64_t v9 = (_DWORD *)[a3 audioBufferList];
  AVAudioFrameCount v10 = [(AVAudioPCMBuffer *)self frameLength];
  int v11 = *((_DWORD *)self->super._impl + 6);
  AVAudioFrameCount v12 = [(AVAudioPCMBuffer *)self frameCapacity];
  AVAudioFrameCount v13 = v12 - [(AVAudioPCMBuffer *)self frameLength];
  AVAudioFrameCount v14 = [(AVAudioPCMBuffer *)self frameLength];
  unsigned int v15 = [a3 frameLength] + v14;
  AVAudioFrameCount v16 = v13;
  if (v15 <= [(AVAudioPCMBuffer *)self frameCapacity]) {
    AVAudioFrameCount v16 = [a3 frameLength];
  }
  uint64_t v17 = v11 * v10;
  if (-[AVAudioFormat isEqual:](-[AVAudioBuffer format](self, "format"), "isEqual:", [a3 format])
    || (AVAudioChannelCount v24 = [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount],
        v24 == objc_msgSend((id)objc_msgSend(a3, "format"), "channelCount"))
    && ([(AVAudioFormat *)[(AVAudioBuffer *)self format] sampleRate],
        double v26 = v25,
        objc_msgSend((id)objc_msgSend(a3, "format"), "sampleRate"),
        v26 == v27)
    && (int v28 = (int)[(AVAudioFormat *)[(AVAudioBuffer *)self format] streamDescription][8],
        v28 == *(_DWORD *)(objc_msgSend((id)objc_msgSend(a3, "format"), "streamDescription") + 8)))
  {
    if (*v9)
    {
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = v8 + 16;
      do
      {
        AVAudioFrameCount v21 = [(AVAudioPCMBuffer *)self frameLength];
        unsigned int v22 = [a3 frameLength] + v21;
        if (v22 <= [(AVAudioPCMBuffer *)self frameCapacity]) {
          unsigned int v23 = v9[v18 + 3];
        }
        else {
          unsigned int v23 = *((_DWORD *)self->super._impl + 6) * v13;
        }
        memcpy((void *)(*(void *)(v20 + v18 * 4) + v17), *(const void **)&v9[v18 + 4], v23);
        ++v19;
        v18 += 4;
      }
      while (v19 < *v9);
    }
    goto LABEL_25;
  }
  AVAudioChannelCount v29 = [(AVAudioFormat *)[(AVAudioBuffer *)self format] channelCount];
  if ((a4 & 0x8000000000000000) == 0
    && v29 == 1
    && objc_msgSend((id)objc_msgSend(a3, "format"), "channelCount") > (unint64_t)a4)
  {
    AVAudioFrameCount v30 = [(AVAudioPCMBuffer *)self frameLength];
    unsigned int v31 = [a3 frameLength] + v30;
    if (v31 <= [(AVAudioPCMBuffer *)self frameCapacity]) {
      unsigned int v32 = v9[4 * a4 + 3];
    }
    else {
      unsigned int v32 = *((_DWORD *)self->super._impl + 6) * v13;
    }
    memcpy((void *)(*(void *)(v8 + 16) + v17), *(const void **)&v9[4 * a4 + 4], v32);
LABEL_25:
    uint64_t v33 = [(AVAudioPCMBuffer *)self frameLength] + v16;
    BOOL v34 = 1;
    goto LABEL_26;
  }
  uint64_t v33 = [(AVAudioPCMBuffer *)self frameLength];
  BOOL v34 = 0;
LABEL_26:
  [(AVAudioPCMBuffer *)self setFrameLength:v33];
  return v34;
}

- (BOOL)appendDataFromBuffer:(id)a3
{
  return [(AVAudioPCMBuffer *)self appendDataFromBuffer:a3 channel:-1];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[AVAudioPCMBuffer allocWithZone:a3] initWithPCMFormat:*(void *)self->super._impl frameCapacity:*((unsigned int *)self->super._impl + 10)];
  impl = v4->super._impl;
  unint64_t v6 = self->super._impl;
  if (*((unsigned char *)v6 + 56)) {
    float v7 = (_DWORD *)(v6[6] + 48);
  }
  else {
    float v7 = (_DWORD *)v6[12];
  }
  if (*((unsigned char *)impl + 56)) {
    uint64_t v8 = impl[6] + 48;
  }
  else {
    uint64_t v8 = impl[12];
  }
  if (*v7)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      *(_DWORD *)(v8 + v9 * 4 + 12) = v7[v9 + 3];
      memcpy(*(void **)(v8 + v9 * 4 + 16), *(const void **)&v7[v9 + 4], v7[v9 + 3]);
      ++v10;
      v9 += 4;
    }
    while (v10 < *v7);
    unint64_t v6 = self->super._impl;
  }
  *((_DWORD *)impl + 4) = *((_DWORD *)v6 + 4);
  return v4;
}

- (int16_t)int16ChannelData
{
  impl = self->super._impl;
  if (*((_DWORD *)impl + 8) != 1) {
    return 0;
  }
  float result = (int16_t *const *)*((void *)impl + 1);
  if (!result)
  {
    [(AVAudioPCMBuffer *)self _initChannelPtrs];
    return (int16_t *const *)*((void *)self->super._impl + 1);
  }
  return result;
}

- (int32_t)int32ChannelData
{
  impl = self->super._impl;
  if (*((_DWORD *)impl + 8) != 2) {
    return 0;
  }
  float result = (int32_t *const *)*((void *)impl + 1);
  if (!result)
  {
    [(AVAudioPCMBuffer *)self _initChannelPtrs];
    return (int32_t *const *)*((void *)self->super._impl + 1);
  }
  return result;
}

- (float)floatChannelData
{
  impl = self->super._impl;
  if (*((_DWORD *)impl + 8)) {
    return 0;
  }
  float result = (float *const *)*((void *)impl + 1);
  if (!result)
  {
    [(AVAudioPCMBuffer *)self _initChannelPtrs];
    return (float *const *)*((void *)self->super._impl + 1);
  }
  return result;
}

- (void)_initChannelPtrs
{
  uint64_t v3 = [*(id *)self->super._impl streamDescription];
  uint64_t v4 = *(unsigned int *)(v3 + 28);
  if (v4)
  {
    int v5 = *(_DWORD *)(v3 + 12);
    *((void *)self->super._impl + 1) = malloc_type_calloc(*(unsigned int *)(v3 + 28), 8uLL, 0x80040B8603338uLL);
    if ((v5 & 0x20) != 0)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 16;
      do
      {
        impl = self->super._impl;
        if (*((unsigned char *)impl + 56)) {
          uint64_t v11 = impl[6] + 48;
        }
        else {
          uint64_t v11 = impl[12];
        }
        *(void *)(impl[1] + v8) = *(void *)(v11 + v9);
        v8 += 8;
        v9 += 16;
      }
      while (8 * v4 != v8);
    }
    else
    {
      unint64_t v6 = self->super._impl;
      if (*((unsigned char *)v6 + 56)) {
        uint64_t v7 = v6[6] + 48;
      }
      else {
        uint64_t v7 = v6[12];
      }
      unsigned int v12 = *((_DWORD *)v6 + 6);
      *(void *)v6[1] = *(void *)(v7 + 16);
      if (v4 >= 2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v12 / v4;
        do
        {
          unsigned int v15 = (void *)(*((void *)self->super._impl + 1) + v13);
          v15[1] = *v15 + v14;
          v13 += 8;
        }
        while (8 * v4 - 8 != v13);
      }
    }
  }
}

- (NSUInteger)stride
{
  return *((int *)self->super._impl + 7);
}

- (void)setFrameLength:(AVAudioFrameCount)frameLength
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  impl = self->super._impl;
  if (impl[5] < frameLength)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v10 = "AVAEInternal.h";
      __int16 v11 = 1024;
      int v12 = 71;
      __int16 v13 = 2080;
      uint64_t v14 = "AVAudioBuffer.mm";
      __int16 v15 = 1024;
      int v16 = 364;
      __int16 v17 = 2080;
      uint64_t v18 = "-[AVAudioPCMBuffer setFrameLength:]";
      __int16 v19 = 2080;
      uint64_t v20 = "length <= _imp->_frameCapacity";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "length <= _imp->_frameCapacity");
    impl = self->super._impl;
  }
  uint64_t v7 = impl[6] * frameLength;
  v8.receiver = self;
  v8.super_class = (Class)AVAudioPCMBuffer;
  [(AVAudioBuffer *)&v8 setByteLength:v7];
  *((_DWORD *)self->super._impl + 4) = frameLength;
}

- (void)setByteLength:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVAudioPCMBuffer;
  -[AVAudioBuffer setByteLength:](&v5, sel_setByteLength_);
  *((_DWORD *)self->super._impl + 4) = a3 / *((_DWORD *)self->super._impl + 6);
}

- (AVAudioFrameCount)frameLength
{
  return *((_DWORD *)self->super._impl + 4);
}

- (AVAudioFrameCount)frameCapacity
{
  return *((_DWORD *)self->super._impl + 5);
}

- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format bufferListNoCopy:(const AudioBufferList *)bufferList deallocator:(void *)deallocator
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(AVAudioFormat *)format streamDescription];
  long long v10 = *(_OWORD *)&v9->mBytesPerPacket;
  long long v44 = *(_OWORD *)&v9->mSampleRate;
  long long v45 = v10;
  uint64_t v46 = *(void *)&v9->mBitsPerChannel;
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v48 = "AVAEInternal.h";
      __int16 v49 = 1024;
      int v50 = 71;
      __int16 v51 = 2080;
      *(void *)v52 = "AVAudioBuffer.mm";
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = 320;
      *(_WORD *)&v53[4] = 2080;
      v54 = "-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]";
      __int16 v55 = 2080;
      v56 = "isPCMFormat(fmt)";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "isPCMFormat(fmt)");
  }
  if (!bufferList)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v48 = "AVAEInternal.h";
      __int16 v49 = 1024;
      int v50 = 71;
      __int16 v51 = 2080;
      *(void *)v52 = "AVAudioBuffer.mm";
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = 321;
      *(_WORD *)&v53[4] = 2080;
      v54 = "-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]";
      __int16 v55 = 2080;
      v56 = "bufferList != nullptr";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "bufferList != nullptr");
  }
  unsigned int v13 = DWORD2(v45);
  if (!DWORD2(v45))
  {
    unsigned int v23 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315394;
    v48 = "AVAudioBuffer.mm";
    __int16 v49 = 1024;
    int v50 = 324;
    AVAudioChannelCount v24 = "%25s:%-5d format has zero bytes per frame";
    goto LABEL_33;
  }
  unint64_t mNumberBuffers = bufferList->mNumberBuffers;
  if (!mNumberBuffers)
  {
    unsigned int v23 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315394;
    v48 = "AVAudioBuffer.mm";
    __int16 v49 = 1024;
    int v50 = 242;
    AVAudioChannelCount v24 = "%25s:%-5d the number of buffers is 0";
LABEL_33:
    double v25 = v23;
    uint32_t v26 = 18;
    goto LABEL_38;
  }
  if ((BYTE12(v44) & 0x20) != 0) {
    int v15 = HIDWORD(v45);
  }
  else {
    int v15 = 1;
  }
  if (mNumberBuffers != v15)
  {
    double v27 = gAVAudioBufferLog();
    if (!os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    UInt32 v28 = bufferList->mNumberBuffers;
    *(_DWORD *)buf = 136315906;
    v48 = "AVAudioBuffer.mm";
    __int16 v49 = 1024;
    int v50 = 249;
    __int16 v51 = 1024;
    *(_DWORD *)v52 = v28;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v15;
    AVAudioChannelCount v24 = "%25s:%-5d the number of buffers (%u) does not match the format's number of channel streams (%u)";
    double v25 = v27;
    uint32_t v26 = 30;
LABEL_38:
    _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
    goto LABEL_39;
  }
  UInt32 mDataByteSize = bufferList->mBuffers[0].mDataByteSize;
  if (!mDataByteSize)
  {
    AVAudioChannelCount v29 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "AVAudioBuffer.mm";
      __int16 v49 = 1024;
      int v50 = 256;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = 0;
      AVAudioChannelCount v24 = "%25s:%-5d mBuffers[0].mDataByteSize (%u) should be non-zero";
      double v25 = v29;
      uint32_t v26 = 24;
      goto LABEL_38;
    }
LABEL_39:

    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  BOOL v19 = 0;
  if ((BYTE12(v44) & 0x20) != 0) {
    int v20 = 1;
  }
  else {
    int v20 = HIDWORD(v45);
  }
  while (1)
  {
    if (v17 * 16)
    {
      uint64_t v21 = (char *)bufferList + v17 * 16;
      if (bufferList->mBuffers[v17].mDataByteSize != mDataByteSize) {
        break;
      }
    }
    unsigned int v22 = (char *)bufferList + v17 * 16;
    if (bufferList->mBuffers[v17].mNumberChannels != v20)
    {
      unsigned int v32 = gAVAudioBufferLog();
      if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      int v33 = *((_DWORD *)v22 + 2);
      *(_DWORD *)buf = 136316162;
      v48 = "AVAudioBuffer.mm";
      __int16 v49 = 1024;
      int v50 = 271;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v18;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v33;
      *(_WORD *)v53 = 1024;
      *(_DWORD *)&v53[2] = v20;
      BOOL v34 = "%25s:%-5d mBuffers[%d].mNumberChannels (%u) does not match the format's number of interleaved channels (%u)";
      v35 = v32;
      uint32_t v36 = 36;
      goto LABEL_47;
    }
    if (!*((void *)v22 + 2))
    {
      v37 = gAVAudioBufferLog();
      if (!os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_DWORD *)buf = 136315650;
      v48 = "AVAudioBuffer.mm";
      __int16 v49 = 1024;
      int v50 = 274;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v18;
      BOOL v34 = "%25s:%-5d mBuffers[%u].mData is null";
      v35 = v37;
      uint32_t v36 = 24;
      goto LABEL_47;
    }
    BOOL v19 = ++v18 >= mNumberBuffers;
    if (mNumberBuffers == ++v17) {
      goto LABEL_49;
    }
  }
  log = gAVAudioBufferLog();
  if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    goto LABEL_48;
  }
  int v38 = *((_DWORD *)v21 + 3);
  *(_DWORD *)buf = 136316418;
  v48 = "AVAudioBuffer.mm";
  __int16 v49 = 1024;
  int v50 = 266;
  __int16 v51 = 1024;
  *(_DWORD *)v52 = v18;
  *(_WORD *)&v52[4] = 1024;
  *(_DWORD *)&v52[6] = v38;
  *(_WORD *)v53 = 1024;
  *(_DWORD *)&v53[2] = v18 - 1;
  LOWORD(v54) = 1024;
  *(_DWORD *)((char *)&v54 + 2) = mDataByteSize;
  BOOL v34 = "%25s:%-5d mBuffers[%u].mDataByteSize (%u) does not match the previous mBuffers[%u].mDataByteSize (%u)";
  v35 = log;
  uint32_t v36 = 42;
LABEL_47:
  _os_log_impl(&dword_19D794000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
LABEL_48:
  if (!v19) {
    goto LABEL_39;
  }
LABEL_49:
  uint64_t v39 = bufferList->mBuffers[0].mDataByteSize;
  v43.receiver = self;
  v43.super_class = (Class)AVAudioPCMBuffer;
  v40 = [(AVAudioBuffer *)&v43 initWithPCMFormat:format byteCapacity:v39 bufferListNoCopy:bufferList deallocator:deallocator];
  AVAudioFrameCount v30 = v40;
  if (v40)
  {
    *((void *)v40->super._impl + 1) = 0;
    *((_DWORD *)v40->super._impl + 6) = v13;
    *((_DWORD *)v40->super._impl + 5) = v39 / v13;
    *((_DWORD *)v40->super._impl + 4) = v39 / v13;
    *((_DWORD *)v40->super._impl + 7) = v20;
    impl = v30->super._impl;
    if (impl[56] || !impl[120]) {
      __assert_rtn("-[AVAudioPCMBuffer initWithPCMFormat:bufferListNoCopy:deallocator:]", "AVAudioBuffer.mm", 347, "!_imp->OwnsMemory() && _imp->_externalABL.has_value()");
    }
  }
  return v30;
}

- (AVAudioPCMBuffer)initWithPCMFormat:(AVAudioFormat *)format frameCapacity:(AVAudioFrameCount)frameCapacity
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(AVAudioFormat *)format streamDescription];
  long long v8 = *(_OWORD *)&v7->mBytesPerPacket;
  long long v19 = *(_OWORD *)&v7->mSampleRate;
  long long v20 = v8;
  uint64_t v21 = *(void *)&v7->mBitsPerChannel;
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      unsigned int v23 = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      double v27 = "AVAudioBuffer.mm";
      __int16 v28 = 1024;
      int v29 = 287;
      __int16 v30 = 2080;
      unsigned int v31 = "-[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]";
      __int16 v32 = 2080;
      int v33 = "isPCMFormat(fmt)";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "isPCMFormat(fmt)");
  }
  int v10 = DWORD2(v20);
  if (!DWORD2(v20))
  {
    __int16 v11 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v23 = "AVAudioBuffer.mm";
      __int16 v24 = 1024;
      int v25 = 290;
      int v12 = "%25s:%-5d format has zero bytes per frame";
      goto LABEL_13;
    }
LABEL_14:

    return 0;
  }
  if (((DWORD2(v20) * (unint64_t)frameCapacity) & 0xFFFFFFFF00000000) != 0)
  {
    __int16 v11 = gAVAudioBufferLog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v23 = "AVAudioBuffer.mm";
      __int16 v24 = 1024;
      int v25 = 297;
      int v12 = "%25s:%-5d buffer byte capacity cannot be represented by an uint32_t";
LABEL_13:
      _os_log_impl(&dword_19D794000, (os_log_t)v11, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)AVAudioPCMBuffer;
  uint64_t v14 = [(AVAudioBuffer *)&v18 initWithFormat:format byteCapacity:DWORD2(v20) * frameCapacity];
  unsigned int v13 = v14;
  if (v14)
  {
    *((void *)v14->super._impl + 1) = 0;
    *((_DWORD *)v14->super._impl + 6) = v10;
    *((_DWORD *)v14->super._impl + 5) = frameCapacity;
    *((_DWORD *)v14->super._impl + 4) = 0;
    if ((BYTE12(v19) & 0x20) != 0) {
      int v15 = 1;
    }
    else {
      int v15 = HIDWORD(v20);
    }
    *((_DWORD *)v14->super._impl + 7) = v15;
    impl = v13->super._impl;
    if (!impl[56] || impl[120]) {
      __assert_rtn("-[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]", "AVAudioBuffer.mm", 312, "_imp->OwnsMemory() && !_imp->_externalABL.has_value()");
    }
  }
  return v13;
}

@end