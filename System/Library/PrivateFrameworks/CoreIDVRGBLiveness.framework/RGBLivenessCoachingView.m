@interface RGBLivenessCoachingView
- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithFrame:(CGRect)a3;
- (void)didFinishVideoPlayBack;
@end

@implementation RGBLivenessCoachingView

- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_completion);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_shouldLoop) = 0;
  id v5 = a3;

  result = (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *)sub_21EE9B338();
  __break(1u);
  return result;
}

- (void)didFinishVideoPlayBack
{
  v2 = self;
  sub_21EE4F740();
}

- (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView)initWithFrame:(CGRect)a3
{
  result = (_TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_playerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_player));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18CoreIDVRGBLiveness23RGBLivenessCoachingView_completion);

  sub_21EDFBD10(v3);
}

@end