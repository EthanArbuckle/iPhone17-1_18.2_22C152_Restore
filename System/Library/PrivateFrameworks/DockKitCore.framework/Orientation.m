@interface Orientation
- (NSString)description;
- (_TtC11DockKitCore11Orientation)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation Orientation

- (_TtC11DockKitCore11Orientation)init
{
  uint64_t v3 = OBJC_IVAR____TtC11DockKitCore11Orientation_allocatedLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B182730);
  v4 = (objc_class *)swift_allocObject();
  *((_DWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__yaw) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__pitch) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore11Orientation__roll) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for Orientation();
  return [(Orientation *)&v6 init];
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_24CF360C4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_24CF34A30);
}

- (NSString)description
{
  v2 = self;
  sub_24CF35010();

  uint64_t v3 = (void *)sub_24CF3B300();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end