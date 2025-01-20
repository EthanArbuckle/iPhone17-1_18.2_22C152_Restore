@interface _SceneFactory._Scene
- (BOOL)shouldAcceptConnection:(id)a3;
- (UIViewController)viewController;
- (_TtCC12ExtensionKit13_SceneFactory6_Scene)init;
- (void)setViewController:(id)a3;
@end

@implementation _SceneFactory._Scene

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController));
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController) = (Class)a3;
  id v3 = a3;
}

- (_TtCC12ExtensionKit13_SceneFactory6_Scene)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController) = 0;
  v2 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_connectionHandler);
  *v2 = sub_2156EF908;
  v2[1] = 0;
  id v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_innerView) = (Class)sub_21570E008();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for _SceneFactory._Scene();
  return [(_SceneFactory._Scene *)&v5 init];
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return sub_215708DBC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_connectionHandler);
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end