@interface CSAudioFileReader
- (BOOL)prepareRecording:(id)a3;
- (BOOL)setRecordBufferDuration:(double)a3;
- (BOOL)startRecording;
- (CSAudioFileReader)initWithURL:(id)a3;
- (CSAudioFileReaderDelegate)delegate;
- (id)readSamplesFromChannelIdx:(unsigned int)a3;
- (void)_readAudioBufferAndFeed;
- (void)close;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)stopRecording;
@end

@implementation CSAudioFileReader

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioFileReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioFileReaderDelegate *)WeakRetained;
}

- (void)close
{
  fFile = self->_fFile;
  if (fFile) {
    ExtAudioFileDispose(fFile);
  }
}

- (id)readSamplesFromChannelIdx:(unsigned int)a3
{
  return 0;
}

- (void)dealloc
{
  [(CSAudioFileReader *)self close];
  v3.receiver = self;
  v3.super_class = (Class)CSAudioFileReader;
  [(CSAudioFileReader *)&v3 dealloc];
}

- (void)stopRecording
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSAudioFileReader stopRecording]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping audio file feed timer", buf, 0xCu);
  }
  dispatch_source_cancel((dispatch_source_t)self->_audioFeedTimer);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = 0;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CSAudioFileReader_stopRecording__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
  ExtAudioFileSeek(self->_fFile, 0);
}

void __34__CSAudioFileReader_stopRecording__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [v4 audioFileReaderDidStopRecording:*(void *)(a1 + 32) forReason:0];
  }
}

- (void)_readAudioBufferAndFeed
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double mSampleRate = self->_outASBD.mSampleRate;
  double v5 = self->_bufferDuration * mSampleRate;
  LODWORD(mSampleRate) = self->_outASBD.mBytesPerFrame;
  LODWORD(v2) = self->_outASBD.mChannelsPerFrame;
  unint64_t v6 = (unint64_t)(v5 * (double)*(unint64_t *)&mSampleRate * (double)v2);
  v7 = [MEMORY[0x1E4F1CA58] dataWithLength:v6];
  *(void *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = self->_outASBD.mChannelsPerFrame;
  ioData.mBuffers[0].mDataByteSize = v6;
  id v8 = v7;
  ioData.mBuffers[0].mData = (void *)[v8 bytes];
  UInt32 ioNumberFrames = v6;
  OSStatus v9 = ExtAudioFileRead(self->_fFile, &ioNumberFrames, &ioData);
  UInt32 v10 = ioNumberFrames;
  if (v9 || !ioNumberFrames)
  {
    v11 = CSLogCategoryAudio;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioFileReader _readAudioBufferAndFeed]";
        __int16 v19 = 1024;
        UInt32 v20 = v9;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s ::: Error reading data from audio file : %d", buf, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSAudioFileReader _readAudioBufferAndFeed]";
        __int16 v19 = 1024;
        UInt32 v20 = v10;
        _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Reach to EOF, chunkSize = %d", buf, 0x12u);
      }
      memset((void *)[v8 bytes], 1, v6);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 audioFileReaderBufferAvailable:self buffer:v8 atTime:mach_absolute_time()];
  }
}

- (BOOL)startRecording
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    float bufferDuration = self->_bufferDuration;
    float mSampleRate = self->_outASBD.mSampleRate;
    UInt32 mBytesPerFrame = self->_outASBD.mBytesPerFrame;
    UInt32 mChannelsPerFrame = self->_outASBD.mChannelsPerFrame;
    *(_DWORD *)buf = 136316162;
    v17 = "-[CSAudioFileReader startRecording]";
    __int16 v18 = 2048;
    double v19 = bufferDuration;
    __int16 v20 = 2048;
    double v21 = mSampleRate;
    __int16 v22 = 1024;
    UInt32 v23 = mBytesPerFrame;
    __int16 v24 = 1024;
    UInt32 v25 = mChannelsPerFrame;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting audio file feed timer, float bufferDuration = %f sampleRate = %f, bytesPerFrame = %d, channelsPerFrame = %d", buf, 0x2Cu);
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v8;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0, (unint64_t)(self->_bufferDuration * 1000000000.0), 0x5F5E100uLL);
  objc_initWeak((id *)buf, self);
  UInt32 v10 = self->_audioFeedTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__CSAudioFileReader_startRecording__block_invoke;
  handler[3] = &unk_1E6201160;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__CSAudioFileReader_startRecording__block_invoke_2;
  v13[3] = &unk_1E6201288;
  v13[4] = self;
  dispatch_async(queue, v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __35__CSAudioFileReader_startRecording__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readAudioBufferAndFeed];
}

void __35__CSAudioFileReader_startRecording__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [v4 audioFileReaderDidStartRecording:*(void *)(a1 + 32) successfully:1 error:0];
  }
}

- (BOOL)prepareRecording:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    uint64_t v19 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v40 = 136315138;
    v41 = "-[CSAudioFileReader prepareRecording:]";
    __int16 v20 = "%s CSAudioFileReader requires prepare recording settings to feed audio";
    goto LABEL_18;
  }
  uint64_t v6 = *MEMORY[0x1E4F151D8];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F151D8]];
  if (v7)
  {
    id v8 = (void *)v7;
    OSStatus v9 = [v5 objectForKeyedSubscript:v6];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if (v10 != 1819304813)
    {
      uint64_t v19 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      int v40 = 136315138;
      v41 = "-[CSAudioFileReader prepareRecording:]";
      __int16 v20 = "%s CSAudioFileReader only support LinearPCM to feed";
LABEL_18:
      v33 = v19;
      uint32_t v34 = 12;
LABEL_26:
      _os_log_error_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v40, v34);
      goto LABEL_22;
    }
  }
  uint64_t v11 = *MEMORY[0x1E4F15268];
  uint64_t v12 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15268]];
  if (!v12
    || (char v13 = (void *)v12,
        [v5 objectForKeyedSubscript:v11],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 floatValue],
        float v16 = v15,
        v14,
        v13,
        v16 == 0.0))
  {
    +[CSConfig inputRecordingSampleRate];
    self->_outASBD.float mSampleRate = v21;
  }
  else
  {
    v17 = [v5 objectForKeyedSubscript:v11];
    [v17 floatValue];
    self->_outASBD.float mSampleRate = v18;
  }
  self->_outASBD.mFormatID = 1819304813;
  uint64_t v22 = *MEMORY[0x1E4F15210];
  uint64_t v23 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15210]];
  if (v23
    && (__int16 v24 = (void *)v23,
        [v5 objectForKeyedSubscript:v22],
        UInt32 v25 = objc_claimAutoreleasedReturnValue(),
        char v26 = [v25 BOOLValue],
        v25,
        v24,
        (v26 & 1) != 0))
  {
    AudioFormatFlags v27 = 9;
  }
  else
  {
    AudioFormatFlags v27 = 12;
  }
  self->_outASBD.mFormatFlags = v27;
  v28 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F151E8]];
  self->_outASBD.mBitsPerChannel = [v28 unsignedIntValue];

  UInt32 v29 = self->_outASBD.mBitsPerChannel >> 3;
  self->_outASBD.mBytesPerPacket = v29;
  self->_outASBD.mFramesPerPacket = 1;
  self->_outASBD.UInt32 mBytesPerFrame = v29;
  uint64_t v30 = *MEMORY[0x1E4F15230];
  v31 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15230]];

  if (v31)
  {
    v32 = [v5 objectForKeyedSubscript:v30];
    self->_outASBD.UInt32 mChannelsPerFrame = [v32 unsignedIntValue];
  }
  else
  {
    self->_outASBD.UInt32 mChannelsPerFrame = 1;
  }
  OSStatus v35 = ExtAudioFileSetProperty(self->_fFile, 0x63666D74u, 0x28u, &self->_outASBD);
  if (!v35)
  {
    BOOL v38 = 1;
    goto LABEL_23;
  }
  OSStatus v36 = v35;
  uint64_t v37 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    int v40 = 136315394;
    v41 = "-[CSAudioFileReader prepareRecording:]";
    __int16 v42 = 1024;
    OSStatus v43 = v36;
    __int16 v20 = "%s Setting ExtAudioFileSetProperty failed : %d";
    v33 = v37;
    uint32_t v34 = 18;
    goto LABEL_26;
  }
LABEL_22:
  BOOL v38 = 0;
LABEL_23:

  return v38;
}

- (BOOL)setRecordBufferDuration:(double)a3
{
  self->_float bufferDuration = a3;
  return 1;
}

- (CSAudioFileReader)initWithURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = (const __CFURL *)a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAudioFileReader;
  double v5 = [(CSAudioFileReader *)&v13 init];
  if (v5
    && (dispatch_queue_t v6 = dispatch_queue_create("CSAudioFileReader Queue", 0),
        queue = v5->_queue,
        v5->_queue = (OS_dispatch_queue *)v6,
        queue,
        (OSStatus v8 = ExtAudioFileOpenURL(v4, &v5->_fFile)) != 0))
  {
    OSStatus v9 = v8;
    uint64_t v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      float v15 = "-[CSAudioFileReader initWithURL:]";
      __int16 v16 = 2112;
      CFURLRef v17 = v4;
      __int16 v18 = 1024;
      OSStatus v19 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s ::: Error reading file %@, err: %d", buf, 0x1Cu);
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v5;
  }

  return v11;
}

@end