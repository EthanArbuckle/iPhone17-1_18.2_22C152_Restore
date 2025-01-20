@interface FMFindingDebugSlider
- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithCoder:(id)a3;
- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithFrame:(CGRect)a3;
- (void)handleValueChangedWithSender:(id)a3;
@end

@implementation FMFindingDebugSlider

- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D379C10();
}

- (void)handleValueChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D3797F8();
}

- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI20FMFindingDebugSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_stepper));
  swift_bridgeObjectRelease();
}

@end