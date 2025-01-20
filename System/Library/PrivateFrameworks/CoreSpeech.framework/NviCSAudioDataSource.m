@interface NviCSAudioDataSource
- (CSAudioStream)audioStream;
- (NSHashTable)receivers;
- (NviCSAudioDataSource)init;
- (NviContext)nviCtx;
- (OS_dispatch_queue)queue;
- (unint64_t)numBytesPerSample;
- (unint64_t)sampleRate;
- (unint64_t)type;
- (void)_createAudioStreamWithCurrentNviContext;
- (void)addReceiver:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 avBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)removeReceiver:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setNviCtx:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)startWithNviContext:(id)a3 didStartHandler:(id)a4;
- (void)stopWithDidStopHandler:(id)a3;
@end

@implementation NviCSAudioDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_nviCtx, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setNviCtx:(id)a3
{
}

- (NviContext)nviCtx
{
  return self->_nviCtx;
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[NviCSAudioDataSource audioStreamProvider:audioChunkForTVAvailable:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    v8 = "-[NviCSAudioDataSource audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v9 = 2114;
    id v10 = v5;
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s provider: %{public}@, unexpectedStop: %{public}ld", (uint8_t *)&v7, 0x20u);
  }
}

- (void)audioStreamProvider:(id)a3 avBufferAvailable:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[NviCSAudioDataSource audioStreamProvider:avBufferAvailable:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NviCSAudioDataSource_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __65__NviCSAudioDataSource_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v7, "receiveOnlyProcessedChannelData", (void)v20))
        {
          v8 = objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", objc_msgSend(MEMORY[0x1E4F5D278], "channelForProcessedInput"));
          uint64_t v9 = [*(id *)(a1 + 40) numSamples];
          uint64_t v10 = [*(id *)(a1 + 40) startSampleCount];
          uint64_t v11 = [*(id *)(a1 + 40) hostTime];
          int64_t v12 = v7;
          uint64_t v13 = v8;
          uint64_t v14 = 1;
          uint64_t v15 = v9;
          uint64_t v16 = v10;
        }
        else
        {
          v8 = [*(id *)(a1 + 40) data];
          uint64_t v17 = [*(id *)(a1 + 40) numChannels];
          uint64_t v18 = [*(id *)(a1 + 40) numSamples];
          uint64_t v19 = [*(id *)(a1 + 40) startSampleCount];
          uint64_t v11 = [*(id *)(a1 + 40) hostTime];
          int64_t v12 = v7;
          uint64_t v13 = v8;
          uint64_t v14 = v17;
          uint64_t v15 = v18;
          uint64_t v16 = v19;
        }
        [v12 audioChunkAvailable:v13 numChannels:v14 numSamplesPerChannel:v15 startSampleId:v16 atAbsMachTimestamp:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

- (void)_createAudioStreamWithCurrentNviContext
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F5D1E8] contextForBuiltInVoiceTrigger];
  id v4 = objc_alloc_init(MEMORY[0x1E4F5D218]);
  [v4 setRequestHistoricalAudioDataSampleCount:1];
  uint64_t v5 = [(NviContext *)self->_nviCtx voiceTriggerInfo];
  v6 = [v5 objectForKeyedSubscript:@"triggerStartSampleCount"];
  [v4 setStartRecordingSampleCount:v6];

  id v7 = +[CSSpeechManager sharedManager];
  id v20 = 0;
  v8 = [v7 audioProviderWithContext:v3 error:&v20];
  id v9 = v20;

  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F5D240];
    id v11 = v8;
    int64_t v12 = [v10 defaultRequestWithContext:v3];
    [v12 setRequiresHistoricalBuffer:1];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    id v19 = v9;
    uint64_t v15 = [v11 audioStreamWithRequest:v12 streamName:v14 error:&v19];

    id v16 = v19;
    audioStream = self->_audioStream;
    self->_audioStream = v15;

    [(CSAudioStream *)self->_audioStream setDelegate:self];
    id v9 = v16;
  }
  else
  {
    uint64_t v18 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v22 = "-[NviCSAudioDataSource _createAudioStreamWithCurrentNviContext]";
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s audioProvider == nil, error : %{public}@", buf, 0x16u);
    }
  }
}

- (void)stopWithDidStopHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke;
  v7[3] = &unk_1E658D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke_2;
  v2[3] = &unk_1E658D328;
  id v3 = *(id *)(a1 + 40);
  [v1 stopAudioStreamWithOption:0 completion:v2];
}

void __47__NviCSAudioDataSource_stopWithDidStopHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      id v8 = "-[NviCSAudioDataSource stopWithDidStopHandler:]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = 0;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Stopped audioStream with result=%d, err=%@", (uint8_t *)&v7, 0x1Cu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startWithNviContext:(id)a3 didStartHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke;
  block[3] = &unk_1E658D198;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  if (!v2[3]) {
    [v2 _createAudioStreamWithCurrentNviContext];
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F5D218]);
  if ([*(id *)(*(void *)(a1 + 32) + 8) requestHistoricalAudio])
  {
    [v3 setRequestHistoricalAudioDataSampleCount:1];
    objc_msgSend(v3, "setStartRecordingSampleCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "reqStartAudioSampleId"));
  }
  else
  {
    [v3 setRequestHistoricalAudioDataSampleCount:0];
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke_2;
  v6[3] = &unk_1E658D378;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 startAudioStreamWithOption:v5 completion:v6];
}

void __60__NviCSAudioDataSource_startWithNviContext_didStartHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = (void *)NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      int v9 = 136315906;
      id v10 = "-[NviCSAudioDataSource startWithNviContext:didStartHandler:]_block_invoke_2";
      __int16 v11 = 2114;
      id v12 = @"NO";
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = [v7 startRecordingSampleCount];
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Start audio stream successfully ? %{public}@, error : %{public}@, startRecordingSampleCount=%lu", (uint8_t *)&v9, 0x2Au);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__NviCSAudioDataSource_removeReceiver___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __39__NviCSAudioDataSource_removeReceiver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NviCSAudioDataSource_addReceiver___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __36__NviCSAudioDataSource_addReceiver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (unint64_t)sampleRate
{
  [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
  return (unint64_t)v2;
}

- (unint64_t)numBytesPerSample
{
  return [MEMORY[0x1E4F5D278] inputRecordingSampleByteDepth];
}

- (unint64_t)type
{
  return 0;
}

- (NviCSAudioDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)NviCSAudioDataSource;
  float v2 = [(NviCSAudioDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    receivers = v2->_receivers;
    v2->_receivers = (NSHashTable *)v3;

    [(NviCSAudioDataSource *)v2 _createAudioStreamWithCurrentNviContext];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nvi.csaudiosrc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end