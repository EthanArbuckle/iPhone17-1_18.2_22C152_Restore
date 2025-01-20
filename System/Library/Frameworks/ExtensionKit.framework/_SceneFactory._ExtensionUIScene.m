@interface _SceneFactory._ExtensionUIScene
- (BOOL)shouldAcceptConnection:(id)a3;
- (UISceneDelegate)sceneDelegate;
- (_TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene)init;
@end

@implementation _SceneFactory._ExtensionUIScene

- (UISceneDelegate)sceneDelegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (UISceneDelegate *)v2;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return sub_215708DBC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene_connectionHandler);
}

- (_TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene)init
{
  result = (_TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end