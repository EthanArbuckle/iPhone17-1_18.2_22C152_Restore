@interface RadioWindowSceneDelegate
- (_TtC5Media24RadioWindowSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation RadioWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002C984(v8, v9);
}

- (void)sceneDidDisconnect:(id)a3
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    id v8 = a3;
    id v9 = self;
    id v10 = [v7 sharedApplication];
    id v11 = [v10 delegate];

    if (v11)
    {
      type metadata accessor for AppDelegate();
      swift_dynamicCastClassUnconditional();
      sub_10007D7B4(v6);

      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

- (_TtC5Media24RadioWindowSceneDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioWindowSceneDelegate();
  return [(RadioWindowSceneDelegate *)&v3 init];
}

@end