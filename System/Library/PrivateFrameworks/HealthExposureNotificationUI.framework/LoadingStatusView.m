@interface LoadingStatusView
- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithFrame:(CGRect)a3;
@end

@implementation LoadingStatusView

- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView;
  id v6 = objc_allocWithZone(MEMORY[0x263F823E8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 101);
  uint64_t v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_statusLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);

  result = (_TtC28HealthExposureNotificationUI17LoadingStatusView *)sub_2294195F8();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithFrame:(CGRect)a3
{
  result = (_TtC28HealthExposureNotificationUI17LoadingStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_statusLabel);
}

@end