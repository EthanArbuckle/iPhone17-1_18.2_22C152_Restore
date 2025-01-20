@interface NviDirectionalitySignalProvider
- (BOOL)doneProcessing;
- (BOOL)receiveOnlyProcessedChannelData;
- (NSHashTable)delegates;
- (NSMutableDictionary)azDistribution;
- (NviAssetsProvider)assetsProvider;
- (NviAudioDataSource)dataSrc;
- (NviAudioFileWriter)audioFileWriter;
- (NviContext)nviCtx;
- (NviDataLogger)sigDataWriter;
- (NviDirectionalitySignalData)dirSigData;
- (NviDirectionalitySignalProvider)initWithDataSource:(id)a3 assetsProvider:(id)a4;
- (OS_dispatch_queue)queue;
- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer;
- (float)currEstimatedAzimuth;
- (float)dirAzimuthEMAParam;
- (int64_t)currReqFirstSampleId;
- (unint64_t)currNumSamplesProcessed;
- (unint64_t)sigType;
- (void)addDelegate:(id)a3;
- (void)audioChunkAvailable:(id)a3 numChannels:(unint64_t)a4 numSamplesPerChannel:(unint64_t)a5 startSampleId:(unint64_t)a6 atAbsMachTimestamp:(unint64_t)a7;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)reset;
- (void)setAssetsProvider:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAzDistribution:(id)a3;
- (void)setCurrEstimatedAzimuth:(float)a3;
- (void)setCurrNumSamplesProcessed:(unint64_t)a3;
- (void)setCurrReqFirstSampleId:(int64_t)a3;
- (void)setDataSrc:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDirAzimuthEMAParam:(float)a3;
- (void)setDirSigData:(id)a3;
- (void)setDoneProcessing:(BOOL)a3;
- (void)setNviCtx:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSigDataWriter:(id)a3;
- (void)setSnAudioStreamAnalyzer:(id)a3;
- (void)startWithNviContext:(id)a3 didStartHandler:(id)a4;
- (void)stopWithDidStopHandler:(id)a3;
@end

@implementation NviDirectionalitySignalProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_azDistribution, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_sigDataWriter, 0);
  objc_storeStrong((id *)&self->_dirSigData, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_nviCtx, 0);
  objc_storeStrong((id *)&self->_assetsProvider, 0);
  objc_storeStrong((id *)&self->_dataSrc, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAzDistribution:(id)a3
{
}

- (NSMutableDictionary)azDistribution
{
  return self->_azDistribution;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (NviAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setDoneProcessing:(BOOL)a3
{
  self->_doneProcessing = a3;
}

- (BOOL)doneProcessing
{
  return self->_doneProcessing;
}

- (void)setSigDataWriter:(id)a3
{
}

- (NviDataLogger)sigDataWriter
{
  return self->_sigDataWriter;
}

- (void)setDirSigData:(id)a3
{
}

- (NviDirectionalitySignalData)dirSigData
{
  return self->_dirSigData;
}

- (void)setCurrEstimatedAzimuth:(float)a3
{
  self->_currEstimatedAzimuth = a3;
}

- (float)currEstimatedAzimuth
{
  return self->_currEstimatedAzimuth;
}

- (void)setCurrNumSamplesProcessed:(unint64_t)a3
{
  self->_currNumSamplesProcessed = a3;
}

- (unint64_t)currNumSamplesProcessed
{
  return self->_currNumSamplesProcessed;
}

- (void)setCurrReqFirstSampleId:(int64_t)a3
{
  self->_currReqFirstSampleId = a3;
}

- (int64_t)currReqFirstSampleId
{
  return self->_currReqFirstSampleId;
}

- (void)setDirAzimuthEMAParam:(float)a3
{
  self->_dirAzimuthEMAParam = a3;
}

- (float)dirAzimuthEMAParam
{
  return self->_dirAzimuthEMAParam;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setDelegates:(id)a3
{
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setNviCtx:(id)a3
{
}

- (NviContext)nviCtx
{
  return self->_nviCtx;
}

- (void)setAssetsProvider:(id)a3
{
}

- (NviAssetsProvider)assetsProvider
{
  return self->_assetsProvider;
}

- (void)setDataSrc:(id)a3
{
}

- (NviAudioDataSource)dataSrc
{
  return self->_dataSrc;
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[NviDirectionalitySignalProvider request:didFailWithError:]";
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NviDirectionalitySignalProvider_request_didProduceResult___block_invoke;
  v8[3] = &unk_1E658D4B0;
  id v9 = v5;
  __int16 v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __60__NviDirectionalitySignalProvider_request_didProduceResult___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 timeRange];
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v33;
    if (v3)
    {
      [v3 timeRange];
      uint64_t v5 = *((void *)&v31 + 1);
      id v6 = *(void **)(a1 + 32);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
  }
  id v6 = 0;
  uint64_t v5 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
LABEL_6:
  uint64_t v7 = v5 + v4;
  float v8 = *(float *)(*(void *)(a1 + 40) + 12);
  [v6 azimuth];
  *(float *)(*(void *)(a1 + 40) + 16) = (float)((float)(1.0 - *(float *)(*(void *)(a1 + 40) + 12))
                                                  * *(float *)(*(void *)(a1 + 40) + 16))
                                          + (float)(v8 * v9);
  [*(id *)(*(void *)(a1 + 40) + 80) setSigGenTs:mach_absolute_time()];
  __int16 v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 timeRange];
    uint64_t v11 = v27;
  }
  else
  {
    uint64_t v11 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
  }
  [*(id *)(*(void *)(a1 + 40) + 80) setStartSample:v11];
  [*(id *)(*(void *)(a1 + 40) + 80) setEndSample:v7];
  [*(id *)(a1 + 32) azimuth];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "setAzimuth:");
  uint64_t v12 = *(void *)(a1 + 40);
  LODWORD(v13) = *(_DWORD *)(v12 + 16);
  [*(id *)(v12 + 80) setEstimatedAzimuth:v13];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "setProcessedAudioDurMs:", (double)(*(void *)(*(void *)(a1 + 40) + 72)/ (unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "sampleRate"))* 1000.0);
  uint64_t v14 = [*(id *)(a1 + 32) spatialSpectrum];
  [*(id *)(*(void *)(a1 + 40) + 80) setSpatialSpectrumData:v14];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = *(id *)(*(void *)(a1 + 40) + 48);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "signalProvider:hasSignalData:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 80), (void)v23);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v17);
  }

  uint64_t v20 = *(void *)(a1 + 40);
  v21 = *(void **)(v20 + 88);
  v22 = [*(id *)(v20 + 80) stringForLogging];
  [v21 logData:v22];
}

- (void)audioChunkAvailable:(id)a3 numChannels:(unint64_t)a4 numSamplesPerChannel:(unint64_t)a5 startSampleId:(unint64_t)a6 atAbsMachTimestamp:(unint64_t)a7
{
  id v11 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__NviDirectionalitySignalProvider_audioChunkAvailable_numChannels_numSamplesPerChannel_startSampleId_atAbsMachTimestamp___block_invoke;
  block[3] = &unk_1E658A1B8;
  block[4] = self;
  id v15 = v11;
  unint64_t v16 = a5;
  unint64_t v17 = a6;
  unint64_t v18 = a4;
  id v13 = v11;
  dispatch_async(queue, block);
}

void __121__NviDirectionalitySignalProvider_audioChunkAvailable_numChannels_numSamplesPerChannel_startSampleId_atAbsMachTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 96);
    id v4 = [*(id *)(a1 + 40) rawMicChannelsDataWithNumSamplesPerChannel:*(void *)(a1 + 48)];
    objc_msgSend(v3, "addSamples:numSamples:", objc_msgSend(v4, "bytes"), *(void *)(a1 + 48));

    uint64_t v5 = *(void *)(a1 + 32);
    if ((*(void *)(v5 + 64) & 0x8000000000000000) != 0)
    {
      *(void *)(v5 + 64) = *(void *)(a1 + 56);
      id v6 = (void *)NviLogContextFacility;
      if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
        uint64_t v9 = *(void *)(a1 + 64);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = v6;
        int v28 = 136316162;
        long long v29 = "-[NviDirectionalitySignalProvider audioChunkAvailable:numChannels:numSamplesPerChannel:startSampleId:atAbs"
              "MachTimestamp:]_block_invoke";
        __int16 v30 = 2050;
        uint64_t v31 = v8;
        __int16 v32 = 2050;
        uint64_t v33 = v9;
        __int16 v34 = 2050;
        uint64_t v35 = v10;
        __int16 v36 = 2050;
        uint64_t v37 = [v7 length];
        _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Dir: firstSample: %{public}lu, numChannels=%{public}lu, numSamplesPerChannel: %{public}lu, length: %{public}lu", (uint8_t *)&v28, 0x34u);
      }
    }
    uint64_t v12 = [*(id *)(a1 + 40) rawMicChannelsDataWithNumSamplesPerChannel:*(void *)(a1 + 48)];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F15350]) initWithLayoutTag:7208966];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F153A0]), "initStandardFormatWithSampleRate:channelLayout:", v13, (double)(unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "sampleRate"));
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v14 frameCapacity:*(unsigned int *)(a1 + 48)];
    [v15 setFrameLength:*(unsigned int *)(a1 + 48)];
    uint64_t v16 = *(void *)(a1 + 48);
    unsigned int v17 = +[NviConstants numChannelsForNviDirectionality];
    if (v17)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 2 * v16;
      uint64_t v21 = v17;
      do
      {
        uint64_t v22 = [v12 bytes];
        uint64_t v23 = [v15 mutableAudioBufferList];
        uint64_t v24 = *(void *)(a1 + 48);
        if (v24)
        {
          long long v25 = *(float **)(v23 + 16 * v19 + 16);
          long long v26 = (__int16 *)(v22 + v18);
          do
          {
            int v27 = *v26++;
            *v25++ = (float)v27 / 32767.0;
            --v24;
          }
          while (v24);
        }
        ++v19;
        v18 += v20;
      }
      while (v19 != v21);
    }
    [*(id *)(*(void *)(a1 + 32) + 56) analyzeAudioBuffer:v15 atAudioFramePosition:*(void *)(*(void *)(a1 + 32) + 72)];
    *(void *)(*(void *)(a1 + 32) + 72) += *(void *)(a1 + 48);
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NviDirectionalitySignalProvider_reset__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__NviDirectionalitySignalProvider_reset__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = 0;
  *(_DWORD *)(*(void *)(result + 32) + 16) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)stopWithDidStopHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NviDirectionalitySignalProvider_stopWithDidStopHandler___block_invoke;
  v7[3] = &unk_1E658D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__NviDirectionalitySignalProvider_stopWithDidStopHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeReceiver:");
  [*(id *)(*(void *)(a1 + 32) + 88) endRequest];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;

  [*(id *)(*(void *)(a1 + 32) + 96) endAudio];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = 0;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (void)startWithNviContext:(id)a3 didStartHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NviDirectionalitySignalProvider_startWithNviContext_didStartHandler___block_invoke;
  block[3] = &unk_1E658D198;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __71__NviDirectionalitySignalProvider_startWithNviContext_didStartHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 32) dirAzimuthEMAParam];
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = v2;
  *(void *)(*(void *)(a1 + 32) + 64) = -1;
  *(void *)(*(void *)(a1 + 32) + 72) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F15350]) initWithLayoutTag:7208966];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F153A0]), "initStandardFormatWithSampleRate:channelLayout:", v3, (double)(unint64_t)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "sampleRate"));
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F3BED0]) initWithFormat:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;

  id v8 = objc_alloc_init(MEMORY[0x1E4F3BF08]);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 56);
  id v38 = 0;
  int v11 = [v10 addRequest:v8 withObserver:v9 error:&v38];
  id v12 = v38;
  id v13 = v12;
  if (!v11 || v12)
  {
    uint64_t v14 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[NviDirectionalitySignalProvider startWithNviContext:didStartHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to create Directionality req: %@", buf, 0x16u);
    }
  }
  id v15 = [(NviSignalData *)[NviDirectionalitySignalData alloc] initWithSignalType:4 timestamp:mach_absolute_time()];
  uint64_t v16 = *(void *)(a1 + 32);
  unsigned int v17 = *(void **)(v16 + 80);
  *(void *)(v16 + 80) = v15;

  if (NviIsInternalBuild_onceToken != -1) {
    dispatch_once(&NviIsInternalBuild_onceToken, &__block_literal_global_12_13969);
  }
  if (NviIsInternalBuild_isInternal
    && [*(id *)(*(void *)(a1 + 32) + 32) isDirectionalityLoggingEnabled])
  {
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 40) rootLogDir];
    uint64_t v19 = [v18 stringByAppendingPathComponent:@"dir.wav"];

    uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19];
    uint64_t v40 = 0;
    memset(buf, 0, sizeof(buf));
    +[NviConstants nviDirectionalityLpcmNonInterleavedASBD];
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    +[NviConstants nviDirectionalityLpcmInterleavedASBD];
    uint64_t v21 = [NviAudioFileWriter alloc];
    v33[0] = *(_OWORD *)buf;
    v33[1] = *(_OWORD *)&buf[16];
    uint64_t v34 = v40;
    v31[0] = v35;
    v31[1] = v36;
    uint64_t v32 = v37;
    uint64_t v22 = [(NviAudioFileWriter *)v21 initWithURL:v20 inputFormat:v33 outputFormat:v31];
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void **)(v23 + 96);
    *(void *)(v23 + 96) = v22;

    long long v25 = [*(id *)(*(void *)(a1 + 32) + 40) rootLogDir];
    long long v26 = [v25 stringByAppendingPathComponent:@"dir.data"];

    int v27 = +[NviDirectionalitySignalData headerString];
    int v28 = [[NviDataLogger alloc] initWithFilePath:v26 appendHdr:v27];
    uint64_t v29 = *(void *)(a1 + 32);
    __int16 v30 = *(void **)(v29 + 88);
    *(void *)(v29 + 88) = v28;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addReceiver:");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__NviDirectionalitySignalProvider_removeDelegate___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __50__NviDirectionalitySignalProvider_removeDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__NviDirectionalitySignalProvider_addDelegate___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __47__NviDirectionalitySignalProvider_addDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[NviDirectionalitySignalProvider dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)NviDirectionalitySignalProvider;
  [(NviDirectionalitySignalProvider *)&v4 dealloc];
}

- (NviDirectionalitySignalProvider)initWithDataSource:(id)a3 assetsProvider:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NviDirectionalitySignalProvider;
  uint64_t v9 = [(NviDirectionalitySignalProvider *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSrc, a3);
    objc_storeStrong((id *)&v10->_assetsProvider, a4);
    v10->_currReqFirstSampleId = -1;
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nvi.sigprov.dir", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    id v15 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[NviDirectionalitySignalProvider initWithDataSource:assetsProvider:]";
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s nvidir=%p", buf, 0x16u);
    }
  }

  return v10;
}

- (BOOL)receiveOnlyProcessedChannelData
{
  return 0;
}

- (unint64_t)sigType
{
  return 4;
}

@end