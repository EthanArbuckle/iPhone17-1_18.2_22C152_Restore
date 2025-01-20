@interface HRLDLogArchiveProcessor
- (BOOL)writeLogsToDiskFrom:(id)a3 error:(id *)a4 progressHandler:(id)a5;
- (HRLDLogArchiveProcessor)init;
- (HRLDLogArchiveProcessor)initWithArchiveStartDate:(id)a3 deviceName:(id)a4 logArchiveURL:(id)a5 outputFileURL:(id)a6 redactedToken:(id)a7 windowSize:(double)a8 error:(id *)a9;
@end

@implementation HRLDLogArchiveProcessor

- (HRLDLogArchiveProcessor)initWithArchiveStartDate:(id)a3 deviceName:(id)a4 logArchiveURL:(id)a5 outputFileURL:(id)a6 redactedToken:(id)a7 windowSize:(double)a8 error:(id *)a9
{
  uint64_t v10 = sub_1000098B0();
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  v13 = &v25[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v15 = &v25[-v14];
  uint64_t v16 = sub_100009960();
  __chkstk_darwin(v16 - 8);
  v18 = &v25[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100009940();
  uint64_t v19 = sub_100009980();
  uint64_t v21 = v20;
  sub_100009890();
  sub_100009890();
  uint64_t v22 = sub_100009980();
  return (HRLDLogArchiveProcessor *)sub_100004104((uint64_t)v18, v19, v21, (uint64_t)v15, (uint64_t)v13, v22, v23, a8);
}

- (BOOL)writeLogsToDiskFrom:(id)a3 error:(id *)a4 progressHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_100009A30();
  _Block_copy(v6);
  v8 = self;
  sub_100004760(v7, (uint64_t)v8, (void (**)(void, __n128))v6);

  _Block_release(v6);
  swift_bridgeObjectRelease();
  return 1;
}

- (HRLDLogArchiveProcessor)init
{
  result = (HRLDLogArchiveProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___HRLDLogArchiveProcessor_archiveStartDate;
  uint64_t v4 = sub_100009960();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___HRLDLogArchiveProcessor_logArchiveURL;
  uint64_t v6 = sub_1000098B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  uint64_t v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRLDLogArchiveProcessor_osStore);
}

@end