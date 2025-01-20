@interface AXLTSettingsManager
+ (AXLTSettingsManager)shared;
- (AXLTSettingsManager)init;
- (BOOL)transcriptionEnabledObjc;
- (_TtP19LiveSpeechUIService27AXLTSettingsManagerProtocol_)delegate;
- (id)backgroundColorObjc;
- (id)fontObjc;
- (id)textColorObjc;
- (void)setDelegate:(id)a3;
- (void)updateBackgroundColor;
- (void)updateFont;
- (void)updateNubbitIdleOpacity;
- (void)updateTextColor;
- (void)updateTranscriptionEnabled;
@end

@implementation AXLTSettingsManager

- (_TtP19LiveSpeechUIService27AXLTSettingsManagerProtocol_)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP19LiveSpeechUIService27AXLTSettingsManagerProtocol_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (AXLTSettingsManager)shared
{
  if (qword_D7E58 != -1) {
    swift_once();
  }
  v2 = (void *)static AXLTSettingsManager.shared;

  return (AXLTSettingsManager *)v2;
}

- (AXLTSettingsManager)init
{
  return (AXLTSettingsManager *)sub_A39C4();
}

- (void)updateNubbitIdleOpacity
{
  v2 = self;
  sub_A47EC();
}

- (void)updateFont
{
  v2 = self;
  sub_A4A24();
}

- (void)updateTextColor
{
  v2 = self;
  sub_A4B70();
}

- (void)updateBackgroundColor
{
  v2 = self;
  sub_A4F34();
}

- (void)updateTranscriptionEnabled
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    [v4 transcriptionEnabledDidChange];

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_33ACC((uint64_t)self + OBJC_IVAR___AXLTSettingsManager_delegate);
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXLTSettingsManager__contentCategory);
}

- (id)fontObjc
{
  v3 = self;
  uint64_t v4 = qword_D7E48;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = [v3 preferredFontForTextStyle:textFontStyle];

  return v6;
}

- (id)textColorObjc
{
  return sub_A5650();
}

- (id)backgroundColorObjc
{
  return sub_A5650();
}

- (BOOL)transcriptionEnabledObjc
{
  return _AXSLiveTranscriptionEnabled() != 0;
}

@end