@interface AVAudioConverter
- (AVAudioConverter)initFromFormat:(AVAudioFormat *)fromFormat toFormat:(AVAudioFormat *)toFormat;
- (AVAudioConverterOutputStatus)convertToBuffer:(AVAudioBuffer *)outputBuffer error:(NSError *)outError withInputFromBlock:(AVAudioConverterInputBlock)inputBlock;
- (AVAudioConverterPrimeInfo)primeInfo;
- (AVAudioConverterPrimeMethod)primeMethod;
- (AVAudioFormat)inputFormat;
- (AVAudioFormat)outputFormat;
- (BOOL)convertToBuffer:(AVAudioPCMBuffer *)outputBuffer fromBuffer:(const AVAudioPCMBuffer *)inputBuffer error:(NSError *)outError;
- (BOOL)dither;
- (BOOL)downmix;
- (NSArray)applicableEncodeBitRates;
- (NSArray)applicableEncodeSampleRates;
- (NSArray)availableEncodeBitRates;
- (NSArray)availableEncodeChannelLayoutTags;
- (NSArray)availableEncodeSampleRates;
- (NSArray)channelMap;
- (NSData)magicCookie;
- (NSInteger)bitRate;
- (NSInteger)maximumOutputPacketSize;
- (NSInteger)sampleRateConverterQuality;
- (NSString)bitRateStrategy;
- (NSString)sampleRateConverterAlgorithm;
- (void)dealloc;
- (void)reset;
- (void)setBitRate:(NSInteger)bitRate;
- (void)setBitRateStrategy:(NSString *)bitRateStrategy;
- (void)setChannelMap:(NSArray *)channelMap;
- (void)setDither:(BOOL)dither;
- (void)setDownmix:(BOOL)downmix;
- (void)setMagicCookie:(NSData *)magicCookie;
- (void)setPrimeInfo:(AVAudioConverterPrimeInfo)primeInfo;
- (void)setPrimeMethod:(AVAudioConverterPrimeMethod)primeMethod;
- (void)setSampleRateConverterAlgorithm:(NSString *)sampleRateConverterAlgorithm;
- (void)setSampleRateConverterQuality:(NSInteger)sampleRateConverterQuality;
@end

@implementation AVAudioConverter

- (AVAudioConverterOutputStatus)convertToBuffer:(AVAudioBuffer *)outputBuffer error:(NSError *)outError withInputFromBlock:(AVAudioConverterInputBlock)inputBlock
{
  impl = (AudioConverterRef *)self->_impl;
  if ([(AVAudioFormat *)[(AVAudioBuffer *)outputBuffer format] isEqual:impl[2]])
  {
    [(AVAudioBuffer *)outputBuffer setByteLength:[(AVAudioBuffer *)outputBuffer byteCapacity]];
    v9 = [(AVAudioBuffer *)outputBuffer mutableAudioBufferList];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      UInt32 v12 = [(AVAudioBuffer *)outputBuffer frameCapacity];
      v13 = 0;
      UInt32 ioOutputDataPacketSize = v12;
      goto LABEL_6;
    }
    if (v11)
    {
      UInt32 ioOutputDataPacketSize = [(AVAudioBuffer *)outputBuffer packetCapacity];
      v13 = (AudioStreamPacketDescription *)[(AVAudioBuffer *)outputBuffer packetDescriptions];
LABEL_6:
      impl[7] = (AudioConverterRef)inputBlock;
      OSStatus v14 = AudioConverterFillComplexBuffer(*impl, (AudioConverterComplexInputDataProc)AVAudioConverterImpl::FillComplexProc, impl, &ioOutputDataPacketSize, v9, v13);
      impl[7] = 0;
      if (isKindOfClass)
      {
        [(AVAudioBuffer *)outputBuffer setFrameLength:ioOutputDataPacketSize];
        if (v14)
        {
LABEL_8:
          if (v14 == 2002872692) {
            return 1;
          }
          if (!outError) {
            return 3;
          }
          id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v17 = *MEMORY[0x1E4F28760];
          uint64_t v18 = v14;
          goto LABEL_12;
        }
      }
      else
      {
        [(AVAudioBuffer *)outputBuffer setByteLength:v9->mBuffers[0].mDataByteSize];
        [(AVAudioBuffer *)outputBuffer setPacketCount:ioOutputDataPacketSize];
        if (v14) {
          goto LABEL_8;
        }
      }
      return 2 * (ioOutputDataPacketSize == 0);
    }
  }
  if (outError)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28760];
    uint64_t v18 = 1718449215;
LABEL_12:
    *outError = (NSError *)[v16 initWithDomain:v17 code:v18 userInfo:0];
  }
  return 3;
}

- (BOOL)convertToBuffer:(AVAudioPCMBuffer *)outputBuffer fromBuffer:(const AVAudioPCMBuffer *)inputBuffer error:(NSError *)outError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  impl = (AudioConverterRef *)self->_impl;
  unsigned int v9 = [(AVAudioPCMBuffer *)outputBuffer frameCapacity];
  if (v9 < [(AVAudioPCMBuffer *)(id)inputBuffer frameLength])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v10 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      id v16 = "AVAEInternal.h";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2080;
      v20 = "AVAudioConverter.mm";
      __int16 v21 = 1024;
      int v22 = 469;
      __int16 v23 = 2080;
      v24 = "convert";
      __int16 v25 = 2080;
      v26 = "outputBuffer.frameCapacity >= inputBuffer.frameLength";
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "outputBuffer.frameCapacity >= inputBuffer.frameLength");
  }
  uint64_t v11 = [(AVAudioPCMBuffer *)(id)inputBuffer frameLength];
  [(AVAudioPCMBuffer *)outputBuffer setFrameLength:v11];
  OSStatus v12 = AudioConverterConvertComplexBuffer(*impl, v11, [(AVAudioBuffer *)(id)inputBuffer audioBufferList], [(AVAudioBuffer *)outputBuffer mutableAudioBufferList]);
  if (v12)
  {
    if (outError)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      *outError = (NSError *)[v13 initWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    }
    [(AVAudioPCMBuffer *)outputBuffer setFrameLength:0];
  }
  return v12 == 0;
}

- (void)setPrimeInfo:(AVAudioConverterPrimeInfo)primeInfo
{
  impl = (AudioConverterRef *)self->_impl;
  AVAudioConverterPrimeInfo inPropertyData = primeInfo;
  AudioConverterSetProperty(*impl, 0x7072696Du, 8u, &inPropertyData);
}

- (AVAudioConverterPrimeInfo)primeInfo
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 8;
  AudioConverterGetProperty(*impl, 0x7072696Du, &ioPropertyDataSize, &outPropertyData);
  return outPropertyData;
}

- (void)setPrimeMethod:(AVAudioConverterPrimeMethod)primeMethod
{
  impl = (AudioConverterRef *)self->_impl;
  int inPropertyData = primeMethod;
  AudioConverterSetProperty(*impl, 0x70726D6Du, 4u, &inPropertyData);
}

- (AVAudioConverterPrimeMethod)primeMethod
{
  impl = (AudioConverterRef *)self->_impl;
  unsigned int outPropertyData = 0;
  UInt32 ioPropertyDataSize = 4;
  AudioConverterGetProperty(*impl, 0x70726D6Du, &ioPropertyDataSize, &outPropertyData);
  return (unint64_t)outPropertyData;
}

- (NSInteger)maximumOutputPacketSize
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  unsigned int outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x786F7073u, &ioPropertyDataSize, &outPropertyData)) {
    return 0;
  }
  else {
    return outPropertyData;
  }
}

- (void)setChannelMap:(NSArray *)channelMap
{
  impl = (AudioConverterRef *)self->_impl;
  uint64_t v5 = [(NSArray *)channelMap count];
  size_t v6 = (4 * v5);
  v7 = malloc_type_calloc(1uLL, v6, 0xE36CCDD3uLL);
  if (v5 >= 1)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      v7[v8] = objc_msgSend(-[NSArray objectAtIndex:](channelMap, "objectAtIndex:", v8), "integerValue");
      uint64_t v8 = v9;
    }
    while (v5 > v9++);
  }
  AudioConverterSetProperty(*impl, 0x63686D70u, v6, v7);

  free(v7);
}

- (NSArray)channelMap
{
  impl = (AudioConverterRef *)self->_impl;
  AudioConverterRef v3 = impl[4];
  if (v3) {

  }
  result = (NSArray *)AVAudioConverterImpl::getInt32List(impl, 0x63686D70u, 0);
  impl[4] = (AudioConverterRef)result;
  if (!result)
  {
    result = (NSArray *)objc_opt_new();
    impl[4] = (AudioConverterRef)result;
  }
  return result;
}

- (void)setMagicCookie:(NSData *)magicCookie
{
  impl = (AudioConverterRef *)self->_impl;
  if (!AudioConverterSetProperty(*impl, 0x636D6763u, [(NSData *)magicCookie length], [(NSData *)magicCookie bytes]))
  {
    AudioConverterRef v5 = impl[3];
    if (v5) {

    }
    impl[3] = (AudioConverterRef)magicCookie;
  }
}

- (NSData)magicCookie
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 outSize = 0;
  Boolean outWritable = 0;
  if (AudioConverterGetPropertyInfo(*impl, 0x636D6763u, &outSize, &outWritable)) {
    return 0;
  }
  AudioConverterRef v3 = malloc_type_calloc(1uLL, outSize, 0xBC4462F1uLL);
  if (AudioConverterGetProperty(*impl, 0x636D6763u, &outSize, v3))
  {
    free(v3);
    return 0;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v4 = (NSData *)[v6 initWithBytes:v3 length:outSize];
  free(v3);
  AudioConverterRef v7 = impl[3];
  if (v7) {

  }
  impl[3] = (AudioConverterRef)v4;
  return v4;
}

- (void)setSampleRateConverterAlgorithm:(NSString *)sampleRateConverterAlgorithm
{
  impl = (AudioConverterRef *)self->_impl;
  if ([(NSString *)sampleRateConverterAlgorithm compare:@"AVSampleRateConverterAlgorithm_Mastering"])
  {
    if ([(NSString *)sampleRateConverterAlgorithm compare:@"AVSampleRateConverterAlgorithm_Normal"])
    {
      if ([(NSString *)sampleRateConverterAlgorithm compare:@"AVSampleRateConverterAlgorithm_MinimumPhase"])
      {
        return;
      }
      int v5 = 1835626096;
    }
    else
    {
      int v5 = 1852797549;
    }
  }
  else
  {
    int v5 = 1650553971;
  }
  int inPropertyData = v5;
  AudioConverterSetProperty(*impl, 0x73726361u, 4u, &inPropertyData);
}

- (NSString)sampleRateConverterAlgorithm
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  int outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x73726361u, &ioPropertyDataSize, &outPropertyData)) {
    return 0;
  }
  if (outPropertyData == 1650553971) {
    v4 = @"AVSampleRateConverterAlgorithm_Mastering";
  }
  else {
    v4 = 0;
  }
  if (outPropertyData == 1835626096) {
    int v5 = @"AVSampleRateConverterAlgorithm_MinimumPhase";
  }
  else {
    int v5 = v4;
  }
  if (outPropertyData == 1852797549) {
    return (NSString *)@"AVSampleRateConverterAlgorithm_Normal";
  }
  else {
    return &v5->isa;
  }
}

- (void)setSampleRateConverterQuality:(NSInteger)sampleRateConverterQuality
{
  impl = (AudioConverterRef *)self->_impl;
  int inPropertyData = sampleRateConverterQuality;
  AudioConverterSetProperty(*impl, 0x73726371u, 4u, &inPropertyData);
}

- (NSInteger)sampleRateConverterQuality
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  unsigned int outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x73726371u, &ioPropertyDataSize, &outPropertyData)) {
    return 0;
  }
  else {
    return outPropertyData;
  }
}

- (void)setDownmix:(BOOL)downmix
{
  impl = (AudioConverterRef *)self->_impl;
  BOOL inPropertyData = downmix;
  AudioConverterSetProperty(*impl, 0x646D6978u, 4u, &inPropertyData);
}

- (void)setDither:(BOOL)dither
{
  impl = (AudioConverterRef *)self->_impl;
  if (dither) {
    int v4 = 3;
  }
  else {
    int v4 = 0;
  }
  int inPropertyData = v4;
  AudioConverterSetProperty(*impl, 0x64697468u, 4u, &inPropertyData);
}

- (BOOL)downmix
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  int outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x646D6978u, &ioPropertyDataSize, &outPropertyData)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = outPropertyData == 0;
  }
  return !v3;
}

- (BOOL)dither
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  int outPropertyData = 0;
  if (AudioConverterGetProperty(*impl, 0x64697468u, &ioPropertyDataSize, &outPropertyData)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = outPropertyData == 0;
  }
  return !v3;
}

- (void)reset
{
  impl = (AudioConverterRef *)self->_impl;
  *((unsigned char *)impl + 64) = 0;
  AudioConverterReset(*impl);
}

- (AVAudioFormat)outputFormat
{
  return (AVAudioFormat *)*((void *)self->_impl + 2);
}

- (AVAudioFormat)inputFormat
{
  return (AVAudioFormat *)*((void *)self->_impl + 1);
}

- (void)dealloc
{
  impl = (id *)self->_impl;
  if (impl)
  {

    id v4 = impl[3];
    if (v4) {

    }
    id v5 = impl[4];
    if (v5) {

    }
    id v6 = impl[6];
    if (v6) {

    }
    AudioConverterDispose((AudioConverterRef)*impl);
    MEMORY[0x19F3ABB30](impl, 0x10A0C40A8DF87D0);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAudioConverter;
  [(AVAudioConverter *)&v7 dealloc];
}

- (AVAudioConverter)initFromFormat:(AVAudioFormat *)fromFormat toFormat:(AVAudioFormat *)toFormat
{
  AudioConverterRef outAudioConverter = 0;
  OSStatus v6 = AudioConverterNew([(AVAudioFormat *)fromFormat streamDescription], [(AVAudioFormat *)toFormat streamDescription], &outAudioConverter);
  result = 0;
  if (!v6 && outAudioConverter)
  {
    uint64_t v8 = [(AVAudioFormat *)fromFormat channelLayout];
    if (!v8
      || (unsigned int v9 = v8, [(AVAudioChannelLayout *)v8 layoutTag] == 6553601)
      || [(AVAudioChannelLayout *)v9 layoutTag] == 6619138
      || (v10 = [(AVAudioChannelLayout *)v9 layout],
          UInt32 v11 = [(AVAudioChannelLayout *)v9 layoutSize],
          !AudioConverterSetProperty(outAudioConverter, 0x69636C20u, v11, v10)))
    {
      OSStatus v12 = [(AVAudioFormat *)toFormat channelLayout];
      if (!v12
        || (id v13 = v12, [(AVAudioChannelLayout *)v12 layoutTag] == 6553601)
        || [(AVAudioChannelLayout *)v13 layoutTag] == 6619138
        || (OSStatus v14 = [(AVAudioChannelLayout *)v13 layout],
            UInt32 v15 = [(AVAudioChannelLayout *)v13 layoutSize],
            !AudioConverterSetProperty(outAudioConverter, 0x6F636C20u, v15, v14)))
      {
        operator new();
      }
    }
    AudioConverterDispose(outAudioConverter);
    return 0;
  }
  return result;
}

- (NSArray)availableEncodeChannelLayoutTags
{
  return (NSArray *)AVAudioConverterImpl::getInt32List((AudioConverterRef *)self->_impl, 0x6165636Cu, 1);
}

- (NSArray)applicableEncodeSampleRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x61657372u, 1);
}

- (NSArray)availableEncodeSampleRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x76657372u, 1);
}

- (NSArray)applicableEncodeBitRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x61656272u, 0);
}

- (NSArray)availableEncodeBitRates
{
  return (NSArray *)AVAudioConverterImpl::getRateList((AudioConverterRef *)self->_impl, 0x76656272u, 0);
}

- (void)setBitRateStrategy:(NSString *)bitRateStrategy
{
  id v4 = *(OpaqueAudioConverter **)self->_impl;
  if ([(NSString *)bitRateStrategy compare:@"AVAudioBitRateStrategy_Constant"])
  {
    if ([(NSString *)bitRateStrategy compare:@"AVAudioBitRateStrategy_LongTermAverage"])
    {
      if ([(NSString *)bitRateStrategy compare:@"AVAudioBitRateStrategy_VariableConstrained"])
      {
        if ([(NSString *)bitRateStrategy compare:@"AVAudioBitRateStrategy_Variable"]) {
          return;
        }
        int v5 = 3;
      }
      else
      {
        int v5 = 2;
      }
    }
    else
    {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
  int inPropertyData = v5;
  AudioConverterSetProperty(v4, 0x61636266u, 4u, &inPropertyData);
}

- (NSString)bitRateStrategy
{
  v2 = *(OpaqueAudioConverter **)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  unsigned int outPropertyData = 0;
  if (AudioConverterGetProperty(v2, 0x61636266u, &ioPropertyDataSize, &outPropertyData) || outPropertyData > 3) {
    return 0;
  }
  else {
    return &off_1E5965F58[outPropertyData]->isa;
  }
}

- (void)setBitRate:(NSInteger)bitRate
{
  impl = (AudioConverterRef *)self->_impl;
  int inPropertyData = bitRate;
  AudioConverterSetProperty(*impl, 0x62726174u, 4u, &inPropertyData);
}

- (NSInteger)bitRate
{
  impl = (AudioConverterRef *)self->_impl;
  UInt32 ioPropertyDataSize = 4;
  unsigned int outPropertyData = 0;
  AudioConverterGetProperty(*impl, 0x62726174u, &ioPropertyDataSize, &outPropertyData);
  return outPropertyData;
}

@end