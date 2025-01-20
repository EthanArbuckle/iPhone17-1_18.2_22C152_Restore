@interface ICSettingsAllowDarkBackgroundsController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsAllowDarkBackgroundsController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsAllowDarkBackgroundsController;
  [(ICSettingsAllowDarkBackgroundsController *)&v4 viewDidAppear:a3];
  [(ICSettingsAllowDarkBackgroundsController *)self ic_submitNavigationEventForIdentifier:@"ALLOW_DARK_BACKGROUNDS" titleStringKey:@"NOTE_CONTENT_BACKGROUNDS" navigationComponents:&off_1F190];
}

@end