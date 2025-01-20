@interface ContextMenuIdentity
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC7SwiftUI19ContextMenuIdentity)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation ContextMenuIdentity

- (id)copyWithZone:(void *)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_base);
  v6 = (char *)objc_allocWithZone(ObjectType);
  v7 = &v6[OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_sourceIndexPath];
  uint64_t v8 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)&v6[OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_base] = v5;
  v10.receiver = v6;
  v10.super_class = ObjectType;
  swift_retain();
  return [(ContextMenuIdentity *)&v10 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = ContextMenuIdentity.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  return Hasher.finalize()();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = ContextMenuIdentity.description.getter();
  uint64_t v5 = v4;

  BOOL v6 = (void *)MEMORY[0x18C115780](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC7SwiftUI19ContextMenuIdentity)init
{
  result = (_TtC7SwiftUI19ContextMenuIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_sourceIndexPath;

  outlined destroy of IndexPath?((uint64_t)v3);
}

@end