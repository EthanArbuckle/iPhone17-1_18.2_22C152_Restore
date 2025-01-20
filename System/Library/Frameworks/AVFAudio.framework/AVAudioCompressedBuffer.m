@interface AVAudioCompressedBuffer
- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity;
- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity maximumPacketSize:(NSInteger)maximumPacketSize;
- (AVAudioPacketCount)packetCapacity;
- (AVAudioPacketCount)packetCount;
- (AudioStreamPacketDescription)packetDescriptions;
- (NSInteger)maximumPacketSize;
- (void)data;
- (void)setPacketCount:(AVAudioPacketCount)packetCount;
@end

@implementation AVAudioCompressedBuffer

- (void)setPacketCount:(AVAudioPacketCount)packetCount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  impl = self->super._impl;
  if (impl[5] < packetCount)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v8 = "AVAEInternal.h";
      __int16 v9 = 1024;
      int v10 = 71;
      __int16 v11 = 2080;
      v12 = "AVAudioBuffer.mm";
      __int16 v13 = 1024;
      int v14 = 608;
      __int16 v15 = 2080;
      v16 = "-[AVAudioCompressedBuffer setPacketCount:]";
      __int16 v17 = 2080;
      v18 = "length <= _imp->_packetCapacity";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "length <= _imp->_packetCapacity");
    impl = self->super._impl;
  }
  impl[4] = packetCount;
}

- (void)data
{
  impl = self->super._impl;
  if (*((unsigned char *)impl + 56)) {
    uint64_t v3 = impl[6] + 48;
  }
  else {
    uint64_t v3 = impl[12];
  }
  return *(void **)(v3 + 16);
}

- (AudioStreamPacketDescription)packetDescriptions
{
  return (AudioStreamPacketDescription *)*((void *)self->super._impl + 1);
}

- (NSInteger)maximumPacketSize
{
  return *((unsigned int *)self->super._impl + 6);
}

- (AVAudioPacketCount)packetCount
{
  return *((_DWORD *)self->super._impl + 4);
}

- (AVAudioPacketCount)packetCapacity
{
  return *((_DWORD *)self->super._impl + 5);
}

- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity
{
  return [(AVAudioCompressedBuffer *)self initWithFormat:format packetCapacity:*(void *)&packetCapacity maximumPacketSize:0];
}

- (AVAudioCompressedBuffer)initWithFormat:(AVAudioFormat *)format packetCapacity:(AVAudioPacketCount)packetCapacity maximumPacketSize:(NSInteger)maximumPacketSize
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  __int16 v9 = [(AVAudioFormat *)format streamDescription];
  AudioFormatID mFormatID = v9->mFormatID;
  NSInteger mBytesPerPacket = v9->mBytesPerPacket;
  if (mFormatID == 1634492791 || mFormatID == 1970037111 || mFormatID == 1819304813)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      v27 = "AVAudioBuffer.mm";
      __int16 v28 = 1024;
      int v29 = 570;
      __int16 v30 = 2080;
      v31 = "-[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]";
      __int16 v32 = 2080;
      v33 = "!(fmt.IsLinearPCM() || fmt.mFormatID == kAudioFormatALaw || fmt.mFormatID == kAudioFormatULaw)";
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "!(fmt.IsLinearPCM() || fmt.mFormatID == kAudioFormatALaw || fmt.mFormatID == kAudioFormatULaw)");
  }
  if (mBytesPerPacket) {
    NSInteger v15 = mBytesPerPacket;
  }
  else {
    NSInteger v15 = maximumPacketSize;
  }
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v23 = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      v27 = "AVAudioBuffer.mm";
      __int16 v28 = 1024;
      int v29 = 574;
      __int16 v30 = 2080;
      v31 = "-[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]";
      __int16 v32 = 2080;
      v33 = "maximumPacketSize != 0";
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "maximumPacketSize != 0");
  }
  v21.receiver = self;
  v21.super_class = (Class)AVAudioCompressedBuffer;
  __int16 v17 = [(AVAudioBuffer *)&v21 initWithFormat:format byteCapacity:v15 * packetCapacity];
  v18 = v17;
  if (v17)
  {
    *((_DWORD *)v17->super._impl + 6) = v15;
    *((_DWORD *)v17->super._impl + 5) = packetCapacity;
    *((_DWORD *)v17->super._impl + 4) = 0;
    if (mBytesPerPacket) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = malloc_type_calloc(packetCapacity, 0x10uLL, 0x1000040451B5BE8uLL);
    }
    *((void *)v18->super._impl + 1) = v19;
  }
  return v18;
}

@end