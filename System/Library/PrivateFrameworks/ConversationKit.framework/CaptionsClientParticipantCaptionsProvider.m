@interface CaptionsClientParticipantCaptionsProvider
- (_TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider)init;
- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4;
- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5;
- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4;
- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5;
- (void)captionsServerDidDie:(id)a3;
- (void)dealloc;
@end

@implementation CaptionsClientParticipantCaptionsProvider

- (void)dealloc
{
  v2 = self;
  CaptionsClientParticipantCaptionsProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_26_2();
  v3();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider_participantCaptionsProviderDelegate);
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider_avcCaptionsClient);
}

- (_TtC15ConversationKit41CaptionsClientParticipantCaptionsProvider)init
{
}

- (void)captionsClient:(id)a3 didEnableCaptions:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didEnableCaptions:error:)((uint64_t)v10, a4, a5);
}

- (void)captionsClient:(id)a3 didDisableCaptions:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didDisableCaptions:error:)((uint64_t)v10, a4, a5);
}

- (void)captionsClient:(id)a3 didStartCaptioningWithReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didStartCaptioningWith:)((uint64_t)v7, v4);
}

- (void)captionsClient:(id)a3 didStopCaptioningWithReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didStopCaptioningWith:)((uint64_t)v7, v4);
}

- (void)captionsClient:(id)a3 didUpdateCaptions:(id)a4 source:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didUpdateCaptions:source:)((uint64_t)v9, a4);
}

- (void)captionsServerDidDie:(id)a3
{
  id v4 = a3;
  v5 = self;
  CaptionsClientParticipantCaptionsProvider.captionsServerDidDie(_:)();
}

- (void)captionsClient:(id)a3 didDetectGibberish:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CaptionsClientParticipantCaptionsProvider.captionsClient(_:didDetectGibberish:)((uint64_t)v7, a4);
}

@end