@interface ContactsLimitedAccessPromptSceneDelegate
- (UIWindow)window;
- (_TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ContactsLimitedAccessPromptSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001ADEC(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  exit(0);
}

- (_TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptSceneDelegate();
  return [(ContactsLimitedAccessPromptSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_window));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC23LimitedAccessPromptView40ContactsLimitedAccessPromptSceneDelegate_rootVc);
}

@end