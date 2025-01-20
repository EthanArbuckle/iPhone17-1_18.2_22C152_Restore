@interface GTMTLReplayActivityLoadArchive
- (GTMTLReplayActivityLoadArchive)initWithPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityLoadArchive

- (void).cxx_destruct
{
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    path = self->_path;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 2114;
    v10 = path;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)jsonObject
{
  activityType = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"path";
  path = self->_path;
  v10[0] = activityType;
  v10[1] = path;
  v9[2] = @"activityStartTime";
  v5 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v10[2] = v5;
  v9[3] = @"activityEndTime";
  v6 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v10[3] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)summary
{
  return @"Loading gputrace";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityLoadArchive;
  v4 = [(GTMTLReplayActivity *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_path);
  }
  return v5;
}

- (GTMTLReplayActivityLoadArchive)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityLoadArchive;
  v6 = [(GTMTLReplayActivity *)&v9 initWithType:@"loadArchive"];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

@end