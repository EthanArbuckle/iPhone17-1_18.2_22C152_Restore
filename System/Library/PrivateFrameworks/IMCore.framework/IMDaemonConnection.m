@interface IMDaemonConnection
- (BOOL)isConnected;
- (IMDaemonConnection)init;
- (IMDaemonConnection)initWithListener:(id)a3;
- (IMDaemonProtocol)remoteObjectProxy;
- (IMDaemonProtocol)synchronousRemoteObjectProxy;
- (id)onSetupComplete;
- (void)connectWithCapabilities:(unint64_t)a3 context:(id)a4 contextChanged:(BOOL)a5;
- (void)disconnect;
- (void)requestSetup;
- (void)requestSetupIfNeededWithCompletionHandler:(id)a3;
- (void)setOnSetupComplete:(id)a3;
- (void)waitForSetup;
@end

@implementation IMDaemonConnection

- (IMDaemonConnection)initWithListener:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (IMDaemonConnection *)sub_1A4B01C70((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)setOnSetupComplete:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_1A4AFAFE8;
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x1F4188790]();
  v6 = self;
  sub_1A4CBAFDC();
  sub_1A4B35388((uint64_t)v5);
}

- (IMDaemonProtocol)remoteObjectProxy
{
  return (IMDaemonProtocol *)sub_1A4B05F60(self);
}

- (void)waitForSetup
{
  v2 = self;
  DaemonConnection.waitForSetup()();
}

- (void)connectWithCapabilities:(unint64_t)a3 context:(id)a4 contextChanged:(BOOL)a5
{
  uint64_t v8 = sub_1A4CBB0AC();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = v8;
  *(unsigned char *)(v9 + 32) = a5;
  *(void *)(v9 + 40) = self;
  v10 = self;
  swift_bridgeObjectRetain();
  sub_1A4CBAFEC();

  swift_bridgeObjectRelease();

  swift_release();
}

- (BOOL)isConnected
{
  v2 = self;
  sub_1A4CBAFDC();

  return v4;
}

- (IMDaemonConnection)init
{
  result = (IMDaemonConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___IMDaemonConnection_isInvokingSetup;
  uint64_t v4 = sub_1A4B0E048((uint64_t *)&unk_1EB3F2058);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

- (IMDaemonProtocol)synchronousRemoteObjectProxy
{
  return (IMDaemonProtocol *)sub_1A4B05F60(self);
}

- (id)onSetupComplete
{
  v2 = self;
  sub_1A4B0E048(&qword_1E965D238);
  sub_1A4CBAFDC();
  if (v7)
  {
    uint64_t v3 = v8;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v7;
    *(void *)(v4 + 24) = v3;

    v11 = sub_1A4C908D8;
    uint64_t v12 = v4;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 1107296256;
    uint64_t v9 = sub_1A4C8E40C;
    v10 = &unk_1EF8E6D40;
    v5 = _Block_copy(&v7);
    swift_release();
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)disconnect
{
}

- (void)requestSetup
{
}

- (void)requestSetupIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1A4B0E048((uint64_t *)&unk_1EB3F2030);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A4CBB1DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E965D250;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E965DBF0;
  v12[5] = v11;
  v13 = self;
  sub_1A4CB3944((uint64_t)v7, (uint64_t)&unk_1E965D260, (uint64_t)v12);
  swift_release();
}

@end