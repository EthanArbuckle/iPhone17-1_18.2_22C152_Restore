@interface ObjcColor
- (BOOL)isEqual:(id)a3;
- (_TtC7SwiftUI9ObjcColor)init;
- (int64_t)hash;
@end

@implementation ObjcColor

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
  char v6 = ObjcColor.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI9ObjcColor_color);
  Hasher.init(_seed:)();
  v4 = *(void (**)(unsigned char *))(*(void *)v3 + 136);
  v5 = self;
  v4(v8);
  Swift::Int v6 = Hasher._finalize()();

  return v6;
}

- (void).cxx_destruct
{
}

- (_TtC7SwiftUI9ObjcColor)init
{
  result = (_TtC7SwiftUI9ObjcColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end