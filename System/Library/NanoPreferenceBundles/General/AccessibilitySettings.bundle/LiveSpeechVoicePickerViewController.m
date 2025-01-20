@interface LiveSpeechVoicePickerViewController
- (BOOL)includeLocaleInSelectorDialog;
- (BOOL)showsSelectedVoiceVariantForLanguage;
- (LiveSpeechVoicePickerViewController)init;
- (id)speechSourceKey;
@end

@implementation LiveSpeechVoicePickerViewController

- (LiveSpeechVoicePickerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)LiveSpeechVoicePickerViewController;
  v2 = [(AXLanguageSpeechBaseController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(LiveSpeechSettingsModelController);
    [(AXLanguageSpeechBaseController *)v2 setSpeechModelController:v3];
  }
  return v2;
}

- (id)speechSourceKey
{
  return (id)*MEMORY[0x263F212D0];
}

- (BOOL)showsSelectedVoiceVariantForLanguage
{
  return 1;
}

- (BOOL)includeLocaleInSelectorDialog
{
  return 0;
}

@end