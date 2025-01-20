@interface BWVariableFrameRateParameters
- (BWVariableFrameRateParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4;
- (NSDictionary)aeMaxGain;
- (NSString)portType;
- (id)description;
- (int)motionThreshold;
- (void)dealloc;
@end

@implementation BWVariableFrameRateParameters

- (BWVariableFrameRateParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  if (a3 && (uint64_t v6 = [a4 objectForKeyedSubscript:@"VariableFrameRateVideoParameters"]) != 0)
  {
    v7 = (void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)BWVariableFrameRateParameters;
    v8 = [(BWVariableFrameRateParameters *)&v10 init];
    if (v8)
    {
      v8->_portType = (NSString *)a3;
      v8->_motionThreshold = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"MotionThreshold"), "intValue");
      v8->_aeMaxGain = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"AEMaxGainForFrameRate"), "copy");
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVariableFrameRateParameters;
  [(BWVariableFrameRateParameters *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PortType : %@ Motion Threshold: %d\n AEMaxGain : %@", self->_portType, self->_motionThreshold, self->_aeMaxGain];
}

- (NSString)portType
{
  return self->_portType;
}

- (int)motionThreshold
{
  return self->_motionThreshold;
}

- (NSDictionary)aeMaxGain
{
  return &self->_aeMaxGain->super;
}

@end