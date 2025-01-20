@interface MResource
- (NSString)id;
- (_TtC14BookFoundation9MResource)init;
@end

@implementation MResource

- (NSString)id
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2289DEB90();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC14BookFoundation9MResource)init
{
  result = (_TtC14BookFoundation9MResource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_228973854(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14BookFoundation9MResource____lazy_storage___relationships));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14BookFoundation9MResource____lazy_storage___views);

  sub_228973854(v3);
}

@end