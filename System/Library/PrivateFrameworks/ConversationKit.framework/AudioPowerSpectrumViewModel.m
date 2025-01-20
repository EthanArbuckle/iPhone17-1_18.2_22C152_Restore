@interface AudioPowerSpectrumViewModel
- (BOOL)isEqual:(id)a3;
- (_TtC15ConversationKit27AudioPowerSpectrumViewModel)init;
- (void)dealloc;
- (void)handleCallRecordingStateChanged:(id)a3;
- (void)handleCallStatusChanged:(id)a3;
@end

@implementation AudioPowerSpectrumViewModel

- (void)dealloc
{
  v2 = self;
  AudioPowerSpectrumViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel__localPowerSpectrum;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[Float]>);
  OUTLINED_FUNCTION_0();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel__remotePowerSpectrum, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_waveformColorRemote));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_waveformColorLocal));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_localWaveformFilter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_remoteWaveformFilter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_callCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_notificationCenter));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ConversationKit27AudioPowerSpectrumViewModel_audioPowerTapQueue);
}

- (void)handleCallStatusChanged:(id)a3
{
}

- (_TtC15ConversationKit27AudioPowerSpectrumViewModel)init
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v5 = self;
  }
  AudioPowerSpectrumViewModel.isEqual(_:)();
  char v7 = v6;

  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)v9, &demangling cache variable for type metadata for Any?);
  return v7 & 1;
}

- (void)handleCallRecordingStateChanged:(id)a3
{
}

@end