@interface DeviceManagedAppContextProvider
- (_TtC7parsecd31DeviceManagedAppContextProvider)init;
- (void)onAppDistUpdateWithNotification:(id)a3;
@end

@implementation DeviceManagedAppContextProvider

- (_TtC7parsecd31DeviceManagedAppContextProvider)init
{
  return (_TtC7parsecd31DeviceManagedAppContextProvider *)sub_1000431F8();
}

- (void)onAppDistUpdateWithNotification:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100043494();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7parsecd31DeviceManagedAppContextProvider_assembly;

  sub_10001CDE0((uint64_t)v3);
}

@end