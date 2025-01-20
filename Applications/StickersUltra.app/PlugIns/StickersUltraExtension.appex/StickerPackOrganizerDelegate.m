@interface StickerPackOrganizerDelegate
- (_TtC22StickersUltraExtension28StickerPackOrganizerDelegate)init;
- (id)dragControllerTranscriptDelegate;
- (void)browserAppManagerDidSelectPlugin:(id)a3;
- (void)dismiss;
- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6;
- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6;
@end

@implementation StickerPackOrganizerDelegate

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  sub_1000074E0(&qword_1000AB110);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  if (a3)
  {
    sub_100078F30();
    uint64_t v12 = sub_100078F50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_100078F50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  if (a4) {
    sub_10007A250();
  }
  if (v11)
  {
    v14 = self;
    _Block_release(v11);
  }
  swift_bridgeObjectRelease();
  sub_100007524((uint64_t)v10);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  sub_1000074E0(&qword_1000AB110);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  if (a3)
  {
    sub_100078F30();
    uint64_t v14 = sub_100078F50();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_100078F50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  if (a4) {
    sub_10007A250();
  }
  if (a5) {
    sub_10007A250();
  }
  v16 = self;
  if (v13) {
    _Block_release(v13);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_100007524((uint64_t)v12);
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a3) {
    sub_10007A250();
  }
  if (a4) {
    sub_10007A250();
  }
  if (a5) {
    sub_10007A250();
  }
  uint64_t v11 = self;
  if (v10) {
    _Block_release(v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)dismiss
{
  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC22StickersUltraExtension28StickerPackOrganizerDelegate_requestDismiss);
  v3 = self;
  v2();
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100006EC8(a3);
}

- (_TtC22StickersUltraExtension28StickerPackOrganizerDelegate)init
{
  result = (_TtC22StickersUltraExtension28StickerPackOrganizerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end