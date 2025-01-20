@interface CAMExposureResult
- (BOOL)deviceSupportsFocus;
- (BOOL)exposureDidEnd;
- (BOOL)exposureDidStart;
- (BOOL)isAdjustingExposure;
- (CAMExposureResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 exposureTargetBias:(float)a5 adjusting:(BOOL)a6 exposureDidStart:(BOOL)a7 exposureDidEnd:(BOOL)a8 deviceSupportsFocus:(BOOL)a9;
- (CGPoint)pointOfInterest;
- (float)exposureTargetBias;
- (id)description;
- (int64_t)exposureMode;
@end

@implementation CAMExposureResult

- (float)exposureTargetBias
{
  return self->_exposureTargetBias;
}

- (BOOL)deviceSupportsFocus
{
  return self->_deviceSupportsFocus;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (CGPoint)pointOfInterest
{
  double x = self->_pointOfInterest.x;
  double y = self->_pointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CAMExposureResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 exposureTargetBias:(float)a5 adjusting:(BOOL)a6 exposureDidStart:(BOOL)a7 exposureDidEnd:(BOOL)a8 deviceSupportsFocus:(BOOL)a9
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v21.receiver = self;
  v21.super_class = (Class)CAMExposureResult;
  v17 = [(CAMExposureResult *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_exposureMode = a3;
    v17->_pointOfInterest.CGFloat x = x;
    v17->_pointOfInterest.CGFloat y = y;
    v17->_exposureTargetBias = a5;
    v17->_adjustingExposure = a6;
    v17->_exposureDidStart = a7;
    v17->_exposureDidEnd = a8;
    v17->_deviceSupportsFocus = a9;
    v19 = v17;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(CAMExposureResult *)self exposureMode];
  [(CAMExposureResult *)self pointOfInterest];
  v7 = NSStringFromCGPoint(v15);
  BOOL v8 = [(CAMExposureResult *)self isAdjustingExposure];
  [(CAMExposureResult *)self exposureTargetBias];
  v10 = [v3 stringWithFormat:@"<%@: %p mode: %ld pointOfInterest: %@ adjusting: %d targetBias: %.3f>", v5, self, v6, v7, v8, v9];

  if ([(CAMExposureResult *)self exposureDidStart])
  {
    uint64_t v11 = [v10 stringByAppendingString:@" didStart"];

    v10 = (void *)v11;
  }
  if ([(CAMExposureResult *)self exposureDidEnd])
  {
    uint64_t v12 = [v10 stringByAppendingString:@" didEnd"];

    v10 = (void *)v12;
  }
  return v10;
}

- (BOOL)isAdjustingExposure
{
  return self->_adjustingExposure;
}

- (BOOL)exposureDidStart
{
  return self->_exposureDidStart;
}

- (BOOL)exposureDidEnd
{
  return self->_exposureDidEnd;
}

@end