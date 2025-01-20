@interface ExpressSettingsSetupCacheManager
- (BOOL)hasExpressSetting:(unint64_t)a3;
- (_TtC5Setup32ExpressSettingsSetupCacheManager)init;
- (void)applyHandlers:(id)a3;
- (void)registerExpressSettings:(id)a3;
- (void)removeApplyHandlerFor:(unint64_t)a3;
- (void)resetCache;
- (void)resetHandlers;
- (void)setApplyHandlerFor:(unint64_t)a3;
- (void)setExpressDataSource:(id)a3;
@end

@implementation ExpressSettingsSetupCacheManager

- (_TtC5Setup32ExpressSettingsSetupCacheManager)init
{
  uint64_t v2 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBD4(0, (unint64_t *)&qword_10031D0D0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchQoS.QoSClass.default(_:), v2);
  uint64_t v6 = static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = (objc_class *)type metadata accessor for ExpressSettingsSetupCacheManager();
  v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_registeredSettings] = &_swiftEmptySetSingleton;
  *(void *)&v8[OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_expressFeaturesToApply] = &_swiftEmptySetSingleton;
  *(void *)&v8[OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_dataSource] = 0;
  *(void *)&v8[OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_queue] = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  v9 = [(ExpressSettingsSetupCacheManager *)&v11 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)setExpressDataSource:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_dataSource) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)setApplyHandlerFor:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_100007B54(a3);
}

- (void)removeApplyHandlerFor:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_100007F8C(a3);
}

- (void)registerExpressSettings:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000082F4(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)hasExpressSetting:(unint64_t)a3
{
  return sub_10000896C(a3, *(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Setup32ExpressSettingsSetupCacheManager_registeredSettings));
}

- (void)applyHandlers:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100008A88((uint64_t)sub_10000BBCC, v5);

  swift_release();
}

- (void)resetHandlers
{
  uint64_t v2 = self;
  sub_1000098F4();
}

- (void)resetCache
{
  uint64_t v2 = self;
  sub_100009CAC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end