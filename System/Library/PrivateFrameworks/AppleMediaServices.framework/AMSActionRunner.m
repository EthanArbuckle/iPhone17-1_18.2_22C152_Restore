@interface AMSActionRunner
+ (BOOL)canHandle:(id)a3 context:(id)a4;
+ (id)handle:(id)a3 context:(id)a4;
+ (void)handle:(NSDictionary *)a3 context:(AMSActionContext *)a4 completionHandler:(id)a5;
- (AMSActionRunner)init;
@end

@implementation AMSActionRunner

+ (BOOL)canHandle:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_18DD4DDA0();
  swift_getObjCClassMetadata();
  id v6 = a4;
  LOBYTE(a4) = static ActionRunner.canHandle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return a4 & 1;
}

+ (void)handle:(NSDictionary *)a3 context:(AMSActionContext *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_18D677FD0((uint64_t)&unk_1E91BA268, (uint64_t)v9);
}

+ (id)handle:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_18DD4DDA0();
  swift_getObjCClassMetadata();
  id v6 = a4;
  id v7 = static ActionRunner.handle(_:context:)(v5, a4);
  swift_bridgeObjectRelease();

  return v7;
}

- (AMSActionRunner)init
{
  return (AMSActionRunner *)ActionRunner.init()();
}

@end