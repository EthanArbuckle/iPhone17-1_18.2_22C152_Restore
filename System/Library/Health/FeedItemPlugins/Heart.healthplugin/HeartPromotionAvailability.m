@interface HeartPromotionAvailability
- (_TtC5Heart26HeartPromotionAvailability)init;
- (void)dealloc;
- (void)heartRhythmAvailabilityDidUpdate;
@end

@implementation HeartPromotionAvailability

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_heartRhythmAvailability);
  v3 = self;
  objc_msgSend(v2, sel_removeHeartRhythmAvailabilityObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for HeartPromotionAvailability();
  [(HeartPromotionAvailability *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_heartRhythmAvailability));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__atrialFibrillationAvailabilityResult;
  sub_240B617E8(0, &qword_26AFD8B30);
  uint64_t v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v6(v3, v4);
  v7 = (char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__aFibBurdenAvailabilityResult;
  sub_240B617E8(0, &qword_26AFD8B38);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v6((char *)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability__aFibFeaturesAvailabilityResult, v5);
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_irregularRhythmNotificationsStatusManager);
  swift_release();
  sub_240B61A54((uint64_t)self + OBJC_IVAR____TtC5Heart26HeartPromotionAvailability_aFibBurdenFeatureStatusManager, (uint64_t (*)(void))sub_240A1F8F8);
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC5Heart26HeartPromotionAvailability)init
{
  result = (_TtC5Heart26HeartPromotionAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)heartRhythmAvailabilityDidUpdate
{
  v2 = self;
  sub_240B60938();
}

@end