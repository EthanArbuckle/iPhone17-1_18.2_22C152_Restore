@interface CKClarityUISceneDelegate
- (CKClarityUISceneDelegate)init;
- (UIWindow)window;
- (void)setWindow:(id)a3;
@end

@implementation CKClarityUISceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (CKClarityUISceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CKClarityUISceneDelegate_window) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUISceneDelegate();
  return [(CKClarityUISceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end