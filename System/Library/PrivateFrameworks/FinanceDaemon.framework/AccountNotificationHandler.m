@interface AccountNotificationHandler
+ (id)makeHandler;
- (_TtC13FinanceDaemon26AccountNotificationHandler)init;
- (void)primaryAppleAccountWasAdded;
- (void)primaryAppleAccountWasDeleted;
@end

@implementation AccountNotificationHandler

+ (id)makeHandler
{
  id v2 = sub_1D72484B0();
  return v2;
}

- (void)primaryAppleAccountWasAdded
{
  id v2 = self;
  sub_1D724806C();
}

- (void)primaryAppleAccountWasDeleted
{
  id v2 = self;
  sub_1D72480C0();
}

- (_TtC13FinanceDaemon26AccountNotificationHandler)init
{
  result = (_TtC13FinanceDaemon26AccountNotificationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon26AccountNotificationHandler_userIdentifierProvider;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end