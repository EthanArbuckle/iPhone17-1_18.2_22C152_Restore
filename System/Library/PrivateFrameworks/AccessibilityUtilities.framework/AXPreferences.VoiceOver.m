@interface AXPreferences.VoiceOver
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver)init;
- (void)effectiveSpeakingRateWithCompletionHandler:(id)a3;
- (void)effectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 completionHandler:(id)a4;
- (void)effectiveSpeakingVolumeWithCompletionHandler:(id)a3;
- (void)effectiveSpeakingVolumeWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 completionHandler:(id)a4;
- (void)setEffectiveSpeakingRate:(float)a3 completionHandler:(id)a4;
- (void)setEffectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 value:(float)a4 completionHandler:(id)a5;
- (void)setEffectiveSpeakingVolume:(float)a3 completionHandler:(id)a4;
- (void)setEffectiveSpeakingVolumeWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 value:(float)a4 completionHandler:(id)a5;
- (void)setWithVoiceId:(NSString *)a3 forLanguage:(NSString *)a4 completionHandler:(id)a5;
- (void)setWithVoiceId:(id)a3 forLanguage:(id)a4 rate:(float)a5 volume:(float)a6 pitch:(float)a7;
- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation AXPreferences.VoiceOver

- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B2528;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B2530;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B2538, (uint64_t)v15);
  swift_release();
}

- (void)setWithVoiceId:(NSString *)a3 forLanguage:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E91B2508;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B2510;
  v17[5] = v16;
  uint64_t v18 = a3;
  v19 = a4;
  v20 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B2518, (uint64_t)v17);
  swift_release();
}

- (void)setWithVoiceId:(id)a3 forLanguage:(id)a4 rate:(float)a5 volume:(float)a6 pitch:(float)a7
{
  if (a3)
  {
    uint64_t v11 = sub_18D40A7F8();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_18D40A7F8();
  v16 = v15;
  v17 = self;
  v18.value._countAndFlagsBits = v11;
  v18.value._object = v13;
  v19._countAndFlagsBits = v14;
  v19._object = v16;
  AXPreferences.VoiceOver.set(voiceId:forLanguage:rate:volume:pitch:)(v18, v19, a5, a6, a7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)effectiveSpeakingVolumeWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E91B24E8;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E91B24F0;
  v13[5] = v12;
  uint64_t v14 = self;
  sub_18D3F5FAC((uint64_t)v8, (uint64_t)&unk_1E91B24F8, (uint64_t)v13);
  swift_release();
}

- (void)effectiveSpeakingVolumeWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B24C8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B24D0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B24D8, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingVolume:(float)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(float *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B24A8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B24B0;
  v15[5] = v14;
  v16 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B24B8, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingVolumeWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 value:(float)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(float *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = self;
  uint64_t v15 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E91B2488;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B2490;
  v17[5] = v16;
  uint64_t v18 = a3;
  Swift::String v19 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B2498, (uint64_t)v17);
  swift_release();
}

- (void)effectiveSpeakingRateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E91B2468;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E91B2470;
  v13[5] = v12;
  uint64_t v14 = self;
  sub_18D3F5FAC((uint64_t)v8, (uint64_t)&unk_1E91B2478, (uint64_t)v13);
  swift_release();
}

- (void)effectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B2448;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B2450;
  v15[5] = v14;
  v16 = a3;
  uint64_t v17 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B2458, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingRate:(float)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(float *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B2428;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B2430;
  v15[5] = v14;
  v16 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B2438, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 value:(float)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(float *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = self;
  uint64_t v15 = sub_18D40A938();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E91B2418;
  v16[5] = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B2160;
  v17[5] = v16;
  uint64_t v18 = a3;
  Swift::String v19 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B2168, (uint64_t)v17);
  swift_release();
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver)init
{
  AXPreferences.VoiceOver.init()();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__defaultVoiceSelectionsByLanguage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__voiceRotors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver___oldDomainRotors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__currentRotorVoiceIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__largeCursorEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__contentDescriptionLevel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__useDigitalCrownNavigation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__imageCaptionsEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__useTVToggleStyleNavigation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__continuousPathKeyboardStartTimeout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__hearingAidRoutingEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__braillePanningAutoTurnsReadingContent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleDisplayOutputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleDisplayInputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesInputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleDisplaySyncInputOutputTables));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleDisplayInputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleDisplayOutputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesInputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesActivationGestureEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesSoundOption));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesUsesHapticFeedback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesUsesTypingSoundFeedback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesDisplayEnteredText));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__brailleGesturesAutoActivateOnTextFields));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__perkinsKeyboardInputEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__perkinsChordKeyboardInputEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__defaultPunctuationGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__activities));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__selectedActivityId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__languageDetectionEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__pitchChangeEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__selectedLanguage));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver__speakUpEnabled);
}

@end