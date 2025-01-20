@interface VideoPlayerView
+ (Class)layerClass;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC15JournalSettingsP33_DC842252687D111FA09317F78A27F39815VideoPlayerView)initWithCoder:(id)a3;
- (_TtC15JournalSettingsP33_DC842252687D111FA09317F78A27F39815VideoPlayerView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation VideoPlayerView

+ (Class)layerClass
{
  sub_C84C(0, &qword_19EC60);

  return (Class)swift_getObjCClassFromMetadata();
}

- (CGRect)bounds
{
  sub_82A28(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoPlayerView, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGRect)frame
{
  sub_82A28(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoPlayerView, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (_TtC15JournalSettingsP33_DC842252687D111FA09317F78A27F39815VideoPlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VideoPlayerView();
  return -[VideoPlayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC15JournalSettingsP33_DC842252687D111FA09317F78A27F39815VideoPlayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoPlayerView();
  return [(VideoPlayerView *)&v5 initWithCoder:a3];
}

@end