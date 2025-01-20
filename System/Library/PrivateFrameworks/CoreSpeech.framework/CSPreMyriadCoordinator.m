@interface CSPreMyriadCoordinator
- (BOOL)_isRemoraSecondPassRunning;
- (BOOL)handlePendingBuiltInVoiceTriggerIfNeeded;
- (BOOL)handlePendingRemoraVoiceTriggerIfNeeded;
- (BOOL)isBultInVoiceTriggerEvent:(id)a3;
- (BOOL)isRemoraVoiceTriggerEvent:(id)a3;
- (CSPreMyriadCoordinator)init;
- (CSPreMyriadVoiceTriggerMetaData)builtInVoiceTriggerMetaData;
- (CSSecondPassProgressProviding)builtInSeconPassProgressProvider;
- (CSSecondPassProgressProviding)remoraSecondPassProgressProvider;
- (CSVoiceTriggerDelegate)delegate;
- (NSDictionary)pendingBuiltInVoiceTriggerResult;
- (NSDictionary)pendingRemoraVoiceTriggerResult;
- (NSMutableDictionary)accessoryVoiceTriggerMetaDataByDeviceId;
- (NSString)pendingRemoraVoiceTriggerDeviceId;
- (OS_dispatch_queue)queue;
- (id)pendingBuiltInVoiceTriggerCompletionBlk;
- (id)pendingRemoraVoiceTriggerCompletionBlk;
- (unint64_t)pendingBuiltInVoiceTriggerDetectedTime;
- (unint64_t)pendingRemoraVoiceTriggerDetectedTime;
- (void)_clearPendingBuiltInVoiceTrigger;
- (void)_clearPendingRemoraVoiceTrigger;
- (void)_getHighestRemoraFirstPassGoodnessScore:(id)a3;
- (void)keywordDetectorDidDetectKeyword;
- (void)raiseToSpeakDetected:(id)a3;
- (void)secondPassDidStartForClient:(unint64_t)a3 deviceId:(id)a4 withFirstPassEstimate:(double)a5;
- (void)secondPassDidStopForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)setAccessoryVoiceTriggerMetaDataByDeviceId:(id)a3;
- (void)setBuiltInSeconPassProgressProvider:(id)a3;
- (void)setBuiltInVoiceTriggerMetaData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingBuiltInVoiceTriggerCompletionBlk:(id)a3;
- (void)setPendingBuiltInVoiceTriggerDetectedTime:(unint64_t)a3;
- (void)setPendingBuiltInVoiceTriggerResult:(id)a3;
- (void)setPendingRemoraVoiceTriggerCompletionBlk:(id)a3;
- (void)setPendingRemoraVoiceTriggerDetectedTime:(unint64_t)a3;
- (void)setPendingRemoraVoiceTriggerDeviceId:(id)a3;
- (void)setPendingRemoraVoiceTriggerResult:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoraSecondPassProgressProvider:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectSpeakerReject:(id)a3;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerGotSuperVector:(id)a3;
@end

@implementation CSPreMyriadCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryVoiceTriggerMetaDataByDeviceId, 0);
  objc_storeStrong((id *)&self->_builtInVoiceTriggerMetaData, 0);
  objc_storeStrong(&self->_pendingBuiltInVoiceTriggerCompletionBlk, 0);
  objc_storeStrong((id *)&self->_pendingBuiltInVoiceTriggerResult, 0);
  objc_storeStrong(&self->_pendingRemoraVoiceTriggerCompletionBlk, 0);
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerDeviceId, 0);
  objc_storeStrong((id *)&self->_pendingRemoraVoiceTriggerResult, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_remoraSecondPassProgressProvider);
  objc_destroyWeak((id *)&self->_builtInSeconPassProgressProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAccessoryVoiceTriggerMetaDataByDeviceId:(id)a3
{
}

- (NSMutableDictionary)accessoryVoiceTriggerMetaDataByDeviceId
{
  return self->_accessoryVoiceTriggerMetaDataByDeviceId;
}

- (void)setBuiltInVoiceTriggerMetaData:(id)a3
{
}

- (CSPreMyriadVoiceTriggerMetaData)builtInVoiceTriggerMetaData
{
  return self->_builtInVoiceTriggerMetaData;
}

- (void)setPendingBuiltInVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingBuiltInVoiceTriggerDetectedTime = a3;
}

- (unint64_t)pendingBuiltInVoiceTriggerDetectedTime
{
  return self->_pendingBuiltInVoiceTriggerDetectedTime;
}

- (void)setPendingBuiltInVoiceTriggerCompletionBlk:(id)a3
{
}

- (id)pendingBuiltInVoiceTriggerCompletionBlk
{
  return self->_pendingBuiltInVoiceTriggerCompletionBlk;
}

- (void)setPendingBuiltInVoiceTriggerResult:(id)a3
{
}

- (NSDictionary)pendingBuiltInVoiceTriggerResult
{
  return self->_pendingBuiltInVoiceTriggerResult;
}

- (void)setPendingRemoraVoiceTriggerDetectedTime:(unint64_t)a3
{
  self->_pendingRemoraVoiceTriggerDetectedTime = a3;
}

- (unint64_t)pendingRemoraVoiceTriggerDetectedTime
{
  return self->_pendingRemoraVoiceTriggerDetectedTime;
}

- (void)setPendingRemoraVoiceTriggerCompletionBlk:(id)a3
{
}

- (id)pendingRemoraVoiceTriggerCompletionBlk
{
  return self->_pendingRemoraVoiceTriggerCompletionBlk;
}

- (void)setPendingRemoraVoiceTriggerDeviceId:(id)a3
{
}

- (NSString)pendingRemoraVoiceTriggerDeviceId
{
  return self->_pendingRemoraVoiceTriggerDeviceId;
}

- (void)setPendingRemoraVoiceTriggerResult:(id)a3
{
}

- (NSDictionary)pendingRemoraVoiceTriggerResult
{
  return self->_pendingRemoraVoiceTriggerResult;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRemoraSecondPassProgressProvider:(id)a3
{
}

- (CSSecondPassProgressProviding)remoraSecondPassProgressProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoraSecondPassProgressProvider);
  return (CSSecondPassProgressProviding *)WeakRetained;
}

- (void)setBuiltInSeconPassProgressProvider:(id)a3
{
}

- (CSSecondPassProgressProviding)builtInSeconPassProgressProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_builtInSeconPassProgressProvider);
  return (CSSecondPassProgressProviding *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (void)secondPassDidStartForClient:(unint64_t)a3 deviceId:(id)a4 withFirstPassEstimate:(double)a5
{
  v8 = (__CFString *)a4;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"N/A";
    *(_DWORD *)buf = 136315651;
    v16 = "-[CSPreMyriadCoordinator secondPassDidStartForClient:deviceId:withFirstPassEstimate:]";
    if (v8) {
      CFStringRef v10 = v8;
    }
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 2113;
    CFStringRef v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s client: %lu, deviceId: %{private}@", buf, 0x20u);
  }
  if (+[CSUtils supportHomeKitAccessory])
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026884;
    v12[3] = &unk_10024E918;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = (id)a3;
    v14[2] = *(id *)&a5;
    v13 = v8;
    dispatch_async(queue, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)secondPassDidStopForClient:(unint64_t)a3 deviceId:(id)a4
{
  v6 = (__CFString *)a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"N/A";
    *(_DWORD *)buf = 136315651;
    v14 = "-[CSPreMyriadCoordinator secondPassDidStopForClient:deviceId:]";
    if (v6) {
      CFStringRef v8 = v6;
    }
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2113;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s client: %lu, deviceId: %{private}@", buf, 0x20u);
  }
  if (+[CSUtils supportHomeKitAccessory])
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026B24;
    block[3] = &unk_100251F80;
    objc_copyWeak(v12, (id *)buf);
    v12[1] = (id)a3;
    v11 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(CSPreMyriadCoordinator *)self isBultInVoiceTriggerEvent:v8])
  {
    [(CSPreMyriadCoordinator *)self handlePendingRemoraVoiceTriggerIfNeeded];
  }
  else if ([(CSPreMyriadCoordinator *)self isRemoraVoiceTriggerEvent:v8])
  {
    [(CSPreMyriadCoordinator *)self handlePendingBuiltInVoiceTriggerIfNeeded];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained voiceTriggerDidRejected:v8 deviceId:v6];
}

- (void)raiseToSpeakDetected:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained raiseToSpeakDetected:v4];
}

- (void)voiceTriggerGotSuperVector:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained voiceTriggerGotSuperVector:v4];
}

- (void)keywordDetectorDidDetectKeyword
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained keywordDetectorDidDetectKeyword];
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained voiceTriggerDidDetectSpeakerReject:v4];
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(CSPreMyriadCoordinator *)self isBultInVoiceTriggerEvent:v8])
  {
    [(CSPreMyriadCoordinator *)self handlePendingRemoraVoiceTriggerIfNeeded];
  }
  else if ([(CSPreMyriadCoordinator *)self isRemoraVoiceTriggerEvent:v8])
  {
    [(CSPreMyriadCoordinator *)self handlePendingBuiltInVoiceTriggerIfNeeded];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained voiceTriggerDidDetectNearMiss:v8 deviceId:v6];
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026F14;
  block[3] = &unk_100253540;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 voiceTriggerDidDetectKeyword:v13 deviceId:v8 completion:v9];
  }
}

- (BOOL)_isRemoraSecondPassRunning
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100027100;
  v5[3] = &unk_10024E8F0;
  v5[4] = &v6;
  [(NSMutableDictionary *)accessoryVoiceTriggerMetaDataByDeviceId enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_getHighestRemoraFirstPassGoodnessScore:(id)a3
{
  id v4 = (void (**)(id, void, double))a3;
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    unint64_t v16 = 0xBFF0000000000000;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_10002728C;
    v11 = sub_10002729C;
    id v12 = 0;
    accessoryVoiceTriggerMetaDataByDeviceId = self->_accessoryVoiceTriggerMetaDataByDeviceId;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000272A4;
    v6[3] = &unk_10024E8C8;
    v6[4] = &v13;
    v6[5] = &v7;
    [(NSMutableDictionary *)accessoryVoiceTriggerMetaDataByDeviceId enumerateKeysAndObjectsUsingBlock:v6];
    v4[2](v4, v8[5], v14[3]);
    _Block_object_dispose(&v7, 8);

    _Block_object_dispose(&v13, 8);
  }
}

- (BOOL)handlePendingBuiltInVoiceTriggerIfNeeded
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingBuiltInVoiceTriggerIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Handling Pending BuiltInVoiceTrigger Event", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = sub_10002728C;
  CFStringRef v18 = sub_10002729C;
  id v19 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10002753C;
  uint64_t v13 = sub_100027568;
  id v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027570;
  block[3] = &unk_1002515C0;
  void block[4] = self;
  void block[5] = &buf;
  block[6] = &v9;
  dispatch_async_and_wait(queue, block);
  uint64_t v5 = *(void *)(*((void *)&buf + 1) + 40);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerDidDetectKeyword:*(void *)(*((void *)&buf + 1) + 40) deviceId:0 completion:v10[5]];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&buf, 8);
  return v5 != 0;
}

- (void)_clearPendingBuiltInVoiceTrigger
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    pendingBuiltInVoiceTriggerResult = self->_pendingBuiltInVoiceTriggerResult;
    int v10 = 136315395;
    uint64_t v11 = "-[CSPreMyriadCoordinator _clearPendingBuiltInVoiceTrigger]";
    __int16 v12 = 2113;
    uint64_t v13 = pendingBuiltInVoiceTriggerResult;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing pending built-in voice trigger %{private}@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v5 = self->_pendingBuiltInVoiceTriggerResult;
  self->_pendingBuiltInVoiceTriggerResult = 0;

  id pendingBuiltInVoiceTriggerCompletionBlk = self->_pendingBuiltInVoiceTriggerCompletionBlk;
  self->_id pendingBuiltInVoiceTriggerCompletionBlk = 0;

  p_builtInSeconPassProgressProvider = &self->_builtInSeconPassProgressProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_builtInSeconPassProgressProvider);
    [v9 pendingSecondPassTriggerWasClearedForClient:1 deviceId:0];
  }
}

- (BOOL)handlePendingRemoraVoiceTriggerIfNeeded
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSPreMyriadCoordinator handlePendingRemoraVoiceTriggerIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Handling Pending Remora VoiceTrigger Event", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10002728C;
  v24 = sub_10002729C;
  id v25 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  CFStringRef v18 = sub_10002728C;
  id v19 = sub_10002729C;
  id v20 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = sub_10002753C;
  uint64_t v13 = sub_100027568;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027A0C;
  v8[3] = &unk_10024E8A0;
  v8[4] = self;
  v8[5] = &buf;
  v8[6] = &v15;
  v8[7] = &v9;
  dispatch_async_and_wait(queue, v8);
  uint64_t v5 = *(void *)(*((void *)&buf + 1) + 40);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerDidDetectKeyword:*(void *)(*((void *)&buf + 1) + 40) deviceId:v16[5] completion:v10[5]];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);

  return v5 != 0;
}

- (void)_clearPendingRemoraVoiceTrigger
{
  char v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    pendingRemoraVoiceTriggerResult = self->_pendingRemoraVoiceTriggerResult;
    int v12 = 136315395;
    uint64_t v13 = "-[CSPreMyriadCoordinator _clearPendingRemoraVoiceTrigger]";
    __int16 v14 = 2113;
    uint64_t v15 = pendingRemoraVoiceTriggerResult;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing pending homekit accessory voice trigger %{private}@", (uint8_t *)&v12, 0x16u);
  }
  id v5 = [(NSString *)self->_pendingRemoraVoiceTriggerDeviceId copy];
  uint64_t v6 = self->_pendingRemoraVoiceTriggerResult;
  self->_pendingRemoraVoiceTriggerResult = 0;

  pendingRemoraVoiceTriggerDeviceId = self->_pendingRemoraVoiceTriggerDeviceId;
  self->_pendingRemoraVoiceTriggerDeviceId = 0;

  id pendingRemoraVoiceTriggerCompletionBlk = self->_pendingRemoraVoiceTriggerCompletionBlk;
  self->_id pendingRemoraVoiceTriggerCompletionBlk = 0;

  p_remoraSecondPassProgressProvider = &self->_remoraSecondPassProgressProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)p_remoraSecondPassProgressProvider);
    [v11 pendingSecondPassTriggerWasClearedForClient:5 deviceId:v5];
  }
}

- (BOOL)isRemoraVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = kVTEIfirstPassTriggerSource;
  uint64_t v6 = [v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [v4 objectForKeyedSubscript:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  int v10 = [v4 objectForKeyedSubscript:v5];
  unsigned __int8 v11 = [v10 isEqualToString:kVTEIFirstPassTriggeredFromRemora];

  if (v11) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (BOOL)isBultInVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = kVTEIfirstPassTriggerSource;
  uint64_t v6 = [v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [v4 objectForKeyedSubscript:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  int v10 = [v4 objectForKeyedSubscript:v5];
  unsigned __int8 v11 = [v10 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor];

  if (v11) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (CSPreMyriadCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSPreMyriadCoordinator;
  v2 = [(CSPreMyriadCoordinator *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    if (!v2->_queue)
    {
      uint64_t v4 = +[CSUtils getSerialQueueWithQOS:33 name:@"com.apple.corespeech.premyriad" fixedPriority:kCSDefaultSerialQueueFixedPriority];
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;
    }
    uint64_t v6 = +[NSMutableDictionary dictionary];
    accessoryVoiceTriggerMetaDataByDeviceId = v3->_accessoryVoiceTriggerMetaDataByDeviceId;
    v3->_accessoryVoiceTriggerMetaDataByDeviceId = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end