@interface APChangeEventManager
- (_TtC13AppProtection20APChangeEventManager)init;
@end

@implementation APChangeEventManager

- (_TtC13AppProtection20APChangeEventManager)init
{
  return (_TtC13AppProtection20APChangeEventManager *)sub_247D48D68();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13AppProtection20APChangeEventManager_changeEventsPublisher;
  if (*((void *)v3 + 3)) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13AppProtection20APChangeEventManager_changeEventsXPCPublisher));
  swift_bridgeObjectRelease();

  swift_release();
}

@end