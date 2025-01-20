@interface NviAudioFileWriter
- (NSURL)fileURL;
- (NviAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5;
- (void)addSamples:(const void *)a3 numSamples:(int64_t)a4;
- (void)dealloc;
- (void)endAudio;
@end

@implementation NviAudioFileWriter

- (void).cxx_destruct
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 >= 1)
  {
    v4 = (AudioBufferList *)&buf[-((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0)];
    uint64_t mChannelsPerFrame = self->inASBD.mChannelsPerFrame;
    v4->mNumberBuffers = mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      unsigned int v6 = 0;
      int v7 = self->inASBD.mBytesPerFrame * a4;
      p_mData = &v4->mBuffers[0].mData;
      do
      {
        *((_DWORD *)p_mData - 2) = 1;
        *((_DWORD *)p_mData - 1) = v7;
        *p_mData = (char *)a3 + v6;
        p_mData += 2;
        v6 += v7;
        --mChannelsPerFrame;
      }
      while (mChannelsPerFrame);
    }
    OSStatus v9 = ExtAudioFileWrite(self->fFile, a4, v4);
    if (v9)
    {
      OSStatus v10 = v9;
      v11 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[NviAudioFileWriter addSamples:numSamples:]";
        __int16 v14 = 2050;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
}

- (void)endAudio
{
  fFile = self->fFile;
  if (fFile) {
    ExtAudioFileDispose(fFile);
  }
}

- (void)dealloc
{
  [(NviAudioFileWriter *)self endAudio];
  v3.receiver = self;
  v3.super_class = (Class)NviAudioFileWriter;
  [(NviAudioFileWriter *)&v3 dealloc];
}

- (NviAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFURLRef v9 = (const __CFURL *)a3;
  v22.receiver = self;
  v22.super_class = (Class)NviAudioFileWriter;
  OSStatus v10 = [(NviAudioFileWriter *)&v22 init];
  v11 = v10;
  if (v10)
  {
    a5->mSampleRate = a4->mSampleRate;
    p_fFile = &v10->fFile;
    OSStatus v13 = ExtAudioFileCreateWithURL(v9, 0x57415645u, a5, 0, 1u, &v10->fFile);
    if (v13)
    {
      OSStatus v14 = v13;
      uint64_t v15 = NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[NviAudioFileWriter initWithURL:inputFormat:outputFormat:]";
        __int16 v25 = 2114;
        CFURLRef v26 = v9;
        __int16 v27 = 1026;
        OSStatus v28 = v14;
        _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (*p_fFile)
    {
      objc_storeStrong((id *)&v11->_fileURL, a3);
      fFile = v11->fFile;
    }
    else
    {
      fFile = 0;
    }
    ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    uint64_t v17 = *(void *)&a4->mBitsPerChannel;
    long long v18 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_OWORD *)&v11->inASBD.mSampleRate = *(_OWORD *)&a4->mSampleRate;
    *(_OWORD *)&v11->inASBD.mBytesPerPacket = v18;
    *(void *)&v11->inASBD.mBitsPerChannel = v17;
    long long v20 = *(_OWORD *)&a5->mSampleRate;
    long long v19 = *(_OWORD *)&a5->mBytesPerPacket;
    *(void *)&v11->outASBD.mBitsPerChannel = *(void *)&a5->mBitsPerChannel;
    *(_OWORD *)&v11->outASBD.mSampleRate = v20;
    *(_OWORD *)&v11->outASBD.mBytesPerPacket = v19;
  }

  return v11;
}

@end