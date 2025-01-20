@interface FigCaptureAutoFocusPositionSensorCalibrationIStopZEstimateDeltaHistory
- (int)currentIStopZEstimateDelta;
- (int)lastPassingIStopZEstimateDelta;
- (int)previousIStopZEstimateDelta;
- (void)setCurrentIStopZEstimateDelta:(int)a3;
- (void)setLastPassingIStopZEstimateDelta:(int)a3;
- (void)setPreviousIStopZEstimateDelta:(int)a3;
@end

@implementation FigCaptureAutoFocusPositionSensorCalibrationIStopZEstimateDeltaHistory

- (int)lastPassingIStopZEstimateDelta
{
  return self->_lastPassingIStopZEstimateDelta;
}

- (void)setLastPassingIStopZEstimateDelta:(int)a3
{
  self->_lastPassingIStopZEstimateDelta = a3;
}

- (int)previousIStopZEstimateDelta
{
  return self->_previousIStopZEstimate;
}

- (void)setPreviousIStopZEstimateDelta:(int)a3
{
  self->_previousIStopZEstimate = a3;
}

- (int)currentIStopZEstimateDelta
{
  return self->_currentIStopZEstimate;
}

- (void)setCurrentIStopZEstimateDelta:(int)a3
{
  self->_currentIStopZEstimate = a3;
}

@end