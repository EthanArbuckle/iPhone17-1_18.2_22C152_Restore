@interface CSEndpointDetectedSelfLogger
+ (id)_decodeFeaturesAtEndpoint:(id)a3 endpointerModelType:(int64_t)a4;
+ (void)emitEndpointDetectedEventWithEndpointerMetrics:(id)a3 withEndpointerModelType:(int64_t)a4 withTrpId:(id)a5 withMhID:(id)a6;
- (BOOL)localSRDisabled;
- (BOOL)trpDetectDelivered;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSEndpointDetectedSelfLogger)init;
- (CSEndpointerMetrics)cachedRelaxedEndpointerMetrics;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)registerEndpointerNode:(id)a3;
- (void)reset;
- (void)setCachedRelaxedEndpointerMetrics:(id)a3;
- (void)setLocalSRDisabled:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setTrpDetectDelivered:(BOOL)a3;
- (void)setup;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5;
@end

@implementation CSEndpointDetectedSelfLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRelaxedEndpointerMetrics, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_storeStrong((id *)&self->_mhId, 0);
}

- (void)setCachedRelaxedEndpointerMetrics:(id)a3
{
}

- (CSEndpointerMetrics)cachedRelaxedEndpointerMetrics
{
  return self->_cachedRelaxedEndpointerMetrics;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setTrpDetectDelivered:(BOOL)a3
{
  self->_trpDetectDelivered = a3;
}

- (BOOL)trpDetectDelivered
{
  return self->_trpDetectDelivered;
}

- (void)setLocalSRDisabled:(BOOL)a3
{
  self->_localSRDisabled = a3;
}

- (BOOL)localSRDisabled
{
  return self->_localSRDisabled;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  return (CSAttSiriEndpointerNode *)WeakRetained;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v8 = a6;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F4D94;
  v11[3] = &unk_100253B08;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000F4EE8;
  v9[3] = &unk_100253B08;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F5018;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F51B8;
  block[3] = &unk_100253540;
  block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v9 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F5340;
  block[3] = &unk_1002532A8;
  id v13 = v9;
  int64_t v14 = a5;
  block[4] = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v7 = a5;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F549C;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F55E4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerEndpointerNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F5740;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setup
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F586C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSEndpointDetectedSelfLogger)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSEndpointDetectedSelfLogger;
  v2 = [(CSEndpointDetectedSelfLogger *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSEndpointDetectedSelfLogger queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_localSRDisabled = 0;
    uint64_t v5 = +[CSSiriClientBehaviorMonitor sharedInstance];
    siriClientBehaviorMonitor = v2->_siriClientBehaviorMonitor;
    v2->_siriClientBehaviorMonitor = (CSSiriClientBehaviorMonitor *)v5;

    cachedRelaxedEndpointerMetrics = v2->_cachedRelaxedEndpointerMetrics;
    v2->_cachedRelaxedEndpointerMetrics = 0;
  }
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[CSEndpointDetectedSelfLogger init]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Created CSEndpointDetectedSelfLogger", buf, 0xCu);
  }
  return v2;
}

+ (id)_decodeFeaturesAtEndpoint:(id)a3 endpointerModelType:(int64_t)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)[v5 count];
  unint64_t v7 = v6;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 2)
    {
      v48 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v50 = 136315906;
        v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
        __int16 v52 = 2048;
        uint64_t v53 = 6;
        __int16 v54 = 2048;
        uint64_t v55 = 2;
        __int16 v56 = 2048;
        uint64_t v57 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s Legacy endpointer feature count should always be %lu or %lu (timeout case), instead got %lu", (uint8_t *)&v50, 0x2Au);
      }
      goto LABEL_20;
    }
LABEL_10:
    id v9 = [v5 objectAtIndex:0];
    [v9 floatValue];
    id v10 = +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:");

    id v11 = [v5 objectAtIndex:1];
    [v11 floatValue];
    id v12 = +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:");

    int v13 = 0;
    if (v7 < 6)
    {
      id v32 = 0;
      id v25 = 0;
      id v30 = 0;
      id v18 = 0;
      id v20 = 0;
      int v35 = 0;
      int v28 = 0;
      int v16 = 0;
      int v23 = 0;
    }
    else
    {
      int64_t v14 = [v5 objectAtIndex:2];
      [v14 floatValue];
      int v16 = v15;

      v17 = [v5 objectAtIndex:3];
      id v18 = [v17 intValue];

      v19 = [v5 objectAtIndex:4];
      [v19 floatValue];
      id v20 = +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:");

      v21 = [v5 objectAtIndex:5];
      [v21 floatValue];
      int v23 = v22;

      if (v7 < 0xB)
      {
        id v32 = 0;
        id v25 = 0;
        id v30 = 0;
        int v35 = 0;
        int v28 = 0;
      }
      else
      {
        v24 = [v5 objectAtIndex:6];
        [v24 floatValue];
        id v25 = +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:");

        v26 = [v5 objectAtIndex:7];
        [v26 floatValue];
        int v28 = v27;

        v29 = [v5 objectAtIndex:8];
        id v30 = [v29 intValue];

        v31 = [v5 objectAtIndex:9];
        [v31 floatValue];
        id v32 = +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:");

        v33 = [v5 objectAtIndex:10];
        [v33 floatValue];
        int v35 = v34;

        if (v7 == 13)
        {
          v36 = [v5 objectAtIndex:11];
          [v36 floatValue];
          int v13 = v37;

          v38 = [v5 objectAtIndex:12];
          [v38 floatValue];
          int v40 = v39;

LABEL_17:
          id v41 = objc_alloc_init((Class)MHSchemaMHEndpointFeaturesAtEndpoint);
          [v41 setWordCount:v18];
          [v41 setTrailingSilenceDurationInNs:v10];
          LODWORD(v42) = v16;
          [v41 setEndOfSentenceLikelihood:v42];
          [v41 setClientSilenceFramesCountInNs:v12];
          [v41 setServerFeaturesLatencyInNs:v20];
          LODWORD(v43) = v23;
          [v41 setClientSilenceProbability:v43];
          [v41 setRcTrailingSilenceDuration:v25];
          LODWORD(v44) = v28;
          [v41 setRcEndOfSentenceLikelihood:v44];
          [v41 setRcWordCount:v30];
          [v41 setRcServerFeaturesLatency:v32];
          LODWORD(v45) = v35;
          [v41 setSilencePosterior:v45];
          LODWORD(v46) = v13;
          [v41 setAcousticEndpointerScore:v46];
          LODWORD(v47) = v40;
          [v41 setSilencePosteriorFrameCountInNs:v47];
          goto LABEL_21;
        }
      }
    }
    int v40 = 0;
    goto LABEL_17;
  }
  if (v6 <= 0xD && ((1 << v6) & 0x2844) != 0) {
    goto LABEL_10;
  }
  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v50 = 136316418;
    v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
    __int16 v52 = 2048;
    uint64_t v53 = 6;
    __int16 v54 = 2048;
    uint64_t v55 = 2;
    __int16 v56 = 2048;
    uint64_t v57 = 11;
    __int16 v58 = 2048;
    uint64_t v59 = 13;
    __int16 v60 = 2048;
    unint64_t v61 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Endpointer feature count should always be %lu, %lu (timeout case), %lu (EEP), or %lu (AEP), instead got %lu", (uint8_t *)&v50, 0x3Eu);
    id v8 = CSLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v50 = 136315394;
    v51 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v50, 0x16u);
  }
LABEL_20:
  id v41 = 0;
LABEL_21:

  return v41;
}

+ (void)emitEndpointDetectedEventWithEndpointerMetrics:(id)a3 withEndpointerModelType:(int64_t)a4 withTrpId:(id)a5 withMhID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 featuresAtEndpoint];
  id v14 = objc_alloc_init((Class)MHSchemaMHEndpointDetected);
  int v50 = (void *)v13;
  unint64_t v47 = a4;
  v49 = [a1 _decodeFeaturesAtEndpoint:v13 endpointerModelType:a4];
  objc_msgSend(v14, "setEndpointFeaturesAtEndpoint:");
  id v15 = objc_alloc_init((Class)MHSchemaMHEndpointerTimeoutMetadata);
  objc_msgSend(v15, "setIsTimeout:", objc_msgSend(v10, "isRequestTimeOut"));
  v48 = v15;
  [v14 setTimeoutMetadata:v15];
  id v16 = [v10 firstAudioSampleSensorTimestamp];
  [v10 blkHepAudioOrigin];
  double v18 = v17;
  [v10 vtExtraAudioAtStartInMs];
  double v20 = v19;
  unsigned int v46 = [v10 isAnchorTimeBuffered];
  id v21 = objc_alloc_init((Class)SISchemaVersion);
  int v22 = [v10 assetConfigVersion];
  int v23 = [v22 componentsSeparatedByString:@"."];

  if ([v23 count] == (id)2)
  {
    v24 = [v23 objectAtIndexedSubscript:0];
    objc_msgSend(v21, "setMajor:", objc_msgSend(v24, "intValue"));

    id v25 = [v23 objectAtIndexedSubscript:1];
    objc_msgSend(v21, "setMinor:", objc_msgSend(v25, "intValue"));
  }
  v51 = v12;
  [v14 setEndpointModelConfigVersion:v21];
  unint64_t v26 = (unint64_t)[v10 endpointerType];
  int v27 = v11;
  if (v26 > 4) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = dword_1001AC7A0[v26];
  }
  [v14 setEndpointerType:v28];
  v29 = [v10 asrFeatureLatencyDistribution];
  id v30 = +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:v29 withScaleFactor:1000.0];

  [v10 totalAudioRecorded];
  *(float *)&double v31 = v31;
  objc_msgSend(v14, "setEndpointAudioDurationInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v31));
  objc_msgSend(v14, "setFirstBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v16));
  objc_msgSend(v14, "setEndpointedBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", objc_msgSend(v10, "endpointBufferHostTime")));
  id v32 = [v10 additionalMetrics];
  v33 = [v32 objectForKey:@"EndpointerDecisionLagMs"];
  [v33 floatValue];
  objc_msgSend(v14, "setEndpointerDecisionLagInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));

  int v34 = [v10 additionalMetrics];
  int v35 = [v34 objectForKey:@"ExtraDelayMs"];
  [v35 floatValue];
  objc_msgSend(v14, "setExtraDelayInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));

  [v14 setDerivedBufferTimeFromHistoricalAudio:v46];
  *(float *)&double v36 = v20;
  objc_msgSend(v14, "setAudioSkippedDurationInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v36));
  *(float *)&double v37 = v18;
  objc_msgSend(v14, "setEndpointResetPositionInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v37));
  v38 = [v10 osdFeaturesAtEndpoint];
  [v38 silenceProbability];
  *(float *)&double v39 = v39;
  [v14 setEndpointerScore:v39];

  [v14 setAsrFeatureLatencyDistribution:v30];
  if (v27)
  {
    id v40 = objc_alloc((Class)SISchemaUUID);
    id v41 = [objc_alloc((Class)NSUUID) initWithUUIDString:v27];
    id v42 = [v40 initWithNSUUID:v41];
    [v14 setTrpId:v42];
  }
  if (v47 <= 2) {
    objc_msgSend(v14, "setTrpDetectionType:");
  }
  double v43 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:v51];
  [v43 setEndpointDetected:v14];
  double v44 = +[AssistantSiriAnalytics sharedStream];
  [v44 emitMessage:v43];

  double v45 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v53 = "+[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:]";
    __int16 v54 = 2112;
    uint64_t v55 = v51;
    __int16 v56 = 2112;
    uint64_t v57 = v27;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@, TRP ID: %@", buf, 0x20u);
  }
}

@end