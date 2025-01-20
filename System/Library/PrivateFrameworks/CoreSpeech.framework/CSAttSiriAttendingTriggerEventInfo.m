@interface CSAttSiriAttendingTriggerEventInfo
+ (BOOL)supportsSecureCoding;
- (CSAttSiriAttendingTriggerEventInfo)initWithCoder:(id)a3;
- (CSAttSiriRequestContext)ctx;
- (NSString)detectedToken;
- (id)description;
- (unint64_t)triggerAbsStartSampleId;
- (unint64_t)triggerMachTime;
- (void)encodeWithCoder:(id)a3;
- (void)setCtx:(id)a3;
- (void)setDetectedToken:(id)a3;
- (void)setTriggerAbsStartSampleId:(unint64_t)a3;
- (void)setTriggerMachTime:(unint64_t)a3;
@end

@implementation CSAttSiriAttendingTriggerEventInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedToken, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

- (void)setTriggerAbsStartSampleId:(unint64_t)a3
{
  self->_triggerAbsStartSampleId = a3;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (void)setTriggerMachTime:(unint64_t)a3
{
  self->_triggerMachTime = a3;
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (void)setDetectedToken:(id)a3
{
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (void)setCtx:(id)a3
{
}

- (CSAttSiriRequestContext)ctx
{
  return self->_ctx;
}

- (id)description
{
  return +[NSString stringWithFormat:@"{attendingCtx: %@, detctedToken: %@, triggerMachTime=%llu, triggerStartSampleId=%llu}", self->_ctx, self->_detectedToken, self->_triggerMachTime, self->_triggerAbsStartSampleId];
}

- (void)encodeWithCoder:(id)a3
{
  ctx = self->_ctx;
  id v5 = a3;
  [v5 encodeObject:ctx forKey:@"RequestContext"];
  [v5 encodeObject:self->_detectedToken forKey:@"DetectedToken"];
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_triggerMachTime];
  [v5 encodeObject:v6 forKey:@"TriggerMachTime"];

  id v7 = +[NSNumber numberWithUnsignedLongLong:self->_triggerAbsStartSampleId];
  [v5 encodeObject:v7 forKey:@"TriggerAbsStartSampleId"];
}

- (CSAttSiriAttendingTriggerEventInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAttSiriAttendingTriggerEventInfo;
  id v5 = [(CSAttSiriAttendingTriggerEventInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestContext"];
    ctx = v5->_ctx;
    v5->_ctx = (CSAttSiriRequestContext *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DetectedToken"];
    detectedToken = v5->_detectedToken;
    v5->_detectedToken = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TriggerMachTime"];
    v5->_triggerMachTime = (unint64_t)[v10 unsignedLongLongValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TriggerAbsStartSampleId"];
    v5->_triggerAbsStartSampleId = (unint64_t)[v11 unsignedLongLongValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end