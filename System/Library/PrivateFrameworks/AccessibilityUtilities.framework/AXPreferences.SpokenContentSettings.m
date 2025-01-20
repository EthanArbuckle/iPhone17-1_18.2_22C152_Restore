@interface AXPreferences.SpokenContentSettings
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings)init;
- (void)setForLanguage:(NSString *)a3 voiceSelection:(AXCVoiceSelection *)a4 completionHandler:(id)a5;
- (void)setWithVoiceId:(NSString *)a3 forLanguage:(NSString *)a4 completionHandler:(id)a5;
- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 exists:(BOOL *)a4 completionHandler:(id)a5;
- (void)voiceSelectionForLanguage:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation AXPreferences.SpokenContentSettings

- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 exists:(BOOL *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E91B2148);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
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
  v16[4] = &unk_1E91B21B8;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B21C0;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B21C8, (uint64_t)v17);
  swift_release();
}

- (void)voiceSelectionForLanguage:(NSString *)a3 completionHandler:(id)a4
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
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E91B2198;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E91B21A0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18D3F5FAC((uint64_t)v10, (uint64_t)&unk_1E91B21A8, (uint64_t)v15);
  swift_release();
}

- (void)setForLanguage:(NSString *)a3 voiceSelection:(AXCVoiceSelection *)a4 completionHandler:(id)a5
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
  v16[4] = &unk_1E91B2178;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B2180;
  v17[5] = v16;
  uint64_t v18 = a3;
  v19 = a4;
  uint64_t v20 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B2188, (uint64_t)v17);
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
  v16[4] = &unk_1E91B2158;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E91B2160;
  v17[5] = v16;
  uint64_t v18 = a3;
  v19 = a4;
  uint64_t v20 = self;
  sub_18D3F5FAC((uint64_t)v12, (uint64_t)&unk_1E91B2168, (uint64_t)v17);
  swift_release();
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings)init
{
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings *)AXPreferences.SpokenContentSettings.init()();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings__voiceSelectionsByLanguage));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings__macroLanguageDisambiguations);
}

@end