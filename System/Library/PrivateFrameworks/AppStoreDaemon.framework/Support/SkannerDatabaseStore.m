@interface SkannerDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9appstored20SkannerDatabaseStore)init;
- (_TtC9appstored20SkannerDatabaseStore)initWithDatabase:(id)a3;
@end

@implementation SkannerDatabaseStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  type metadata accessor for SkannerDatabaseSession();
  type metadata accessor for SkannerDatabaseTransaction();
  v2 = objc_allocWithZone((Class)SQLiteDatabaseStoreDescriptor);
  NSString v3 = String._bridgeToObjectiveC()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v6 = swift_getObjCClassFromMetadata();
  v7 = sub_1000088C8(v2, v3, isa, ObjCClassFromMetadata, v6);

  return (SQLiteDatabaseStoreDescriptor *)v7;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = ObjCClassMetadata;
  v10[4] = sub_100038FCC;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100038DB4;
  v10[3] = &unk_100511E68;
  uint64_t v6 = _Block_copy(v10);
  id v7 = a3;
  swift_release();
  char v8 = sub_100282DA0((uint64_t)v7, 16400, v6);
  _Block_release(v6);

  return v8;
}

- (_TtC9appstored20SkannerDatabaseStore)initWithDatabase:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SQLiteDatabaseStore *)&v5 initWithDatabase:a3];
}

- (_TtC9appstored20SkannerDatabaseStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SkannerDatabaseStore *)&v3 init];
}

@end