@interface BDSCloudSyncDiagnosticService
- (BDSCloudSyncDiagnosticService)init;
- (BDSCloudSyncDiagnosticService)initWithCloudKitController:(id)a3 entityServiceProviders:(id)a4;
- (id)clearSyncMetadata;
- (id)stateForLog;
- (void)detachWithCompletionHandler:(id)a3;
- (void)diagnosticInfoWithCompletionHandler:(id)a3;
- (void)fetchRemoteChangesWithCompletionHandler:(id)a3;
- (void)findLocalIdDupesWithCompletionHandler:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticService

- (BDSCloudSyncDiagnosticService)initWithCloudKitController:(id)a3 entityServiceProviders:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_10007DC14((uint64_t *)&unk_1002942F0);
  uint64_t v7 = sub_1001EC5E0();
  v8 = (objc_class *)a3;
  v9 = self;
  sub_1001EB550();
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR___BDSCloudSyncDiagnosticService_cloudKitController) = v8;
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR___BDSCloudSyncDiagnosticService_entityServiceProviders) = (Class)v7;
  v10 = v8;

  v13.receiver = v9;
  v13.super_class = ObjectType;
  v11 = [(BDSCloudSyncDiagnosticService *)&v13 init];

  return v11;
}

- (void)detachWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002942D8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002942E0;
  v12[5] = v11;
  objc_super v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293BC8, (uint64_t)v12);
  swift_release();
}

- (void)diagnosticInfoWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002942B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002942C0;
  v12[5] = v11;
  objc_super v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_1002942C8, (uint64_t)v12);
  swift_release();
}

- (void)findLocalIdDupesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100294298;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002942A0;
  v12[5] = v11;
  objc_super v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_1002942A8, (uint64_t)v12);
  swift_release();
}

- (id)stateForLog
{
  v2 = self;
  v3 = (void *)sub_100122118(1);
  sub_10007DC14(&qword_1002941D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100215320;
  strcpy((char *)(inited + 32), "diagnosticInfo");
  *(unsigned char *)(inited + 47) = -18;
  id v5 = [v3 stateForLog];
  uint64_t v6 = sub_1001EC260();

  *(void *)(inited + 72) = sub_10007DC14(&qword_1002941E0);
  *(void *)(inited + 48) = v6;
  sub_10012186C(inited);

  v7.super.isa = sub_1001EC250().super.isa;
  swift_bridgeObjectRelease();
  return v7.super.isa;
}

- (id)clearSyncMetadata
{
  v2 = (void *)_s14bookdatastored26CloudSyncDiagnosticServiceC05clearC8MetadataSo7NSErrorCSgyF_0();
  return v2;
}

- (void)fetchRemoteChangesWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  NSDictionary v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100294258;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B00;
  v12[5] = v11;
  objc_super v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293860, (uint64_t)v12);
  swift_release();
}

- (BDSCloudSyncDiagnosticService)init
{
  result = (BDSCloudSyncDiagnosticService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BDSCloudSyncDiagnosticService_logger;
  uint64_t v4 = sub_1001EB560();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end