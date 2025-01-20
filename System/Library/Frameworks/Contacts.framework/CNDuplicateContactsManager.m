@interface CNDuplicateContactsManager
+ (BOOL)applyMergeResultToSaveRequest:(id)a3 signatures:(id)a4;
+ (void)duplicatesCountsWithCompletionHandler:(id)a3;
+ (void)refreshManagedDuplicatesWithCompletionHandler:(id)a3;
+ (void)updateRecentImagesDatabaseForSignatures:(id)a3;
+ (void)updateRecentPostersDatabaseForSignatures:(id)a3;
- (BOOL)applyMergeResultToSaveRequest:(id)a3;
- (CNDuplicateContactsManager)init;
- (CNDuplicateContactsManager)initWithContactStore:(id)a3;
- (NSArray)duplicates;
@end

@implementation CNDuplicateContactsManager

- (NSArray)duplicates
{
  v2 = self;
  sub_190B64F6C();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3D40);
  v3 = (void *)sub_190B772B8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (CNDuplicateContactsManager)initWithContactStore:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_contacts) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_findResult) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_mergeResult);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_didPerformMerge) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_contactStore) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DuplicateContactsManager();
  id v5 = a3;
  return [(CNDuplicateContactsManager *)&v7 init];
}

+ (void)duplicatesCountsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v5 - 8);
  objc_super v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E92A6160;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E92A6170;
  v12[5] = v11;
  sub_190B673B8((uint64_t)v7, (uint64_t)&unk_1E92A6180, (uint64_t)v12);
  swift_release();
}

- (BOOL)applyMergeResultToSaveRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_190B66314(v4);

  return self & 1;
}

+ (BOOL)applyMergeResultToSaveRequest:(id)a3 signatures:(id)a4
{
  uint64_t v5 = sub_190B772C8();
  id v6 = a3;
  char v7 = _s8Contacts09DuplicateA7ManagerC29applyMergeResultToSaveRequest_10signaturesSbSo06CNSaveI0C_SaySSGtFZ_0(v6, v5);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

+ (void)refreshManagedDuplicatesWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_190B6C0D4(ObjCClassMetadata, (void (**)(void, void))v3);

  _Block_release(v3);
}

+ (void)updateRecentImagesDatabaseForSignatures:(id)a3
{
}

+ (void)updateRecentPostersDatabaseForSignatures:(id)a3
{
}

- (CNDuplicateContactsManager)init
{
  result = (CNDuplicateContactsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_mergeResult);

  sub_190B6502C(v3);
}

@end