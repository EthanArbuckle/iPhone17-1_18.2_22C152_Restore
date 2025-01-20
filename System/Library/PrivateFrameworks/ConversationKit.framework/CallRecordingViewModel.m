@interface CallRecordingViewModel
- (_TtC15ConversationKit22CallRecordingViewModel)init;
- (void)tapContainer;
- (void)tapStopRecording;
@end

@implementation CallRecordingViewModel

- (_TtC15ConversationKit22CallRecordingViewModel)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22CallRecordingViewModel_service);
  swift_release();

  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22CallRecordingViewModel_countdownDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22CallRecordingViewModel_recordingDelegate);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CallRecordingViewModel.PresentedView?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v3();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit22CallRecordingViewModel_waveformViewModel);
}

- (void)tapStopRecording
{
  v2 = self;
  CallRecordingViewModel.tapStopRecording()();
}

- (void)tapContainer
{
  v2 = self;
  CallRecordingViewModel.tapContainer()();
}

@end