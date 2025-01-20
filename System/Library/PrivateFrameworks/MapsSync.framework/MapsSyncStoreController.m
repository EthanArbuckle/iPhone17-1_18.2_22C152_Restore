@interface MapsSyncStoreController
- (NSArray)storeSubscriptionTypes;
- (_TtC8MapsSync23MapsSyncStoreController)init;
- (_TtC8MapsSync23MapsSyncStoreController)initWithConfig:(id)a3 notifyForChanges:(id)a4 callbackQueue:(id)a5 delegate:(id)a6;
- (_TtC8MapsSync23MapsSyncStoreController)initWithNotifyForChanges:(id)a3 delegate:(id)a4;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation MapsSyncStoreController

- (NSArray)storeSubscriptionTypes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703C0);
  v2 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703C0);
  uint64_t v4 = sub_1A709D4D8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync23MapsSyncStoreController_storeSubscriptionTypes);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync23MapsSyncStoreController)initWithConfig:(id)a3 notifyForChanges:(id)a4 callbackQueue:(id)a5 delegate:(id)a6
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703C0);
  uint64_t v9 = sub_1A709D4D8();
  id v10 = a3;
  id v11 = a5;
  swift_unknownObjectRetain();
  return (_TtC8MapsSync23MapsSyncStoreController *)MapsSyncStoreController.init(config:notifyForChanges:callbackQueue:delegate:)(v10, v9, a5, (uint64_t)a6);
}

- (_TtC8MapsSync23MapsSyncStoreController)initWithNotifyForChanges:(id)a3 delegate:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6703C0);
  sub_1A709D4D8();
  swift_unknownObjectRetain();
  id v6 = _s8MapsSync0aB11StoreConfigC07defaultcD0ACvgZ_0();
  v7 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  v8 = [(MapsSyncStoreController *)self initWithConfig:v6 notifyForChanges:v7 callbackQueue:0 delegate:a4];

  swift_unknownObjectRelease();
  return v8;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4 = sub_1A709D4D8();
  v5 = self;
  sub_1A6F6E598(v4);

  swift_bridgeObjectRelease();
}

- (_TtC8MapsSync23MapsSyncStoreController)init
{
  result = (_TtC8MapsSync23MapsSyncStoreController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A6F33A08((uint64_t)self + OBJC_IVAR____TtC8MapsSync23MapsSyncStoreController__delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncStoreController__barrierQueue);
}

@end