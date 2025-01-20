@interface AssistantBridgeSiriResponsesController
- (AssistantBridgeSiriResponsesController)init;
- (id)alwaysShowRecognizedSpeech;
- (id)siriResponseShouldAlwaysPrint;
- (id)specifiers;
- (id)voiceVolume;
- (void)_updateSpecifiersFromPreferences;
- (void)languageCodeDidChange:(id)a3;
- (void)preferencesDidChange:(id)a3;
- (void)setAlwaysShowRecognizedSpeech:(id)a3;
- (void)setSiriResponseShouldAlwaysPrint:(id)a3;
- (void)setVoiceVolume:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AssistantBridgeSiriResponsesController

- (AssistantBridgeSiriResponsesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantBridgeSiriResponsesController;
  v2 = [(AssistantBridgeSiriResponsesController *)&v6 init];
  if (v2)
  {
    v3 = +[AFPreferences sharedPreferences];
    v4 = [v3 nanoLanguageCode];
    v2->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"preferencesDidChange:" name:AFNanoPreferencesDidChangeNotification object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"languageCodeDidChange:" name:AFLanguageCodeDidChangeNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)AssistantBridgeSiriResponsesController;
  [(AssistantBridgeSiriResponsesController *)&v7 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantBridgeSiriResponsesController;
  [(AssistantBridgeSiriResponsesController *)&v6 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AFNanoPreferencesDidChangeNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:AFLanguageCodeDidChangeNotification object:0];
}

- (void)preferencesDidChange:(id)a3
{
  v4 = +[AFPreferences sharedPreferences];
  v5 = [v4 nanoLanguageCode];
  self->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();

  objc_super v6 = +[AFPreferences sharedPreferences];
  id v7 = [v6 nanoUseDeviceSpeakerForTTS];

  if (v7 != self->_voiceFeedbackPref) {
    self->_voiceFeedbackPref = (int64_t)v7;
  }

  [(AssistantBridgeSiriResponsesController *)self reloadSpecifiers];
}

- (void)languageCodeDidChange:(id)a3
{
  v4 = +[AFPreferences sharedPreferences];
  v5 = [v4 nanoLanguageCode];
  self->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();

  [(AssistantBridgeSiriResponsesController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(AssistantBridgeSiriResponsesController *)self loadSpecifiersFromPlistName:@"AssistantBridgeSiriResponses" target:self];
    objc_super v6 = [v5 specifierForID:@"VOICE_VOLUME_SLIDER_ID"];
    if (self->_siriSpeaksSupportedLanguage)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);

      if (WeakRetained)
      {
        v8 = +[UIImage imageNamed:@"Volume-Min"];
        WeakRetained = [v8 imageFlippedForRightToLeftLayoutDirection];

        v9 = +[UIImage imageNamed:@"Volume-Max"];
        v10 = [v9 imageFlippedForRightToLeftLayoutDirection];
      }
      else
      {
        v10 = 0;
      }
      [v6 setProperty:WeakRetained forKey:PSSliderLeftImageKey];
      [v6 setProperty:v10 forKey:PSSliderRightImageKey];
    }
    else
    {
      objc_msgSend(v5, "removeObjectsInRange:", objc_msgSend(v5, "indexOfSpecifierWithID:", @"VOICE_FEEDBACK_GROUP_ID"), 4);
      WeakRetained = [v5 specifierForID:@"VOICE_VOLUME_GROUP_ID"];
      [v5 removeObject:WeakRetained];
      [v5 removeObject:v6];
    }

    id v11 = [v5 copy];
    v12 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v11;

    [(AssistantBridgeSiriResponsesController *)self _updateSpecifiersFromPreferences];
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_updateSpecifiersFromPreferences
{
  uint64_t v3 = +[AFPreferences sharedPreferences];
  self->_int64_t voiceFeedbackPref = (int64_t)[v3 nanoUseDeviceSpeakerForTTS];

  int64_t voiceFeedbackPref = self->_voiceFeedbackPref;
  CFStringRef v5 = @"VOICE_FEEDBACK_HEADPHONES_ONLY_ID";
  if (voiceFeedbackPref == 1) {
    CFStringRef v5 = @"VOICE_FEEDBACK_CONTROL_WITH_SILENT_MODE_ID";
  }
  if (voiceFeedbackPref == 2) {
    CFStringRef v6 = @"VOICE_FEEDBACK_ALWAYS_ON_ID";
  }
  else {
    CFStringRef v6 = v5;
  }
  id v8 = [(AssistantBridgeSiriResponsesController *)self specifierForID:v6];
  id v7 = [(AssistantBridgeSiriResponsesController *)self specifierForID:@"VOICE_FEEDBACK_GROUP_ID"];
  [v7 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AssistantBridgeSiriResponsesController;
  id v6 = a4;
  [(AssistantBridgeSiriResponsesController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[AssistantBridgeSiriResponsesController indexForIndexPath:](self, "indexForIndexPath:", v6, v12.receiver, v12.super_class);

  id v8 = [(AssistantBridgeSiriResponsesController *)self specifierAtIndex:v7];
  v9 = [v8 identifier];

  if ([v9 isEqualToString:@"VOICE_FEEDBACK_ALWAYS_ON_ID"])
  {
    int64_t v10 = 2;
LABEL_7:
    self->_int64_t voiceFeedbackPref = v10;
    goto LABEL_8;
  }
  if ([v9 isEqualToString:@"VOICE_FEEDBACK_CONTROL_WITH_SILENT_MODE_ID"])
  {
    int64_t v10 = 1;
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"VOICE_FEEDBACK_HEADPHONES_ONLY_ID"])
  {
    int64_t v10 = 3;
    goto LABEL_7;
  }
LABEL_8:
  id v11 = +[AFPreferences sharedPreferences];
  [v11 setNanoUseDeviceSpeakerForTTS:self->_voiceFeedbackPref];
}

- (id)siriResponseShouldAlwaysPrint
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 nanoSiriResponseShouldAlwaysPrint];

  return +[NSNumber numberWithBool:v3];
}

- (void)setSiriResponseShouldAlwaysPrint:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setNanoSiriResponseShouldAlwaysPrint:v3];
}

- (id)alwaysShowRecognizedSpeech
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 nanoAlwaysShowRecognizedSpeech];

  return +[NSNumber numberWithBool:v3];
}

- (void)setAlwaysShowRecognizedSpeech:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setNanoAlwaysShowRecognizedSpeech:v3];
}

- (id)voiceVolume
{
  v2 = +[AFPreferences sharedPreferences];
  [v2 nanoTTSSpeakerVolume];
  id v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v3;
}

- (void)setVoiceVolume:(id)a3
{
  [a3 floatValue];
  int v4 = v3;
  id v6 = +[AFPreferences sharedPreferences];
  LODWORD(v5) = v4;
  [v6 setNanoTTSSpeakerVolume:v5];
}

@end