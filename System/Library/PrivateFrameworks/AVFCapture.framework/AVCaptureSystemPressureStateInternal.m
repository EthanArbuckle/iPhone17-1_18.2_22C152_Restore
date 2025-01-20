@interface AVCaptureSystemPressureStateInternal
- (AVCaptureSystemPressureStateInternal)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5;
- (AVFrameRateRange)recommendedFrameRateRangeForPortrait;
- (int)figLevel;
- (unint64_t)factors;
- (void)dealloc;
@end

@implementation AVCaptureSystemPressureStateInternal

- (AVFrameRateRange)recommendedFrameRateRangeForPortrait
{
  v2 = self->_recommendedFrameRateRangeForPortrait;

  return v2;
}

- (unint64_t)factors
{
  return self->_factors;
}

- (int)figLevel
{
  return self->_figLevel;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemPressureStateInternal;
  [(AVCaptureSystemPressureStateInternal *)&v3 dealloc];
}

- (AVCaptureSystemPressureStateInternal)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemPressureStateInternal;
  v8 = [(AVCaptureSystemPressureStateInternal *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_figLevel = a3;
    v8->_factors = a4;
    v8->_recommendedFrameRateRangeForPortrait = (AVFrameRateRange *)a5;
  }
  return v9;
}

@end