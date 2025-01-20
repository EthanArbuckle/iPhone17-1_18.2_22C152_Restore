@interface StickerDataSource
- (_TtC25ActivityMessagesExtension17StickerDataSource)init;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (id)stickersForAchievement:(id)a3;
- (id)stickersForAchievements:(id)a3;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
@end

@implementation StickerDataSource

- (_TtC25ActivityMessagesExtension17StickerDataSource)init
{
  return (_TtC25ActivityMessagesExtension17StickerDataSource *)sub_100005984();
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1000112B8();

  return v6;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = sub_1000118E4(a4);

  return v8;
}

- (id)stickersForAchievements:(id)a3
{
  sub_100011620(0, &qword_10001CD40);
  unint64_t v4 = sub_100015008();
  v5 = self;
  sub_10000841C(v4);

  swift_bridgeObjectRelease();
  sub_100011620(0, &qword_10001CD58);
  v6.super.isa = sub_100014FF8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)stickersForAchievement:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100009334((uint64_t)v4);

  sub_100011620(0, &qword_10001CD58);
  v6.super.isa = sub_100014FF8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void).cxx_destruct
{
  sub_100011AD4((uint64_t)self + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_resourceProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_healthStore));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_awardQuery));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end