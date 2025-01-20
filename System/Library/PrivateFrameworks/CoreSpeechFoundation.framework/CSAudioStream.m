@interface CSAudioStream
- (BOOL)isNarrowBand;
- (BOOL)isStreaming;
- (BOOL)isWeakStream;
- (BOOL)needsBoost12dB;
- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4;
- (BOOL)scheduledFutureSample;
- (BOOL)streaming;
- (CSAudioStartStreamOption)startStreamOption;
- (CSAudioStream)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5;
- (CSAudioStreamProviding)streamProvider;
- (CSAudioStreamProvidingDelegate)delegate;
- (CSAudioStreamRequest)streamRequest;
- (NSHashTable)tandemStreams;
- (NSString)UUID;
- (NSString)name;
- (NSUUID)streamingUUID;
- (id)recordSettings;
- (unint64_t)lastForwardedSampleCount;
- (unint64_t)startSampleCount;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4 lastForwardedSampleCount:(unint64_t)a5;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7;
- (void)dealloc;
- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsWeakStream:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNeedsBoost12dB:(BOOL)a3;
- (void)setScheduledFutureSample:(BOOL)a3;
- (void)setStartStreamOption:(id)a3;
- (void)setStreamProvider:(id)a3;
- (void)setStreamRequest:(id)a3;
- (void)setStreaming:(BOOL)a3;
- (void)setStreamingUUID:(id)a3;
- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4;
- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4;
- (void)updateAudioStreamStartTimeInSampleCount:(unint64_t)a3;
@end

@implementation CSAudioStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingUUID, 0);
  objc_storeStrong((id *)&self->_tandemStreams, 0);
  objc_storeStrong((id *)&self->_startStreamOption, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_streamRequest, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_streamProvider);
}

- (void)setStreamingUUID:(id)a3
{
}

- (NSUUID)streamingUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStreaming:(BOOL)a3
{
  self->_streaming = a3;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (void)setNeedsBoost12dB:(BOOL)a3
{
  self->_needsBoost12dB = a3;
}

- (BOOL)needsBoost12dB
{
  return self->_needsBoost12dB;
}

- (NSHashTable)tandemStreams
{
  return self->_tandemStreams;
}

- (void)setIsWeakStream:(BOOL)a3
{
  self->_isWeakStream = a3;
}

- (BOOL)isWeakStream
{
  return self->_isWeakStream;
}

- (CSAudioStartStreamOption)startStreamOption
{
  return self->_startStreamOption;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setStreamRequest:(id)a3
{
}

- (CSAudioStreamRequest)streamRequest
{
  return self->_streamRequest;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)scheduledFutureSample
{
  return self->_scheduledFutureSample;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioStreamProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioStreamProvidingDelegate *)WeakRetained;
}

- (void)setStreamProvider:(id)a3
{
}

- (CSAudioStreamProviding)streamProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamProvider);
  return (CSAudioStreamProviding *)WeakRetained;
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = [(CSAudioStream *)self name];
    int v13 = 136315394;
    v14 = "-[CSAudioStream audioStreamProvider:didHardwareConfigurationChange:]";
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> has received didHardwareConfigurationChange", (uint8_t *)&v13, 0x16u);
  }
  v10 = [(CSAudioStream *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(CSAudioStream *)self delegate];
    [v12 audioStreamProvider:v6 didHardwareConfigurationChange:a4];
  }
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  id v15 = a3;
  v12 = [(CSAudioStream *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(CSAudioStream *)self delegate];
    [v14 audioStreamProvider:v15 numSamplesAvailableInExclave:a4 hostTime:a5 arrivalHostTimeToAudioRecorder:a6 exclaveSampleCount:a7];
  }
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(CSAudioStream *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CSAudioStream *)self delegate];
    [v9 audioStreamProvider:v10 audioChunkForTVAvailable:v6];
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4 lastForwardedSampleCount:(unint64_t)a5
{
  self->_lastForwardedSampleCount = a5;
  [(CSAudioStream *)self audioStreamProvider:a3 audioBufferAvailable:a4];
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(CSAudioStream *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CSAudioStream *)self delegate];
    [v9 audioStreamProvider:v10 audioBufferAvailable:v6];
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(CSAudioStream *)self setStreamingUUID:0];
  [(CSAudioStream *)self setStreaming:0];
  v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = v7;
    v9 = [(CSAudioStream *)self name];
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSAudioStream audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> has received didStopStreamUnexpectedly", buf, 0x16u);
  }
  id v10 = [(CSAudioStream *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(CSAudioStream *)self delegate];
    [v12 audioStreamProvider:v6 didStopStreamUnexpectedly:a4];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v13 = [(CSAudioStream *)self tandemStreams];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v17++) audioStreamProvider:v6 didStopStreamUnexpectedly:a4];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  v18 = [(CSAudioStream *)self tandemStreams];
  [v18 removeAllObjects];
}

- (void)setScheduledFutureSample:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_scheduledFutureSample = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(CSAudioStream *)self tandemStreams];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setScheduledFutureSample:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setStartStreamOption:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_startStreamOption, a3);
  id v6 = [[CSAudioStartStreamOption alloc] initTandemWithOption:v5];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(CSAudioStream *)self tandemStreams];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setStartStreamOption:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)updateAudioStreamStartTimeInSampleCount:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = [(CSAudioStream *)self name];
    *(_DWORD *)buf = 136315650;
    long long v19 = "-[CSAudioStream updateAudioStreamStartTimeInSampleCount:]";
    __int16 v20 = 2114;
    long long v21 = v7;
    __int16 v22 = 2050;
    unint64_t v23 = a3;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Stream %{public}@ set startTimeInSampleCount : %{public}llu", buf, 0x20u);
  }
  self->_startSampleCount = a3;
  self->_lastForwardedSampleCount = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(CSAudioStream *)self tandemStreams];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updateAudioStreamStartTimeInSampleCount:a3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)isNarrowBand
{
  v2 = [(CSAudioStream *)self streamProvider];
  char v3 = [v2 isNarrowBand];

  return v3;
}

- (id)recordSettings
{
  v2 = [(CSAudioStream *)self streamProvider];
  char v3 = [v2 recordSettings];

  return v3;
}

- (BOOL)isStreaming
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = [(CSAudioStream *)self name];
    int v7 = 136315650;
    uint64_t v8 = "-[CSAudioStream isStreaming]";
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 1026;
    BOOL v12 = [(CSAudioStream *)self streaming];
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s AudioStream<%{public}@> is streaming : %{public}d", (uint8_t *)&v7, 0x1Cu);
  }
  return [(CSAudioStream *)self streaming];
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSAudioStream *)self streamProvider];

  if (v8)
  {
    [(CSAudioStream *)self setStreamingUUID:0];
    __int16 v9 = [(CSAudioStream *)self streamProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__CSAudioStream_stopAudioStreamWithOption_completion___block_invoke;
    v11[3] = &unk_1E61FF928;
    v11[4] = self;
    id v12 = v7;
    [v9 stopAudioStream:self option:v6 completion:v11];
  }
  else if (v7)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __54__CSAudioStream_stopAudioStreamWithOption_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) streamingUUID];

    if (!v6) {
      [*(id *)(a1 + 32) setStreaming:0];
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = [*(id *)(a1 + 32) tandemStreams];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = *(void **)(a1 + 32);
      id v12 = v10;
      uint64_t v13 = [v11 tandemStreams];
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[CSAudioStream stopAudioStreamWithOption:completion:]_block_invoke";
      __int16 v29 = 2050;
      uint64_t v30 = [v13 count];
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Delivering didStop to %{public}lu tandem stream(s)", buf, 0x16u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = objc_msgSend(*(id *)(a1 + 32), "tandemStreams", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        __int16 v20 = [*(id *)(a1 + 32) streamProvider];
        [v19 audioStreamProvider:v20 didStopStreamUnexpectedly:7];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  long long v21 = [*(id *)(a1 + 32) tandemStreams];
  [v21 removeAllObjects];
}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSAudioStream *)self streamProvider];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    [(CSAudioStream *)self setStreamingUUID:v9];
    uint64_t v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v19 = "-[CSAudioStream startAudioStreamWithOption:completion:]";
      __int16 v20 = 2114;
      long long v21 = v9;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Creating UUID for start audio stream request : %{public}@", buf, 0x16u);
    }
    __int16 v11 = [(CSAudioStream *)self streamProvider];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CSAudioStream_startAudioStreamWithOption_completion___block_invoke;
    v14[3] = &unk_1E61FFDB0;
    id v15 = v9;
    uint64_t v16 = self;
    id v17 = v7;
    id v12 = v9;
    [v11 startAudioStream:self option:v6 completion:v14];
  }
  else if (v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

uint64_t __55__CSAudioStream_startAudioStreamWithOption_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = v5;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = objc_msgSend(*(id *)(a1 + 40), "streamingUUID", v5);
    LODWORD(v6) = [v6 isEqual:v7];

    if (v6) {
      [*(id *)(a1 + 40) setStreaming:1];
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
  }
  return MEMORY[0x1F4181820]();
}

- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSAudioStream *)self streamProvider];
  [v8 prepareAudioStream:self request:v7 completion:v6];
}

- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CSAudioStream *)self streamProvider];
  LOBYTE(a4) = [v7 prepareAudioStreamSync:self request:v6 error:a4];

  return (char)a4;
}

- (void)setName:(id)a3
{
  id v6 = [a3 stringByAppendingFormat:@"-%@", self->_UUID];
  v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = [(CSAudioStream *)self name];
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSAudioStream dealloc]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s stream %{public}@ is deallocated", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSAudioStream;
  [(CSAudioStream *)&v6 dealloc];
}

- (CSAudioStream)initWithAudioStreamProvider:(id)a3 streamName:(id)a4 streamRequest:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CSAudioStream;
  uint64_t v11 = [(CSAudioStream *)&v22 init];
  id v12 = v11;
  if (v11)
  {
    [(CSAudioStream *)v11 setStreamProvider:v8];
    [(CSAudioStream *)v12 setStreaming:0];
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v14;

    [(CSAudioStream *)v12 setName:v9];
    [(CSAudioStream *)v12 setStreamRequest:v10];
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tandemStreams = v12->_tandemStreams;
    v12->_tandemStreams = (NSHashTable *)v16;

    v12->_needsBoost12dB = 0;
    uint64_t v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = v18;
      __int16 v20 = [(CSAudioStream *)v12 name];
      *(_DWORD *)buf = 136315394;
      long long v24 = "-[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]";
      __int16 v25 = 2114;
      __int16 v26 = v20;
      _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s stream %{public}@ initialized", buf, 0x16u);
    }
  }

  return v12;
}

@end