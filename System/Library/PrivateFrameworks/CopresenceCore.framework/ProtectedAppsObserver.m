@interface ProtectedAppsObserver
- (_TtC14CopresenceCore21ProtectedAppsObserver)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
@end

@implementation ProtectedAppsObserver

- (_TtC14CopresenceCore21ProtectedAppsObserver)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC14CopresenceCore21ProtectedAppsObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProtectedAppsObserver();
  v3 = [(ProtectedAppsObserver *)&v8 init];
  v4 = self;
  v5 = v3;
  id v6 = objc_msgSend(objc_msgSend(v4, sel_subjectMonitorRegistry), sel_addMonitor_, v5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v5;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  type metadata accessor for APSubject();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  id v6 = self;
  specialized ProtectedAppsObserver.appProtectionSubjectsChanged(_:for:)(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end