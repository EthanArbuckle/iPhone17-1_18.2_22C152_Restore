@interface ETGestureIgnoringView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIView)trackedView;
- (void)ignoreGesturesInView:(id)a3;
- (void)setTrackedView:(id)a3;
@end

@implementation ETGestureIgnoringView

- (void)ignoreGesturesInView:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  [v4 locationOfTouch:0 inView:self];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackedView);
  [WeakRetained frame];
  v14.x = v6;
  v14.y = v8;
  BOOL v10 = CGRectContainsPoint(v15, v14);

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)ETGestureIgnoringView;
    BOOL v11 = [(ETGestureIgnoringView *)&v13 gestureRecognizerShouldBegin:v4];
  }

  return v11;
}

- (UIView)trackedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackedView);

  return (UIView *)WeakRetained;
}

- (void)setTrackedView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end