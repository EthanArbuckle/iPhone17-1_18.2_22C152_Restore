@interface AMSTokenStorage
- (AMSTokenStorage)init;
- (id)loadWithName:(id)a3;
- (void)save:(NSDictionary *)a3 name:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation AMSTokenStorage

- (void)save:(NSDictionary *)a3 name:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100021964((uint64_t)&unk_1002350D8, (uint64_t)v9);
}

- (id)loadWithName:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  v5 = (void *)sub_1001B94C4();

  swift_bridgeObjectRelease();
  return v5;
}

- (AMSTokenStorage)init
{
  return (AMSTokenStorage *)TokenStorage.init()();
}

@end