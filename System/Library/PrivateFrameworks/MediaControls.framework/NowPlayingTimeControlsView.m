@interface NowPlayingTimeControlsView
- (_TtC13MediaControls26NowPlayingTimeControlsView)initWithCoder:(id)a3;
- (_TtC13MediaControls26NowPlayingTimeControlsView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingTimeControlsView

- (_TtC13MediaControls26NowPlayingTimeControlsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC13MediaControls26NowPlayingTimeControlsView_viewModel;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)v7 = 0;
  v7[24] = -1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NowPlayingTimeControlsView();
  return -[NowPlayingTimeControlsView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13MediaControls26NowPlayingTimeControlsView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC13MediaControls26NowPlayingTimeControlsView_viewModel;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)v4 = 0;
  v4[24] = -1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingTimeControlsView();
  return [(NowPlayingTimeControlsView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end