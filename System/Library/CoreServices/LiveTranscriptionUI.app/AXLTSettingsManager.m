@interface AXLTSettingsManager
+ (AXLTSettingsManager)shared;
- (AXLTSettingsManager)init;
- (BOOL)transcriptionEnabledObjc;
- (_TtP19LiveTranscriptionUI27AXLTSettingsManagerProtocol_)delegate;
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

- (_TtP19LiveTranscriptionUI27AXLTSettingsManagerProtocol_)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP19LiveTranscriptionUI27AXLTSettingsManagerProtocol_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (AXLTSettingsManager)shared
{
  if (qword_10006AE20 != -1) {
    swift_once();
  }
  v2 = (void *)static AXLTSettingsManager.shared;

  return (AXLTSettingsManager *)v2;
}

- (AXLTSettingsManager)init
{
  return (AXLTSettingsManager *)sub_10002F580();
}

- (void)updateNubbitIdleOpacity
{
  v2 = self;
  sub_100030538();
}

- (void)updateFont
{
}

- (void)updateTextColor
{
  v2 = self;
  sub_100030830();
}

- (void)updateBackgroundColor
{
  v2 = self;
  sub_100030BF4();
}

- (void)updateTranscriptionEnabled
{
}

- (void).cxx_destruct
{
  sub_1000314D0((uint64_t)self + OBJC_IVAR___AXLTSettingsManager_delegate);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (id)fontObjc
{
  v3 = self;
  uint64_t v4 = qword_10006AE18;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  id v6 = [v3 preferredFontForTextStyle:textFontStyle];

  return v6;
}

- (id)textColorObjc
{
  return sub_100031334();
}

- (id)backgroundColorObjc
{
  return sub_100031334();
}

- (BOOL)transcriptionEnabledObjc
{
  return _AXSLiveTranscriptionEnabled() != 0;
}

@end