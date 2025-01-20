@interface RecommendationController
- (void)recommendationEnablementProgressDidUpdateWithRecommendationID:(id)a3 progress:(double)a4;
- (void)recommendationsDidUpdate;
@end

@implementation RecommendationController

- (void)recommendationsDidUpdate
{
  swift_retain();
  sub_4AC70();

  swift_release();
}

- (void)recommendationEnablementProgressDidUpdateWithRecommendationID:(id)a3 progress:(double)a4
{
  uint64_t v6 = sub_14F50(&qword_A3500);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_76C10();
  uint64_t v11 = v10;
  uint64_t v12 = sub_76D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(void *)(v13 + 32) = self;
  *(void *)(v13 + 40) = v9;
  *(void *)(v13 + 48) = v11;
  *(double *)(v13 + 56) = a4;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_52508((uint64_t)v8, (uint64_t)&unk_A3F88, v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end