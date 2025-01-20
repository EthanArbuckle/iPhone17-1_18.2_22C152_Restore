@interface AVMobileChromeControlsView
- (UIView)activePlaybackControlsView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setActivePlaybackControlsView:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation AVMobileChromeControlsView

- (void).cxx_destruct
{
}

- (UIView)activePlaybackControlsView
{
  return self->_activePlaybackControlsView;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromeControlsView;
  -[AVMobileChromeControlsView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self)
  {
    activePlaybackControlsView = self->_activePlaybackControlsView;
    [(AVMobileChromeControlsView *)self bounds];
    -[UIView setFrame:](activePlaybackControlsView, "setFrame:");
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsView;
  [(AVMobileChromeControlsView *)&v4 layoutSubviews];
  if (self)
  {
    activePlaybackControlsView = self->_activePlaybackControlsView;
    [(AVMobileChromeControlsView *)self bounds];
    -[UIView setFrame:](activePlaybackControlsView, "setFrame:");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromeControlsView;
  -[AVMobileChromeControlsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_super v5 = (AVMobileChromeControlsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

- (void)setActivePlaybackControlsView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  activePlaybackControlsView = self->_activePlaybackControlsView;
  v7 = v5;
  if (activePlaybackControlsView != v5)
  {
    if (activePlaybackControlsView) {
      [(UIView *)activePlaybackControlsView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_activePlaybackControlsView, a3);
    if (self->_activePlaybackControlsView) {
      -[AVMobileChromeControlsView addSubview:](self, "addSubview:");
    }
  }
}

@end