@interface CSEnhancedEndpointerResult
- (BOOL)didDefaultEndpointerFire;
- (BOOL)didEndpointerFire;
- (BOOL)didForceEndpoint;
- (BOOL)didRelaxedEndpointerFire;
- (BOOL)speechArrivalDetected;
- (float)endpointPosterior;
- (float)partialScore;
- (float)rcScore;
- (int)extraDelayMs;
- (int64_t)endpointerType;
- (void)setDidDefaultEndpointerFire:(BOOL)a3;
- (void)setDidForceEndpoint:(BOOL)a3;
- (void)setDidRelaxedEndpointerFire:(BOOL)a3;
- (void)setEndpointPosterior:(float)a3;
- (void)setEndpointerType:(int64_t)a3;
- (void)setExtraDelayMs:(int)a3;
- (void)setPartialScore:(float)a3;
- (void)setRcScore:(float)a3;
- (void)setSpeechArrivalDetected:(BOOL)a3;
@end

@implementation CSEnhancedEndpointerResult

- (void)setEndpointerType:(int64_t)a3
{
  self->_endpointerType = a3;
}

- (int64_t)endpointerType
{
  return self->_endpointerType;
}

- (void)setRcScore:(float)a3
{
  self->_rcScore = a3;
}

- (float)rcScore
{
  return self->_rcScore;
}

- (void)setPartialScore:(float)a3
{
  self->_partialScore = a3;
}

- (float)partialScore
{
  return self->_partialScore;
}

- (void)setDidForceEndpoint:(BOOL)a3
{
  self->_didForceEndpoint = a3;
}

- (BOOL)didForceEndpoint
{
  return self->_didForceEndpoint;
}

- (void)setSpeechArrivalDetected:(BOOL)a3
{
  self->_speechArrivalDetected = a3;
}

- (BOOL)speechArrivalDetected
{
  return self->_speechArrivalDetected;
}

- (void)setExtraDelayMs:(int)a3
{
  self->_extraDelayMs = a3;
}

- (int)extraDelayMs
{
  return self->_extraDelayMs;
}

- (void)setEndpointPosterior:(float)a3
{
  self->_endpointPosterior = a3;
}

- (float)endpointPosterior
{
  return self->_endpointPosterior;
}

- (void)setDidRelaxedEndpointerFire:(BOOL)a3
{
  self->_didRelaxedEndpointerFire = a3;
}

- (BOOL)didRelaxedEndpointerFire
{
  return self->_didRelaxedEndpointerFire;
}

- (void)setDidDefaultEndpointerFire:(BOOL)a3
{
  self->_didDefaultEndpointerFire = a3;
}

- (BOOL)didDefaultEndpointerFire
{
  return self->_didDefaultEndpointerFire;
}

- (BOOL)didEndpointerFire
{
  return self->_didDefaultEndpointerFire || self->_didRelaxedEndpointerFire;
}

@end