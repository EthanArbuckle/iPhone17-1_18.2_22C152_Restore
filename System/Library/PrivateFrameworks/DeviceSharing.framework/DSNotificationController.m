@interface DSNotificationController
- (DSNotificationController)init;
- (void)cancelNotificationIfNecessary;
@end

@implementation DSNotificationController

- (DSNotificationController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DSNotificationController_activeNotification) = 0;
  *(void *)&self->activeNotification[OBJC_IVAR___DSNotificationController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NotificationController();
  return [(DSNotificationController *)&v4 init];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___DSNotificationController_delegate;
  sub_24CC8C3A8((uint64_t)v3);
}

- (void)cancelNotificationIfNecessary
{
  v2 = self;
  NotificationController.cancelNotificationIfNecessary()();
}

@end