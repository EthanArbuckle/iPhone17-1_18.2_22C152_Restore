@interface MediaPlayerView
+ (Class)layerClass;
- (AVPlayer)player;
- (_TtC18SharingViewService15MediaPlayerView)initWithCoder:(id)a3;
- (_TtC18SharingViewService15MediaPlayerView)initWithFrame:(CGRect)a3;
- (void)setPlayer:(id)a3;
@end

@implementation MediaPlayerView

- (AVPlayer)player
{
  v2 = self;
  id v3 = [(MediaPlayerView *)v2 layer];
  self;
  id v4 = [(id)swift_dynamicCastObjCClassUnconditional() player];

  return (AVPlayer *)v4;
}

- (void)setPlayer:(id)a3
{
  id v6 = a3;
  id v4 = self;
  id v5 = [(MediaPlayerView *)v4 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setPlayer:v6];
}

+ (Class)layerClass
{
  sub_100017EF4(0, &qword_1001C8590);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18SharingViewService15MediaPlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC18SharingViewService15MediaPlayerView *)sub_10002CC58(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for MediaPlayerView);
}

- (_TtC18SharingViewService15MediaPlayerView)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService15MediaPlayerView *)sub_10002CCE4(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for MediaPlayerView);
}

@end