@interface TextButton
- (UIButton)button;
- (_TtC11Diagnostics10TextButton)initWithCoder:(id)a3;
- (_TtC11Diagnostics10TextButton)initWithFrame:(CGRect)a3;
- (void)buttonActionWithSender:(id)a3;
@end

@implementation TextButton

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics10TextButton_button));
}

- (_TtC11Diagnostics10TextButton)initWithCoder:(id)a3
{
  result = (_TtC11Diagnostics10TextButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)buttonActionWithSender:(id)a3
{
  v4 = *(void (**)(id))&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action + 24];
  id v5 = a3;
  v6 = self;
  v4(v5);
}

- (_TtC11Diagnostics10TextButton)initWithFrame:(CGRect)a3
{
  result = (_TtC11Diagnostics10TextButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action + 8];
  swift_release();

  swift_bridgeObjectRelease();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11Diagnostics10TextButton_button);
}

@end