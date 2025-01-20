@interface WFTouchCapturingView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)touchCapturedHandler;
- (void)setTouchCapturedHandler:(id)a3;
@end

@implementation WFTouchCapturingView

- (void).cxx_destruct
{
}

- (void)setTouchCapturedHandler:(id)a3
{
}

- (id)touchCapturedHandler
{
  return self->_touchCapturedHandler;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v5 = [(WFTouchCapturingView *)self touchCapturedHandler];

  if (v5)
  {
    v6 = [(WFTouchCapturingView *)self touchCapturedHandler];
    v6[2]();
  }
  return 1;
}

@end