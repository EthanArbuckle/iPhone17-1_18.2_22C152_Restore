@interface RecommendationsController
- (_TtC21CloudRecommendationUI25RecommendationsController)initWithAccount:(id)a3;
- (_TtP21CloudRecommendationUI40RecommendationSubtitleControllerDelegate_)subtitleControllerDelegate;
- (void)accountDidChange:(id)a3;
- (void)fetchAllWithShouldRefreshBreakout:(BOOL)a3;
- (void)refresh;
- (void)refreshEligibleRecommendationsWithShouldSendDisplayedStatus:(BOOL)a3 shouldRefreshBreakout:(BOOL)a4;
- (void)setSubtitleControllerDelegate:(id)a3;
@end

@implementation RecommendationsController

- (_TtP21CloudRecommendationUI40RecommendationSubtitleControllerDelegate_)subtitleControllerDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC21CloudRecommendationUI25RecommendationsController_subtitleControllerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24C5C31B0](v2);
  return (_TtP21CloudRecommendationUI40RecommendationSubtitleControllerDelegate_ *)v3;
}

- (void)setSubtitleControllerDelegate:(id)a3
{
}

- (_TtC21CloudRecommendationUI25RecommendationsController)initWithAccount:(id)a3
{
  sub_24A397778();
  id v4 = a3;
  v5 = (void *)sub_24A397768();
  type metadata accessor for RecommendationsController();
  swift_allocObject();
  v6 = (_TtC21CloudRecommendationUI25RecommendationsController *)sub_24A32B314(v4, v5, 0);

  swift_deallocPartialClassInstance();
  return v6;
}

- (void)fetchAllWithShouldRefreshBreakout:(BOOL)a3
{
  BOOL v3 = a3;
  swift_retain();
  sub_24A3196C8();
  sub_24A318FA4(0, v3);
  swift_retain();
  sub_24A307DB4();
  swift_release();
  swift_release();
}

- (void)refresh
{
  swift_retain();
  sub_24A318FA4(0, 1);
  swift_retain();
  sub_24A307DB4();
  swift_release();
  swift_release();
}

- (void)refreshEligibleRecommendationsWithShouldSendDisplayedStatus:(BOOL)a3 shouldRefreshBreakout:(BOOL)a4
{
  swift_retain();
  sub_24A318D64(a3, a4);
  swift_release();
}

- (void)accountDidChange:(id)a3
{
  uint64_t v3 = sub_24A397468();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A397448();
  swift_retain();
  sub_24A3287B8((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end