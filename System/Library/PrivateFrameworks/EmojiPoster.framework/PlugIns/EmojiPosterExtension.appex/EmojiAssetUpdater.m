@interface EmojiAssetUpdater
- (_TtC20EmojiPosterExtension17EmojiAssetUpdater)init;
- (void)updateConfiguration:(id)a3 completion:(id)a4;
- (void)updateDescriptors:(id)a3 completion:(id)a4;
@end

@implementation EmojiAssetUpdater

- (_TtC20EmojiPosterExtension17EmojiAssetUpdater)init
{
  return (_TtC20EmojiPosterExtension17EmojiAssetUpdater *)EmojiAssetUpdater.init()();
}

- (void)updateDescriptors:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_10000A4A0(0, &qword_1000219C8);
  uint64_t v6 = sub_100017F48();
  _Block_copy(v5);
  v7 = self;
  sub_10000A4DC(v6, (uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)updateConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void (*)(void *, id, void))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6, v8, 0);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_logger;
  uint64_t v3 = sub_100017ED8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
}

@end