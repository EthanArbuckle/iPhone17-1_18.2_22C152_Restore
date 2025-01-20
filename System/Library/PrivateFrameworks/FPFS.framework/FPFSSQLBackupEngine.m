@interface FPFSSQLBackupEngine
- (_TtC9libfssync19FPFSSQLBackupEngine)init;
- (_TtC9libfssync19FPFSSQLBackupEngine)initWithUserURL:(id)a3 outputUserURL:(id)a4;
- (void)backUpWithCompletionHandler:(id)a3;
@end

@implementation FPFSSQLBackupEngine

- (_TtC9libfssync19FPFSSQLBackupEngine)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&v11 - v8;
  sub_24DCC89E8();
  sub_24DCC89E8();
  return (_TtC9libfssync19FPFSSQLBackupEngine *)sub_24DBBBB28(v9, v7);
}

- (void)backUpWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_24DBBF0A8((char *)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC9libfssync19FPFSSQLBackupEngine)init
{
  result = (_TtC9libfssync19FPFSSQLBackupEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_userURL;
  uint64_t v4 = sub_24DCC8A58();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_outputUserURL, v4);
  v6((char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_destinationDirectoryURL, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_backupManifestURL;

  v6(v5, v4);
}

@end