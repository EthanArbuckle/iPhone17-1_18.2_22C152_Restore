@interface VoiceOverNeuralFeedbackController
- (id)_feedbackRelatedSpecifiers;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverNeuralFeedbackController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = [(VoiceOverNeuralFeedbackController *)self _feedbackRelatedSpecifiers];
    [v5 addObjectsFromArray:v6];

    id v7 = [v5 copy];
    v8 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v7;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (id)_feedbackRelatedSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  v5 = settingsLocString(@"VO_RECOGNITION_FEEDBACK_FOOTER", @"VoiceOverSettings");
  [v4 setProperty:v5 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v6 = settingsLocString(@"FEEDBACK_SPEAK", @"VoiceOverSettings");
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v7 setProperty:&off_22A6B0 forKey:@"AXSVoiceOverDiscoveredMLContentFeedback"];
  [v3 addObject:v7];
  v8 = settingsLocString(@"FEEDBACK_PLAY_TONE", @"VoiceOverSettings");
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setProperty:&off_22A6C8 forKey:@"AXSVoiceOverDiscoveredMLContentFeedback"];
  [v3 addObject:v9];
  v10 = settingsLocString(@"FEEDBACK_DO_NOTHING", @"VoiceOverSettings");
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v11 setProperty:&off_22A6E0 forKey:@"AXSVoiceOverDiscoveredMLContentFeedback"];
  [v3 addObject:v11];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v3;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) setProperty:&__kCFBooleanTrue forKey:@"kAXFeedbackRelatedSettingsKey"];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  v5 = +[AXSettings sharedInstance];
  id v6 = [v5 voiceOverNeuralElementFeedback];

  id v7 = [v10 specifier];
  v8 = [v7 propertyForKey:@"AXSVoiceOverDiscoveredMLContentFeedback"];
  BOOL v9 = [v8 integerValue] == v6;

  [v10 setChecked:v9];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VoiceOverNeuralFeedbackController;
  id v6 = a4;
  [(VoiceOverNeuralFeedbackController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[VoiceOverNeuralFeedbackController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v11.receiver, v11.super_class);

  v8 = [v7 propertyForKey:@"AXSVoiceOverDiscoveredMLContentFeedback"];
  id v9 = [v8 integerValue];
  id v10 = +[AXSettings sharedInstance];
  [v10 setVoiceOverNeuralElementFeedback:v9];

  [(VoiceOverNeuralFeedbackController *)self beginUpdates];
  [(VoiceOverNeuralFeedbackController *)self reloadSpecifiers];
  [(VoiceOverNeuralFeedbackController *)self endUpdates];
}

@end