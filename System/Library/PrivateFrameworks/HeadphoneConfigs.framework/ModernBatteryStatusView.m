@interface ModernBatteryStatusView
- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3;
- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5;
- (void)cleanUp;
- (void)startLisentingWithDevice:(id)a3;
@end

@implementation ModernBatteryStatusView

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners) = (Class)MEMORY[0x1E4FBC870];
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  id v11 = a4;
  v12 = -[HPSBatteryStatusView initWithFrame:device:darkMode:](&v15, sel_initWithFrame_device_darkMode_, v11, v5, x, y, width, height);
  id v13 = objc_msgSend(v11, sel_headphoneDevice, v15.receiver, v15.super_class);
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v12->super.super.super.super.isa) + 0x78))();

  return v12;
}

- (void)startLisentingWithDevice:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E4C84D58(a3);
}

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners) = (Class)MEMORY[0x1E4FBC870];
  id v4 = a3;

  result = (_TtC16HeadphoneConfigs23ModernBatteryStatusView *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (void)cleanUp
{
  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners);
  swift_beginAccess();
  void *v2 = MEMORY[0x1E4FBC870];
  swift_bridgeObjectRelease();
}

- (_TtC16HeadphoneConfigs23ModernBatteryStatusView)initWithFrame:(CGRect)a3
{
  result = (_TtC16HeadphoneConfigs23ModernBatteryStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end