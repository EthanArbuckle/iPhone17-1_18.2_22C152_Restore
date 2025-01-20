@interface PHASETargetRoomAcousticSubbandParameters
- (PHASETargetRoomAcousticSubbandParameters)init;
- (double)confidence;
- (double)earlyRoomEqDb;
- (double)frequency;
- (double)lateRoomEqDb;
- (double)rt60;
- (void)setConfidence:(double)a3;
- (void)setEarlyRoomEqDb:(double)a3;
- (void)setFrequency:(double)a3;
- (void)setLateRoomEqDb:(double)a3;
- (void)setRt60:(double)a3;
@end

@implementation PHASETargetRoomAcousticSubbandParameters

- (PHASETargetRoomAcousticSubbandParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASETargetRoomAcousticSubbandParameters;
  result = [(PHASETargetRoomAcousticSubbandParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_frequency = xmmword_2220E7950;
    result->_earlyRoomEqDb = 0.0;
    result->_lateRoomEqDb = 0.0;
    result->_confidence = 1.0;
  }
  return result;
}

- (void)setFrequency:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_frequency = PHASEGetPropertyBounded<double>(v8, v7, a3, 20.0, 20000.0);
}

- (void)setRt60:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_rt60 = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 15.0);
}

- (void)setEarlyRoomEqDb:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_earlyRoomEqDb = PHASEGetPropertyBounded<double>(v8, v7, a3, -60.0, 20.0);
}

- (void)setLateRoomEqDb:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_lateRoomEqDb = PHASEGetPropertyBounded<double>(v8, v7, a3, -60.0, 20.0);
}

- (void)setConfidence:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_confidence = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.0);
}

- (double)frequency
{
  return self->_frequency;
}

- (double)rt60
{
  return self->_rt60;
}

- (double)earlyRoomEqDb
{
  return self->_earlyRoomEqDb;
}

- (double)lateRoomEqDb
{
  return self->_lateRoomEqDb;
}

- (double)confidence
{
  return self->_confidence;
}

@end