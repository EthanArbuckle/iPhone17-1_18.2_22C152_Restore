@interface RemotePersonalizationAppStateDataSource
- (_TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource)init;
- (void)dealloc;
- (void)didCompletePurchase:(id)a3;
- (void)registerPersonalizedAdamIds:(id)a3;
- (void)storeAccountDidChange;
@end

@implementation RemotePersonalizationAppStateDataSource

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(RemotePersonalizationAppStateDataSource *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_1E15F6A98((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_accessQueue));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_urlSession));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource_process);
}

- (void)storeAccountDidChange
{
  v2 = self;
  sub_1E1B7ACB8();
}

- (void)didCompletePurchase:(id)a3
{
}

- (void)registerPersonalizedAdamIds:(id)a3
{
}

- (_TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource)init
{
  result = (_TtC19AppStoreKitInternal39RemotePersonalizationAppStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end