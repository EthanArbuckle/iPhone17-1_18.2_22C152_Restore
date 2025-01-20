@interface JFXCVASegMatting_NoOp
- (BOOL)isValidForCameraFrameSet:(id)a3;
- (id)initForFrameSet:(id)a3;
- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5;
@end

@implementation JFXCVASegMatting_NoOp

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXCVASegMatting_NoOp;
  id v5 = [(JFXMatting *)&v9 initForFrameSet:v4];
  v6 = v5;
  if (v5)
  {
    v8.receiver = v5;
    v8.super_class = (Class)JFXCVASegMatting_NoOp;
    [(JFXMatting *)&v8 setReady:1];
  }

  return v6;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  return 1;
}

@end