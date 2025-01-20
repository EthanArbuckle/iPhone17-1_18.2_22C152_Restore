@interface JFXCVASegMatting
+ (CGSize)mattingDepthInputSize;
- (BOOL)isValidForCameraFrameSet:(id)a3;
- (id)initForFrameSet:(id)a3;
- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5;
@end

@implementation JFXCVASegMatting

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXCVASegMatting;
  v5 = [(JFXMatting *)&v11 initForFrameSet:v4];
  if (v5)
  {
    id v6 = [[JFXCVASegMatting_NoOp alloc] initForFrameSet:v4];
    id v7 = v5[5];
    v5[5] = v6;

    uint64_t v8 = [v5[5] ready];
    v10.receiver = v5;
    v10.super_class = (Class)JFXCVASegMatting;
    [(JFXMatting *)&v10 setReady:v8];
  }

  return v5;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void))a5;
  v11.receiver = self;
  v11.super_class = (Class)JFXCVASegMatting;
  if ([(JFXMatting *)&v11 ready]) {
    [(JFXMatting *)self->_impl alphaMatteForFrameSet:v8 mattingPerfState:v9 completionHandler:v10];
  }
  else {
    v10[2](v10, 0);
  }
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)JFXCVASegMatting;
  if ([(JFXMatting *)&v7 isValidForCameraFrameSet:v4]) {
    BOOL v5 = [(JFXMatting *)self->_impl isValidForCameraFrameSet:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = 320.0;
  double v3 = 180.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end