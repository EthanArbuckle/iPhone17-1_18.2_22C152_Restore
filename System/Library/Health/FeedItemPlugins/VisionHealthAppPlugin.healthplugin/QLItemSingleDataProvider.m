@interface QLItemSingleDataProvider
- (_TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider)init;
- (id)provideDataForItem:(id)a3;
@end

@implementation QLItemSingleDataProvider

- (id)provideDataForItem:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data);
  unint64_t v4 = *(void *)&self->data[OBJC_IVAR____TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider_data];
  sub_241D41560(v3, v4);
  v5 = (void *)sub_241DA96E0();
  sub_241D415B8(v3, v4);

  return v5;
}

- (_TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider)init
{
  result = (_TtC21VisionHealthAppPluginP33_CF6C513206421B216281CAD0791521A824QLItemSingleDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end