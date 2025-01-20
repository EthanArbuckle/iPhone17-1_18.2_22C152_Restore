@interface CarPlaySceneDelegate
- (_TtC13InCallService20CarPlaySceneDelegate)init;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation CarPlaySceneDelegate

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10016B194();
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10016B224(v4);
}

- (_TtC13InCallService20CarPlaySceneDelegate)init
{
  return (_TtC13InCallService20CarPlaySceneDelegate *)sub_10016B3CC();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13InCallService20CarPlaySceneDelegate_hardwareControlsBroadcaster);
}

@end