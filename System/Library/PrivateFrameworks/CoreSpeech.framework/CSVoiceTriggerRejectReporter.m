@interface CSVoiceTriggerRejectReporter
+ (id)sharedInstance;
- (CSVoiceTriggerRejectReporter)init;
- (OS_dispatch_queue)queue;
- (id)_checkForRejectWithScore:(id)a3 threshold:(id)a4 eventType:(unint64_t)a5 deltaTime:(double)a6;
- (id)_constructVTRejectEventFrom:(id)a3 withMhid:(id)a4;
- (id)_extractMetaDataEventFromEntry:(id)a3 currentTime:(double)a4;
- (id)_readEventFromBiome;
- (id)constructSELFEventFromEvents:(id)a3 withMhid:(id)a4;
- (void)_deleteAllEventsFromBiome;
- (void)_emitEvent:(id)a3;
- (void)reportVTRejectIfNeededForMHId:(id)a3;
- (void)setQueue:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSVoiceTriggerRejectReporter

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_extractMetaDataEventFromEntry:(id)a3 currentTime:(double)a4
{
  id v6 = a3;
  v7 = [v6 objectForKey:@"absoluteTimestamp"];
  v8 = v7;
  if (!v7
    || (unint64_t v9 = (unint64_t)(a4 - (double)(unint64_t)[v7 unsignedLongLongValue]), v9 > 0x3C))
  {
    id v10 = 0;
    goto LABEL_21;
  }
  v11 = [v6 objectForKey:@"invocationTypeID"];
  if (v11)
  {
    v12 = [v6 objectForKey:@"tdSpeakerRecognizerCombinedScore"];
    if ([v11 isEqualToNumber:&off_10025E260])
    {
      v13 = [v6 objectForKey:@"triggerScoreHS"];
      v14 = [v6 objectForKey:@"keywordThresholdHS"];
      v15 = [v6 objectForKey:@"tdSpeakerRecognizerCombinedThresholdHS"];
      double v16 = (double)v9;
      v17 = [(CSVoiceTriggerRejectReporter *)self _checkForRejectWithScore:v13 threshold:v14 eventType:0 deltaTime:(double)v9];
      if (!v17)
      {
        v18 = self;
        v19 = v12;
        v20 = v15;
        uint64_t v21 = 2;
LABEL_13:
        v23 = [(CSVoiceTriggerRejectReporter *)v18 _checkForRejectWithScore:v19 threshold:v20 eventType:v21 deltaTime:v16];
        id v10 = v23;
        if (v23)
        {
          id v24 = v23;
          int v22 = 1;
        }
        else
        {
          int v22 = 0;
        }

LABEL_17:
        if (v22)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        id v10 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      if (![v11 isEqualToNumber:&off_10025E278]) {
        goto LABEL_18;
      }
      v13 = [v6 objectForKey:@"triggerScoreJS"];
      v14 = [v6 objectForKey:@"keywordThresholdJS"];
      v15 = [v6 objectForKey:@"tdSpeakerRecognizerCombinedThresholdJS"];
      double v16 = (double)v9;
      v17 = [(CSVoiceTriggerRejectReporter *)self _checkForRejectWithScore:v13 threshold:v14 eventType:1 deltaTime:(double)v9];
      if (!v17)
      {
        v18 = self;
        v19 = v12;
        v20 = v15;
        uint64_t v21 = 3;
        goto LABEL_13;
      }
    }
    id v10 = v17;
    int v22 = 1;
    goto LABEL_17;
  }
  id v10 = 0;
LABEL_20:

LABEL_21:
  return v10;
}

- (id)_checkForRejectWithScore:(id)a3 threshold:(id)a4 eventType:(unint64_t)a5 deltaTime:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    [v9 floatValue];
    float v14 = v13;
    [v11 floatValue];
    if (v14 >= v15)
    {
      v12 = 0;
    }
    else
    {
      double v16 = [CSVTRejectEventMetadata alloc];
      [v9 floatValue];
      unsigned int v18 = v17;
      [v11 floatValue];
      LODWORD(v20) = v19;
      v12 = [(CSVTRejectEventMetadata *)v16 initWithEventType:a5 score:COERCE_DOUBLE(v18 | 0x41CDCD6500000000) threshold:v20 deltaTime:a6 * 1000000000.0];
    }
  }

  return v12;
}

- (void)_emitEvent:(id)a3
{
  id v3 = a3;
  v4 = +[AssistantSiriAnalytics sharedStream];
  [v4 emitMessage:v3];

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSVoiceTriggerRejectReporter _emitEvent:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Emitting VTRejectDetected event", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_constructVTRejectEventFrom:(id)a3 withMhid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)MHSchemaMHVoiceTriggerRejectDetected);
  objc_msgSend(v7, "setPhsRejectBeforeActivationCount:", objc_msgSend(v5, "spkrIdRejectCount"));
  objc_msgSend(v7, "setCheckerHSRejectBeforeActivationCount:", objc_msgSend(v5, "hsRejectCount"));
  objc_msgSend(v7, "setCheckerJSRejectBeforeActivationCount:", objc_msgSend(v5, "jsRejectCount"));
  v8 = [v5 spkrIdScores];
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = [v5 spkrIdScores];
    [v7 setPhsRejectBeforeActivationScores:v10];

    v11 = [v5 spkrIdTimeDelta];
    [v7 setPhsRejectBeforeActivationTimeDiffInNs:v11];

    [v5 phsThreshold];
    objc_msgSend(v7, "setPhsThreshold:");
    [v5 pjsThreshold];
    objc_msgSend(v7, "setPjsThreshold:");
  }
  v12 = [v5 hsScores];
  id v13 = [v12 count];

  if (v13)
  {
    float v14 = [v5 hsScores];
    [v7 setCheckerHSRejectBeforeActivationScores:v14];

    float v15 = [v5 hsTimeDelta];
    [v7 setCheckerHSRejectBeforeActivationTimeDiffInNs:v15];

    [v5 hsThreshold];
    objc_msgSend(v7, "setCheckerHSThreshold:");
  }
  double v16 = [v5 jsScores];
  id v17 = [v16 count];

  if (v17)
  {
    unsigned int v18 = [v5 jsScores];
    [v7 setCheckerJSRejectBeforeActivationScores:v18];

    int v19 = [v5 jsTimeDelta];
    [v7 setCheckerJSRejectBeforeActivationTimeDiffInNs:v19];

    [v5 jsThreshold];
    objc_msgSend(v7, "setCheckerJSThreshold:");
  }
  id v20 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  id v21 = objc_alloc((Class)SISchemaUUID);
  id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];

  id v23 = [v21 initWithNSUUID:v22];
  [v20 setMhId:v23];

  id v24 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  [v24 setEventMetadata:v20];
  [v24 setVoiceTriggerRejectDetected:v7];

  return v24;
}

- (void)_deleteAllEventsFromBiome
{
  v2 = BiomeLibrary();
  id v3 = [v2 Siri];
  v4 = [v3 VoiceTriggerStatistics];

  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [v4 pruner];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014722C;
  v8[3] = &unk_100252948;
  v8[4] = &v9;
  [v5 deleteWithPolicy:@"Delete all VT stats" eventsPassingTest:v8];

  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v10[3];
    *(_DWORD *)buf = 136315394;
    float v14 = "-[CSVoiceTriggerRejectReporter _deleteAllEventsFromBiome]";
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Cleaned up %lu entries", buf, 0x16u);
  }
  _Block_object_dispose(&v9, 8);
}

- (id)_readEventFromBiome
{
  v2 = +[NSMutableArray array];
  id v3 = objc_alloc_init((Class)BMSQLDatabase);
  v4 = [v3 executeQuery:@"SELECT * FROM \"Siri.VoiceTriggerStatistics\""];
  uint64_t v5 = 2001;
  while ([v4 next])
  {
    id v6 = [v4 row];
    [v2 addObject:v6];

    if (!--v5)
    {
      uint64_t v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        id v13 = "-[CSVoiceTriggerRejectReporter _readEventFromBiome]";
        __int16 v14 = 2048;
        uint64_t v15 = 2000;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Exiting after reading %lu entries", (uint8_t *)&v12, 0x16u);
      }
      break;
    }
  }
  v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    id v10 = [v2 count];
    int v12 = 136315394;
    id v13 = "-[CSVoiceTriggerRejectReporter _readEventFromBiome]";
    __int16 v14 = 2048;
    uint64_t v15 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Read %lu entries from biome", (uint8_t *)&v12, 0x16u);
  }
  return v2;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v9)
  {
    uint64_t v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      int v19 = "-[CSVoiceTriggerRejectReporter siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
    }
    id v17 = [v14 requestMHUUID];
    [(CSVoiceTriggerRejectReporter *)self reportVTRejectIfNeededForMHId:v17];
  }
}

- (id)constructSELFEventFromEvents:(id)a3 withMhid:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  uint64_t v7 = objc_alloc_init(CSVTRejectDetectDataExtractor);
  v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v29;
    double v15 = (double)(unint64_t)v10;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v17 = [(CSVoiceTriggerRejectReporter *)self _extractMetaDataEventFromEntry:*(void *)(*((void *)&v28 + 1) + 8 * i) currentTime:v15];
        if (v17)
        {
          int v18 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            int v19 = v18;
            id v20 = [v17 description];
            *(_DWORD *)buf = 136315394;
            v33 = "-[CSVoiceTriggerRejectReporter constructSELFEventFromEvents:withMhid:]";
            __int16 v34 = 2112;
            unint64_t v35 = (unint64_t)v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Extracted interested event: %@", buf, 0x16u);
          }
          [(CSVTRejectDetectDataExtractor *)v7 classifyEventWithMetaData:v17];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v13);
  }

  if ([(CSVTRejectDetectDataExtractor *)v7 totalEventCount])
  {
    id v21 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      unint64_t v23 = [(CSVTRejectDetectDataExtractor *)v7 totalEventCount];
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSVoiceTriggerRejectReporter constructSELFEventFromEvents:withMhid:]";
      __int16 v34 = 2048;
      unint64_t v35 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Count of VT reject events detected: %lu", buf, 0x16u);
    }
    id v24 = v27;
    v25 = [(CSVoiceTriggerRejectReporter *)self _constructVTRejectEventFrom:v7 withMhid:v27];
  }
  else
  {
    v25 = 0;
    id v24 = v27;
  }

  return v25;
}

- (void)reportVTRejectIfNeededForMHId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014789C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSVoiceTriggerRejectReporter)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSVoiceTriggerRejectReporter;
    id v4 = [(CSVoiceTriggerRejectReporter *)&v9 init];
    if (v4)
    {
      uint64_t v5 = dispatch_get_global_queue(9, 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

      uint64_t v7 = +[CSSiriClientBehaviorMonitor sharedInstance];
      [v7 registerObserver:v4];
    }
    self = v4;
    id v3 = self;
  }

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3B88 != -1) {
    dispatch_once(&qword_1002A3B88, &stru_100252920);
  }
  v2 = (void *)qword_1002A3B80;
  return v2;
}

@end