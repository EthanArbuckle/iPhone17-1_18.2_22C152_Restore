@interface DBLayoutControl
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (_TtC9DashBoard15DBLayoutControl)initWithCoder:(id)a3;
- (_TtC9DashBoard15DBLayoutControl)initWithFrame:(CGRect)a3;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)downButtonHandler;
- (void)homeButtonHandler;
- (void)leftButtonHandler;
- (void)rightButtonHandler;
- (void)selectButtonHandler;
- (void)selectButtonLongPressHandler;
- (void)upButtonHandler;
@end

@implementation DBLayoutControl

- (_TtC9DashBoard15DBLayoutControl)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9DashBoard15DBLayoutControl_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC9DashBoard15DBLayoutControl *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)homeButtonHandler
{
  v2 = self;
  sub_22D7C35DC();
}

- (void)selectButtonLongPressHandler
{
  v2 = self;
  sub_22D7C37A8();
}

- (void)selectButtonHandler
{
  v2 = self;
  sub_22D7C3974();
}

- (void)upButtonHandler
{
}

- (void)downButtonHandler
{
}

- (void)leftButtonHandler
{
}

- (void)rightButtonHandler
{
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  v4 = (_TtC9DashBoard15DBLayoutControl *)a3;
  id v5 = self;
  v6 = (_TtC9DashBoard15DBLayoutControl *)[(DBLayoutControl *)v4 previouslyFocusedView];
  if (v6)
  {
    v7 = v6;
    type metadata accessor for DBLayoutControl();
    BOOL v8 = swift_dynamicCastClass() != 0;

    v4 = v5;
    id v5 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22D7C3F9C(a3);
}

- (_TtC9DashBoard15DBLayoutControl)initWithFrame:(CGRect)a3
{
  result = (_TtC9DashBoard15DBLayoutControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end