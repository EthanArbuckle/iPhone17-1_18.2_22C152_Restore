@interface CSVoiceTriggerFirstPassRemora
- (CSAsset)currentAsset;
- (CSAudioProvider)triggeredAudioProvider;
- (CSSecondPassProgressDelegate)secondPassProgressDelegate;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassRemora)init;
- (NSMutableDictionary)accessoryFirstPassGoodnessScores;
- (NSMutableDictionary)remoraSecondPassRequests;
- (NSMutableDictionary)triggeredAudioStreamHoldingByAccessoryId;
- (OS_dispatch_queue)queue;
- (void)_cancelAllAudioStreamHoldings;
- (void)_cancelAudioStreamHoldingForAccessoryWithId:(id)a3;
- (void)_createSecondPassRequestIfNecessaryForActivationEvent:(id)a3 completion:(id)a4;
- (void)_handleRemoraTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5;
- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 error:(id)a6 completion:(id)a7;
- (void)_requestStartAudioStreamProviderWithContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_setDeviceIds:(id)a3;
- (void)_setIsSecondPassing:(BOOL)a3 forDeviceId:(id)a4;
- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)cancelSecondPassRunning;
- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)reset;
- (void)setAccessoryFirstPassGoodnessScores:(id)a3;
- (void)setConnectedDeviceIds:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoraSecondPassRequests:(id)a3;
- (void)setSecondPassProgressDelegate:(id)a3;
- (void)setTriggeredAudioProvider:(id)a3;
- (void)setTriggeredAudioStreamHoldingByAccessoryId:(id)a3;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassRemora

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeredAudioProvider, 0);
  objc_storeStrong((id *)&self->_triggeredAudioStreamHoldingByAccessoryId, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_accessoryFirstPassGoodnessScores, 0);
  objc_storeStrong((id *)&self->_remoraSecondPassRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_secondPassProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTriggeredAudioProvider:(id)a3
{
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioStreamHoldingByAccessoryId:(id)a3
{
}

- (NSMutableDictionary)triggeredAudioStreamHoldingByAccessoryId
{
  return self->_triggeredAudioStreamHoldingByAccessoryId;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setAccessoryFirstPassGoodnessScores:(id)a3
{
}

- (NSMutableDictionary)accessoryFirstPassGoodnessScores
{
  return self->_accessoryFirstPassGoodnessScores;
}

- (void)setRemoraSecondPassRequests:(id)a3
{
}

- (NSMutableDictionary)remoraSecondPassRequests
{
  return self->_remoraSecondPassRequests;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSecondPassProgressDelegate:(id)a3
{
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
  return (CSSecondPassProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013E240;
  block[3] = &unk_1002532A8;
  v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)cancelSecondPassRunning
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013E2D4;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cancelAllAudioStreamHoldings
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) cancelAudioStreamHold];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_cancelAudioStreamHoldingForAccessoryWithId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CSVoiceTriggerFirstPassRemora *)self triggeredAudioStreamHoldingByAccessoryId];
    id v6 = [v5 objectForKey:v4];

    if (v6)
    {
      long long v7 = [v6 audioStreamHolding];
      long long v8 = [v6 audioProvider];
      if (v8 && v7)
      {
        long long v9 = CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
        {
          int v10 = 136315395;
          v11 = "-[CSVoiceTriggerFirstPassRemora _cancelAudioStreamHoldingForAccessoryWithId:]";
          __int16 v12 = 2113;
          id v13 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Cancelling audio stream hold for accessory: %{private}@", (uint8_t *)&v10, 0x16u);
        }
        [v8 cancelAudioStreamHold:v7];
      }
    }
  }
}

- (void)_requestStartAudioStreamProviderWithContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v8 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10013E788;
  v16[3] = &unk_100253100;
  id v9 = a6;
  id v17 = v9;
  id v10 = a3;
  v11 = objc_retainBlock(v16);
  __int16 v12 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v15 = 0;
  id v13 = [v12 audioProviderWithContext:v10 error:&v15];

  id v14 = v15;
  if (v13) {
    [v8 setAudioProvider:v13];
  }
  ((void (*)(void *, BOOL, id))v11[2])(v11, v13 != 0, v14);
}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, id))a7;
  id v17 = [v12 result];
  v18 = [v12 voiceTriggerEventInfo];
  if (v17 == (id)4)
  {
    if (v16) {
      v16[2](v16, 0, v15);
    }
    goto LABEL_31;
  }
  v19 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = [v15 localizedDescription];
    *(_DWORD *)buf = 136316162;
    v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    __int16 v51 = 1026;
    *(_DWORD *)v52 = v17;
    *(_WORD *)&v52[4] = 2114;
    *(void *)&v52[6] = v18;
    __int16 v53 = 2114;
    id v54 = v14;
    __int16 v55 = 2114;
    v56 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@", buf, 0x30u);
  }
  unsigned __int8 v43 = [v13 isCancelled];
  if (v43)
  {
    v22 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "%s VoiceTrigger Second Pass has been marked for cancellation.", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v23 = v18;
  id v24 = v15;
  v41 = v23;
  id v25 = [v23 mutableCopy];
  [v13 firstPassTriggerEndTime];
  v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v42 = v25;
  [v25 setObject:v26 forKey:kVTEIFirstPassRemoraTriggerEndTime];

  if (v17 == (id)3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v31 = objc_opt_respondsToSelector();

    id v15 = v24;
    v18 = v41;
    if ((v31 & 1) == 0) {
      goto LABEL_24;
    }
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    [v32 voiceTriggerDidDetectNearMiss:v42 deviceId:v14];
LABEL_18:

    goto LABEL_24;
  }
  id v15 = v24;
  if (v17 == (id)2)
  {
    id v33 = objc_loadWeakRetained((id *)&self->_delegate);
    char v34 = objc_opt_respondsToSelector();

    v18 = v41;
    if ((v34 & 1) == 0) {
      goto LABEL_24;
    }
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    [v32 voiceTriggerDidRejected:v42 deviceId:v14];
    goto LABEL_18;
  }
  v18 = v41;
  if (v17 != (id)1)
  {
    v35 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v32 = v35;
    v36 = [v15 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v50 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    __int16 v51 = 2114;
    *(void *)v52 = v36;
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

    goto LABEL_18;
  }
  id v27 = objc_loadWeakRetained((id *)&self->_delegate);
  char location = objc_opt_respondsToSelector();

  id v28 = objc_loadWeakRetained((id *)&self->_delegate);
  id v29 = v28;
  if (location)
  {
    [v28 voiceTriggerDidDetectKeyword:v42 deviceId:v14 completion:0];
LABEL_23:

    goto LABEL_24;
  }
  char locationa = objc_opt_respondsToSelector();

  if (locationa)
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    [v29 voiceTriggerDidDetectKeyword:v42 deviceId:v14];
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  if ([v12 isSecondChanceCandidate]) {
    v37 = [[CSVoiceTriggerSecondChanceContext alloc] initWithWindowStartTime:mach_absolute_time()];
  }
  else {
    v37 = 0;
  }
  [v13 setSecondChanceContext:v37];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013ECC0;
  block[3] = &unk_100252778;
  void block[4] = self;
  id v45 = v14;
  id v46 = v13;
  id v47 = v17;
  unsigned __int8 v48 = v43;
  dispatch_async(queue, block);
  if (v16) {
    v16[2](v16, 1, 0);
  }

LABEL_31:
}

- (void)_handleRemoraTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  v30 = +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", [v8 hosttime], mach_absolute_time());
  id v10 = [v8 deviceId];
  char v31 = +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:v10];

  v11 = +[NSUUID UUID];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10013F1D4;
  v38[3] = &unk_1002531E0;
  id v12 = v9;
  id v39 = v12;
  [(CSVoiceTriggerFirstPassRemora *)self _requestStartAudioStreamProviderWithContext:v31 secondPassRequest:v12 startStreamOption:0 completion:v38];
  id v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [v8 deviceId];
    *(_DWORD *)buf = 136315394;
    v41 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]";
    __int16 v42 = 2112;
    unsigned __int8 v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v16 = [v8 deviceId];
  [(CSVoiceTriggerFirstPassRemora *)self _setIsSecondPassing:1 forDeviceId:v16];

  objc_initWeak((id *)buf, self);
  id v17 = [v12 secondChanceContext];
  id v18 = [v17 shouldRunAsSecondChance];

  v19 = [CSVoiceTriggerSecondPassRequestOption alloc];
  v20 = [v8 deviceId];
  v21 = [v12 audioProvider];
  v22 = [v21 UUID];
  v23 = [v8 activationInfo];
  id v24 = [(CSVoiceTriggerSecondPassRequestOption *)v19 initWithFirstPassSource:7 deviceId:v20 audioProviderUUID:v22 firstPassInfo:v23 rejectionMHUUID:v11 isSecondChanceRun:v18 firstpassMetrics:v30 rtModelRequestOptions:0];

  id v25 = [v12 voiceTriggerSecondPass];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10013F324;
  v32[3] = &unk_100252750;
  objc_copyWeak(&v37, (id *)buf);
  id v26 = v12;
  id v33 = v26;
  id v27 = v8;
  id v34 = v27;
  id v28 = v29;
  v35 = self;
  id v36 = v28;
  [v25 handleVoiceTriggerSecondPassFrom:v24 completion:v32];

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
}

- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8
{
  id v9 = a8;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013F620;
  v12[3] = &unk_100253B08;
  id v13 = v9;
  id v14 = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)_createSecondPassRequestIfNecessaryForActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v7 = (void (**)(id, void, void *))a4;
  id v8 = [v6 activationInfo];
  id v9 = [v8 objectForKey:@"firstPassGoodness"];
  [v9 floatValue];
  float v11 = v10;

  double v12 = v11;
  double v13 = v12 + 0.0;
  id v14 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    v16 = [v6 deviceId];
    *(_DWORD *)buf = 136316163;
    v61 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
    __int16 v62 = 2113;
    v63 = v16;
    __int16 v64 = 2049;
    double v65 = v12 + 0.0;
    __int16 v66 = 2049;
    double v67 = v12;
    __int16 v68 = 2049;
    double v69 = 0.0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s accessory id %{private}@, ascore: %{private}f (raw=%{private}f, bump=%{private}f)", buf, 0x34u);
  }
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10013FC38;
  v57[3] = &unk_100252728;
  id v17 = v6;
  id v58 = v17;
  double v59 = v12 + 0.0;
  id v18 = objc_retainBlock(v57);
  if (v17)
  {
    uint64_t v19 = [v17 activationInfo];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [v17 activationInfo];
      v22 = [v21 objectForKey:@"firstPassGoodness"];

      if (!v22) {
        goto LABEL_27;
      }
    }
  }
  v23 = [v17 hosttime];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v24 = [(NSMutableDictionary *)self->_remoraSecondPassRequests allKeys];
  id v25 = [v24 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (!v25)
  {

LABEL_27:
    id v46 = ((void (*)(void *))v18[2])(v18);
    remoraSecondPassRequests = self->_remoraSecondPassRequests;
    unsigned __int8 v48 = [v17 deviceId];
    [(NSMutableDictionary *)remoraSecondPassRequests setObject:v46 forKey:v48];

    if (v7) {
      v7[2](v7, 0, v46);
    }
    goto LABEL_29;
  }
  id v26 = v25;
  v49 = v18;
  v50 = v7;
  __int16 v51 = v17;
  uint64_t v27 = *(void *)v54;
  char v52 = 1;
  do
  {
    for (i = 0; i != v26; i = (char *)i + 1)
    {
      if (*(void *)v54 != v27) {
        objc_enumerationMutation(v24);
      }
      id v29 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      v30 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29, v49);
      unsigned __int8 v31 = [v30 isCancelled];

      if ((v31 & 1) == 0)
      {
        v32 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectForKeyedSubscript:v29];
        id v33 = [v32 timestamp];

        id v34 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectForKeyedSubscript:v29];
        v35 = [v34 timestamp];
        int64_t v36 = v23 <= v33 ? v35 - v23 : v23 - v35;
        +[CSFTimeUtils hostTimeToTimeInterval:v36];
        double v38 = v37;

        if (v38 <= 0.349999994)
        {
          id v39 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectForKeyedSubscript:v29];
          [v39 goodnessScore];
          double v41 = v40;

          if (v13 <= v41)
          {
            char v52 = 0;
          }
          else
          {
            __int16 v42 = (void *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v43 = v42;
              v44 = [v51 deviceId];
              *(_DWORD *)buf = 136316419;
              v61 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
              __int16 v62 = 2113;
              v63 = v29;
              __int16 v64 = 2048;
              double v65 = v13;
              __int16 v66 = 2113;
              double v67 = *(double *)&v44;
              __int16 v68 = 2048;
              double v69 = v41;
              __int16 v70 = 2113;
              v71 = v29;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s Pre-Myriad is cancelling activation on device %{private}@ (activation goodness score: %f (deviceId: %{private}@), competing goodness score: %f (deviceId: %{private}@))", buf, 0x3Eu);
            }
            id v45 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectForKeyedSubscript:v29];
            [v45 cancelRequest];

            [(NSMutableDictionary *)self->_remoraSecondPassRequests removeObjectForKey:v29];
          }
        }
      }
    }
    id v26 = [v24 countByEnumeratingWithState:&v53 objects:v72 count:16];
  }
  while (v26);

  id v18 = v49;
  long long v7 = v50;
  id v17 = v51;
  if (v52) {
    goto LABEL_27;
  }
  if (v50)
  {
    id v46 = +[NSError errorWithDomain:CSErrorDomain code:605 userInfo:0];
    ((void (**)(id, void *, void *))v50)[2](v50, v46, 0);
LABEL_29:
  }
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013FE60;
  block[3] = &unk_100253280;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)_setIsSecondPassing:(BOOL)a3 forDeviceId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      [v7 setIsSecondPassRunning:v4];
      p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);

      if (WeakRetained)
      {
        if (v4)
        {
          id v11 = [(CSVoiceTriggerFirstPassRemora *)self accessoryFirstPassGoodnessScores];
          double v12 = [v11 objectForKey:v6];

          id v13 = CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315651;
            uint64_t v19 = "-[CSVoiceTriggerFirstPassRemora _setIsSecondPassing:forDeviceId:]";
            __int16 v20 = 2113;
            id v21 = v6;
            __int16 v22 = 2113;
            v23 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s First pass signal estimate for device %{private}@: %{private}@", (uint8_t *)&v18, 0x20u);
          }
          [v12 doubleValue];
          double v15 = v14;
          id v16 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
          [v16 secondPassDidStartForClient:5 deviceId:v6 withFirstPassEstimate:v15];
        }
        else
        {
          id v17 = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
          [v17 secondPassDidStopForClient:5 deviceId:v6];
        }
      }
    }
  }
}

- (void)_setDeviceIds:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v7);
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        id v10 = +[CSVoiceTriggerAssetHandler sharedHandler];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100140B98;
        v13[3] = &unk_100252688;
        v13[4] = self;
        v13[5] = v8;
        dispatch_semaphore_t v14 = v9;
        id v11 = v9;
        [v10 getVoiceTriggerAssetWithEndpointId:v8 completion:v13];

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)setConnectedDeviceIds:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100140CB0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_reset
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_remoraSecondPassRequests objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) reset];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140E20;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140E9C;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerFirstPassRemora)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerFirstPassRemora;
  v2 = [(CSVoiceTriggerFirstPassRemora *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[CSUtils getSerialQueueWithQOS:33 name:@"com.apple.corespeech.firstpassremora" fixedPriority:kCSDefaultSerialQueueFixedPriority];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    remoraSecondPassRequests = v2->_remoraSecondPassRequests;
    v2->_remoraSecondPassRequests = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    accessoryFirstPassGoodnessScores = v2->_accessoryFirstPassGoodnessScores;
    v2->_accessoryFirstPassGoodnessScores = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    triggeredAudioStreamHoldingByAccessoryId = v2->_triggeredAudioStreamHoldingByAccessoryId;
    v2->_triggeredAudioStreamHoldingByAccessoryId = (NSMutableDictionary *)v9;
  }
  return v2;
}

@end