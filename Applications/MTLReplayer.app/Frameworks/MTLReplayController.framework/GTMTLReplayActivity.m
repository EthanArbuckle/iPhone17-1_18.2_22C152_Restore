@interface GTMTLReplayActivity
- (GTMTLReplayActivity)initWithType:(id)a3;
- (GTMTLReplayActivity)previousActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (unint64_t)endTime;
- (unsigned)messageSerial;
- (void)outputToLog:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setPreviousActivity:(id)a3;
- (void)signpostIntervalBegin:(unint64_t)a3;
@end

@implementation GTMTLReplayActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousActivity, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)setPreviousActivity:(id)a3
{
}

- (GTMTLReplayActivity)previousActivity
{
  return self->_previousActivity;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_activityEndTime = a3;
}

- (unint64_t)endTime
{
  return self->_activityEndTime;
}

- (void)signpostIntervalBegin:(unint64_t)a3
{
  v5 = g_signpostLog;
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    unsigned int v7 = [(GTMTLReplayActivity *)self messageSerial];
    activityType = self->_activityType;
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2112;
    v11 = activityType;
    _os_signpost_emit_with_name_impl(&def_1C1270, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "Replayer-3-commandQueue", "%u. %@", (uint8_t *)v9, 0x12u);
  }
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->_activityType;
    int v6 = 138543362;
    unsigned int v7 = activityType;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)jsonObject
{
  v8[0] = self->_activityType;
  v7[0] = @"activityType";
  v7[1] = @"activityStartTime";
  v3 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->_activityStartTime];
  v8[1] = v3;
  v7[2] = @"activityEndTime";
  v4 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->_activityEndTime];
  v8[2] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)summary
{
  return +[NSString stringWithFormat:@"Activity: %@", self->_activityType];
}

- (unsigned)messageSerial
{
  return [(GTMTLReplayActivity *)self->_previousActivity messageSerial];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  int v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)v5 + 1, self->_activityType);
    v6[2] = self->_activityStartTime;
    v6[3] = self->_activityEndTime;
    id v7 = [(GTMTLReplayActivity *)self->_previousActivity copyWithZone:a3];
    v8 = (void *)v6[4];
    v6[4] = v7;
  }
  return v6;
}

- (GTMTLReplayActivity)initWithType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTMTLReplayActivity;
  int v6 = [(GTMTLReplayActivity *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityType, a3);
    uint64_t v8 = mach_absolute_time();
    v7->_activityStartTime = v8;
    v7->_activityEndTime = v8;
  }

  return v7;
}

@end