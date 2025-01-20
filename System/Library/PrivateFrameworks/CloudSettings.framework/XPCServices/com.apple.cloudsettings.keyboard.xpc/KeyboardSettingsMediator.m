@interface KeyboardSettingsMediator
+ (id)cloudSettingKeyFromTextInputUIKey;
- (id)DFRFnBehavior;
- (id)DFRPresentationMode;
- (id)JIMAutocorrection;
- (id)JIMConvertWithPunctuation;
- (id)JIMFullWidthNumeralCharacters;
- (id)JIMLiveConversion;
- (id)JIMLiveWindowsMode;
- (id)JIMPredictiveCandidate;
- (id)JIMPunctuationType;
- (id)KeyboardCheckSpelling;
- (id)automaticCapitalization;
- (id)automaticDash;
- (id)automaticPeriod;
- (id)automaticQuote;
- (id)automaticSpellingCorrection;
- (id)automaticTextCompletion;
- (id)bidiKeyboardShortcut;
- (id)bidiSplitCursor;
- (id)bidiVisualSelection;
- (id)capsLockSwitch;
- (id)deviceSettingsForKeys:(id)a3;
- (id)dictationLanguage;
- (id)dictationLanguages;
- (id)dictationShortcut;
- (id)doubleQuoteOption;
- (id)fnKeyFunction;
- (id)keyRepeatInterval;
- (id)keyRepeatThreshold;
- (id)keyboardAllowPaddle;
- (id)keyboardAutocapitalization;
- (id)keyboardAutocorrection;
- (id)keyboardCapsLock;
- (id)keyboardContinuousPathDeleteWholeWord;
- (id)keyboardContinuousPathEnabled;
- (id)keyboardPeriodShortcut;
- (id)keyboardPrediction;
- (id)perContextInput;
- (id)preferencesController;
- (id)singleQuoteOption;
- (id)smartDashesEnabled;
- (id)smartQuotesEnabled;
- (id)spaceConfirmation;
- (id)spellingLanguage;
- (id)textInputMenu;
- (id)uiMode;
- (void)registerKeys;
- (void)setAutomaticCapitalization:(id)a3;
- (void)setAutomaticPeriod:(id)a3;
- (void)setAutomaticSpellingCorrection:(id)a3;
- (void)setCapsLockSwitch:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setDictationShortcut:(id)a3;
- (void)setFnKeyFunction:(id)a3;
- (void)setKeyboardAllowPaddle:(id)a3;
- (void)setKeyboardAutocapitalization:(id)a3;
- (void)setKeyboardAutocorrection:(id)a3;
- (void)setKeyboardCapsLock:(id)a3;
- (void)setKeyboardCheckSpelling:(id)a3;
- (void)setKeyboardContinuousPathDeleteWholeWord:(id)a3;
- (void)setKeyboardContinuousPathEnabled:(id)a3;
- (void)setKeyboardPeriodShortcut:(id)a3;
- (void)setKeyboardPrediction:(id)a3;
- (void)setSmartDashesEnabled:(id)a3;
- (void)setSmartQuotesEnabled:(id)a3;
- (void)setSpaceConfirmation:(id)a3;
- (void)setTextInputMenu:(id)a3;
@end

@implementation KeyboardSettingsMediator

- (void)registerKeys
{
  [(KeyboardSettingsMediator *)self registerKey:@"KB_KeyRepeatThreshold" getter:"keyRepeatThreshold" setter:"setKeyRepeatThreshold:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_KeyRepeatInterval" getter:"keyRepeatInterval" setter:"setKeyRepeatInterval:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AdjustBacklight" getter:"adjustBacklight" setter:"setAdjustBacklight:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_IdleDimTime" getter:"idleDimTime" setter:"setIdleDimTime:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_FnKeyFunction" getter:"fnKeyFunction" setter:"setFnKeyFunction:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_DFRPresentationModeDefault" getter:"DFRPresentationMode" setter:"setDFRPresentationMode:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_DFRFnBehavior" getter:"DFRFnBehavior" setter:"setDFRFnBehavior:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_UIMode" getter:"uiMode" setter:"setUIMode:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_TextInputMenu" getter:"textInputMenu" setter:"setTextInputMenu:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_CapsLockSwitch" getter:"capsLockSwitch" setter:"setCapsLockSwitch:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_PerContextInput" getter:"perContextInput" setter:"setPerContextInput:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticSpellingCorrection" getter:"automaticSpellingCorrection" setter:"setAutomaticSpellingCorrection:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticCapitalization" getter:"automaticCapitalization" setter:"setAutomaticCapitalization:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticTextCompletion" getter:"automaticTextCompletion" setter:"setAutomaticTextCompletion:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticQuote" getter:"automaticQuote" setter:"setAutomaticQuote:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticDash" getter:"automaticDash" setter:"setAutomaticDash:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_AutomaticPeriod" getter:"automaticPeriod" setter:"setAutomaticPeriod:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_SpellingLanguage" getter:"spellingLanguage" setter:"setSpellingLanguage:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_SingleQuoteOption" getter:"singleQuoteOption" setter:"setSingleQuoteOption:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_DoubleQuoteOption" getter:"doubleQuoteOption" setter:"setDoubleQuoteOption:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_BidiSplitCursor" getter:"bidiSplitCursor" setter:"setBidiSplitCursor:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_BidiKeyboardShortcut" getter:"bidiKeyboardShortcut" setter:"setBidiKeyboardShortcut:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_BidiVisualSelection" getter:"bidiVisualSelection" setter:"setBidiVisualSelection:"];
  [(KeyboardSettingsMediator *)self registerKey:@"KB_DictationShortcut" getter:"dictationShortcut" setter:"setDictationShortcut:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardAutocorrectionPreference getter:"keyboardAutocorrection" setter:"setKeyboardAutocorrection:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardAutocapitalizationPreference getter:"keyboardAutocapitalization" setter:"setKeyboardAutocapitalization:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardCheckSpellingPreference getter:"KeyboardCheckSpelling" setter:"setKeyboardCheckSpelling:"];
  [(KeyboardSettingsMediator *)self registerKey:TISmartQuotesEnabledPreference getter:"smartQuotesEnabled" setter:"setSmartQuotesEnabled:"];
  [(KeyboardSettingsMediator *)self registerKey:TISmartDashesEnabledPreference getter:"smartDashesEnabled" setter:"setSmartDashesEnabled:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardCapsLockPreference getter:"keyboardCapsLock" setter:"setKeyboardCapsLock:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardContinuousPathEnabledPreference getter:"keyboardContinuousPathEnabled" setter:"setKeyboardContinuousPathEnabled:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardContinuousPathDeleteWholeWordPreference getter:"keyboardContinuousPathDeleteWholeWord" setter:"setKeyboardContinuousPathDeleteWholeWord:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardAllowPaddlePreference getter:"keyboardAllowPaddle" setter:"setKeyboardAllowPaddle:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardPeriodShortcutPreference getter:"keyboardPeriodShortcut" setter:"setKeyboardPeriodShortcut:"];
  [(KeyboardSettingsMediator *)self registerKey:TIKeyboardPredictionPreference getter:"keyboardPrediction" setter:"setKeyboardPrediction:"];
  [(KeyboardSettingsMediator *)self registerKey:TISpaceConfirmationPreference getter:"spaceConfirmation" setter:"setSpaceConfirmation:"];

  [(KeyboardSettingsMediator *)self registerKey:@"KB_DictationLanguages" getter:"dictationLanguages" setter:"setDictationLangauges:"];
}

+ (id)cloudSettingKeyFromTextInputUIKey
{
  if (qword_10000CB28 != -1) {
    dispatch_once(&qword_10000CB28, &stru_1000081E0);
  }
  v2 = (void *)qword_10000CB20;

  return v2;
}

- (id)deviceSettingsForKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    v7 = [(id)objc_opt_class() cloudSettingKeyFromTextInputUIKey];
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v5 objectAtIndexedSubscript:v8];
        uint64_t v10 = [v7 objectForKeyedSubscript:v9];
        v11 = (void *)v10;
        if (v10) {
          v12 = (void *)v10;
        }
        else {
          v12 = v9;
        }
        [v6 addObject:v12];

        ++v8;
      }
      while (v8 < (unint64_t)[v5 count]);
    }
  }
  else
  {
    v6 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)KeyboardSettingsMediator;
  v13 = [(KeyboardSettingsMediator *)&v15 deviceSettingsForKeys:v6];

  return v13;
}

- (void)setFnKeyFunction:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Update FnKeyFunction", v7, 2u);
  }
  BOOL v4 = [v3 intValue] == 1;
  v5 = +[TIPreferencesController sharedPreferencesController];
  v6 = +[NSNumber numberWithBool:v4];
  [v5 setValue:v6 forPreferenceKey:TIHWKeyboardGlobeAsEmojiKeyPreference];
}

- (void)setTextInputMenu:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Text input menu", v5, 2u);
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005A28();
    }
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.TextInputMenu"];
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "BOOLValue"), @"visible");
  }
}

- (void)setCapsLockSwitch:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - CapsLock switch", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIHWKeyboardCapsLockRomanSwitchPreference];
  }
}

- (void)setAutomaticSpellingCorrection:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Automatic spelling correction", v5, 2u);
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005A98();
    }
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIHWKeyboardAutocorrectionPreference];
  }
}

- (void)setDictationLanguages:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Dictation languages", v7, 2u);
  }
  id v4 = [v3 firstObject];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005B08();
    }
    v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v6 = [v5 preferencesActions];
    [v6 setEnabledDictationLanguages:v4];
  }
}

- (void)setDictationShortcut:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Dictation shortcut", v11, 2u);
  }
  id v4 = [v3 firstObject];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005B78();
    }
    v5 = [v4 objectForKeyedSubscript:@"KB_Dictation_ShortcutType"];
    unsigned int v6 = [v5 integerValue];

    if (v6 - 4 < 3)
    {
      v7 = +[TIPreferencesController sharedPreferencesController];
      unint64_t v8 = v7;
      uint64_t v9 = TIHWKeyboardDictationShortcutPreference;
      uint64_t v10 = &off_100008610;
LABEL_12:
      [v7 setValue:v10 forPreferenceKey:v9];

      goto LABEL_13;
    }
    if (!v6)
    {
      v7 = +[TIPreferencesController sharedPreferencesController];
      unint64_t v8 = v7;
      uint64_t v9 = TIHWKeyboardDictationShortcutPreference;
      uint64_t v10 = &off_100008628;
      goto LABEL_12;
    }
    if (v6 == 2)
    {
      v7 = +[TIPreferencesController sharedPreferencesController];
      unint64_t v8 = v7;
      uint64_t v9 = TIHWKeyboardDictationShortcutPreference;
      uint64_t v10 = &off_1000085F8;
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)setKeyboardAutocorrection:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - TIKeyboardAutocorrectionPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardAutocorrectionPreference];
  }
}

- (void)setKeyboardAutocapitalization:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - TIKeyboardAutocapitalizationPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardAutocapitalizationPreference];
  }
}

- (void)setAutomaticCapitalization:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Automatic capitalization", v5, 2u);
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005BE8();
    }
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIHWKeyboardAutocapitalizationPreference];
  }
}

- (void)setAutomaticPeriod:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - Automatic period", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIHWKeyboardPeriodShortcutPreference];
  }
}

- (void)setKeyboardCheckSpelling:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardCheckSpellingPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardCheckSpellingPreference];
  }
}

- (void)setSmartQuotesEnabled:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - SmartQuotesEnabledPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TISmartQuotesEnabledPreference];
  }
}

- (void)setSmartDashesEnabled:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - SmartDashesEnabledPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TISmartDashesEnabledPreference];
  }
}

- (void)setKeyboardCapsLock:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardCapsLockPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardCapsLockPreference];
  }
}

- (void)setKeyboardContinuousPathEnabled:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardContinuousPathEnabledPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardContinuousPathEnabledPreference];
  }
}

- (void)setKeyboardContinuousPathDeleteWholeWord:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardContinuousPathDeleteWholeWordPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardContinuousPathDeleteWholeWordPreference];
  }
}

- (void)setKeyboardAllowPaddle:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardAllowPaddlePreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardAllowPaddlePreference];
  }
}

- (void)setKeyboardPeriodShortcut:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardPeriodShortcutPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardPeriodShortcutPreference];
  }
}

- (void)setKeyboardPrediction:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - KeyboardPredictionPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TIKeyboardPredictionPreference];
  }
}

- (void)setSpaceConfirmation:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPCSERVICE - SpaceConfirmationPreference", v5, 2u);
  }
  if (v3)
  {
    id v4 = +[TIPreferencesController sharedPreferencesController];
    [v4 setValue:v3 forPreferenceKey:TISpaceConfirmationPreference];
  }
}

- (id)preferencesController
{
  v2 = +[TIPreferencesController sharedPreferencesController];
  [v2 synchronizePreferences];

  return v2;
}

- (id)keyRepeatThreshold
{
  return 0;
}

- (id)keyRepeatInterval
{
  return 0;
}

- (id)fnKeyFunction
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - HWKeyboardGlobeAsEmojiKey", v8, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  unsigned int v4 = [v3 BOOLForPreferenceKey:TIHWKeyboardGlobeAsEmojiKeyPreference];

  if (v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  unsigned int v6 = +[NSNumber numberWithInteger:v5];

  return v6;
}

- (id)DFRPresentationMode
{
  return 0;
}

- (id)DFRFnBehavior
{
  return 0;
}

- (id)uiMode
{
  return 0;
}

- (id)textInputMenu
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - Text input menu", v13, 2u);
  }
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.TextInputMenu"];
  id v3 = [v2 BOOLForKey:@"visible"];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100005C58((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = +[NSNumber numberWithBool:v3];

  return v11;
}

- (id)capsLockSwitch
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - HWKeyboardCapsLockRomanSwitch", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIHWKeyboardCapsLockRomanSwitchPreference];

  uint64_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)perContextInput
{
  return 0;
}

- (id)automaticSpellingCorrection
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - HWKeyboardAutocorrection", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIHWKeyboardAutocorrectionPreference];

  uint64_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)automaticCapitalization
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - HWKeyboardAutocapitalization", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIHWKeyboardAutocapitalizationPreference];

  uint64_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)automaticTextCompletion
{
  return 0;
}

- (id)automaticQuote
{
  return 0;
}

- (id)automaticDash
{
  return 0;
}

- (id)automaticPeriod
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - HWKeyboardPeriodShortcut", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIHWKeyboardPeriodShortcutPreference];

  uint64_t v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)spellingLanguage
{
  return 0;
}

- (id)singleQuoteOption
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - Single Quote option", v6, 2u);
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"KB_SingleQuoteOption", kCFPreferencesAnyApplication);
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)doubleQuoteOption
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - Double Quote option", v6, 2u);
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"KB_DoubleQuoteOption", kCFPreferencesAnyApplication);
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)bidiSplitCursor
{
  return 0;
}

- (id)bidiKeyboardShortcut
{
  return 0;
}

- (id)bidiVisualSelection
{
  return 0;
}

- (id)dictationLanguage
{
  return 0;
}

- (id)dictationLanguages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - Dictation languages", v7, 2u);
  }
  id v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  id v4 = [v3 valueForPreferenceKey:UIDictationLanguagesEnabled];

  uint64_t v8 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v8 count:1];

  return v5;
}

- (id)dictationShortcut
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - Dictation shortcut", v8, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 valueForPreferenceKey:TIHWKeyboardDictationShortcutPreference];
  id v5 = [v4 integerValue];

  if ((unint64_t)v5 + 1 > 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v9 = (&off_100008200)[(void)v5 + 1];
    uint64_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
  }

  return v6;
}

- (id)JIMLiveConversion
{
  return 0;
}

- (id)JIMAutocorrection
{
  return 0;
}

- (id)JIMLiveWindowsMode
{
  return 0;
}

- (id)JIMPredictiveCandidate
{
  return 0;
}

- (id)JIMConvertWithPunctuation
{
  return 0;
}

- (id)JIMPunctuationType
{
  return 0;
}

- (id)JIMFullWidthNumeralCharacters
{
  return 0;
}

- (id)keyboardAutocorrection
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - TIKeyboardAutocorrectionPreference", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardAutocorrectionPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardAutocapitalization
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - TIKeyboardAutocapitalizationPreference", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardAutocapitalizationPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)KeyboardCheckSpelling
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardCheckSpelling", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardCheckSpellingPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)smartQuotesEnabled
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - SmartQuotesEnabled", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TISmartQuotesEnabledPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)smartDashesEnabled
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - SmartQuotesEnabled", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TISmartDashesEnabledPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardCapsLock
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardCapsLock", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardCapsLockPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardContinuousPathEnabled
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardContinuousPathEnabled", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardContinuousPathEnabledPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardContinuousPathDeleteWholeWord
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardContinuousPathDeleteWholeWord", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardContinuousPathDeleteWholeWordPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardAllowPaddle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardAllowPaddle", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardAllowPaddlePreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardPeriodShortcut
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardPeriodShortcut", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardPeriodShortcutPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)keyboardPrediction
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - KeyboardPrediction", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TIKeyboardPredictionPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)spaceConfirmation
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN SERVICE - SpaceConfirmation", v7, 2u);
  }
  id v3 = [(KeyboardSettingsMediator *)self preferencesController];
  id v4 = [v3 BOOLForPreferenceKey:TISpaceConfirmationPreference];

  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

@end