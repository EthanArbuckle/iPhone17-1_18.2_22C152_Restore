@interface CLBAdminSceneDelegate
- (BOOL)handleEvent:(id)a3;
- (BOOL)isShowingAdminSettings;
- (BOOL)isShowingModalView;
- (CLBAdminSceneDelegate)init;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setIsShowingAdminSettings:(BOOL)a3;
- (void)setIsShowingModalView:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation CLBAdminSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CLBAdminSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isShowingModalView
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingModalView);
}

- (void)setIsShowingModalView:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingModalView) = a3;
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_window);
  if (v3) {
    objc_msgSend(v3, "setAccessibilityViewIsModal:");
  }
}

- (BOOL)isShowingAdminSettings
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingAdminSettings);
}

- (void)setIsShowingAdminSettings:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingAdminSettings) = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100088698();
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 type];
  if (v6 == (id)5)
  {
    sub_100029F90(&qword_10017E440);
    sub_10007F854();
    Subject<>.send()();
  }

  return v6 == (id)5;
}

- (CLBAdminSceneDelegate)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_window) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingModalView) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CLBAdminSceneDelegate_isShowingAdminSettings) = 0;
  uint64_t v3 = OBJC_IVAR___CLBAdminSceneDelegate_showAdminViewPublisher;
  sub_100029F90(&qword_10017E440);
  swift_allocObject();
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)PassthroughSubject.init()();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AdminSceneDelegate();
  return [(CLBAdminSceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  swift_release();
}

@end