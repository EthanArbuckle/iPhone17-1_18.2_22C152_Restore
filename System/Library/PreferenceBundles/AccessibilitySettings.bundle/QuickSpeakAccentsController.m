@interface QuickSpeakAccentsController
- (BOOL)includeLocaleInSelectorDialog;
- (BOOL)showsSelectedVoiceVariantForLanguage;
- (id)speechSourceKey;
@end

@implementation QuickSpeakAccentsController

- (id)speechSourceKey
{
  return AXSpeechSourceKeySpeechFeatures;
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