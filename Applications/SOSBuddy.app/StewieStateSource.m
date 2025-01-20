@interface StewieStateSource
- (_TtC8SOSBuddy17StewieStateSource)init;
- (void)dealloc;
@end

@implementation StewieStateSource

- (_TtC8SOSBuddy17StewieStateSource)init
{
  return (_TtC8SOSBuddy17StewieStateSource *)sub_10001ECDC();
}

- (void)dealloc
{
  v2 = self;
  sub_10001EF4C();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17StewieStateSource__agent);
}

@end