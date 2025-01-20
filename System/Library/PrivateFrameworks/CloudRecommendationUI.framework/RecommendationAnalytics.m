@interface RecommendationAnalytics
- (_TtC21CloudRecommendationUI23RecommendationAnalytics)init;
- (_TtC21CloudRecommendationUI23RecommendationAnalytics)initWithAccount:(id)a3;
- (void)sendManageStorageDisplayedEvent;
- (void)sendRecommendedForYouTapEvent;
- (void)sendiCloudSettingsDisplayedEvent;
@end

@implementation RecommendationAnalytics

- (_TtC21CloudRecommendationUI23RecommendationAnalytics)initWithAccount:(id)a3
{
  id v3 = a3;
  v4 = (_TtC21CloudRecommendationUI23RecommendationAnalytics *)sub_24A354704(v3);

  return v4;
}

- (void)sendRecommendedForYouTapEvent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978B2D8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  unint64_t v7 = sub_24A31268C(MEMORY[0x263F8EE78]);
  sub_24A398608();
  uint64_t v8 = sub_24A398638();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = v9;
  *(void *)(v10 + 40) = v7;
  *(unsigned char *)(v10 + 48) = 4;
  swift_bridgeObjectRetain();
  sub_24A35328C((uint64_t)v5, (uint64_t)&unk_26978C160, v10);
  swift_release();
  sub_24A354930((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)sendiCloudSettingsDisplayedEvent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978B2D8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  unint64_t v7 = sub_24A31268C(MEMORY[0x263F8EE78]);
  sub_24A398608();
  uint64_t v8 = sub_24A398638();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = v9;
  *(void *)(v10 + 40) = v7;
  *(unsigned char *)(v10 + 48) = 10;
  swift_bridgeObjectRetain();
  sub_24A35328C((uint64_t)v5, (uint64_t)&unk_26978C158, v10);
  swift_release();
  sub_24A354930((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)sendManageStorageDisplayedEvent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26978B2D8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  unint64_t v7 = sub_24A31268C(MEMORY[0x263F8EE78]);
  sub_24A398608();
  uint64_t v8 = sub_24A398638();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = v9;
  *(void *)(v10 + 40) = v7;
  *(unsigned char *)(v10 + 48) = 11;
  swift_bridgeObjectRetain();
  sub_24A35328C((uint64_t)v5, (uint64_t)&unk_26978C150, v10);
  swift_release();
  sub_24A354930((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC21CloudRecommendationUI23RecommendationAnalytics)init
{
  result = (_TtC21CloudRecommendationUI23RecommendationAnalytics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23RecommendationAnalytics_account));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23RecommendationAnalytics_storageDataController));
  swift_release();
}

@end