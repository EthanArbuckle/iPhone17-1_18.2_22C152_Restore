@interface VerticallyCenteredContentScrollView
- (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VerticallyCenteredContentScrollView

- (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView *)sub_1AD3A5F04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView_centeredConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView_scrollingConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView_sharedConstraints) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI35VerticallyCenteredContentScrollView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD3A6348();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView__internalContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35VerticallyCenteredContentScrollView_contentView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end