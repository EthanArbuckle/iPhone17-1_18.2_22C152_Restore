@interface FMFWildcardGestureRecognizer
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (FMFWildcardGestureRecognizer)init;
- (id)touchesBeganCallback;
- (id)touchesEndedCallback;
- (void)setTouchesBeganCallback:(id)a3;
- (void)setTouchesEndedCallback:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation FMFWildcardGestureRecognizer

- (FMFWildcardGestureRecognizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMFWildcardGestureRecognizer;
  v2 = [(FMFWildcardGestureRecognizer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMFWildcardGestureRecognizer *)v2 setCancelsTouchesInView:0];
  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  touchesBeganCallback = (void (**)(id, id, id))self->_touchesBeganCallback;
  if (touchesBeganCallback) {
    touchesBeganCallback[2](touchesBeganCallback, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  touchesEndedCallback = (void (**)(id, id, id))self->_touchesEndedCallback;
  if (touchesEndedCallback) {
    touchesEndedCallback[2](touchesEndedCallback, a3, a4);
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (id)touchesBeganCallback
{
  return self->_touchesBeganCallback;
}

- (void)setTouchesBeganCallback:(id)a3
{
}

- (id)touchesEndedCallback
{
  return self->_touchesEndedCallback;
}

- (void)setTouchesEndedCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchesEndedCallback, 0);
  objc_storeStrong(&self->_touchesBeganCallback, 0);
}

@end