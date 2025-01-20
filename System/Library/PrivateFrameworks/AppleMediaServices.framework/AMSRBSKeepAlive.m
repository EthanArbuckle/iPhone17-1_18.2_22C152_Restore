@interface AMSRBSKeepAlive
+ (id)keepAliveWithName:(id)a3;
+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4;
+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5;
+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7;
- (AMSRBSKeepAlive)init;
- (NSString)name;
- (int64_t)style;
- (void)invalidate;
@end

@implementation AMSRBSKeepAlive

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_18DD4DEB0();
  v13[2] = v10;
  sub_18D680618(v11, v12, a4, v8, a6, (void (*)(uint64_t))sub_18D6D82E8, (uint64_t)v13);
  _Block_release(v10);
  swift_bridgeObjectRelease();
}

+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4
{
  uint64_t v5 = sub_18DD4DEB0();
  uint64_t v7 = v6;
  swift_getObjCClassMetadata();
  id v8 = sub_18D682DC8(v5, v7, a4);
  swift_bridgeObjectRelease();
  return v8;
}

- (void)invalidate
{
  v2 = self;
  sub_18D682F58();
}

- (NSString)name
{
  sub_18D7C7618();
  v2 = (void *)sub_18DD4DE80();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)style
{
  return sub_18D7C7678();
}

+ (id)keepAliveWithName:(id)a3
{
  uint64_t v3 = sub_18DD4DEB0();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  id v6 = sub_18D7C7688(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
  id v6 = _Block_copy(a5);
  uint64_t v7 = sub_18DD4DEB0();
  v9[2] = v6;
  sub_18D7C774C(v7, v8, a4, (void (*)(uint64_t))sub_18D6DA260, (uint64_t)v9);
  _Block_release(v6);
  swift_bridgeObjectRelease();
}

- (AMSRBSKeepAlive)init
{
}

@end