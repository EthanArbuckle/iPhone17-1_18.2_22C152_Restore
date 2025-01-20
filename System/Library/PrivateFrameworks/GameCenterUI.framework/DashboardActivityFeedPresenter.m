@interface DashboardActivityFeedPresenter
- (BOOL)didScrollToIndexPath;
- (NSIndexPath)scrollToIndexPath;
- (NSString)title;
- (_TtC12GameCenterUI30DashboardActivityFeedPresenter)initWithPlayerId:(id)a3;
- (void)loadMoreActivityFeedWithContinuationToken:(id)a3;
- (void)setDidScrollToIndexPath:(BOOL)a3;
- (void)setScrollToIndexPath:(id)a3;
- (void)updateSnapshot;
@end

@implementation DashboardActivityFeedPresenter

- (NSString)title
{
  v2 = self;
  sub_1AF711E18();

  v3 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSIndexPath)scrollToIndexPath
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC5F20);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF712700();
  uint64_t v5 = sub_1AF7A9A60();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AF7A99D0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSIndexPath *)v6;
}

- (void)setScrollToIndexPath:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AC5F20);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1AF7A99E0();
    uint64_t v8 = sub_1AF7A9A60();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1AF7A9A60();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_1AF712828((uint64_t)v7);
}

- (BOOL)didScrollToIndexPath
{
  return sub_1AF7128B4() & 1;
}

- (void)setDidScrollToIndexPath:(BOOL)a3
{
}

- (void)updateSnapshot
{
  uint64_t v2 = self;
  sub_1AF7141BC();
}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  v4 = self;
  sub_1AF711F74();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI30DashboardActivityFeedPresenter)initWithPlayerId:(id)a3
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  sub_1AF7143C8();
}

- (void).cxx_destruct
{
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_scrollToIndexPath, &qword_1E9AC5F20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF379794((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_requiredData, &qword_1E9AC3898);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_dashboardDisplayMode));
  swift_release();

  swift_release();
}

@end