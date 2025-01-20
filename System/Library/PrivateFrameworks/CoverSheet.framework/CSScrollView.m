@interface CSScrollView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation CSScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v8 = [(BSUIScrollView *)self delegate];
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "coverSheetScrollView:shouldSetContentOffset:animated:", self, v4, x, y))
  {
    v10.receiver = self;
    v10.super_class = (Class)CSScrollView;
    -[BSUIScrollView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(BSUIScrollView *)self delegate];
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "coverSheetScrollView:shouldSetContentOffset:animated:", self, 0, x, y))
  {
    v8.receiver = self;
    v8.super_class = (Class)CSScrollView;
    -[BSUIScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = [(BSUIScrollView *)self delegate];
  LOBYTE(self) = [v5 coverSheetScrollView:self gestureRecognizerShouldBegin:v4];

  return (char)self;
}

@end