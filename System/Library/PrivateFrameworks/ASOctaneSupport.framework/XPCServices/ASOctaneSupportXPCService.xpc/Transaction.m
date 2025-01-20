@interface Transaction
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (_TtC25ASOctaneSupportXPCService11Transaction)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (id)copyWithZone:(void *)a3;
@end

@implementation Transaction

+ (Class)databaseEntityClass
{
  sub_1000D9164();
  return (Class)swift_getObjCClassFromMetadata();
}

+ (id)defaultProperties
{
  sub_1000D9194();
  v2.super.isa = sub_10024EA80().super.isa;
  swift_bridgeObjectRelease();
  return v2.super.isa;
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_1000DAB88((uint64_t)a3, v7);

  sub_10001C2A8(v7, v7[3]);
  v5 = (void *)sub_10024FA50();
  sub_10001C2EC((uint64_t)v7);
  return v5;
}

- (_TtC25ASOctaneSupportXPCService11Transaction)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  return (_TtC25ASOctaneSupportXPCService11Transaction *)sub_1000DAC98();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end