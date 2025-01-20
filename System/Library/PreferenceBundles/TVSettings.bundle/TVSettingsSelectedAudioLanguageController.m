@interface TVSettingsSelectedAudioLanguageController
- (void)externalPreferencesDidUpdate;
@end

@implementation TVSettingsSelectedAudioLanguageController

- (void)externalPreferencesDidUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)TVSettingsSelectedAudioLanguageController;
  [(TVSettingsListItemsMonitorController *)&v3 externalPreferencesDidUpdate];
  [(TVSettingsSelectedAudioLanguageController *)self scrollToSelectedCell];
}

@end