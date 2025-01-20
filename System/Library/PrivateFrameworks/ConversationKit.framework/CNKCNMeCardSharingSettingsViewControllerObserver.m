@interface CNKCNMeCardSharingSettingsViewControllerObserver
- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4;
- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4;
@end

@implementation CNKCNMeCardSharingSettingsViewControllerObserver

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(MEMORY[0x1E4F6E820], "sharedInstance", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSharingEnabled:v4];
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x1E4F6E820], "sharedInstance", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSharingAudience:a4];
}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x1E4F6BD50];
  id v5 = a4;
  id v6 = [v4 sharedInstance];
  [v6 updatePersonalNicknameIfNecessaryWithMeCardSharingResult:v5];
}

@end