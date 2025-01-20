@interface ScreenRecorder
- (_TtC11AssetViewer14ScreenRecorder)init;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ScreenRecorder

- (_TtC11AssetViewer14ScreenRecorder)init
{
  return (_TtC11AssetViewer14ScreenRecorder *)sub_1E29577CC();
}

- (void).cxx_destruct
{
  sub_1E28742B0((uint64_t)self + OBJC_IVAR____TtC11AssetViewer14ScreenRecorder_url);
  swift_unknownObjectRelease();
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11AssetViewer14ScreenRecorder____lazy_storage___userNotificationCenter);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void (*)(void *, uint64_t))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 7);
  _Block_release(v8);
}

@end