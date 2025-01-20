@interface SKANInteropProviderService
+ (NSString)entitlement;
+ (_TtC9appstored26SKANInteropProviderService)defaultService;
- (_TtC9appstored26SKANInteropProviderService)init;
- (void)getImpressionsForApp:(id)a3 completionHandler:(id)a4;
- (void)storePostbacks:(id)a3 completionHandler:(id)a4;
- (void)storeSkannerEvents:(id)a3 advertisedItemID:(id)a4 completionHandler:(id)a5;
@end

@implementation SKANInteropProviderService

+ (_TtC9appstored26SKANInteropProviderService)defaultService
{
  if (qword_1005A2FB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1458;
  return (_TtC9appstored26SKANInteropProviderService *)v2;
}

+ (NSString)entitlement
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

- (void)getImpressionsForApp:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v7 = sub_100034BD0;
  }
  else
  {
    v7 = 0;
  }
  self;
  id v8 = a3;
  v14 = self;
  id v9 = sub_1003C44E0();
  id v10 = sub_1003C84A0((uint64_t)v9, v8);

  if (v10)
  {
    uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;

    if (v6)
    {
LABEL_6:
      v7(v11, v13);
      sub_100034BBC(v11, v13);
      sub_100018DD4((uint64_t)v7);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0xF000000000000000;
    if (v6) {
      goto LABEL_6;
    }
  }
  sub_100034BBC(v11, v13);
LABEL_9:
}

- (void)storeSkannerEvents:(id)a3 advertisedItemID:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v15 = a4;
  id v10 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v14 = sub_100034BB4;
  }
  else
  {
    v14 = 0;
  }
  if (qword_1005A2FD0 != -1) {
    swift_once();
  }
  sub_10003BF60(v11, v13, (uint64_t)[v15 longLongValue]);
  if (v8)
  {
    v14();
    sub_100018DD4((uint64_t)v14);
  }
  sub_10001EC80(v11, v13);
}

- (void)storePostbacks:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  id v15 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v11 = sub_100034BAC;
  }
  else
  {
    uint64_t v11 = 0;
  }
  self;
  id v12 = sub_1003C44E0();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v14 = sub_1003C8844((uint64_t)v12, isa);

  if (v6)
  {
    v11((uint64_t)v14);

    sub_100018DD4((uint64_t)v11);
  }
  else
  {
  }
  sub_10001EC80(v8, v10);
}

- (_TtC9appstored26SKANInteropProviderService)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SKANInteropProviderService *)&v3 init];
}

@end