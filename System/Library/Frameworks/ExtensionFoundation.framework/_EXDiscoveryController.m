@interface _EXDiscoveryController
+ (_EXDiscoveryController)sharedInstance;
- (_EXDiscoveryController)init;
- (void)observerDidObserveDatabaseChange:(id)a3;
@end

@implementation _EXDiscoveryController

- (_EXDiscoveryController)init
{
  return (_EXDiscoveryController *)sub_191F55788();
}

+ (_EXDiscoveryController)sharedInstance
{
  if (qword_1EB27BBA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB27C518;

  return (_EXDiscoveryController *)v2;
}

- (void)observerDidObserveDatabaseChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_191F82BBC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_191F35A6C((uint64_t)self + OBJC_IVAR____EXDiscoveryController_settingsStoreToken);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXDiscoveryController_queryQueue);
}

@end