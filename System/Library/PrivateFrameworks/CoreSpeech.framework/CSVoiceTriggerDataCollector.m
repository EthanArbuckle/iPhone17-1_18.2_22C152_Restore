@interface CSVoiceTriggerDataCollector
+ (id)sharedInstance;
- (CSVoiceTriggerDataCollector)init;
- (NSArray)privacyApprovedFields;
- (NSDate)lastVTDisableDate;
- (NSDate)lastVTEnableDate;
- (NSMutableArray)vteiList;
- (OS_dispatch_queue)queue;
- (id)_filteredVTEIArray;
- (id)fetchVoiceTriggerHeartBeatMetrics;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_createAndSubmitRejectLoggingDictWithSource:(id)a3 withPHSAcceptInfo:(id)a4;
- (void)_submitToggleReport;
- (void)addVTAcceptEntryAndSubmit:(id)a3;
- (void)addVTRejectEntry:(id)a3 truncateData:(BOOL)a4;
- (void)setLastVTDisableDate:(id)a3;
- (void)setLastVTEnableDate:(id)a3;
- (void)setPrivacyApprovedFields:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVteiList:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
@end

@implementation CSVoiceTriggerDataCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyApprovedFields, 0);
  objc_storeStrong((id *)&self->_lastVTDisableDate, 0);
  objc_storeStrong((id *)&self->_lastVTEnableDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vteiList, 0);
}

- (void)setPrivacyApprovedFields:(id)a3
{
}

- (NSArray)privacyApprovedFields
{
  return self->_privacyApprovedFields;
}

- (void)setLastVTDisableDate:(id)a3
{
}

- (NSDate)lastVTDisableDate
{
  return self->_lastVTDisableDate;
}

- (void)setLastVTEnableDate:(id)a3
{
}

- (NSDate)lastVTEnableDate
{
  return self->_lastVTEnableDate;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setVteiList:(id)a3
{
}

- (NSMutableArray)vteiList
{
  return self->_vteiList;
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000344E0;
  v5[3] = &unk_100253AB8;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v9 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034750;
  block[3] = &unk_1002537C0;
  BOOL v15 = a5;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)_submitToggleReport
{
  v3 = +[CSVoiceTriggerStatistics sharedInstance];
  id v4 = [v3 getPHSRejectCount];

  v5 = +[CSVoiceTriggerStatistics sharedInstance];
  id v6 = [v5 getVTRejectCount];

  vteiList = self->_vteiList;
  if (vteiList
    && ([(NSMutableArray *)vteiList lastObject],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [(NSMutableArray *)self->_vteiList lastObject];
    v10 = [v9 objectForKeyedSubscript:kVTEIsatNumberTrainingUtterances];
    id v11 = [v10 unsignedIntegerValue];
  }
  else
  {
    id v11 = 0;
  }
  v22[0] = kVTEIsatNumberTrainingUtterances;
  v12 = +[NSNumber numberWithUnsignedInteger:v11];
  v23[0] = v12;
  v22[1] = kVTEILastConsecutiveVTRejects;
  id v13 = +[NSNumber numberWithUnsignedInteger:v6];
  v23[1] = v13;
  v22[2] = kVTEILastConsecutivePHSRejects;
  v14 = +[NSNumber numberWithUnsignedInteger:v4];
  v23[2] = v14;
  BOOL v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  v16 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    v19 = "-[CSVoiceTriggerDataCollector _submitToggleReport]";
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Submitting VT toggle analytics: %@", (uint8_t *)&v18, 0x16u);
  }
  v17 = +[AFAnalytics sharedAnalytics];
  [v17 logEventWithType:4708 context:v15];
}

- (void)_createAndSubmitRejectLoggingDictWithSource:(id)a3 withPHSAcceptInfo:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = [(CSVoiceTriggerDataCollector *)self _filteredVTEIArray];
  if ([v8 count])
  {
    id v9 = +[NSMutableDictionary dictionary];
    v10 = @"unkown";
    if (v6) {
      v10 = v6;
    }
    id v11 = v10;
    [v9 setObject:v11 forKey:kVTEISiriActivationRecordType];
    v12 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v9 setObject:v12 forKey:kVTEItriggerEndMachTime];

    [v9 setObject:v8 forKey:kVTEIRejectInfoList];
    if (v7) {
      [v9 setObject:v7 forKey:kVTEIPHSAcceptEventInfo];
    }
    id v13 = +[AFAnalytics sharedAnalytics];
    [v13 logEventWithType:4709 context:v9];

    v14 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      vteiList = self->_vteiList;
      v16 = v14;
      int v19 = 136315650;
      __int16 v20 = "-[CSVoiceTriggerDataCollector _createAndSubmitRejectLoggingDictWithSource:withPHSAcceptInfo:]";
      __int16 v21 = 2048;
      id v22 = [(NSMutableArray *)vteiList count];
      __int16 v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Submitting %lu VT/PHS reject logs for siri record type %@", (uint8_t *)&v19, 0x20u);
    }
  }
  v17 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:5];
  int v18 = self->_vteiList;
  self->_vteiList = v17;
}

- (id)_filteredVTEIArray
{
  uint64_t v3 = mach_absolute_time();
  id v22 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_vteiList;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (!v4) {
    goto LABEL_14;
  }
  id v6 = v4;
  uint64_t v7 = *(void *)v25;
  *(void *)&long long v5 = 136315650;
  long long v21 = v5;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"dcTriggerEndMachTime", v21);
      id v11 = [v10 unsignedIntegerValue];

      +[CSFTimeUtils hostTimeToTimeInterval:v3 - (void)v11];
      double v13 = v12;
      v14 = +[NSMutableDictionary dictionaryWithDictionary:v9];
      [v14 removeObjectForKey:@"dcTriggerEndMachTime"];
      if (v13 <= 30.0)
      {
        [v22 addObject:v14];
        int v18 = CSLogCategoryVT;
        if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = v21;
        v29 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        __int16 v30 = 2048;
        id v31 = v11;
        __int16 v32 = 2048;
        double v33 = v13;
        v16 = v18;
        v17 = "%s Collecting VT/PHS reject event from time: %llu, delta %f secs";
      }
      else
      {
        BOOL v15 = CSLogCategoryVT;
        if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = v21;
        v29 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        __int16 v30 = 2048;
        id v31 = v11;
        __int16 v32 = 2048;
        double v33 = v13;
        v16 = v15;
        v17 = "%s Rejecting VT/PHS reject event from time: %llu, delta %f secs";
      }
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
LABEL_12:
    }
    id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  }
  while (v6);
LABEL_14:

  if ([v22 count]) {
    id v19 = [v22 copy];
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (void)addVTAcceptEntryAndSubmit:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034F84;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addVTRejectEntry:(id)a3 truncateData:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035094;
  block[3] = &unk_1002537C0;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (id)fetchVoiceTriggerHeartBeatMetrics
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100035428;
  id v10 = sub_100035438;
  id v11 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035440;
  block[3] = &unk_100253440;
  void block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CSVoiceTriggerDataCollector)init
{
  v16.receiver = self;
  v16.super_class = (Class)CSVoiceTriggerDataCollector;
  v2 = [(CSVoiceTriggerDataCollector *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerDataCollector", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    long long v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    vteiList = v2->_vteiList;
    v2->_vteiList = v5;

    uint64_t v7 = +[CSSiriClientBehaviorMonitor sharedInstance];
    [v7 registerObserver:v2];

    uint64_t v8 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
    [v8 addObserver:v2];

    id v9 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
    if ([v9 isEnabled])
    {
      uint64_t v10 = +[NSDate date];
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = (NSDate *)v10;
    }
    else
    {
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = 0;
    }

    lastVTDisableDate = v2->_lastVTDisableDate;
    v2->_lastVTDisableDate = 0;

    double v13 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", kVTEIconfigVersion, kVTEIbuildVersion, kVTEItotalSamplesAtEndOfCapture, kVTEItriggerScore, kVTEIrecognizerScore, 0);
    objc_storeStrong((id *)&v2->_privacyApprovedFields, v13);
    v14 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v18 = "-[CSVoiceTriggerDataCollector init]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Created CSVoiceTriggerDataCollector", buf, 0xCu);
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1002A3680 != -1) {
    dispatch_once(&qword_1002A3680, &stru_10024EDA0);
  }
  v2 = (void *)qword_1002A3688;
  return v2;
}

@end