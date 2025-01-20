@interface AttendingStatesServiceHandler
- (_TtC9ASRBridge29AttendingStatesServiceHandler)init;
- (void)localAttendingStartedWithRootRequestId:(id)a3;
- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3;
- (void)localAttendingWillStartWithRootRequestId:(id)a3;
- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5;
- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3;
@end

@implementation AttendingStatesServiceHandler

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_2472016E0(a3);
}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  if (a5) {
    sub_247205FD8();
  }
  v6 = self;
  sub_2472045A4();

  swift_bridgeObjectRelease();
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  v4 = self;
  sub_247202560(a3);
}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  if (a5)
  {
    uint64_t v8 = sub_247205FD8();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v11 = self;
  sub_247202F68(a3, a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (_TtC9ASRBridge29AttendingStatesServiceHandler)init
{
  result = (_TtC9ASRBridge29AttendingStatesServiceHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  uint64_t v4 = sub_247204938();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher);
  swift_release();
}

@end