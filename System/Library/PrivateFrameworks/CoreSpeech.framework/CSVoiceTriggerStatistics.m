@interface CSVoiceTriggerStatistics
+ (id)sharedInstance;
- (CSVoiceTriggerStatistics)init;
- (double)getLastPHSRejectTime;
- (double)lastPHSReject;
- (id)getVoiceTriggerDailyMetadata;
- (id)getVoiceTriggerStatistics;
- (int)_convertToFirstPassSource:(id)a3;
- (unint64_t)consecutivePHSRejects;
- (unint64_t)firstPassTriggerCount;
- (unint64_t)getPHSRejectCount;
- (unint64_t)getVTRejectCount;
- (unint64_t)triggerCount;
- (void)clearFalseFirstPassTriggersPerHour;
- (void)clearFirstPassTriggerCount;
- (void)clearTriggerCount;
- (void)increaseFalseFirstPassTriggersPerHour;
- (void)increaseTriggerCount;
- (void)incrementFirstPassTriggerCount;
- (void)incrementPHSRejectCount;
- (void)incrementVTRejectCount;
- (void)resetPHSRejectCount;
- (void)resetVTEstimationStatistics;
- (void)setConsecutivePHSRejects:(unint64_t)a3;
- (void)setLastPHSReject:(double)a3;
- (void)updateVTEstimationStatistics:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
@end

@implementation CSVoiceTriggerStatistics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtDailyMetadata, 0);
  objc_storeStrong((id *)&self->_vtEstimationStatistics, 0);
  objc_storeStrong((id *)&self->_hourPowerTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLastPHSReject:(double)a3
{
  self->_lastPHSReject = a3;
}

- (double)lastPHSReject
{
  return self->_lastPHSReject;
}

- (void)setConsecutivePHSRejects:(unint64_t)a3
{
  self->_consecutivePHSRejects = a3;
}

- (unint64_t)consecutivePHSRejects
{
  return self->_consecutivePHSRejects;
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  [(CSVoiceTriggerStatistics *)self incrementVTRejectCount];
  [(CSVoiceTriggerStatistics *)self increaseFalseFirstPassTriggersPerHour];
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  [(CSVoiceTriggerStatistics *)self incrementVTRejectCount];
  [(CSVoiceTriggerStatistics *)self increaseFalseFirstPassTriggersPerHour];
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
  [(CSVoiceTriggerStatistics *)self increaseTriggerCount];
  [(CSVoiceTriggerStatistics *)self clearFalseFirstPassTriggersPerHour];
}

- (id)getVoiceTriggerDailyMetadata
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000F1974;
  v10 = sub_1000F1984;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F198C;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getVoiceTriggerStatistics
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000F1974;
  v10 = sub_1000F1984;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F1ADC;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int)_convertToFirstPassSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessor])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromApplicationProcessorWithRingtone] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", kVTEIFirstPassTriggeredFromApplicationProcessorWithConnectedCall))
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromAlwaysOnProcessor])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromHearst])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromJarvis])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromRemora])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromWatch])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:kVTEIFirstPassTriggeredFromDarwin])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = [v3 isEqualToString:kVTEIFirstPassTriggeredFromDefault];
  }

  return v4;
}

- (void)resetVTEstimationStatistics
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F1D28;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateVTEstimationStatistics:(id)a3
{
  id v4 = a3;
  if ((+[CSUtils isDarwinOS] & 1) == 0)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F1DF4;
    v6[3] = &unk_100253B08;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (unint64_t)firstPassTriggerCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F28E4;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)clearFirstPassTriggerCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F296C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)incrementFirstPassTriggerCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F29EC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unint64_t)getVTRejectCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F2AAC;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)incrementVTRejectCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2B34;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)incrementPHSRejectCount
{
  ++self->_consecutivePHSRejects;
  +[CSUtils systemUpTime];
  self->_lastPHSReject = v3;
}

- (unint64_t)getPHSRejectCount
{
  return self->_consecutivePHSRejects;
}

- (double)getLastPHSRejectTime
{
  return self->_lastPHSReject;
}

- (void)resetPHSRejectCount
{
  self->_consecutivePHSRejects = 0;
}

- (unint64_t)triggerCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F2C48;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)clearTriggerCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2CD0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)increaseTriggerCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2D50;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)clearFalseFirstPassTriggersPerHour
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2DE0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)increaseFalseFirstPassTriggersPerHour
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2E60;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerStatistics)init
{
  v18.receiver = self;
  v18.super_class = (Class)CSVoiceTriggerStatistics;
  id v2 = [(CSVoiceTriggerStatistics *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerStatistics queue", 0);
    id v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    *((void *)v2 + 1) = 0;
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 5) = 0;
    *((_WORD *)v2 + 36) = 0;
    uint64_t v5 = +[NSMutableArray array];
    uint64_t v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    uint64_t v8 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v7;

    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    id v11 = *((void *)v2 + 6);
    dispatch_time_t v12 = dispatch_time(0, 0x34630B80000);
    dispatch_source_set_timer(v11, v12, 0x34630B80000uLL, 0xDF8476000uLL);
    objc_initWeak(&location, v2);
    v13 = *((void *)v2 + 6);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F3068;
    v15[3] = &unk_1002533D0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (CSVoiceTriggerStatistics *)v2;
}

+ (id)sharedInstance
{
  if (qword_1002A39D8 != -1) {
    dispatch_once(&qword_1002A39D8, &stru_100251748);
  }
  id v2 = (void *)qword_1002A39D0;
  return v2;
}

@end