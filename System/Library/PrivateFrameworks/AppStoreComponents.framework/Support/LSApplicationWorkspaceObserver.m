@interface LSApplicationWorkspaceObserver
- (_TtC19appstorecomponentsdP33_29B18140782058085C16F28BE6542E8A30LSApplicationWorkspaceObserver)init;
- (uint64_t)applicationsDidInstall:(uint64_t)a3;
@end

@implementation LSApplicationWorkspaceObserver

- (uint64_t)applicationsDidInstall:(uint64_t)a3
{
  if (a3) {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = a1;
  sub_10003A500(v4);

  return swift_bridgeObjectRelease();
}

- (_TtC19appstorecomponentsdP33_29B18140782058085C16F28BE6542E8A30LSApplicationWorkspaceObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->changeObserver[OBJC_IVAR____TtC19appstorecomponentsdP33_29B18140782058085C16F28BE6542E8A30LSApplicationWorkspaceObserver_changeObserver] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LSApplicationWorkspaceObserver *)&v5 init];
}

- (void).cxx_destruct
{
}

@end