@interface FLDPGBatchFactory
+ (BOOL)allowDPGBundleID:(id)a3;
+ (BOOL)isDPGBundleID:(id)a3;
+ (id)makeBatchWithPayload:(id)a3 bundleID:(id)a4 schema:(id)a5;
- (FLDPGBatchFactory)init;
@end

@implementation FLDPGBatchFactory

+ (id)makeBatchWithPayload:(id)a3 bundleID:(id)a4 schema:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_1BA2D98E8();
  unint64_t v12 = v11;

  uint64_t v13 = sub_1BA2D9C18();
  uint64_t v15 = v14;

  uint64_t v16 = sub_1BA2D9C18();
  uint64_t v18 = v17;

  id v19 = sub_1BA2BE580(v10, v12, v13, v15, v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA2BD220(v10, v12);
  return v19;
}

+ (BOOL)isDPGBundleID:(id)a3
{
  sub_1BA2D9C18();
  char v3 = sub_1BA2BEBD0();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

+ (BOOL)allowDPGBundleID:(id)a3
{
  uint64_t v3 = sub_1BA2D9C18();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  char v6 = sub_1BA2BEC38(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (FLDPGBatchFactory)init
{
  return (FLDPGBatchFactory *)FLDPGBatchFactory.init()();
}

@end