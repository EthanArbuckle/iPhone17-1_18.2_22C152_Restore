@interface FSChangesEnumerator
- (_TtC24LocalStorageFileProvider19FSChangesEnumerator)init;
- (void)dealloc;
@end

@implementation FSChangesEnumerator

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC24LocalStorageFileProvider19FSChangesEnumerator_source;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24LocalStorageFileProvider19FSChangesEnumerator_source))
  {
    swift_getObjectType();
    v5 = self;
    swift_unknownObjectRetain();
    sub_10096C720();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = self;
  }
  *(Class *)((char *)&self->super.isa + v4) = 0;
  swift_unknownObjectRelease();
  v7.receiver = self;
  v7.super_class = ObjectType;
  [(FSChangesEnumerator *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_100020374((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider19FSChangesEnumerator_currentToken, (uint64_t (*)(void))type metadata accessor for FSChangeToken);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider19FSChangesEnumerator_observedID));
  sub_100020374((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider19FSChangesEnumerator_domain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC24LocalStorageFileProvider19FSChangesEnumerator)init
{
  result = (_TtC24LocalStorageFileProvider19FSChangesEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end