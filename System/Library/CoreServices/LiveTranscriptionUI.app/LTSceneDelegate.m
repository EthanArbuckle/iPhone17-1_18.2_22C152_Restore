@interface LTSceneDelegate
- (_TtC19LiveTranscriptionUI15LTSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation LTSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10001FED4(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
}

- (_TtC19LiveTranscriptionUI15LTSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_systemLanguageChanged) = (Class)sub_10001F460;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19LiveTranscriptionUI15LTSceneDelegate_featureEnabledChanged) = (Class)sub_10001F6E4;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LTSceneDelegate();
  return [(LTSceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
}

@end