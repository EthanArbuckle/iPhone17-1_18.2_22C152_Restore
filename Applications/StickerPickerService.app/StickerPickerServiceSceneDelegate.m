@interface StickerPickerServiceSceneDelegate
- (UIWindow)window;
- (_TtC20StickerPickerService33StickerPickerServiceSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
@end

@implementation StickerPickerServiceSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100007B34(v8);
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a6;
  v11 = self;
  sub_100007D48(v9, a4);

  swift_unknownObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007FA4(v4, "sceneDidDisconnect %@");
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007FA4(v4, "sceneDidBecomeActive %@");
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007FA4(v4, "sceneWillResignActive %@");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006D34(v4);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100008180(v4);
}

- (_TtC20StickerPickerService33StickerPickerServiceSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerPickerServiceSceneDelegate();
  return [(StickerPickerServiceSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window));
}

@end