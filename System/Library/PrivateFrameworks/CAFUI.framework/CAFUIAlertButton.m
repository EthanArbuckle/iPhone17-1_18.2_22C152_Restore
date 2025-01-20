@interface CAFUIAlertButton
- (_TtC5CAFUI16CAFUIAlertButton)init;
- (_TtC5CAFUI16CAFUIAlertButton)initWithCoder:(id)a3;
- (_TtC5CAFUI16CAFUIAlertButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation CAFUIAlertButton

- (_TtC5CAFUI16CAFUIAlertButton)init
{
  return (_TtC5CAFUI16CAFUIAlertButton *)CAFUIAlertButton.init()();
}

- (_TtC5CAFUI16CAFUIAlertButton)initWithCoder:(id)a3
{
  result = (_TtC5CAFUI16CAFUIAlertButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFUIAlertButton.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);
}

- (_TtC5CAFUI16CAFUIAlertButton)initWithFrame:(CGRect)a3
{
  result = (_TtC5CAFUI16CAFUIAlertButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end