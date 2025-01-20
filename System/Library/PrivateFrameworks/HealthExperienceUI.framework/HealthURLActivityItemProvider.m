@interface HealthURLActivityItemProvider
- (_TtC18HealthExperienceUI29HealthURLActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation HealthURLActivityItemProvider

- (id)item
{
  uint64_t v3 = sub_1AD73A4B0();
  MEMORY[0x1F4188790](v3);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_url, v3);
  v6 = (void *)sub_1AD740C10();
  return v6;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1AD2E7A04();

  return v6;
}

- (_TtC18HealthExperienceUI29HealthURLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  result = (_TtC18HealthExperienceUI29HealthURLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_url;
  uint64_t v4 = sub_1AD73A4B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HealthURLActivityItemProvider_thumbnailImage));
  swift_bridgeObjectRelease();
}

@end