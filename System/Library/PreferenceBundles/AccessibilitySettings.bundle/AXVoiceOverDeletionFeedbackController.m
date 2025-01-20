@interface AXVoiceOverDeletionFeedbackController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXVoiceOverDeletionFeedbackController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v7 = +[NSMutableArray array];
    v8 = settingsLocString(@"FEEDBACK_SPEAK", @"VoiceOverSettings");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v9 setProperty:&off_2293D8 forKey:@"AXSVoiceOverDeletionFeedback"];
    [v7 addObject:v9];
    v10 = settingsLocString(@"FEEDBACK_PLAY_TONE", @"VoiceOverSettings");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v11 setProperty:&off_2293F0 forKey:@"AXSVoiceOverDeletionFeedback"];
    [v7 addObject:v11];
    v12 = settingsLocString(@"FEEDBACK_CHANGE_PITCH", @"VoiceOverSettings");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v13 setProperty:&off_229408 forKey:@"AXSVoiceOverDeletionFeedback"];
    [v7 addObject:v13];
    v14 = settingsLocString(@"FEEDBACK_DO_NOTHING", @"VoiceOverSettings");
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v15 setProperty:&off_229420 forKey:@"AXSVoiceOverDeletionFeedback"];
    [v7 addObject:v15];
    id v16 = [v7 copy];
    v17 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v16;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  uint64_t v5 = +[AXSettings sharedInstance];
  id v6 = [v5 voiceOverDeletionFeedback];

  v7 = [v10 specifier];
  v8 = [v7 propertyForKey:@"AXSVoiceOverDeletionFeedback"];
  BOOL v9 = [v8 integerValue] == v6;

  [v10 setChecked:v9];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AXVoiceOverDeletionFeedbackController;
  id v6 = a4;
  [(AXVoiceOverDeletionFeedbackController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[AXVoiceOverDeletionFeedbackController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v11.receiver, v11.super_class);

  v8 = [v7 propertyForKey:@"AXSVoiceOverDeletionFeedback"];
  id v9 = [v8 integerValue];
  id v10 = +[AXSettings sharedInstance];
  [v10 setVoiceOverDeletionFeedback:v9];

  [(AXVoiceOverDeletionFeedbackController *)self beginUpdates];
  [(AXVoiceOverDeletionFeedbackController *)self reloadSpecifiers];
  [(AXVoiceOverDeletionFeedbackController *)self endUpdates];
}

@end