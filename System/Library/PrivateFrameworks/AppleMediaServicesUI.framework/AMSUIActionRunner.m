@interface AMSUIActionRunner
+ (BOOL)canHandle:(id)a3 context:(id)a4;
+ (id)handle:(id)a3 context:(id)a4;
+ (void)handle:(NSDictionary *)a3 context:(AMSUIActionContext *)a4 completionHandler:(id)a5;
- (AMSUIActionRunner)init;
@end

@implementation AMSUIActionRunner

+ (BOOL)canHandle:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_21C2BF220();
  swift_getObjCClassMetadata();
  id v6 = a4;
  LOBYTE(a4) = static UIActionRunner.canHandle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return a4 & 1;
}

+ (void)handle:(NSDictionary *)a3 context:(AMSUIActionContext *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_21C2AE4CC((uint64_t)&unk_267C7B480, (uint64_t)v9);
}

+ (id)handle:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_21C2BF220();
  swift_getObjCClassMetadata();
  id v6 = a4;
  v7 = (void *)static UIActionRunner.handle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return v7;
}

- (AMSUIActionRunner)init
{
  return (AMSUIActionRunner *)UIActionRunner.init()();
}

@end