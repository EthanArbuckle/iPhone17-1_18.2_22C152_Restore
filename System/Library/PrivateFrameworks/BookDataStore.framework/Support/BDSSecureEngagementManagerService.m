@interface BDSSecureEngagementManagerService
+ (void)deleteCloudDataWithCompletion:(id)a3;
- (BDSSecureEngagementManagerService)init;
- (BDSSecureEngagementManagerService)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4;
- (id)entityName;
- (void)currentCloudSyncVersions:(id)a3;
- (void)dealloc;
- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4;
- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3;
- (void)engagementDataForKey:(id)a3 completion:(id)a4;
- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5;
- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4;
- (void)hasSaltChangedWithCompletion:(id)a3;
- (void)setEngagementData:(id)a3 completion:(id)a4;
- (void)setEngagementDatas:(id)a3 completion:(id)a4;
- (void)signalSyncToCKForSyncManager:(id)a3;
- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5;
- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4;
- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5;
@end

@implementation BDSSecureEngagementManagerService

- (BDSSecureEngagementManagerService)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  return (BDSSecureEngagementManagerService *)sub_1000C2AE4(a3, a4);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_cloudKitController);
  v3 = self;
  id v4 = [v2 privateCloudDatabaseController];
  uint64_t v5 = OBJC_IVAR___BDSSecureEngagementManagerService_syncManager;
  [v4 removeObserver:*(Class *)((char *)&v3->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_syncManager)];

  [*(id *)((char *)&v3->super.isa + v5) setDelegate:0];
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for CloudSecureEngagementManagerService();
  [(BDSSecureEngagementManagerService *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)currentCloudSyncVersions:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  objc_super v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
  v9[4] = sub_1000C6624;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000C30C0;
  v9[3] = &unk_100264FA8;
  v7 = _Block_copy(v9);
  v8 = self;
  swift_retain();
  swift_release();
  [v6 currentCloudSyncVersions:v7];
  _Block_release(v7);

  swift_release();
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  objc_super v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1000C6638;
  *(void *)(v7 + 24) = v5;
  v10[4] = sub_1000C671C;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1001AE0C0;
  v10[3] = &unk_100264F58;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  [v6 hasSaltChangedWithCompletion:v8];
  _Block_release(v8);

  swift_release();
}

- (void)setEngagementData:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1000C3378(a3, (uint64_t)sub_1000C6724, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)setEngagementDatas:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_10007DC14((uint64_t *)&unk_100295C40);
  uint64_t v6 = sub_1001EC260();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_1000C372C(v6, (uint64_t)sub_1000C661C, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)engagementDataForKey:(id)a3 completion:(id)a4
{
}

- (void)engagementDataIncludingDeleted:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1001EC370();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_1000C3CBC(a3, v8, v10, (uint64_t)sub_1000C6614, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchEngagementDatasIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1000C6604;
  *(void *)(v9 + 24) = v7;
  v12[4] = sub_1000C660C;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1000C4268;
  v12[3] = &unk_100264E40;
  uint64_t v10 = _Block_copy(v12);
  uint64_t v11 = self;
  swift_retain();
  swift_release();
  [v8 fetchCloudDataIncludingDeleted:v4 completion:v10];
  _Block_release(v10);

  swift_release();
}

- (void)getEngagementDataChangesSince:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
  sub_100081668(0, &qword_1002926E8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1000C6534;
  *(void *)(v10 + 24) = v7;
  v14[4] = sub_1000C6574;
  v14[5] = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1000C450C;
  v14[3] = &unk_100264DC8;
  uint64_t v11 = _Block_copy(v14);
  id v12 = a3;
  v13 = self;
  swift_retain();
  swift_release();
  [v8 getChangesSince:v12 forEntityClass:ObjCClassFromMetadata completion:v11];
  _Block_release(v11);

  swift_release();
}

- (BDSSecureEngagementManagerService)init
{
  result = (BDSSecureEngagementManagerService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
    uint64_t v8 = sub_1000C6638;
    v12[4] = sub_1000C6638;
    v12[5] = v6;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_1001AE1A8;
    v12[3] = &unk_100264C10;
    uint64_t v9 = _Block_copy(v12);
    uint64_t v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSSecureEngagementManagerService_dataManager);
    uint64_t v11 = self;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  [v7 dissociateCloudDataFromSyncWithCompletion:v9];
  _Block_release(v9);
  sub_1000B0100((uint64_t)v8);
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  v3 = (uint64_t (*)())_Block_copy(a3);
  if (v3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    v3 = sub_1000C6638;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_1000C5344((uint64_t)v3, v4);
  sub_1000B0100((uint64_t)v3);
}

- (id)entityName
{
  sub_100081668(0, &qword_1002926E8);
  sub_10007DC14(&qword_1002926F0);
  sub_1001EC3D0();
  NSString v2 = sub_1001EC340();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_1000C54CC((uint64_t)v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000C563C();
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  sub_10007DC14(&qword_100292708);
  unint64_t v8 = sub_1001EC5E0();
  _Block_copy(v7);
  id v9 = a3;
  uint64_t v10 = self;
  sub_1000C5C04(v8, (uint64_t)v10, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
}

- (void)deleteEngagementDataForKey:(id)a3 completion:(id)a4
{
}

@end