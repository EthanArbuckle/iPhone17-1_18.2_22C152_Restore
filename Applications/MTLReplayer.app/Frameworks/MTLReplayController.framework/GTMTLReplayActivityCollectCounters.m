@interface GTMTLReplayActivityCollectCounters
- (GTMTLReplayActivityCollectCounters)initWithCounters:(id)a3 statLocations:(unint64_t)a4 index:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (unsigned)messageSerial;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityCollectCounters

- (void).cxx_destruct
{
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    unint64_t index = self->_index;
    unint64_t locations = self->_locations;
    counterNames = self->_counterNames;
    int v9 = 138544130;
    v10 = activityType;
    __int16 v11 = 2048;
    unint64_t v12 = index;
    __int16 v13 = 2048;
    unint64_t v14 = locations;
    __int16 v15 = 2114;
    v16 = counterNames;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@(%llu):\t0x%08llx %{public}@", (uint8_t *)&v9, 0x2Au);
  }
}

- (id)jsonObject
{
  activityType = self->super._activityType;
  counterNames = self->_counterNames;
  v11[0] = @"activityType";
  v11[1] = @"counterNames";
  v12[0] = activityType;
  v12[1] = counterNames;
  v11[2] = @"locations";
  v5 = +[NSNumber numberWithUnsignedLongLong:self->_locations];
  v12[2] = v5;
  v11[3] = @"index";
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_index];
  v12[3] = v6;
  v11[4] = @"activityStartTime";
  v7 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v12[4] = v7;
  v11[5] = @"activityEndTime";
  v8 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v12[5] = v8;
  int v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)summary
{
  return @"Collecting counters";
}

- (unsigned)messageSerial
{
  return self->_index;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityCollectCounters;
  v4 = [(GTMTLReplayActivity *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 5, self->_counterNames);
    v5[6] = self->_locations;
    v5[7] = self->_index;
  }
  return v5;
}

- (GTMTLReplayActivityCollectCounters)initWithCounters:(id)a3 statLocations:(unint64_t)a4 index:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMTLReplayActivityCollectCounters;
  v10 = [(GTMTLReplayActivity *)&v13 initWithType:@"collectCounters"];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_counterNames, a3);
    v11->_unint64_t locations = a4;
    v11->_unint64_t index = a5;
  }

  return v11;
}

@end