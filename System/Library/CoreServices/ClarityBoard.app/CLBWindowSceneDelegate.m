@interface CLBWindowSceneDelegate
- (BOOL)handleEvent:(id)a3;
- (CLBApplicationInfo)currentApplication;
- (CLBWindowSceneDelegate)init;
- (UIWindow)window;
- (void)didDisableSecureMode:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setCurrentApplication:(id)a3;
- (void)setWindow:(id)a3;
- (void)willEnableSecureMode:(id)a3;
@end

@implementation CLBWindowSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CLBWindowSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBWindowSceneDelegate_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBWindowSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (CLBWindowSceneDelegate)init
{
  return (CLBWindowSceneDelegate *)sub_10003B7E0();
}

- (CLBApplicationInfo)currentApplication
{
  return (CLBApplicationInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CLBWindowSceneDelegate_currentApplication));
}

- (void)setCurrentApplication:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBWindowSceneDelegate_currentApplication);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBWindowSceneDelegate_currentApplication) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_10003B9D8(v4);
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10003CDD4();
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10003BDCC(v4);

  return self & 1;
}

- (void)willEnableSecureMode:(id)a3
{
}

- (void)didDisableSecureMode:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CLBWindowSceneDelegate_currentApplication);
}

@end