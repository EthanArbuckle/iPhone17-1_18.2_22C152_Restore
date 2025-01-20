@interface AssistantVoiceFeedbackController
- (id)specifiers;
- (void)_updateSpecifiersFromPreferences;
- (void)preferencesDidChange:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AssistantVoiceFeedbackController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"preferencesDidChange:" name:AFNanoPreferencesDidChangeNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)AssistantVoiceFeedbackController;
  [(AssistantVoiceFeedbackController *)&v6 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantVoiceFeedbackController;
  [(AssistantVoiceFeedbackController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AFNanoPreferencesDidChangeNotification object:0];
}

- (void)preferencesDidChange:(id)a3
{
  v4 = +[AFPreferences sharedPreferences];
  id v5 = [v4 nanoUseDeviceSpeakerForTTS];

  if (v5 != self->_voiceFeedbackPref)
  {
    self->_voiceFeedbackPref = (int64_t)v5;
    [(AssistantVoiceFeedbackController *)self reloadSpecifiers];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(AssistantVoiceFeedbackController *)self loadSpecifiersFromPlistName:@"AssistantVoiceFeedback" target:self];
    id v6 = [v5 copy];
    v7 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    [(AssistantVoiceFeedbackController *)self _updateSpecifiersFromPreferences];
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
  id v8 = [(AssistantVoiceFeedbackController *)self specifierForID:v6];
  v7 = [(AssistantVoiceFeedbackController *)self specifierForID:@"VOICE_FEEDBACK_GROUP_ID"];
  [v7 setProperty:v8 forKey:PSRadioGroupCheckedSpecifierKey];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AssistantVoiceFeedbackController;
  id v6 = a4;
  [(AssistantVoiceFeedbackController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[AssistantVoiceFeedbackController indexForIndexPath:](self, "indexForIndexPath:", v6, v12.receiver, v12.super_class);

  id v8 = [(AssistantVoiceFeedbackController *)self specifierAtIndex:v7];
  v9 = [v8 identifier];

  if ([v9 isEqualToString:@"VOICE_FEEDBACK_ALWAYS_ON_ID"])
  {
    int64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"VOICE_FEEDBACK_CONTROL_WITH_SILENT_MODE_ID"])
  {
    int64_t v10 = 1;
  }
  else
  {
    int64_t v10 = 3;
  }
  self->_int64_t voiceFeedbackPref = v10;
  v11 = +[AFPreferences sharedPreferences];
  [v11 setNanoUseDeviceSpeakerForTTS:self->_voiceFeedbackPref];
}

@end