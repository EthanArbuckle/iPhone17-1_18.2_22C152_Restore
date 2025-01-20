@interface ICSettingsDefaultAccountController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsDefaultAccountController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsDefaultAccountController;
  [(ICSettingsDefaultAccountController *)&v4 viewDidAppear:a3];
  [(ICSettingsDefaultAccountController *)self ic_submitNavigationEventForIdentifier:@"DEFAULT_ACCOUNT" titleStringKey:@" " navigationComponents:&off_1F280];
}

@end