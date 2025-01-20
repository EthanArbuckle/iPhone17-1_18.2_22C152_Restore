@interface PointerIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier)init;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation PointerIdentifier

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier_base);
  v4 = (objc_class *)type metadata accessor for PointerIdentifier();
  v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier_base] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_retain();
  return [(PointerIdentifier *)&v7 init];
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
    v5 = self;
  }
  BOOL v6 = PointerIdentifier.isEqual(_:)((uint64_t)v8);

  outlined destroy of AccessibilityValueStorage?((uint64_t)v8, (unint64_t *)&lazy cache variable for type metadata for Any?);
  return v6;
}

- (int64_t)hash
{
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier_base));
  return Hasher.finalize()();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PointerIdentifier.description.getter();
  uint64_t v5 = v4;

  BOOL v6 = (void *)MEMORY[0x18C115780](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier)init
{
  result = (_TtC7SwiftUIP33_E281E5F41850D012D9603104FBB83C5417PointerIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end