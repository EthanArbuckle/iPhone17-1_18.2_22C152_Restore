@interface DBOEMNotificationController
- (BOOL)isOEMPresentedNotification:(id)a3;
- (_TtC9DashBoard27DBOEMNotificationController)init;
- (_TtC9DashBoard27DBOEMNotificationController)initWithDisplayID:(id)a3 delegate:(id)a4 environment:(id)a5;
- (double)sideInsetsForActiveNotification;
- (void)didDismissNotification:(id)a3;
@end

@implementation DBOEMNotificationController

- (_TtC9DashBoard27DBOEMNotificationController)initWithDisplayID:(id)a3 delegate:(id)a4 environment:(id)a5
{
  uint64_t v7 = sub_22D85E4C8();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC9DashBoard27DBOEMNotificationController *)DBOEMNotificationController.init(displayID:delegate:environment:)(v7, v9, (uint64_t)a4, (uint64_t)a5);
}

- (double)sideInsetsForActiveNotification
{
  v2 = self;
  double v3 = DBOEMNotificationController.sideInsetsForActiveNotification()();

  return v3;
}

- (BOOL)isOEMPresentedNotification:(id)a3
{
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard27DBOEMNotificationController_activeNotification);
  if (v3 && (type metadata accessor for DBOEMNotificationViewController(0), swift_dynamicCastClass()))
  {
    swift_unknownObjectRetain();
    v5 = self;
    id v6 = v3;
    char v7 = sub_22D85E808();
    swift_unknownObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

- (void)didDismissNotification:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  DBOEMNotificationController.didDismiss(notification:)();
  swift_unknownObjectRelease();
}

- (_TtC9DashBoard27DBOEMNotificationController)init
{
  result = (_TtC9DashBoard27DBOEMNotificationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard27DBOEMNotificationController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9DashBoard27DBOEMNotificationController_activeNotification));
  swift_release();
}

@end