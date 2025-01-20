@interface HRHealthRecordsMigrator
- (HRHealthRecordsMigrator)init;
- (HRHealthRecordsMigrator)initWithHealthStore:(id)a3;
- (void)migrateIfNeededWithCompletion:(id)a3;
@end

@implementation HRHealthRecordsMigrator

- (HRHealthRecordsMigrator)initWithHealthStore:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = qword_1EBB6EF50;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1EBB719C8;
  id v8 = objc_allocWithZone(ObjectType);
  swift_retain();
  v9 = (HRHealthRecordsMigrator *)sub_1C24F8B38(v6, v7);

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1C24F8EC8((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (HRHealthRecordsMigrator)init
{
  result = (HRHealthRecordsMigrator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end