@interface ANXPCManager
- (ANXPCManager)init;
- (ANXPCManager)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6;
- (ANXPCManagerCheckInProvider)checkInProvider;
- (ANXPCManagerDelegate)delegate;
- (NSXPCConnection)connection;
- (void)addCheckInObserver:(id)a3;
- (void)dealloc;
- (void)setCheckInProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ANXPCManager

- (ANXPCManagerDelegate)delegate
{
  return (ANXPCManagerDelegate *)sub_220FC87D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ANXPCManager_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (ANXPCManagerCheckInProvider)checkInProvider
{
  return (ANXPCManagerCheckInProvider *)sub_220FC87D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ANXPCManager_checkInProvider);
}

- (void)setCheckInProvider:(id)a3
{
}

- (ANXPCManager)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedInterface:(id)a5 exportedObject:(id)a6
{
  uint64_t v8 = sub_220FCB610();
  uint64_t v10 = v9;
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  return (ANXPCManager *)XPCManager.init(machServiceName:remoteObjectInterface:exportedInterface:exportedObject:)(v8, v10, v11, v12);
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ANXPCManager__connection);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XPCManager();
  [(ANXPCManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_220FCAD80((uint64_t)self + OBJC_IVAR___ANXPCManager_delegate);
  sub_220FCAD80((uint64_t)self + OBJC_IVAR___ANXPCManager_checkInProvider);

  v3 = (char *)self + OBJC_IVAR___ANXPCManager_logger;
  uint64_t v4 = sub_220FCB5E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_220FCAD80((uint64_t)self + OBJC_IVAR___ANXPCManager_exportedObject);

  objc_super v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ANXPCManager_exportedInterface);
}

- (void)addCheckInObserver:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_220FC9270();
  swift_unknownObjectRelease();
}

- (NSXPCConnection)connection
{
  v2 = self;
  id v3 = sub_220FC93E8();

  return (NSXPCConnection *)v3;
}

- (ANXPCManager)init
{
  result = (ANXPCManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end