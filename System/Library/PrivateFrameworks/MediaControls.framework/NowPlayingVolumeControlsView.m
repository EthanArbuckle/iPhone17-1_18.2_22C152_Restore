@interface NowPlayingVolumeControlsView
- (_TtC13MediaControls28NowPlayingVolumeControlsView)initWithCoder:(id)a3;
- (_TtC13MediaControls28NowPlayingVolumeControlsView)initWithFrame:(CGRect)a3;
@end

@implementation NowPlayingVolumeControlsView

- (_TtC13MediaControls28NowPlayingVolumeControlsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC13MediaControls28NowPlayingVolumeControlsView_viewModel;
  uint64_t v9 = type metadata accessor for NowPlayingVolumeControlsView.ViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NowPlayingVolumeControlsView(0);
  return -[NowPlayingVolumeControlsView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13MediaControls28NowPlayingVolumeControlsView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC13MediaControls28NowPlayingVolumeControlsView_viewModel;
  uint64_t v6 = type metadata accessor for NowPlayingVolumeControlsView.ViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingVolumeControlsView(0);
  return [(NowPlayingVolumeControlsView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end