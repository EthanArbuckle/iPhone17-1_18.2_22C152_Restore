@interface CNKClarityUISceneDelegate
- (CNKClarityUISceneDelegate)init;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation CNKClarityUISceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (CNKClarityUISceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CNKClarityUISceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return [(CNKClarityUISceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end