@interface RecentsHomeScreenWidgetIntentHandler
- (_TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler)init;
- (id)defaultLocationForOpenLocation:(id)a3;
- (void)provideLocationOptionsCollectionForOpenLocation:(id)a3 withCompletion:(id)a4;
@end

@implementation RecentsHomeScreenWidgetIntentHandler

- (void)provideLocationOptionsCollectionForOpenLocation:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100004FAC((uint64_t)sub_100005B84, v7);

  swift_release();
}

- (id)defaultLocationForOpenLocation:(id)a3
{
  sub_100005A58();
  return v3;
}

- (_TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler)init
{
  return (_TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler *)sub_100003698();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchQueue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchGroup));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favoritesSource));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_pickFolderSource);
}

@end