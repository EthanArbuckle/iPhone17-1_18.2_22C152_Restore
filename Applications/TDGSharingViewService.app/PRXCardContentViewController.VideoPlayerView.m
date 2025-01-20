@interface PRXCardContentViewController.VideoPlayerView
- (_TtCE21TDGSharingViewServiceCSo28PRXCardContentViewController15VideoPlayerView)initWithCoder:(id)a3;
- (_TtCE21TDGSharingViewServiceCSo28PRXCardContentViewController15VideoPlayerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PRXCardContentViewController.VideoPlayerView

- (void)layoutSubviews
{
  v2 = self;
  PRXCardContentViewController.VideoPlayerView.layoutSubviews()();
}

- (_TtCE21TDGSharingViewServiceCSo28PRXCardContentViewController15VideoPlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  return -[PRXCardContentViewController.VideoPlayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCE21TDGSharingViewServiceCSo28PRXCardContentViewController15VideoPlayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PRXCardContentViewController.VideoPlayerView();
  return [(PRXCardContentViewController.VideoPlayerView *)&v5 initWithCoder:a3];
}

@end