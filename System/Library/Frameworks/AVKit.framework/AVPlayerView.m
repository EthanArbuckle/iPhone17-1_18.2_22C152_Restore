@interface AVPlayerView
- (AVPlayerView)initWithFrame:(CGRect)a3 contentView:(id)a4;
- (BOOL)needsInitialLayout;
- (UIView)contentView;
- (void)_beginManagingContentViewIfNeeded;
- (void)_stopManagingContentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setNeedsInitialLayout:(BOOL)a3;
@end

@implementation AVPlayerView

- (AVPlayerView)initWithFrame:(CGRect)a3 contentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerView;
  v11 = -[AVPlayerView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentView, a4);
    [(AVPresentationContainerView *)v12 setPresentationContainerContentView:v10];
    v12->_needsInitialLayout = 1;
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (void)setNeedsInitialLayout:(BOOL)a3
{
  self->_needsInitialLayout = a3;
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_stopManagingContentView
{
  contentView = self->_contentView;
  if (contentView && [(UIView *)contentView isDescendantOfView:self])
  {
    v4 = self->_contentView;
    [(UIView *)v4 removeFromSuperview];
  }
}

- (void)_beginManagingContentViewIfNeeded
{
  uint64_t v3 = [(AVPlayerView *)self contentView];
  if (v3)
  {
    id v12 = (id)v3;
    v4 = [(AVPlayerView *)self contentView];
    if ([v4 isDescendantOfView:self])
    {
    }
    else
    {
      BOOL v5 = [(AVPlayerView *)self needsInitialLayout];

      if (v5) {
        return;
      }
      v6 = [(AVPlayerView *)self contentView];
      v7 = [v6 superview];

      if (v7)
      {
        v8 = [(AVPlayerView *)self contentView];
        [v8 removeFromSuperview];
      }
      v9 = [(AVPlayerView *)self contentView];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:1];

      id v10 = [(AVPlayerView *)self contentView];
      [v10 setAutoresizingMask:18];

      v11 = [(AVPlayerView *)self contentView];
      [(AVPlayerView *)self bounds];
      objc_msgSend(v11, "setFrame:");

      id v12 = [(AVPlayerView *)self contentView];
      [(AVPlayerView *)self insertSubview:v12 atIndex:0];
    }
  }
}

- (void)layoutSubviews
{
  kdebug_trace();
  if ([(AVPlayerView *)self needsInitialLayout])
  {
    [(AVPlayerView *)self setNeedsInitialLayout:0];
    [(AVPlayerView *)self _beginManagingContentViewIfNeeded];
  }
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerView;
  [(AVPresentationContainerView *)&v3 layoutSubviews];
  kdebug_trace();
}

- (void)setContentView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  if (self->_contentView != v5)
  {
    [(AVPlayerView *)self _stopManagingContentView];
    objc_storeStrong((id *)&self->_contentView, a3);
  }
  [(AVPlayerView *)self _beginManagingContentViewIfNeeded];
}

@end