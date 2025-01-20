@interface LTApplication
- (_TtC19LiveTranscriptionUI13LTApplication)init;
@end

@implementation LTApplication

- (_TtC19LiveTranscriptionUI13LTApplication)init
{
  [self registerLiveCaptionsPID];
  static os_log_type_t.debug.getter();
  if (qword_10006AD90 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LTApplication();
  return [(LTApplication *)&v4 init];
}

@end