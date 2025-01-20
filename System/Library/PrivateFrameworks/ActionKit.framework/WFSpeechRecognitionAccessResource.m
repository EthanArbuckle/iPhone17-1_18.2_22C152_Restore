@interface WFSpeechRecognitionAccessResource
+ (BOOL)isSystemResource;
- (id)icon;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (id)name;
- (unint64_t)status;
- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5;
@end

@implementation WFSpeechRecognitionAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v5 = a5;
  v6 = [NSURL URLWithString:@"prefs:root=General&path=Keyboard/DictationSettings"];
  v7 = [MEMORY[0x263F33718] sharedContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __109__WFSpeechRecognitionAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
  v9[3] = &unk_264E59738;
  id v10 = v5;
  id v8 = v5;
  [v7 openURL:v6 completionHandler:v9];
}

uint64_t __109__WFSpeechRecognitionAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Enable Dictation");
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(@"In order to use this action, enable Dictation in Keyboard Settings.");
}

- (unint64_t)status
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getAFPreferencesClass_softClass_7576;
  uint64_t v11 = getAFPreferencesClass_softClass_7576;
  if (!getAFPreferencesClass_softClass_7576)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getAFPreferencesClass_block_invoke_7577;
    v7[3] = &unk_264E5EC88;
    v7[4] = &v8;
    __getAFPreferencesClass_block_invoke_7577((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 sharedPreferences];
  if ([v4 dictationIsEnabled]) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = 3;
  }

  return v5;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"speech recognition", @"speech recognition");
  unint64_t v5 = [v3 localize:v4];

  return v5;
}

- (id)icon
{
  return (id)[MEMORY[0x263F85308] actionKitImageNamed:@"SpeechRecognition"];
}

- (id)name
{
  return WFLocalizedString(@"Speech Recognition");
}

@end