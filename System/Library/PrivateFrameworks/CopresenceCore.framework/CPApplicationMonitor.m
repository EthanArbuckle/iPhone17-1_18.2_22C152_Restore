@interface CPApplicationMonitor
- (CPApplicationMonitor)init;
- (CPApplicationMonitor)initWithApplicationController:(id)a3 queue:(id)a4;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)dealloc;
@end

@implementation CPApplicationMonitor

- (CPApplicationMonitor)initWithApplicationController:(id)a3 queue:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = one-time initialization token for shared;
  id v8 = a3;
  id v9 = a4;
  if (v7 != -1) {
    swift_once();
  }
  v10 = (void *)static CPApplicationPolicyManager.shared;
  v13[3] = type metadata accessor for CPApplicationController();
  v13[4] = &protocol witness table for CPApplicationController;
  v13[0] = v8;
  v11 = (CPApplicationMonitor *)(*(uint64_t (**)(void *, void *, id))(ObjectType + 136))(v10, v13, v9);
  swift_deallocPartialClassInstance();
  return v11;
}

- (void)dealloc
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPApplicationMonitor_appVisibilityMonitor);
  swift_beginAccess();
  if (*v3)
  {
    uint64_t v4 = v3[1];
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 24);
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    v6(ObjectType, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    id v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CPApplicationMonitor();
  [(CPApplicationMonitor *)&v9 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPApplicationMonitor_applicationController);
  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  specialized CPApplicationMonitor.conversationManager(_:conversationChanged:)(a3);
  swift_unknownObjectRelease();
}

- (CPApplicationMonitor)init
{
  result = (CPApplicationMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end