@interface VoiceOverNavigateImagesController
- (VoiceOverNavigateImagesController)init;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation VoiceOverNavigateImagesController

- (VoiceOverNavigateImagesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverNavigateImagesController;
  v2 = [(VoiceOverNavigateImagesController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [*(id *)&v2->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__table] setDataSource:v2];
    v4 = v3;
  }

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    objc_super v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = settingsLocString(@"NAV_IMG_ALWAYS", @"VoiceOverSettings");
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v5 addObject:v8];
    v9 = settingsLocString(@"NAV_IMG_W_DESCRIPTIONS", @"VoiceOverSettings");
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v5 addObject:v10];
    v11 = settingsLocString(@"NAV_IMG_NEVER", @"VoiceOverSettings");
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v5 addObject:v12];
    v13 = *(void **)&self->AXUISettingsListController_opaque[v3];
    *(void *)&self->AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  id v6 = a5;
  v7 = +[AXSettings sharedInstance];
  id v8 = [v7 voiceOverNavigateImagesOption];

  v9 = (char *)[v6 row];
  uint64_t v10 = 2;
  if (v9 != (unsigned char *)&dword_0 + 1) {
    uint64_t v10 = 3;
  }
  if (!v9) {
    uint64_t v10 = 1;
  }
  if (v8 == (id)v10) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v12 setAccessoryType:v11];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (char *)[v6 row];
  uint64_t v9 = 2;
  if (v8 != (unsigned char *)&dword_0 + 1) {
    uint64_t v9 = 3;
  }
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v11 = +[AXSettings sharedInstance];
  [v11 setVoiceOverNavigateImagesOption:v10];

  v12.receiver = self;
  v12.super_class = (Class)VoiceOverNavigateImagesController;
  [(VoiceOverNavigateImagesController *)&v12 tableView:v7 didSelectRowAtIndexPath:v6];

  [*(id *)&self->AXUISettingsListController_opaque[OBJC_IVAR___PSListController__table] reloadData];
}

@end