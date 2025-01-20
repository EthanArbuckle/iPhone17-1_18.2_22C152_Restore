@interface HearingRecord
- (NSString)debugDescription;
- (_TtC16HeadphoneManager13HearingRecord)init;
- (char)hearingAidEnabled;
- (char)hearingAssistEnabled;
- (char)listeningModeOffAllowed;
- (char)mediaAssistEnabled;
- (char)pmeMediaEnabled;
- (char)pmeVoiceEnabled;
- (char)swipeGainEnabled;
- (float)amplification;
- (float)balance;
- (float)beamFormer;
- (float)noiseSuppression;
- (float)tone;
- (void)setAmplification:(float)a3;
- (void)setBalance:(float)a3;
- (void)setBeamFormer:(float)a3;
- (void)setHearingAidEnabled:(char)a3;
- (void)setHearingAssistEnabled:(char)a3;
- (void)setListeningModeOffAllowed:(char)a3;
- (void)setMediaAssistEnabled:(char)a3;
- (void)setNoiseSuppression:(float)a3;
- (void)setPmeMediaEnabled:(char)a3;
- (void)setPmeVoiceEnabled:(char)a3;
- (void)setSwipeGainEnabled:(char)a3;
- (void)setTone:(float)a3;
@end

@implementation HearingRecord

- (float)amplification
{
  v2 = self;
  float v5 = HearingRecord.amplification.getter();

  return v5;
}

- (void)setAmplification:(float)a3
{
  v3 = self;
  HearingRecord.amplification.setter(a3);
}

- (float)balance
{
  v2 = self;
  float v5 = HearingRecord.balance.getter();

  return v5;
}

- (void)setBalance:(float)a3
{
  v3 = self;
  HearingRecord.balance.setter(a3);
}

- (float)beamFormer
{
  v2 = self;
  float v5 = HearingRecord.beamFormer.getter();

  return v5;
}

- (void)setBeamFormer:(float)a3
{
  v3 = self;
  HearingRecord.beamFormer.setter(a3);
}

- (float)noiseSuppression
{
  v2 = self;
  float v5 = HearingRecord.noiseSuppression.getter();

  return v5;
}

- (void)setNoiseSuppression:(float)a3
{
  v3 = self;
  HearingRecord.noiseSuppression.setter(a3);
}

- (float)tone
{
  v2 = self;
  float v5 = HearingRecord.tone.getter();

  return v5;
}

- (void)setTone:(float)a3
{
  v3 = self;
  HearingRecord.tone.setter(a3);
}

- (char)pmeVoiceEnabled
{
  v2 = self;
  char v5 = HearingRecord.pmeVoiceEnabled.getter();

  return v5;
}

- (void)setPmeVoiceEnabled:(char)a3
{
  v3 = self;
  HearingRecord.pmeVoiceEnabled.setter(a3);
}

- (char)pmeMediaEnabled
{
  v2 = self;
  char v5 = HearingRecord.pmeMediaEnabled.getter();

  return v5;
}

- (void)setPmeMediaEnabled:(char)a3
{
  v3 = self;
  HearingRecord.pmeMediaEnabled.setter(a3);
}

- (char)mediaAssistEnabled
{
  v2 = self;
  char v5 = HearingRecord.mediaAssistEnabled.getter();

  return v5;
}

- (void)setMediaAssistEnabled:(char)a3
{
  v3 = self;
  HearingRecord.mediaAssistEnabled.setter(a3);
}

- (char)hearingAssistEnabled
{
  v2 = self;
  char v5 = HearingRecord.hearingAssistEnabled.getter();

  return v5;
}

- (void)setHearingAssistEnabled:(char)a3
{
  v3 = self;
  HearingRecord.hearingAssistEnabled.setter(a3);
}

- (char)swipeGainEnabled
{
  v2 = self;
  char v5 = HearingRecord.swipeGainEnabled.getter();

  return v5;
}

- (void)setSwipeGainEnabled:(char)a3
{
  v3 = self;
  HearingRecord.swipeGainEnabled.setter(a3);
}

- (char)hearingAidEnabled
{
  v2 = self;
  char v5 = HearingRecord.hearingAidEnabled.getter();

  return v5;
}

- (void)setHearingAidEnabled:(char)a3
{
  v3 = self;
  HearingRecord.hearingAidEnabled.setter(a3);
}

- (char)listeningModeOffAllowed
{
  v2 = self;
  char v5 = HearingRecord.listeningModeOffAllowed.getter();

  return v5;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  v3 = self;
  HearingRecord.listeningModeOffAllowed.setter(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v6 = HearingRecord.debugDescription.getter();
  uint64_t v7 = v3;

  id v8 = (id)MEMORY[0x253385EB0](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (_TtC16HeadphoneManager13HearingRecord)init
{
  return (_TtC16HeadphoneManager13HearingRecord *)HearingRecord.init()();
}

- (void).cxx_destruct
{
  outlined destroy of HearingRecordConfig<HearingRecord, Float>();
  outlined destroy of HearingRecordConfig<HearingRecord, Float>();
  outlined destroy of HearingRecordConfig<HearingRecord, Float>();
  outlined destroy of HearingRecordConfig<HearingRecord, Float>();
  outlined destroy of HearingRecordConfig<HearingRecord, Float>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  uint64_t v3 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__bluetoothAddress;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<String>);
  char v5 = *(void (**)(char *))(*(void *)(v4 - 8) + 8);
  v5((char *)self + v3);
  ((void (*)(char *, uint64_t))v5)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__bluetoothUUID, v4);
  uint64_t v6 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hideOffModeCapability;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<HMMultiState>);
  v9 = *(void (**)(char *))(*(void *)(v8 - 8) + 8);
  v9((char *)self + v6);
  ((void (*)(char *, uint64_t))v9)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingAssistCapability, v8);
  ((void (*)(char *, uint64_t))v9)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingAssistEnrolled, v8);
  uint64_t v7 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingAssistRegionStatus;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<HMRegionStatus>);
  v11 = *(void (**)(char *))(*(void *)(v10 - 8) + 8);
  v11((char *)self + v7);
  ((void (*)(char *, uint64_t))v11)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingProtectionRegionStatus, v10);
  ((void (*)(char *, uint64_t))v9)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingProtectionCapability, v8);
  outlined destroy of HearingRecordConfig<HearingRecord, HMMultiState>();
  ((void (*)(char *, uint64_t))v11)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingTestRegionStatus, v10);
  uint64_t v12 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__earLossArrayLeft;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[NSNumber]>);
  v14 = *(void (**)(char *))(*(void *)(v13 - 8) + 8);
  v14((char *)self + v12);
  ((void (*)(char *, uint64_t))v14)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__earLossArrayRight, v13);
  uint64_t v15 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__hearingProtectionOcclusionResult;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<HMOcclusionResult>);
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v15);
  uint64_t v16 = OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__validAudiograms;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[HKAudiogramSample]>);
  v18 = *(void (**)(char *))(*(void *)(v17 - 8) + 8);
  v18((char *)self + v16);
  ((void (*)(char *, uint64_t))v18)((char *)self + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord__invalidAudiograms, v17);
  outlined destroy of HMDeviceRecord?((id *)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16HeadphoneManager13HearingRecord_deviceRecord));
}

@end