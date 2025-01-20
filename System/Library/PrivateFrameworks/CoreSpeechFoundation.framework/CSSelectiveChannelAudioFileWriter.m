@interface CSSelectiveChannelAudioFileWriter
- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4;
- (BOOL)endAudio;
- (CSSelectiveChannelAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 channelBitset:(unint64_t)a6;
- (NSURL)fileURL;
- (unsigned)numberOfChannels;
- (void)dealloc;
@end

@implementation CSSelectiveChannelAudioFileWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->selectedChannelList, 0);
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)addSamples:(const void *)a3 numSamples:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v4 = 1;
  if (a4 >= 1 && self->isWriting)
  {
    int64_t v24 = a4;
    v23 = &v21;
    UInt32 mBytesPerFrame = self->inASBD.mBytesPerFrame;
    v7 = (AudioBufferList *)((char *)&v21 - ((24 * self->inASBD.mChannelsPerFrame + 15) & 0x3FFFFFFFF0));
    v7->mNumberBuffers = self->inASBD.mChannelsPerFrame;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v22 = self;
    v8 = self->selectedChannelList;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = mBytesPerFrame * v24;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = (char *)v7 + 16 * (v11 + i);
          *((_DWORD *)v16 + 2) = 1;
          *((_DWORD *)v16 + 3) = v12;
          *((void *)v16 + 2) = (char *)a3 + [v15 unsignedIntegerValue] * v12;
        }
        v11 += i;
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v10);
    }

    OSStatus v17 = ExtAudioFileWrite(v22->fFile, v24, v7);
    BOOL v4 = v17 == 0;
    if (v17)
    {
      OSStatus v18 = v17;
      v19 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[CSSelectiveChannelAudioFileWriter addSamples:numSamples:]";
        __int16 v31 = 2050;
        uint64_t v32 = v18;
        _os_log_error_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_ERROR, "%s ::: Error writing to output wave file. : %{public}ld", buf, 0x16u);
      }
    }
  }
  return v4;
}

- (BOOL)endAudio
{
  fFile = self->fFile;
  if (fFile) {
    ExtAudioFileDispose(fFile);
  }
  self->isWriting = 0;
  return 1;
}

- (void)dealloc
{
  [(CSSelectiveChannelAudioFileWriter *)self endAudio];
  v3.receiver = self;
  v3.super_class = (Class)CSSelectiveChannelAudioFileWriter;
  [(CSSelectiveChannelAudioFileWriter *)&v3 dealloc];
}

- (CSSelectiveChannelAudioFileWriter)initWithURL:(id)a3 inputFormat:(AudioStreamBasicDescription *)a4 outputFormat:(AudioStreamBasicDescription *)a5 channelBitset:(unint64_t)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFURLRef v10 = (const __CFURL *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CSSelectiveChannelAudioFileWriter;
  int v11 = [(CSSelectiveChannelAudioFileWriter *)&v26 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_numberOfChannels = a4->mChannelsPerFrame;
    a5->mSampleRate = a4->mSampleRate;
    OSStatus v13 = ExtAudioFileCreateWithURL(v10, 0x57415645u, a5, 0, 1u, &v11->fFile);
    if (v13)
    {
      v14 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CSSelectiveChannelAudioFileWriter initWithURL:inputFormat:outputFormat:channelBitset:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v28) = v13;
        _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s ::: Error creating output file %{public}@, err: %{public}d", buf, 0x1Cu);
      }
    }
    if (v12->fFile) {
      CFURLRef v15 = v10;
    }
    else {
      CFURLRef v15 = 0;
    }
    fileURL = v12->_fileURL;
    v12->_fileURL = (NSURL *)v15;

    fFile = v12->fFile;
    if (fFile) {
      ExtAudioFileSetProperty(fFile, 0x63666D74u, 0x28u, a4);
    }
    v12->isWriting = 1;
    long long v18 = *(_OWORD *)&a4->mSampleRate;
    long long v19 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v12->inASBD.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v12->inASBD.mBytesPerPacket = v19;
    *(_OWORD *)&v12->inASBD.mSampleRate = v18;
    long long v20 = *(_OWORD *)&a5->mSampleRate;
    long long v21 = *(_OWORD *)&a5->mBytesPerPacket;
    *(void *)&v12->outASBD.mBitsPerChannel = *(void *)&a5->mBitsPerChannel;
    *(_OWORD *)&v12->outASBD.mSampleRate = v20;
    *(_OWORD *)&v12->outASBD.mBytesPerPacket = v21;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v28 = __Block_byref_object_copy__12738;
    v29 = __Block_byref_object_dispose__12739;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__CSSelectiveChannelAudioFileWriter_initWithURL_inputFormat_outputFormat_channelBitset___block_invoke;
    v25[3] = &unk_1E6201058;
    v25[4] = buf;
    +[CSUtils iterateBitset:a6 block:v25];
    uint64_t v22 = [*(id *)(*(void *)&buf[8] + 40) mutableCopy];
    selectedChannelList = v12->selectedChannelList;
    v12->selectedChannelList = (NSArray *)v22;

    _Block_object_dispose(buf, 8);
  }

  return v12;
}

void __88__CSSelectiveChannelAudioFileWriter_initWithURL_inputFormat_outputFormat_channelBitset___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

@end