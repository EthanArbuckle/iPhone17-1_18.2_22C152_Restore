@interface RotationalVelocity
- (_TtC11DockKitCore18RotationalVelocity)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation RotationalVelocity

- (id)copyWithZone:(void *)a3
{
  return (id)sub_24CF360C4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_24CF35E54);
}

- (_TtC11DockKitCore18RotationalVelocity)init
{
  uint64_t v3 = OBJC_IVAR____TtC11DockKitCore18RotationalVelocity_allocatedLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182730);
  v4 = (objc_class *)swift_allocObject();
  *((_DWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18RotationalVelocity__yawVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18RotationalVelocity__pitchVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore18RotationalVelocity__rollVelocity) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RotationalVelocity();
  return [(RotationalVelocity *)&v6 init];
}

- (void).cxx_destruct
{
}

@end