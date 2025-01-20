@interface LiveSpeechCaptionsViewsCoordinator
- (_TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator)init;
@end

@implementation LiveSpeechCaptionsViewsCoordinator

- (_TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator)init
{
  v2 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveSpeechFrame);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v3 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveCaptionsFrame);
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveSpeechViewToFront);
  void *v4 = LiveSpeechStore.SpeechContext.init(text:highlightRange:);
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveCaptionsAdjustFrame);
  void *v5 = LiveSpeechStore.SpeechContext.init(text:highlightRange:);
  v5[1] = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveSpeechWindowState) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC19LiveSpeechUIService34LiveSpeechCaptionsViewsCoordinator_liveCaptionsWindowState) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LiveSpeechCaptionsViewsCoordinator();
  return [(LiveSpeechCaptionsViewsCoordinator *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end