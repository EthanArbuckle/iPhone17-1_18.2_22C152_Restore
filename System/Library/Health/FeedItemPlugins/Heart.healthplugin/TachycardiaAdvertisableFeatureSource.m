@interface TachycardiaAdvertisableFeatureSource
- (_TtC5Heart36TachycardiaAdvertisableFeatureSource)init;
- (void)dealloc;
- (void)heartRhythmAvailabilityDidUpdate;
@end

@implementation TachycardiaAdvertisableFeatureSource

- (void)dealloc
{
  v3 = *(void **)(*sub_240A3466C((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider), *(void *)&self->heartSettingsUtilityProvider[OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider])+ 16);
  v4 = self;
  objc_msgSend(v3, sel_removeHeartRhythmAvailabilityObserver_, v4);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for TachycardiaAdvertisableFeatureSource();
  [(TachycardiaAdvertisableFeatureSource *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_healthStore));

  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_heartSettingsUtilityProvider);
  v3 = (char *)self + OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_identifier;
  uint64_t v4 = sub_240BB3670();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC5Heart36TachycardiaAdvertisableFeatureSource_delegate;

  sub_240A484BC((uint64_t)v5);
}

- (_TtC5Heart36TachycardiaAdvertisableFeatureSource)init
{
  result = (_TtC5Heart36TachycardiaAdvertisableFeatureSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)heartRhythmAvailabilityDidUpdate
{
  v2 = self;
  sub_240ABF3F4();
}

@end