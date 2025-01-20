@interface IMDPreReqsChecker
- (_TtC12IMDaemonCore17IMDPreReqsChecker)init;
- (void)verifyAllPreReqsWithRequireEnablement:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation IMDPreReqsChecker

- (void)verifyAllPreReqsWithRequireEnablement:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1D96867CC((uint64_t *)&unk_1EBE2B000);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_1D9907030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA8C95E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA8C8188;
  v14[5] = v13;
  v15 = self;
  sub_1D98A7218((uint64_t)v9, (uint64_t)&unk_1EA8C8190, (uint64_t)v14);
  swift_release();
}

- (_TtC12IMDaemonCore17IMDPreReqsChecker)init
{
  v2 = self;
  sub_1D9906B70();
  sub_1D9906B90();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for IMDPreReqsChecker(0);
  return [(IMDPreReqsChecker *)&v4 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12IMDaemonCore17IMDPreReqsChecker_logger;
  uint64_t v3 = sub_1D9906BA0();
  objc_super v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end