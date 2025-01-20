@interface MessageWithSeparatedActionTileView
- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithFrame:(CGRect)a3;
- (void)didTapAction:(id)a3;
@end

@implementation MessageWithSeparatedActionTileView

- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView *)sub_1AD4521F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD453260();
}

- (void)didTapAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD452C08();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_actionButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_didTapActionButton);
  sub_1AD1E4514(v3);
}

@end