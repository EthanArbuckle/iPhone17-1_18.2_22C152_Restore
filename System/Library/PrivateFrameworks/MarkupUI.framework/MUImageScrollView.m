@interface MUImageScrollView
- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3;
- (void)centerContentIgnoringInsets;
@end

@implementation MUImageScrollView

- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3
{
  BOOL v3 = a3;
  [(MUImageScrollView *)self contentSize];
  double v6 = v5;
  [(MUImageScrollView *)self bounds];
  double v8 = v7;
  v9 = [(MUImageScrollView *)self delegate];
  int v10 = [v9 centersIgnoringContentInsets];
  v11.receiver = self;
  v11.super_class = (Class)MUImageScrollView;
  [(MUImageScrollView *)&v11 _centerContentIfNecessaryAdjustingContentOffset:v3];
  if (v10 && v6 <= v8 && ([(MUImageScrollView *)self isZooming] & 1) == 0) {
    [(MUImageScrollView *)self centerContentIgnoringInsets];
  }
}

- (void)centerContentIgnoringInsets
{
  id v4 = [(MUImageScrollView *)self delegate];
  [(MUImageScrollView *)self bounds];
  BOOL v3 = [v4 viewForZoomingInScrollView:self];
  [v3 frame];
  UIRectCenteredYInRect();
  objc_msgSend(v3, "setFrame:");
}

@end