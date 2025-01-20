@interface SHRecordingLog
+ (void)powerlogCallingProcessBundleID:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSDate)endedRecordingDate;
- (NSDate)startedRecordingDate;
- (NSString)bundleID;
- (SHRecordingLog)initWithBundleID:(id)a3;
- (int64_t)assistantTapCount;
- (int64_t)totalTapCount;
- (void)attachedTapForClient:(int64_t)a3;
- (void)detachedTapForClient:(int64_t)a3;
@end

@implementation SHRecordingLog

- (SHRecordingLog)initWithBundleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRecordingLog;
  v6 = [(SHRecordingLog *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleID, a3);
  }

  return v7;
}

- (void)attachedTapForClient:(int64_t)a3
{
  int64x2_t v4 = vdupq_n_s64(1uLL);
  v4.i64[0] = a3 == 2;
  *(int64x2_t *)&self->_assistantTapCount = vaddq_s64(*(int64x2_t *)&self->_assistantTapCount, v4);
  if ((id)[(SHRecordingLog *)self totalTapCount] == (id)1)
  {
    id v5 = +[NSDate date];
    startedRecordingDate = self->_startedRecordingDate;
    self->_startedRecordingDate = v5;

    endedRecordingDate = self->_endedRecordingDate;
    self->_endedRecordingDate = 0;
  }
}

- (void)detachedTapForClient:(int64_t)a3
{
  if (a3 == 2) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = 0;
  }
  v5.i64[1] = -1;
  v5.i64[0] = v4;
  *(int64x2_t *)&self->_assistantTapCount = vaddq_s64(*(int64x2_t *)&self->_assistantTapCount, v5);
  if (![(SHRecordingLog *)self totalTapCount])
  {
    v6 = +[NSDate date];
    endedRecordingDate = self->_endedRecordingDate;
    self->_endedRecordingDate = v6;

    v8 = objc_opt_class();
    id v11 = [(SHRecordingLog *)self bundleID];
    objc_super v9 = [(SHRecordingLog *)self startedRecordingDate];
    v10 = [(SHRecordingLog *)self endedRecordingDate];
    [v8 powerlogCallingProcessBundleID:v11 startDate:v9 endDate:v10];
  }
}

+ (void)powerlogCallingProcessBundleID:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  [v10 setValue:v9 forKey:@"BundleID"];

  [v10 setValue:v8 forKey:@"timestamp"];
  [v10 setValue:v7 forKey:@"timestampEnd"];

  id v11 = sh_log_object();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Powerlogging %@", (uint8_t *)&v12, 0xCu);
  }

  PLLogRegisteredEvent();
}

- (NSDate)startedRecordingDate
{
  return self->_startedRecordingDate;
}

- (NSDate)endedRecordingDate
{
  return self->_endedRecordingDate;
}

- (int64_t)assistantTapCount
{
  return self->_assistantTapCount;
}

- (int64_t)totalTapCount
{
  return self->_totalTapCount;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_endedRecordingDate, 0);

  objc_storeStrong((id *)&self->_startedRecordingDate, 0);
}

@end