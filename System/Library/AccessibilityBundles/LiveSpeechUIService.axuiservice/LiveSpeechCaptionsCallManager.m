@interface LiveSpeechCaptionsCallManager
+ (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager)shared;
- (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager)init;
- (void)handleCallStatusChanged:(id)a3;
@end

@implementation LiveSpeechCaptionsCallManager

+ (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager)shared
{
  if (qword_D7DB0 != -1) {
    swift_once();
  }
  v2 = (void *)static LiveSpeechCaptionsCallManager.shared;

  return (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager *)v2;
}

- (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager)init
{
  return (_TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager *)LiveSpeechCaptionsCallManager.init()();
}

- (void)handleCallStatusChanged:(id)a3
{
  uint64_t v4 = sub_A58D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A58A0();
  v8 = self;
  sub_8BB54();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager_callCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager_callQueue));
  v3 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager__currentCallEvent;
  uint64_t v4 = sub_7AF4(&qword_DA9C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager_observers));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager__currentCallCount;
  uint64_t v6 = sub_7AF4(&qword_DA9C0);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService29LiveSpeechCaptionsCallManager__currentVideoCallCount;

  v8(v7, v6);
}

@end