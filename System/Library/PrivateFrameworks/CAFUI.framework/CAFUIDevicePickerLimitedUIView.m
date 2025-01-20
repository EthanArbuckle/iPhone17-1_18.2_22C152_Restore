@interface CAFUIDevicePickerLimitedUIView
- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithCoder:(id)a3;
- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithFrame:(CGRect)a3;
- (void)buttonPressed;
- (void)layoutSubviews;
@end

@implementation CAFUIDevicePickerLimitedUIView

- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_presentedAction);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_dismissAction);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_button;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)closure #1 in variable initialization expression of CAFUIDevicePickerLimitedUIView.button();
  uint64_t v8 = OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_label;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)closure #1 in variable initialization expression of CAFUIDevicePickerLimitedUIView.label();

  result = (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
}

- (void)buttonPressed
{
}

- (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView)initWithFrame:(CGRect)a3
{
  result = (_TtC5CAFUI30CAFUIDevicePickerLimitedUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_presentedAction));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_dismissAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_button));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5CAFUI30CAFUIDevicePickerLimitedUIView_label);
}

@end