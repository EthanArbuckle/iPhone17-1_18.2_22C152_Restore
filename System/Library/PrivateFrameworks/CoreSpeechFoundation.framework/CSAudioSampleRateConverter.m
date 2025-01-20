@interface CSAudioSampleRateConverter
+ (id)downsampler;
+ (id)upsampler;
- (CSAudioSampleRateConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4;
- (OpaqueAudioConverter)_createSampleRateConverterWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4;
- (id)convertSampleRateOfBuffer:(id)a3;
- (void)dealloc;
@end

@implementation CSAudioSampleRateConverter

- (id)convertSampleRateOfBuffer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_sampleRateConverter || ![v4 length])
  {
    id v8 = v5;
    goto LABEL_18;
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", (unint64_t)(float)(self->_outBufferScaleFactor * (float)(unint64_t)objc_msgSend(v5, "length")));
  int v7 = 0;
  while (1)
  {
    memset(&outOutputData.mNumberBuffers + 1, 0, 20);
    outOutputData.mNumberBuffers = 1;
    id v8 = v6;
    outOutputData.mBuffers[0].mData = (void *)[v8 mutableBytes];
    UInt32 v9 = [v8 length];
    outOutputData.mBuffers[0].mNumberChannels = self->_outASBD.mChannelsPerFrame;
    outOutputData.mBuffers[0].mDataByteSize = v9;
    UInt32 ioOutputDataPacketSize = 0;
    UInt32 ioOutputDataPacketSize = [v8 length];
    sampleRateConverter = self->_sampleRateConverter;
    inInputDataProcUserData[0] = MEMORY[0x1E4F143A8];
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __56__CSAudioSampleRateConverter_convertSampleRateOfBuffer___block_invoke;
    inInputDataProcUserData[3] = &unk_1E61FF470;
    id v11 = v5;
    v21 = self;
    v22 = v25;
    id v20 = v11;
    OSStatus v12 = AudioConverterFillComplexBuffer(sampleRateConverter, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    int v13 = v12;
    v7 += self->_outASBD.mBytesPerFrame * ioOutputDataPacketSize;
    if (v12 | ioOutputDataPacketSize)
    {
      if (v12 != 1836086393 && v12) {
        goto LABEL_14;
      }
    }
    else
    {
      v14 = CSLogCategoryAudio;
      int v13 = 1836086393;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
        _os_log_debug_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEBUG, "%s Override result as 'mpty'", buf, 0xCu);
      }
    }
    v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG)) {
      break;
    }
    if (v13) {
      goto LABEL_13;
    }
LABEL_11:
  }
  uint64_t v16 = self->_outASBD.mBytesPerFrame * ioOutputDataPacketSize;
  *(_DWORD *)buf = 136315394;
  v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
  __int16 v29 = 2048;
  uint64_t v30 = v16;
  _os_log_debug_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEBUG, "%s Audio resampling done : %lu", buf, 0x16u);
  if (!v13) {
    goto LABEL_11;
  }
LABEL_13:
  if (v13 == 1836086393) {
    goto LABEL_16;
  }
LABEL_14:
  v17 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[CSAudioSampleRateConverter convertSampleRateOfBuffer:]";
    __int16 v29 = 1026;
    LODWORD(v30) = v13;
    _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s AudioConverter is sad: 0x%{public}xd", buf, 0x12u);
  }
LABEL_16:

  [v8 setLength:v7];
  _Block_object_dispose(v25, 8);
LABEL_18:

  return v8;
}

uint64_t __56__CSAudioSampleRateConverter_convertSampleRateOfBuffer___block_invoke(uint64_t a1, int *a2, uint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) length];
  uint64_t v7 = *(void *)(a1 + 40);
  unsigned int v8 = v6 - *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unsigned int v9 = *(_DWORD *)(v7 + 48);
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(v7 + 92);
  if (v9 <= v8)
  {
    int v11 = v8 / v9;
    if (v8 / v9 >= *a2)
    {
      uint64_t v14 = [*(id *)(a1 + 32) bytes];
      uint64_t result = 0;
      *(void *)(a3 + 16) = v14 + *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v13 = *(_DWORD *)(*(void *)(a1 + 40) + 48) * *a2;
    }
    else
    {
      *a2 = v11;
      uint64_t v12 = [*(id *)(a1 + 32) bytes];
      uint64_t result = 0;
      *(void *)(a3 + 16) = v12 + *(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v13 = *(_DWORD *)(*(void *)(a1 + 40) + 48) * v11;
    }
    *(_DWORD *)(a3 + 12) = v13;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v13;
  }
  else
  {
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    uint64_t result = 1836086393;
    *(_DWORD *)(a3 + 12) = 0;
  }
  return result;
}

- (OpaqueAudioConverter)_createSampleRateConverterWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  AudioConverterRef outAudioConverter = 0;
  OSStatus v7 = AudioConverterNew(a3, a4, &outAudioConverter);
  if (!v7)
  {
    int inPropertyData = 127;
    if (AudioConverterSetProperty(outAudioConverter, 0x73726371u, 4u, &inPropertyData))
    {
      AudioConverterDispose(outAudioConverter);
      uint64_t v13 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
      v10 = "%s Cannot set Quality property to audioConverter";
    }
    else
    {
      int inPropertyData = 1852797549;
      if (!AudioConverterSetProperty(outAudioConverter, 0x73726361u, 4u, &inPropertyData))
      {
        float v15 = a4->mSampleRate / a3->mSampleRate;
        self->_outBufferScaleFactor = v15;
        return outAudioConverter;
      }
      AudioConverterDispose(outAudioConverter);
      uint64_t v13 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
      v10 = "%s Cannot set Complexity property to audioConverter";
    }
    int v11 = v13;
    uint32_t v12 = 12;
    goto LABEL_11;
  }
  OSStatus v8 = v7;
  uint64_t v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSAudioSampleRateConverter _createSampleRateConverterWithInASBD:outASBD:]";
    __int16 v20 = 1026;
    OSStatus v21 = v8;
    v10 = "%s Cannot create SampleRateConverter using AudioConverterNew : %{public}d";
    int v11 = v9;
    uint32_t v12 = 18;
LABEL_11:
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
  }
  return 0;
}

- (void)dealloc
{
  sampleRateConverter = self->_sampleRateConverter;
  if (sampleRateConverter)
  {
    AudioConverterDispose(sampleRateConverter);
    self->_sampleRateConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioSampleRateConverter;
  [(CSAudioSampleRateConverter *)&v4 dealloc];
}

- (CSAudioSampleRateConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CSAudioSampleRateConverter;
  int v6 = [(CSAudioSampleRateConverter *)&v19 init];
  OSStatus v7 = (CSAudioSampleRateConverter *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a3->mSampleRate;
    long long v9 = *(_OWORD *)&a3->mBytesPerPacket;
    *((void *)v6 + 7) = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 24) = v8;
    long long v10 = *(_OWORD *)&a4->mSampleRate;
    long long v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *((void *)v6 + 12) = *(void *)&a4->mBitsPerChannel;
    *((_OWORD *)v6 + 4) = v10;
    *((_OWORD *)v6 + 5) = v11;
    long long v12 = *(_OWORD *)&a3->mBytesPerPacket;
    v17[0] = *(_OWORD *)&a3->mSampleRate;
    v17[1] = v12;
    uint64_t v18 = *(void *)&a3->mBitsPerChannel;
    long long v13 = *(_OWORD *)&a4->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a4->mSampleRate;
    v15[1] = v13;
    uint64_t v16 = *(void *)&a4->mBitsPerChannel;
    *((void *)v6 + 1) = [v6 _createSampleRateConverterWithInASBD:v17 outASBD:v15];
  }
  return v7;
}

+ (id)downsampler
{
  v2 = [CSAudioSampleRateConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmNarrowBandASBD];
  v3 = [(CSAudioSampleRateConverter *)v2 initWithInASBD:v6 outASBD:&v5];
  return v3;
}

+ (id)upsampler
{
  v2 = [CSAudioSampleRateConverter alloc];
  +[CSFAudioStreamBasicDescriptionFactory lpcmNarrowBandASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmASBD];
  v3 = [(CSAudioSampleRateConverter *)v2 initWithInASBD:v6 outASBD:&v5];
  return v3;
}

@end