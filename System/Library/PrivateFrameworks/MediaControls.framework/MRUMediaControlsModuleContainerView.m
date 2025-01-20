@interface MRUMediaControlsModuleContainerView
- (CCUIModuleContentMetrics)contentMetrics;
- (MRUMediaControlsModuleContainerView)initWithFrame:(CGRect)a3;
- (MRUMediaControlsModuleNowPlayingView)nowPlayingView;
- (MRUMediaControlsModuleRoutingView)routingView;
- (MRUVisualStylingProvider)stylingProvider;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)setContentMetrics:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setNowPlayingView:(id)a3;
- (void)setStylingProvider:(id)a3;
@end

@implementation MRUMediaControlsModuleContainerView

- (MRUMediaControlsModuleContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MRUMediaControlsModuleContainerView;
  v3 = -[MRUMediaControlsModuleContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MRUMediaControlsModuleContainerView *)v3 setClipsToBounds:1];
    v5 = objc_alloc_init(MRUMediaControlsModuleRoutingView);
    routingView = v4->_routingView;
    v4->_routingView = v5;

    [(MRUMediaControlsModuleContainerView *)v4 addSubview:v4->_routingView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)MRUMediaControlsModuleContainerView;
  [(MRUMediaControlsModuleContainerView *)&v36 layoutSubviews];
  uint64_t v3 = [(MRUMediaControlsModuleContainerView *)self bounds];
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  switch(self->_layout)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v4, v5, v6, v7);
      v37.origin.x = v8;
      v37.origin.y = v9;
      v37.size.width = v10;
      v37.size.height = v11;
      double MinX = CGRectGetMinX(v37);
      v38.origin.x = v8;
      v38.origin.y = v9;
      v38.size.width = v10;
      v38.size.height = v11;
      double MaxY = CGRectGetMaxY(v38);
      v39.origin.x = v8;
      v39.origin.y = v9;
      v39.size.width = v10;
      v39.size.height = v11;
      double Width = CGRectGetWidth(v39);
      routingView = self->_routingView;
      double Height = 0.0;
      goto LABEL_4;
    case 2:
    case 7:
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v4, v5, v6, v7);
      v40.origin.x = v8;
      v40.origin.y = v9;
      v40.size.width = v10;
      v40.size.height = v11;
      double MinX = CGRectGetMaxX(v40);
      v41.origin.x = v8;
      v41.origin.y = v9;
      v41.size.width = v10;
      v41.size.height = v11;
      double MaxY = CGRectGetMinY(v41);
      v42.origin.x = v8;
      v42.origin.y = v9;
      v42.size.width = v10;
      v42.size.height = v11;
      double Height = CGRectGetHeight(v42);
      routingView = self->_routingView;
      double Width = 0.0;
LABEL_4:
      -[MRUMediaControlsModuleRoutingView setFrame:](routingView, "setFrame:", MinX, MaxY, Width, Height);
      return;
    case 8:
      -[MRUMediaControlsModuleNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v6, v7);
      double v27 = v26;
      double v29 = v28;
      v47.origin.x = v8;
      v47.origin.y = v9;
      v47.size.width = v10;
      v47.size.height = v11;
      double v30 = CGRectGetMinX(v47);
      v48.origin.x = v8;
      v48.origin.y = v9;
      v48.size.width = v10;
      v48.size.height = v11;
      double MinY = CGRectGetMinY(v48);
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v30, MinY, v27, v29);
      v49.origin.x = v30;
      v49.origin.y = MinY;
      v49.size.width = v27;
      v49.size.height = v29;
      CGRectGetHeight(v49);
      goto LABEL_7;
    case 9:
      double v17 = MEMORY[0x1B3E725A0](v3);
      CCUILayoutGutter();
      double v19 = v17 + v18;
      double v20 = (double)CCUINumberOfColumnsForGridSizeClass();
      CCUILayoutGutter();
      CGFloat v22 = -(v21 - v19 * v20);
      v43.origin.x = v8;
      v43.origin.y = v9;
      v43.size.width = v10;
      v43.size.height = v11;
      double v23 = CGRectGetHeight(v43);
      v44.origin.x = v8;
      v44.origin.y = v9;
      v44.size.width = v10;
      v44.size.height = v11;
      double v24 = CGRectGetMinX(v44);
      v45.origin.x = v8;
      v45.origin.y = v9;
      v45.size.width = v10;
      v45.size.height = v11;
      double v25 = CGRectGetMinY(v45);
      -[MRUMediaControlsModuleNowPlayingView setFrame:](self->_nowPlayingView, "setFrame:", v24, v25, v22, v23);
      v46.origin.x = v24;
      v46.origin.y = v25;
      v46.size.width = v22;
      v46.size.height = v23;
      CGRectGetWidth(v46);
LABEL_7:
      UIRectInset();
      double v33 = v32;
      double v35 = v34;
      -[MRUMediaControlsModuleRoutingView setFrame:](self->_routingView, "setFrame:");
      -[MRUMediaControlsModuleRoutingView setContentSize:](self->_routingView, "setContentSize:", v33, v35);
      break;
    default:
      return;
  }
}

- (void)setNowPlayingView:(id)a3
{
  double v5 = (MRUMediaControlsModuleNowPlayingView *)a3;
  nowPlayingView = self->_nowPlayingView;
  double v7 = v5;
  if (nowPlayingView != v5)
  {
    [(MRUMediaControlsModuleNowPlayingView *)nowPlayingView removeFromSuperview];
    objc_storeStrong((id *)&self->_nowPlayingView, a3);
    [(MRUMediaControlsModuleNowPlayingView *)v7 setContentMetrics:self->_contentMetrics];
    [(MRUMediaControlsModuleContainerView *)self addSubview:v7];
    [(MRUMediaControlsModuleContainerView *)self setNeedsLayout];
  }
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUMediaControlsModuleRoutingView *)self->_routingView setStylingProvider:v5];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUMediaControlsModuleContainerView *)self setNeedsLayout];
  }
}

- (void)setContentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  id v5 = a3;
  [(MRUMediaControlsModuleNowPlayingView *)self->_nowPlayingView setContentMetrics:v5];
}

- (MRUMediaControlsModuleNowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (MRUMediaControlsModuleRoutingView)routingView
{
  return self->_routingView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_routingView, 0);

  objc_storeStrong((id *)&self->_nowPlayingView, 0);
}

@end