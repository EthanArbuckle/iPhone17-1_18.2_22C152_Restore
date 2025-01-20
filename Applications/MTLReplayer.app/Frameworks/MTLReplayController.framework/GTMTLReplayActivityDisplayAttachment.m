@interface GTMTLReplayActivityDisplayAttachment
- (GTMTLReplayActivityDisplayAttachment)initWithIndex:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityDisplayAttachment

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    unsigned int function = self->_currentIndex.function;
    unsigned int subCommand = self->_currentIndex.subCommand;
    int v8 = 138543874;
    v9 = activityType;
    __int16 v10 = 1024;
    unsigned int v11 = function;
    __int16 v12 = 1024;
    unsigned int v13 = subCommand;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u:%u", (uint8_t *)&v8, 0x18u);
  }
}

- (id)jsonObject
{
  v10[0] = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"functionIndex";
  v3 = +[NSNumber numberWithUnsignedInt:self->_currentIndex.function];
  v10[1] = v3;
  v9[2] = @"subCommand";
  v4 = +[NSNumber numberWithUnsignedInt:self->_currentIndex.subCommand];
  v10[2] = v4;
  v9[3] = @"activityStartTime";
  v5 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v10[3] = v5;
  v9[4] = @"activityEndTime";
  v6 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v10[4] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (id)summary
{
  return +[NSString stringWithFormat:@"Displaying attachment at (index: %d, subCommand: %d)", self->_currentIndex.function, self->_currentIndex.subCommand];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDisplayAttachment;
  id result = [(GTMTLReplayActivity *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 5) = self->_currentIndex;
  }
  return result;
}

- (GTMTLReplayActivityDisplayAttachment)initWithIndex:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDisplayAttachment;
  id result = [(GTMTLReplayActivity *)&v5 initWithType:@"displayAttachment"];
  if (result) {
    result->_currentIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a3;
  }
  return result;
}

@end