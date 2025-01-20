@interface _PKInlineDrawingScrollView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (id)_parentScrollView;
- (void)setContentOffset:(CGPoint)a3;
@end

@implementation _PKInlineDrawingScrollView

- (id)_parentScrollView
{
  v2 = [(_PKInlineDrawingScrollView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_PKInlineDrawingScrollView *)self panGestureRecognizer];
  v9 = [(_PKInlineDrawingScrollView *)self _parentScrollView];
  id v10 = [v9 panGestureRecognizer];

  BOOL v12 = v8 == v7 && v10 == v6;
  return v12;
}

- (void)setContentOffset:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_PKInlineDrawingScrollView;
  -[_PKInlineDrawingScrollView setContentOffset:](&v3, sel_setContentOffset_, a3.x, 0.0);
}

@end