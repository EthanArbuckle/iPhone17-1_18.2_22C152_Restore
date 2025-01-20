@interface ShareFileActivityItemSource
- (_TtC18HealthExperienceUI27ShareFileActivityItemSource)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)dealloc;
@end

@implementation ShareFileActivityItemSource

- (void)dealloc
{
  v2 = self;
  ShareFileActivityItemSource.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL;
  uint64_t v3 = sub_1AD73A4B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v4 = sub_1AD73A4B0();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL, v4);
  v7 = (void *)sub_1AD740C10();
  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v5 = sub_1AD73A4B0();
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27ShareFileActivityItemSource_fileURL, v5);
  v8 = (void *)sub_1AD740C10();
  return v8;
}

- (_TtC18HealthExperienceUI27ShareFileActivityItemSource)init
{
  result = (_TtC18HealthExperienceUI27ShareFileActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end