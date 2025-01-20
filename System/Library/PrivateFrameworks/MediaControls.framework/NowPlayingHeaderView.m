@interface NowPlayingHeaderView
- (_TtC13MediaControls20NowPlayingHeaderView)initWithCoder:(id)a3;
- (_TtC13MediaControls20NowPlayingHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingHeaderView

- (_TtC13MediaControls20NowPlayingHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC13MediaControls20NowPlayingHeaderView_viewModel;
  v9 = (objc_class *)type metadata accessor for NowPlayingHeaderView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  v8[64] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NowPlayingHeaderView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13MediaControls20NowPlayingHeaderView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC13MediaControls20NowPlayingHeaderView_viewModel;
  v6 = (objc_class *)type metadata accessor for NowPlayingHeaderView();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  v5[64] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(NowPlayingHeaderView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end