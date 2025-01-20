@interface MOProtectedAppsManager
- (_TtC16MomentsUIService22MOProtectedAppsManager)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
@end

@implementation MOProtectedAppsManager

- (_TtC16MomentsUIService22MOProtectedAppsManager)init
{
  v2 = (char *)self + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_delegate;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_monitoring) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_monitoringSubjects) = (Class)&_swiftEmptySetSingleton;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOProtectedAppsManager();
  return [(MOProtectedAppsManager *)&v4 init];
}

- (void).cxx_destruct
{
  outlined destroy of MOProtectedAppsManagerDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService22MOProtectedAppsManager_delegate);

  swift_bridgeObjectRelease();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  type metadata accessor for APSubject();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  v6 = self;
  specialized MOProtectedAppsManager.appProtectionSubjectsChanged(_:for:)(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end