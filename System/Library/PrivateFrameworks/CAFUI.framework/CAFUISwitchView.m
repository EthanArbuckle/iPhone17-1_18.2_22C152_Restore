@interface CAFUISwitchView
- (void)switchChangedWithSender:(id)a3;
@end

@implementation CAFUISwitchView

- (void)switchChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_isOn);
  v7 = *(void (**)(id))((char *)&v5->super.super.super.super.isa
                                 + OBJC_IVAR____TtC5CAFUI15CAFUISwitchView_handler);
  swift_retain();
  v7(v6);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI15CAFUISwitchView_uiSwitch);
}

@end