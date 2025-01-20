@interface CSExclaveRecordClient
+ (id)sharedClient;
- (BOOL)fetchAndStoreAudioBuffer;
- (BOOL)initializeSecondPass;
- (BOOL)isRecording;
- (BOOL)prepare;
- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6;
- (CSExclaveAudioProvidingDelegate)delegate;
- (CSExclaveIndicatorController)exclaveIndicatorController;
- (CSExclaveRecordClient)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (unint64_t)startSensor;
- (unint64_t)stopSensor;
- (void)adBlockerMatchingInProgress:(id)a3;
- (void)configAOPVoiceTrigger;
- (void)fetchAOPVoiceTriggerResult:(id)a3;
- (void)processBargeInVoiceTriggerWithResult:(id)a3;
- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4;
- (void)requestHistoricalAudioBufferFor:(unint64_t)a3 startSample:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6;
- (void)resetFirstPassVoiceTrigger;
- (void)setAdBlockerAsset:(id)a3;
- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5;
- (void)setAudioFeedTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExclaveIndicatorController:(id)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)startAdBlockerMatching;
- (void)startBargeInVoiceTrigger;
- (void)startSecondPassVoiceTriggerWithFirstPassSource:(unint64_t)a3 enablePHS:(BOOL)a4 supportMultiPhrase:(BOOL)a5 activeChannel:(unsigned int)a6;
- (void)startSecureAdBlockerMobileAssetLoaderService:(id)a3;
- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4;
- (void)stopAdBlockerMatching;
- (void)stopBargeInVoiceTrigger;
- (void)stopSecondPassVoiceTrigger;
- (void)stopSecureAdBlockerMobileAssetLoaderService:(id)a3;
- (void)stopSecureMobileAssetLoaderService:(id)a3;
@end

@implementation CSExclaveRecordClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveIndicatorController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioProvidingProxy, 0);
}

- (void)setExclaveIndicatorController:(id)a3
{
}

- (CSExclaveIndicatorController)exclaveIndicatorController
{
  return self->_exclaveIndicatorController;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (CSExclaveAudioProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSExclaveAudioProvidingDelegate *)WeakRetained;
}

- (void)adBlockerMatchingInProgress:(id)a3
{
}

- (void)startAdBlockerMatching
{
}

- (void)stopAdBlockerMatching
{
}

- (void)setAdBlockerAsset:(id)a3
{
}

- (void)stopSecureAdBlockerMobileAssetLoaderService:(id)a3
{
}

- (void)startSecureAdBlockerMobileAssetLoaderService:(id)a3
{
}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
}

- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6
{
  return [(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy setSpeakerProfile:a3 numEmbeddings:a4 dimension:a5 speakerRecognizerType:a6];
}

- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4
{
}

- (void)stopSecondPassVoiceTrigger
{
}

- (void)startSecondPassVoiceTriggerWithFirstPassSource:(unint64_t)a3 enablePHS:(BOOL)a4 supportMultiPhrase:(BOOL)a5 activeChannel:(unsigned int)a6
{
  if (a3 - 11 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1BA25E900[a3 - 11];
  }
  uint64_t v7 = 256;
  if (!a5) {
    uint64_t v7 = 0;
  }
  -[CSSecureSiriAudioProvidingProxy startSecondPassVoiceTriggerWithStartOption:](self->_audioProvidingProxy, "startSecondPassVoiceTriggerWithStartOption:", v6, v7 | a4 | (*(void *)&a6 << 32));
}

- (BOOL)initializeSecondPass
{
  return [(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy initializeSecondPass];
}

- (void)resetFirstPassVoiceTrigger
{
}

- (void)processBargeInVoiceTriggerWithResult:(id)a3
{
}

- (void)stopBargeInVoiceTrigger
{
}

- (void)startBargeInVoiceTrigger
{
}

- (void)fetchAOPVoiceTriggerResult:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSExclaveRecordClient fetchAOPVoiceTriggerResult:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy fetchAOPVoiceTriggerResult:v4];
}

- (void)configAOPVoiceTrigger
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSExclaveRecordClient configAOPVoiceTrigger]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  if (([(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy configAOPVoiceTrigger] & 1) == 0)
  {
    id v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[CSExclaveRecordClient configAOPVoiceTrigger]";
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to config AOP VoiceTrigger", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)requestHistoricalAudioBufferFor:(unint64_t)a3 startSample:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSExclaveRecordClient requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:]";
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  audioProvidingProxy = self->_audioProvidingProxy;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__CSExclaveRecordClient_requestHistoricalAudioBufferFor_startSample_numSamples_hostTime___block_invoke;
  v13[3] = &unk_1E61FF740;
  v13[4] = self;
  v13[5] = a5;
  v13[6] = a3;
  v13[7] = a6;
  [(CSSecureSiriAudioProvidingProxy *)audioProvidingProxy requestHistoricalAudioBufferWithStartSample:a4 completion:v13];
}

void __89__CSExclaveRecordClient_requestHistoricalAudioBufferFor_startSample_numSamples_hostTime___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v5 = *(_DWORD *)(a1 + 40);
    [*(id *)(a1 + 32) exclaveIndicatorController];
    uint64_t v6 = (2 * v5 * a3);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v14 copyBufferWithSize:v6];

    if (v7)
    {
      id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:v6];
      uint64_t v8 = v15;
      if (+[CSConfig inputRecordingIsFloat])
      {
        uint64_t v9 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:](CSFLPCMTypeConverter, "convertToFloatLPCMBufFromShortLPCMBuf:");

        uint64_t v8 = (void *)v9;
      }
      v10 = [*(id *)(a1 + 32) delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        v12 = [*(id *)(a1 + 32) delegate];
        [v12 exclaveRecordClientAudioBuffer:*(void *)(a1 + 32) audioStreamHandleId:*(void *)(a1 + 48) audioBuffer:v8 hostTime:*(void *)(a1 + 56)];
      }
    }
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSExclaveRecordClient requestHistoricalAudioBufferFor:startSample:numSamples:hostTime:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed!!!", buf, 0xCu);
    }
  }
}

- (BOOL)fetchAndStoreAudioBuffer
{
  return [(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy fetchAndStoreAudioBuffer];
}

- (unint64_t)stopSensor
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(CSExclaveRecordClient *)self exclaveIndicatorController];
  unint64_t v3 = [v2 sensorStop];

  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSExclaveRecordClient stopSensor]";
    __int16 v8 = 2048;
    unint64_t v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s stop sensor with status: %lu", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (unint64_t)startSensor
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(CSExclaveRecordClient *)self exclaveIndicatorController];
  unint64_t v3 = [v2 sensorStart];

  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSExclaveRecordClient startSensor]";
    __int16 v8 = 2048;
    unint64_t v9 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Start sensor with status: %lu", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (BOOL)prepare
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSExclaveRecordClient prepare]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Prepare CSExclaveRecordClient", (uint8_t *)&v6, 0xCu);
  }
  if (+[CSUtils isSiriDSPTurnedOn]) {
    unint64_t v4 = +[CSConfig exclaveHALInputNumChannelsWithDSP];
  }
  else {
    unint64_t v4 = +[CSConfig exclaveHALInputNumChannelsWithoutDSP];
  }
  return [(CSSecureSiriAudioProvidingProxy *)self->_audioProvidingProxy prepare:v4];
}

- (void)setDelegate:(id)a3
{
}

- (CSExclaveRecordClient)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CSExclaveRecordClient;
  v2 = [(CSExclaveRecordClient *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSExclaveRecordClient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    int v5 = (CSSecureSiriAudioProvidingProxy *)objc_alloc_init(MEMORY[0x1E4F5D128]);
    audioProvidingProxy = v2->_audioProvidingProxy;
    v2->_audioProvidingProxy = v5;

    uint64_t v7 = objc_alloc_init(CSExclaveIndicatorController);
    exclaveIndicatorController = v2->_exclaveIndicatorController;
    v2->_exclaveIndicatorController = v7;
  }
  unint64_t v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSExclaveRecordClient init]";
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Creating CSExclaveRecordClient", buf, 0xCu);
  }
  return v2;
}

+ (id)sharedClient
{
  if (+[CSExclaveRecordClient sharedClient]::onceToken != -1) {
    dispatch_once(&+[CSExclaveRecordClient sharedClient]::onceToken, &__block_literal_global_3439);
  }
  v2 = (void *)+[CSExclaveRecordClient sharedClient]::sharedClient;
  return v2;
}

uint64_t __37__CSExclaveRecordClient_sharedClient__block_invoke()
{
  +[CSExclaveRecordClient sharedClient]::sharedClient = objc_alloc_init(CSExclaveRecordClient);
  return MEMORY[0x1F41817F8]();
}

@end