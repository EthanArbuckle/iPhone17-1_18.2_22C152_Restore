@interface AMSUIMessagingActionRunner
+ (BOOL)canRespondToDeeplink:(id)a3;
+ (BOOL)canRespondToIdentifier:(id)a3;
+ (id)performWithDeeplink:(id)a3 context:(id)a4 parameters:(id)a5;
+ (id)performWithIdentifier:(id)a3 context:(id)a4 parameters:(id)a5;
- (AMSUIMessagingActionRunner)init;
@end

@implementation AMSUIMessagingActionRunner

+ (BOOL)canRespondToDeeplink:(id)a3
{
  uint64_t v3 = sub_21C2BD740();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  swift_getObjCClassMetadata();
  char v7 = static ActionRunner.canRespondTo(deeplink:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (BOOL)canRespondToIdentifier:(id)a3
{
  uint64_t v3 = sub_21C2BF2C0();
  char v5 = static ActionRunner.canRespondTo(identifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (id)performWithDeeplink:(id)a3 context:(id)a4 parameters:(id)a5
{
  uint64_t v6 = sub_21C2BD740();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C2BD6F0();
  uint64_t v10 = sub_21C2BF220();
  swift_getObjCClassMetadata();
  id v11 = a4;
  id v12 = static ActionRunner.perform(deeplink:context:parameters:)((uint64_t)v9, (uint64_t)v11, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

+ (id)performWithIdentifier:(id)a3 context:(id)a4 parameters:(id)a5
{
  uint64_t v6 = sub_21C2BF2C0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_21C2BF220();
  swift_getObjCClassMetadata();
  id v10 = a4;
  id v11 = static ActionRunner.perform(identifier:context:parameters:)(v6, v8, (uint64_t)v10, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

- (AMSUIMessagingActionRunner)init
{
  return (AMSUIMessagingActionRunner *)ActionRunner.init()();
}

@end