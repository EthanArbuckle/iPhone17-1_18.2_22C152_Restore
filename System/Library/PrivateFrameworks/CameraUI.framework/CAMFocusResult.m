@interface CAMFocusResult
- (BOOL)contrastBasedFocusDidEnd;
- (BOOL)contrastBasedFocusDidStart;
- (BOOL)deviceSupportsFocus;
- (BOOL)isPerformingContrastDetection;
- (CAMFocusResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 performingContrastDetection:(BOOL)a5 contrastBasedFocusDidStart:(BOOL)a6 contrastBasedFocusDidEnd:(BOOL)a7 deviceSupportsFocus:(BOOL)a8;
- (CGPoint)pointOfInterest;
- (id)description;
- (int64_t)focusMode;
@end

@implementation CAMFocusResult

- (BOOL)deviceSupportsFocus
{
  return self->_deviceSupportsFocus;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (BOOL)contrastBasedFocusDidStart
{
  return self->_contrastBasedFocusDidStart;
}

- (BOOL)contrastBasedFocusDidEnd
{
  return self->_contrastBasedFocusDidEnd;
}

- (CGPoint)pointOfInterest
{
  double x = self->_pointOfInterest.x;
  double y = self->_pointOfInterest.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CAMFocusResult)initWithMode:(int64_t)a3 pointOfInterest:(CGPoint)a4 performingContrastDetection:(BOOL)a5 contrastBasedFocusDidStart:(BOOL)a6 contrastBasedFocusDidEnd:(BOOL)a7 deviceSupportsFocus:(BOOL)a8
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v19.receiver = self;
  v19.super_class = (Class)CAMFocusResult;
  v15 = [(CAMFocusResult *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_focusMode = a3;
    v15->_pointOfInterest.CGFloat x = x;
    v15->_pointOfInterest.CGFloat y = y;
    v15->_performingContrastDetection = a5;
    v15->_contrastBasedFocusDidStart = a6;
    v15->_contrastBasedFocusDidEnd = a7;
    v15->_deviceSupportsFocus = a8;
    v17 = v15;
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(CAMFocusResult *)self focusMode];
  [(CAMFocusResult *)self pointOfInterest];
  v7 = NSStringFromCGPoint(v13);
  v8 = [v3 stringWithFormat:@"<%@: %p mode: %ld pointOfInterest: %@ contrast: %d>", v5, self, v6, v7, -[CAMFocusResult isPerformingContrastDetection](self, "isPerformingContrastDetection")];

  if ([(CAMFocusResult *)self contrastBasedFocusDidStart])
  {
    uint64_t v9 = [v8 stringByAppendingString:@" contrastDidStart"];

    v8 = (void *)v9;
  }
  if ([(CAMFocusResult *)self contrastBasedFocusDidEnd])
  {
    uint64_t v10 = [v8 stringByAppendingString:@" contrastDidEnd"];

    v8 = (void *)v10;
  }
  return v8;
}

- (BOOL)isPerformingContrastDetection
{
  return self->_performingContrastDetection;
}

@end