@interface VoiceOverWebRotorController
- (BOOL)allowItemToBeToggled:(id)a3;
- (BOOL)canItemBeToggled:(id)a3;
- (BOOL)hideListItem:(id)a3;
- (BOOL)isItemEnabled:(id)a3;
- (VoiceOverWebRotorController)init;
- (id)itemsFromPreferences;
- (id)specifiers;
- (id)stringForSearchRotorItem:(id)a3;
- (void)updateItemsInPreferences:(id)a3;
@end

@implementation VoiceOverWebRotorController

- (VoiceOverWebRotorController)init
{
  v7.receiver = self;
  v7.super_class = (Class)VoiceOverWebRotorController;
  v2 = [(AXReorderableCheckmarkListController *)&v7 init];
  if (v2)
  {
    v3 = settingsLocString(@"WEB_ROTOR", @"VoiceOverSettings");
    v4 = [(VoiceOverWebRotorController *)v2 navigationItem];
    [v4 setTitle:v3];

    v5 = v2;
  }

  return v2;
}

- (id)specifiers
{
  v10.receiver = self;
  v10.super_class = (Class)VoiceOverWebRotorController;
  v3 = [(AXReorderableCheckmarkListController *)&v10 specifiers];
  id v4 = [v3 copy];

  [(VoiceOverWebRotorController *)self setAllSpecifiersUnsearchable:v4];
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  v6 = *(void **)&self->super.super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.super.AXUISettingsSetupCapableListController_opaque[OBJC_IVAR___PSListController__specifiers] = v4;
  id v7 = v4;

  id v8 = *(id *)&self->super.super.AXUISettingsSetupCapableListController_opaque[v5];
  return v8;
}

- (id)itemsFromPreferences
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 voiceOverRotorItems];

  return v3;
}

- (BOOL)hideListItem:(id)a3
{
  return _AXShouldHideVoiceOverRotorItemFromSettings(a3, a2);
}

- (BOOL)canItemBeToggled:(id)a3
{
  return 1;
}

- (void)updateItemsInPreferences:(id)a3
{
  id v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverRotorItems:v3];
}

- (BOOL)isItemEnabled:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverWebRotorController;
  return [(VoiceOverRotorController *)&v4 isItemEnabled:a3];
}

- (BOOL)allowItemToBeToggled:(id)a3
{
  return 1;
}

- (id)stringForSearchRotorItem:(id)a3
{
  return (id)_AXVoiceOverRotorLocString(a3, a2);
}

@end