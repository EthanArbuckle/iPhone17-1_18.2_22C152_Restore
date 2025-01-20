@interface GTMTLReplayActivityRestoreCommandBuffer
- (GTMTLReplayActivityRestoreCommandBuffer)initWithIndex:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityRestoreCommandBuffer

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    unsigned int functionIndex = self->_functionIndex;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 1024;
    unsigned int v10 = functionIndex;
    _os_log_impl(&def_1C1270, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%u", (uint8_t *)&v7, 0x12u);
  }
}

- (id)jsonObject
{
  v9[0] = self->super._activityType;
  v8[0] = @"activityType";
  v8[1] = @"functionIndex";
  v3 = +[NSNumber numberWithUnsignedInt:self->_functionIndex];
  v9[1] = v3;
  v8[2] = @"activityStartTime";
  v4 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v9[2] = v4;
  v8[3] = @"activityEndTime";
  v5 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v9[3] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)summary
{
  return +[NSString stringWithFormat:@"Restoring a command buffer at function index %d", self->_functionIndex];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreCommandBuffer;
  id result = [(GTMTLReplayActivity *)&v5 copyWithZone:a3];
  if (result) {
    *((_DWORD *)result + 10) = self->_functionIndex;
  }
  return result;
}

- (GTMTLReplayActivityRestoreCommandBuffer)initWithIndex:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreCommandBuffer;
  id result = [(GTMTLReplayActivity *)&v5 initWithType:@"restoreCommandBuffer"];
  if (result) {
    result->_unsigned int functionIndex = a3;
  }
  return result;
}

@end