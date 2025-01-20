@interface Plane
- (_TtC16MagnifierSupport5Plane)init;
- (_TtC16MagnifierSupport5Plane)initWithCoder:(id)a3;
@end

@implementation Plane

- (_TtC16MagnifierSupport5Plane)initWithCoder:(id)a3
{
  result = (_TtC16MagnifierSupport5Plane *)sub_23594A968();
  __break(1u);
  return result;
}

- (_TtC16MagnifierSupport5Plane)init
{
  result = (_TtC16MagnifierSupport5Plane *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport5Plane_classification;
  uint64_t v4 = sub_23594A118();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end