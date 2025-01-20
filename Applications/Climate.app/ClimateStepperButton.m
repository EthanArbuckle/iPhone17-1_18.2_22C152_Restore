@interface ClimateStepperButton
- (_TtC7Climate20ClimateStepperButton)init;
@end

@implementation ClimateStepperButton

- (_TtC7Climate20ClimateStepperButton)init
{
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Climate20ClimateStepperButton_presentationStatesBlock);
  void *v3 = 0;
  v3[1] = 0;
  *(void *)&self->super.autoModeLabel[OBJC_IVAR____TtC7Climate20ClimateStepperButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateStepperButton();
  return [(ClimateButton *)&v5 init];
}

- (void).cxx_destruct
{
  sub_100005690(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Climate20ClimateStepperButton_presentationStatesBlock));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate20ClimateStepperButton_delegate;

  sub_100026DD0((uint64_t)v3);
}

@end