@interface HangDataStreamStatusTracker
+ (id)sharedInstance;
- (BOOL)isHangEndedWithDuration:(double)a3 updateInterval:(double)a4 hangID:(id)a5;
- (HangDataStreamStatusTracker)init;
- (NSMutableDictionary)hangHUDStatusDict;
- (void)initializeStatus;
- (void)setHangHUDStatusDict:(id)a3;
@end

@implementation HangDataStreamStatusTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006710;
  block[3] = &unk_100030840;
  block[4] = a1;
  if (qword_10003E930 != -1) {
    dispatch_once(&qword_10003E930, block);
  }
  v2 = (void *)qword_10003E928;

  return v2;
}

- (HangDataStreamStatusTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)HangDataStreamStatusTracker;
  v2 = [(HangDataStreamStatusTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hangHUDStatusDict = v2->_hangHUDStatusDict;
    v2->_hangHUDStatusDict = v3;
  }
  return v2;
}

- (void)initializeStatus
{
}

- (BOOL)isHangEndedWithDuration:(double)a3 updateInterval:(double)a4 hangID:(id)a5
{
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->_hangHUDStatusDict objectForKey:v8];

  if (!v9)
  {
    hangHUDStatusDict = self->_hangHUDStatusDict;
    v11 = objc_alloc_init(HangDataStreamStatus);
    [(NSMutableDictionary *)hangHUDStatusDict setObject:v11 forKey:v8];
  }
  v12 = [(NSMutableDictionary *)self->_hangHUDStatusDict objectForKeyedSubscript:v8];
  [v12 previousDurationSinceLastUpdateMs];
  double v14 = v13;
  v15 = sub_10000E760();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    [v12 previousDurationSinceLastUpdateMs];
    int v21 = 134219522;
    double v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = v20;
    __int16 v25 = 1024;
    unsigned int v26 = [v12 countsOfMeetingEndingConditions];
    __int16 v27 = 1024;
    BOOL v28 = a3 > a4;
    __int16 v29 = 1024;
    BOOL v30 = v14 < a3;
    __int16 v31 = 2048;
    double v32 = a4;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "isHangEndedWithDuration %f, previous_durationSinceLastUpdateMs:%f, counter:%i, is_latency_high:%i, is_latency_increasing:%i, hudUpdateInterval:%f, hangID:%@", (uint8_t *)&v21, 0x3Cu);
  }

  if (a3 <= a4 || v14 >= a3)
  {
    [v12 initStatus];
  }
  else
  {
    objc_msgSend(v12, "setCountsOfMeetingEndingConditions:", objc_msgSend(v12, "countsOfMeetingEndingConditions") + 1);
    [v12 setPreviousDurationSinceLastUpdateMs:a3];
  }
  int v16 = [v12 countsOfMeetingEndingConditions];
  v17 = sub_10000E760();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16 < 3)
  {
    if (v18) {
      sub_10001BE3C((uint64_t)v8, v17);
    }
  }
  else
  {
    if (v18) {
      sub_10001BDC4((uint64_t)v8, v17);
    }

    [v12 initStatus];
  }

  return v16 > 2;
}

- (NSMutableDictionary)hangHUDStatusDict
{
  return self->_hangHUDStatusDict;
}

- (void)setHangHUDStatusDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end