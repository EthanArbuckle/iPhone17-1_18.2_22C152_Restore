@interface FavoritesItemsSource
- (_TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource)init;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
@end

@implementation FavoritesItemsSource

- (_TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource)init
{
  return (_TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource *)sub_100004240();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_queue));
  sub_100004790(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource____lazy_storage___itemCollection);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100004050(1);
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  sub_100004050(1);
  _Block_release(v6);
}

@end