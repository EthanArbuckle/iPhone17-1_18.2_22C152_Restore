@interface FPCK
+ (BOOL)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 error:(id *)a6;
- (BOOL)checker:(id)a3 handleItem:(int)a4 itemStatus:(id *)a5 under:(id)a6 brokenInvariants:(unint64_t)a7;
- (BOOL)checker:(id)a3 handleLockedItemAtPath:(id)a4 handle:(const fpfs_item_handle *)a5;
- (BOOL)launchFromURLs:(id)a3 options:(unint64_t)a4 error:(id *)a5 resultHandler:(id)a6;
- (NSDictionary)telemetryReport;
- (_TtC9libfssync4FPCK)init;
- (_TtC9libfssync4FPCK)initWithDatabasesBackupsPaths:(id)a3 volumeRole:(unsigned int)a4 providerDomainID:(id)a5 domainUserInfo:(id)a6 reason:(unint64_t)a7 usingFPFS:(BOOL)a8 iCDPackageDetection:(BOOL)a9 useShouldPause:(BOOL)a10 shouldPause:(id)a11 sendDiagnostics:(id)a12 saveCheckpoint:(id)a13 isInvalidated:(id)a14;
- (int64_t)numberOfBrokenFilesInBackupManifestCheck;
- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck;
- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck;
- (int64_t)numberOfBrokenFilesInReconciliationTableCheck;
- (int64_t)numberOfFilesChecked;
- (int64_t)numberOfReconciliationTableEntries;
- (void)dealloc;
- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3;
- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3;
- (void)setNumberOfFilesChecked:(int64_t)a3;
- (void)setNumberOfReconciliationTableEntries:(int64_t)a3;
- (void)setTelemetryReport:(id)a3;
@end

@implementation FPCK

- (int64_t)numberOfFilesChecked
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfFilesChecked);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfFilesChecked:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfFilesChecked);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSAndFSSnapshotCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSAndFSSnapshotCheck);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInReconciliationTableCheck
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInReconciliationTableCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInReconciliationTableCheck);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfBrokenFilesInBackupManifestCheck
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInBackupManifestCheck);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfBrokenFilesInBackupManifestCheck);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numberOfReconciliationTableEntries
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfReconciliationTableEntries);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfReconciliationTableEntries:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_numberOfReconciliationTableEntries);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSDictionary)telemetryReport
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_telemetryReport);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3.super.isa = sub_10096B9A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSDictionary *)v3.super.isa;
}

- (void)setTelemetryReport:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_10096B9C0();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync4FPCK_telemetryReport);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC9libfssync4FPCK)initWithDatabasesBackupsPaths:(id)a3 volumeRole:(unsigned int)a4 providerDomainID:(id)a5 domainUserInfo:(id)a6 reason:(unint64_t)a7 usingFPFS:(BOOL)a8 iCDPackageDetection:(BOOL)a9 useShouldPause:(BOOL)a10 shouldPause:(id)a11 sendDiagnostics:(id)a12 saveCheckpoint:(id)a13 isInvalidated:(id)a14
{
  v15 = _Block_copy(a11);
  v16 = _Block_copy(a12);
  v17 = _Block_copy(a13);
  v18 = _Block_copy(a14);
  uint64_t v19 = sub_10096B9C0();
  if (a6) {
    a6 = (id)sub_10096B9C0();
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v15;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v16;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v17;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v18;
  if (a10)
  {
    swift_retain();
    v24 = sub_1004A5C6C;
    uint64_t v25 = v20;
  }
  else
  {
    v24 = 0;
    uint64_t v25 = 0;
  }
  swift_getObjectType();
  v26 = (_TtC9libfssync4FPCK *)sub_10049EFA4(v19, a4, a5, (uint64_t)a6, a7, a8, a9, 0, 256, (uint64_t)v24, v25, (uint64_t)sub_1004A5CA4, v21, (uint64_t)sub_100082804, v22, (Swift::Bool (__swiftcall *)())sub_1004A5D18, (Swift::Bool (__swiftcall *)())v23);
  swift_release();
  swift_deallocPartialClassInstance();
  return v26;
}

- (void)dealloc
{
  v2 = self;
  FPCK.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000705CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_shouldPause));
  sub_1000705CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_sendDiagnostics));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _Block_release(*(const void **)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_ioContext));
  swift_release();
  swift_bridgeObjectRelease();
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync4FPCK_rootURL, &qword_100ACA8C0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)launchFromURLs:(id)a3 options:(unint64_t)a4 error:(id *)a5 resultHandler:(id)a6
{
  v8 = _Block_copy(a6);
  sub_10096AE50();
  uint64_t v9 = sub_10096C0A0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v11 = self;
  FPCK.launch(fromURLs:options:resultHandler:)(v9, a4, (char *)sub_1004A5C54, (uint8_t *)v10);
  swift_bridgeObjectRelease();
  swift_release();

  return 1;
}

- (BOOL)checker:(id)a3 handleItem:(int)a4 itemStatus:(id *)a5 under:(id)a6 brokenInvariants:(unint64_t)a7
{
  sub_100011348(0, (unint64_t *)&qword_100ACB6E0);
  unint64_t v12 = sub_10096C0A0();
  id v13 = a3;
  v14 = self;
  LOBYTE(a7) = sub_10049FD38(a4, (uint64_t)a5, v12, a7);

  swift_bridgeObjectRelease();
  return a7 & 1;
}

- (BOOL)checker:(id)a3 handleLockedItemAtPath:(id)a4 handle:(const fpfs_item_handle *)a5
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync4FPCK_fsSnapshotChecker))
  {
    unint64_t var0 = a5->var0;
    swift_beginAccess();
    id v8 = a3;
    uint64_t v9 = self;
    swift_retain();
    sub_100495714(&v11, var0, (void (*)(uint64_t))sub_100922024, (uint64_t)&type metadata for UInt64, (uint64_t *)&unk_100AD63D0, (uint64_t (*)(uint64_t))sub_10092431C);
    swift_endAccess();

    swift_release();
  }
  return 1;
}

+ (BOOL)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v8 = _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  uint64_t v10 = v9;
  id v11 = a5;
  sub_1004A2690(v8, v10, v7, v11);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC9libfssync4FPCK)init
{
  result = (_TtC9libfssync4FPCK *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end