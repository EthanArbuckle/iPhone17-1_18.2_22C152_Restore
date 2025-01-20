@interface StateCaptureItem
- (_TtC10ChronoCore16StateCaptureItem)init;
- (void)dealloc;
@end

@implementation StateCaptureItem

- (void)dealloc
{
  sub_1DABF7670((uint64_t)self + OBJC_IVAR____TtC10ChronoCore16StateCaptureItem_invalidatable, (uint64_t)v6);
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(v6, v7);
    v3 = self;
    sub_1DABF4DC0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    v4 = self;
    sub_1DABF76D8((uint64_t)v6);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StateCaptureItem();
  [(StateCaptureItem *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore16StateCaptureItem_invalidatable;

  sub_1DABF76D8((uint64_t)v3);
}

- (_TtC10ChronoCore16StateCaptureItem)init
{
  result = (_TtC10ChronoCore16StateCaptureItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end