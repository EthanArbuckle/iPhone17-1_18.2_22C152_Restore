@interface PinnedContentStore
- (_TtC28HealthAppHealthDaemonSupport18PinnedContentStore)init;
- (id)exportedInterface;
- (id)remoteInterface;
@end

@implementation PinnedContentStore

- (id)exportedInterface
{
  id v2 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2701E63A0);
  return v2;
}

- (id)remoteInterface
{
  id v2 = (void *)_s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0();
  return v2;
}

- (_TtC28HealthAppHealthDaemonSupport18PinnedContentStore)init
{
  result = (_TtC28HealthAppHealthDaemonSupport18PinnedContentStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider);
}

@end