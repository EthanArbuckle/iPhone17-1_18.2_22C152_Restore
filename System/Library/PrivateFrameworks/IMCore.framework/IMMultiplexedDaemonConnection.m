@interface IMMultiplexedDaemonConnection
- (IMDaemonProtocol)remoteProxy;
- (IMDaemonProtocol)synchronousRemoteProxy;
- (IMMultiplexedDaemonConnection)init;
- (IMMultiplexedDaemonConnection)initWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 onInvalidate:(id)a6 onDealloc:(id)a7;
- (NSDictionary)context;
- (NSString)label;
- (unint64_t)capabilities;
- (void)connectWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)waitForSetup;
@end

@implementation IMMultiplexedDaemonConnection

- (IMMultiplexedDaemonConnection)initWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 onInvalidate:(id)a6 onDealloc:(id)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  v13 = _Block_copy(a6);
  v14 = _Block_copy(a7);
  uint64_t v15 = sub_1A4CBB0CC();
  uint64_t v17 = v16;
  if (a5) {
    a5 = (id)sub_1A4CBB0AC();
  }
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v13;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_label);
  uint64_t *v20 = v15;
  v20[1] = v17;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_context) = (Class)a5;
  v21 = (uint64_t (**)())((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_onInvalidate);
  *v21 = sub_1A4CA6158;
  v21[1] = (uint64_t (*)())v18;
  v22 = (uint64_t (**)())((char *)self + OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit);
  *v22 = sub_1A4CA66E4;
  v22[1] = (uint64_t (*)())v19;
  v24.receiver = self;
  v24.super_class = ObjectType;
  return [(IMMultiplexedDaemonConnection *)&v24 init];
}

- (unint64_t)capabilities
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_capabilities);
}

- (NSDictionary)context
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_context))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A4CBB09C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (NSString)label
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A4CBB0BC();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (IMDaemonProtocol)remoteProxy
{
  return (IMDaemonProtocol *)sub_1A4CA4FB8(self, (uint64_t)a2, (SEL *)&selRef_remoteDaemon);
}

- (IMDaemonProtocol)synchronousRemoteProxy
{
  return (IMDaemonProtocol *)sub_1A4CA4FB8(self, (uint64_t)a2, (SEL *)&selRef_synchronousRemoteDaemon);
}

- (void)waitForSetup
{
  v2 = self;
  MultiplexedDaemonConnection.waitForSetup()();
}

- (void)connectWithCompletion:(id)a3
{
  uint64_t v5 = sub_1A4B0E048((uint64_t *)&unk_1EB3F2030);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1A4CBB1DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E965DBE8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E965DBF0;
  v12[5] = v11;
  v13 = self;
  sub_1A4CB3944((uint64_t)v7, (uint64_t)&unk_1E965D260, (uint64_t)v12);
  swift_release();
}

- (void)invalidate
{
  v2 = self;
  MultiplexedDaemonConnection.invalidate()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa + OBJC_IVAR___IMMultiplexedDaemonConnection_onDeinit);
  uint64_t v5 = self;
  uint64_t v6 = swift_retain();
  v4(v6);
  swift_release();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(IMMultiplexedDaemonConnection *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (IMMultiplexedDaemonConnection)init
{
  result = (IMMultiplexedDaemonConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end