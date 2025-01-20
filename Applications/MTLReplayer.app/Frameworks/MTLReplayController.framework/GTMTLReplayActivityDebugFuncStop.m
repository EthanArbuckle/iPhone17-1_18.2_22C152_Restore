@interface GTMTLReplayActivityDebugFuncStop
- (GTMTLReplayActivityDebugFuncStop)initWithCurrentIndex:(id)a3 targetIndex:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityDebugFuncStop

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    unsigned int function = self->_currentIndex.function;
    unsigned int subCommand = self->_currentIndex.subCommand;
    unsigned int v9 = self->_targetIndex.function;
    unsigned int v8 = self->_targetIndex.subCommand;
    int v10 = 138544386;
    v11 = activityType;
    __int16 v12 = 1024;
    unsigned int v13 = function;
    __int16 v14 = 1024;
    unsigned int v15 = subCommand;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u:%u -> %u:%u", (uint8_t *)&v10, 0x24u);
  }
}

- (id)jsonObject
{
  v12[0] = self->super._activityType;
  v11[0] = @"activityType";
  v11[1] = @"currentFunctionIndex";
  v3 = +[NSNumber numberWithUnsignedInt:self->_currentIndex.function];
  v12[1] = v3;
  v11[2] = @"currentSubCommand";
  v4 = +[NSNumber numberWithUnsignedInt:self->_currentIndex.subCommand];
  v12[2] = v4;
  v11[3] = @"targetFunctionIndex";
  v5 = +[NSNumber numberWithUnsignedInt:self->_targetIndex.function];
  v12[3] = v5;
  v11[4] = @"targetSubCommand";
  v6 = +[NSNumber numberWithUnsignedInt:self->_targetIndex.subCommand];
  v12[4] = v6;
  v11[5] = @"activityStartTime";
  v7 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v12[5] = v7;
  v11[6] = @"activityEndTime";
  unsigned int v8 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v12[6] = v8;
  unsigned int v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

- (id)summary
{
  return +[NSString stringWithFormat:@"Replaying from (index: %d, subCommand: %d) to (index: %d, subCommand: %d)", self->_currentIndex.function, self->_currentIndex.subCommand, self->_targetIndex.function, self->_targetIndex.subCommand];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityDebugFuncStop;
  id result = [(GTMTLReplayActivity *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 5) = self->_currentIndex;
    *((void *)result + 6) = self->_targetIndex;
  }
  return result;
}

- (GTMTLReplayActivityDebugFuncStop)initWithCurrentIndex:(id)a3 targetIndex:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityDebugFuncStop;
  id result = [(GTMTLReplayActivity *)&v7 initWithType:@"debugFuncStop"];
  if (result)
  {
    result->_currentIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a3;
    result->_targetIndex = ($0F314FFEF57EDD05BD6D642B3ED39160)a4;
  }
  return result;
}

@end