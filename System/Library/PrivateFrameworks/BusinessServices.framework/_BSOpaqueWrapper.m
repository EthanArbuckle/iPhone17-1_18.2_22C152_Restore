@interface _BSOpaqueWrapper
- (_BSOpaqueWrapper)init;
- (id)init:(id)a3;
- (id)wrappedThing;
@end

@implementation _BSOpaqueWrapper

- (id)wrappedThing
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____BSOpaqueWrapper_wrappedThing), *(void *)&self->wrappedThing[OBJC_IVAR____BSOpaqueWrapper_wrappedThing + 16]);
  v2 = (void *)sub_2291677D0();
  return v2;
}

- (id)init:(id)a3
{
  swift_unknownObjectRetain();
  sub_2291676E0();
  swift_unknownObjectRelease();
  sub_22914AECC((uint64_t)v7, (uint64_t)self + OBJC_IVAR____BSOpaqueWrapper_wrappedThing);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OpaqueWrapper();
  v4 = [(_BSOpaqueWrapper *)&v6 init];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  return v4;
}

- (_BSOpaqueWrapper)init
{
  result = (_BSOpaqueWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end