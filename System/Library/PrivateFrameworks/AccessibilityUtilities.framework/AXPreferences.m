@interface AXPreferences
+ (AXPreferences)shared;
+ (void)setShared:(id)a3;
- (AXPreferences)init;
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences10LiveSpeech)liveSpeech;
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch)assistiveTouch;
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings)spokenContent;
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9Magnifier)magnifier;
- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver)voiceover;
- (void)setAssistiveTouch:(id)a3;
- (void)setLiveSpeech:(id)a3;
- (void)setMagnifier:(id)a3;
- (void)setSpokenContent:(id)a3;
- (void)setVoiceover:(id)a3;
@end

@implementation AXPreferences

- (AXPreferences)init
{
  return (AXPreferences *)AXPreferences.init()();
}

+ (AXPreferences)shared
{
  if (qword_1E91B2048 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (AXPreferences *)(id)qword_1E91B2AE0;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1E91B2048;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1E91B2AE0;
  qword_1E91B2AE0 = (uint64_t)v4;
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver)voiceover
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_voiceover);
  swift_beginAccess();
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9VoiceOver *)*v2;
}

- (void)setVoiceover:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_voiceover);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9Magnifier)magnifier
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_magnifier);
  swift_beginAccess();
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences9Magnifier *)*v2;
}

- (void)setMagnifier:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_magnifier);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings)spokenContent
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_spokenContent);
  swift_beginAccess();
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences21SpokenContentSettings *)*v2;
}

- (void)setSpokenContent:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_spokenContent);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch)assistiveTouch
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_assistiveTouch);
  swift_beginAccess();
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences14AssistiveTouch *)*v2;
}

- (void)setAssistiveTouch:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_assistiveTouch);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (_TtCE22AccessibilityUtilitiesCSo13AXPreferences10LiveSpeech)liveSpeech
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_liveSpeech);
  swift_beginAccess();
  return (_TtCE22AccessibilityUtilitiesCSo13AXPreferences10LiveSpeech *)*v2;
}

- (void)setLiveSpeech:(id)a3
{
  id v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_liveSpeech);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___AXPreferences_liveSpeech);
}

@end