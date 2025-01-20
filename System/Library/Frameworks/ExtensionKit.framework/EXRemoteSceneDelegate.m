@interface EXRemoteSceneDelegate
- (EXRemoteSceneDelegate)init;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation EXRemoteSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___EXRemoteSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_2156FD314((uint64_t)v8, v9);
}

- (EXRemoteSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___EXRemoteSceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EXRemoteSceneDelegate();
  return [(EXRemoteSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end