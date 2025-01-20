@interface AXPreferences.AssistiveTouch
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch)init;
- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation AXPreferences.AssistiveTouch

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
  v14[4] = &unk_1E91B28C8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B2160;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B2168, (uint64_t)v15);
  swift_release();
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch)init
{
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch *)AXPreferences.AssistiveTouch.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__useNinePointCalibration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__defaultVoiceSelectionsByLanguage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__scannerSpeechEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__scannerSpeechShouldSpeakTraits));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__scannerSpeechIsInterruptedByScanning));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__eyeTrackingUseZoomForKeyboardKeys));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch__switchControlPointPickerModeEnabled);
}

@end