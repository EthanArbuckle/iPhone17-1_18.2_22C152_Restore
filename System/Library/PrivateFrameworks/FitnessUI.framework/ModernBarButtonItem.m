@interface ModernBarButtonItem
- (_TtC9FitnessUI19ModernBarButtonItem)init;
- (_TtC9FitnessUI19ModernBarButtonItem)initWithCoder:(id)a3;
- (void)handleTappedButton;
@end

@implementation ModernBarButtonItem

- (_TtC9FitnessUI19ModernBarButtonItem)initWithCoder:(id)a3
{
  result = (_TtC9FitnessUI19ModernBarButtonItem *)sub_21E4D0EF0();
  __break(1u);
  return result;
}

- (void)handleTappedButton
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9FitnessUI19ModernBarButtonItem_callback);
  v3 = self;
  v2();
}

- (_TtC9FitnessUI19ModernBarButtonItem)init
{
  result = (_TtC9FitnessUI19ModernBarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end