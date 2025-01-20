@interface MRUNowPlayingCellContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUArtworkView)artworkView;
- (MRUNowPlayingCellContentView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingHeaderView)headerView;
- (MRUVisualStylingProvider)stylingProvider;
- (double)contentScale;
- (double)textInset;
- (void)layoutSubviews;
- (void)setContentScale:(double)a3;
- (void)setStylingProvider:(id)a3;
@end

@implementation MRUNowPlayingCellContentView

- (MRUNowPlayingCellContentView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingCellContentView;
  v3 = -[MRUNowPlayingCellContentView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MRUArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v4;

    [(MRUArtworkView *)v3->_artworkView setUserInteractionEnabled:0];
    [(MRUNowPlayingCellContentView *)v3 addSubview:v3->_artworkView];
    v6 = objc_alloc_init(MRUNowPlayingHeaderView);
    headerView = v3->_headerView;
    v3->_headerView = v6;

    v8 = [(MRUNowPlayingHeaderView *)v3->_headerView labelView];
    [v8 setEnabled:0];

    v9 = [(MRUNowPlayingHeaderView *)v3->_headerView labelView];
    [v9 setShowRoute:1];

    v10 = [(MRUNowPlayingHeaderView *)v3->_headerView labelView];
    [v10 setShowSubtitle:0];

    [(MRUNowPlayingCellContentView *)v3 addSubview:v3->_headerView];
    v3->_contentScale = 1.0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MRUNowPlayingCellContentView;
  [(MRUNowPlayingCellContentView *)&v13 layoutSubviews];
  [(MRUNowPlayingCellContentView *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double v7 = CGRectGetWidth(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v15);
  if (v7 >= v8) {
    double v7 = v8;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v17);
  if (v9 >= v10) {
    double v9 = v10;
  }
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v19);
  [(MRUNowPlayingCellContentView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:");
  v20.origin.CGFloat x = MinX;
  v20.origin.CGFloat y = MinY;
  v20.size.CGFloat width = v7;
  v20.size.CGFloat height = v9;
  CGRectGetWidth(v20);
  UIRectInset();
  [(MRUNowPlayingCellContentView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUNowPlayingHeaderView setFrame:](self->_headerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[MRUNowPlayingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, a3.height);
  if (v4 <= 60.0) {
    double v4 = 60.0;
  }
  double v5 = width;
  result.CGFloat height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUArtworkView *)self->_artworkView setStylingProvider:v5];
    [(MRUNowPlayingHeaderView *)self->_headerView setStylingProvider:v5];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    double v5 = [(MRUNowPlayingCellContentView *)self headerView];
    [v5 setContentScale:a3];

    id v6 = [(MRUNowPlayingCellContentView *)self artworkView];
    [v6 setContentScale:a3];
  }
}

- (double)textInset
{
  return 60.0 + 10.0;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (MRUNowPlayingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end