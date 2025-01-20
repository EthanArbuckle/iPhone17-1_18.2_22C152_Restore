@interface RichCarouselItem
- (_TtC7ChatKit16RichCarouselItem)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation RichCarouselItem

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_18F52C800((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_18F7BA6F0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (_TtC7ChatKit16RichCarouselItem)init
{
  result = (_TtC7ChatKit16RichCarouselItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit16RichCarouselItem_actionButtonDelegate;

  sub_18F4C25DC((uint64_t)v3);
}

@end