@interface AssistantBridgeSettingsUtilities
+ (BOOL)digitalCrownEnabled;
+ (BOOL)isCompactVoiceTriggerAvailable;
+ (BOOL)raiseToSpeakEnabled;
+ (BOOL)voiceTriggerEnabled;
+ (id)languageCode;
+ (id)triggerPhraseChoiceHS;
+ (id)triggerPhraseChoiceHSJS;
+ (void)setAssistantEnabled:(BOOL)a3 alertPresenter:(id)a4 confirmationAction:(id)a5 alertPresentationCompletion:(id)a6;
@end

@implementation AssistantBridgeSettingsUtilities

+ (id)languageCode
{
  v2 = +[AFPreferences sharedPreferences];
  v3 = [v2 languageCode];

  if (!v3)
  {
    v4 = +[AFPreferences sharedPreferences];
    v3 = [v4 bestSupportedLanguageCodeForLanguageCode:0];
  }

  return v3;
}

+ (BOOL)isCompactVoiceTriggerAvailable
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 nanoJSSupported];

  return v3;
}

+ (id)triggerPhraseChoiceHSJS
{
  v2 = [a1 languageCode];
  unsigned __int8 v3 = +[VTPreferences sharedPreferences];
  v4 = [v3 localizedTriggerPhraseForLanguageCode:v2];

  v5 = +[VTPreferences sharedPreferences];
  v6 = [v5 localizedCompactTriggerPhraseForLanguageCode:v2];

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"TRIGGER_PHRASE_CHOICE_TWO_PHRASES" value:&stru_10A70 table:@"AssistantBridgeSettings"];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6, v4);

  return v9;
}

+ (id)triggerPhraseChoiceHS
{
  unsigned __int8 v3 = +[VTPreferences sharedPreferences];
  v4 = [a1 languageCode];
  v5 = [v3 localizedTriggerPhraseForLanguageCode:v4];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"TRIGGER_PHRASE_CHOICE_ONE_PHRASE" value:&stru_10A70 table:@"AssistantBridgeSettings"];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5);

  return v8;
}

+ (BOOL)voiceTriggerEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  if ([v2 nanoAssistantEnabled])
  {
    unsigned __int8 v3 = +[AFPreferences sharedPreferences];
    unsigned __int8 v4 = [v3 nanoPhraseSpotterEnabled];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)raiseToSpeakEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  if ([v2 nanoAssistantEnabled])
  {
    unsigned __int8 v3 = +[AFPreferences sharedPreferences];
    unsigned __int8 v4 = [v3 nanoRaiseToSpeakEnabled];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (BOOL)digitalCrownEnabled
{
  v2 = +[AFPreferences sharedPreferences];
  if ([v2 nanoAssistantEnabled])
  {
    unsigned __int8 v3 = +[AFPreferences sharedPreferences];
    unsigned __int8 v4 = [v3 nanoCrownActivationEnabled];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (void)setAssistantEnabled:(BOOL)a3 alertPresenter:(id)a4 confirmationAction:(id)a5 alertPresentationCompletion:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v34 = a5;
  id v35 = a6;
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = v10;
  if (v8)
  {
    uint64_t v12 = [v10 localizedStringForKey:@"ASSISTANT_ENABLE_TITLE" value:&stru_10A70 table:@"AssistantBridgeSettings"];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"ASSISTANT_ENABLE_WARNING" value:&stru_10A70 table:@"AssistantBridgeSettings"];

    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"ASSISTANT_ENABLE_CONFIRMATION" value:&stru_10A70 table:@"AssistantBridgeSettings"];
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v12 = [v10 localizedStringForKey:@"ASSISTANT_DISABLE_TITLE" value:&stru_10A70 table:@"AssistantBridgeSettings"];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v32 = [v18 localizedStringForKey:@"ASSISTANT_DISABLE_CONFIRMATION" value:&stru_10A70 table:@"AssistantBridgeSettings"];

    v19 = +[AFPreferences sharedPreferences];
    unsigned int v20 = [v19 nanoDictationEnabled];

    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = v21;
    if (v20) {
      CFStringRef v22 = @"ASSISTANT_DISABLE_WARNING_DICTATION_ENABLED";
    }
    else {
      CFStringRef v22 = @"ASSISTANT_DISABLE_WARNING_DICTATION_DISABLED";
    }
    v14 = [v21 localizedStringForKey:v22 value:&stru_10A70 table:@"AssistantBridgeSettings"];
    uint64_t v17 = 2;
    uint64_t v16 = v32;
  }
  v33 = (void *)v12;

  v23 = +[UIAlertController alertControllerWithTitle:v12 message:v14 preferredStyle:0];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_9440;
  v39[3] = &unk_105E0;
  id v41 = v34;
  id v24 = v35;
  BOOL v43 = v8;
  id v42 = v24;
  id v40 = v9;
  id v25 = v9;
  id v36 = v34;
  v26 = (void *)v16;
  v27 = +[UIAlertAction actionWithTitle:v16 style:v17 handler:v39];
  [v23 addAction:v27];

  v28 = +[NSBundle bundleForClass:objc_opt_class()];
  v29 = [v28 localizedStringForKey:@"ASSISTANT_ENABLE_DISABLE_CANCEL" value:&stru_10A70 table:@"AssistantBridgeSettings"];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_96CC;
  v37[3] = &unk_10608;
  id v38 = v24;
  id v30 = v24;
  v31 = +[UIAlertAction actionWithTitle:v29 style:1 handler:v37];
  [v23 addAction:v31];

  [v25 presentViewController:v23 animated:1 completion:0];
}

@end