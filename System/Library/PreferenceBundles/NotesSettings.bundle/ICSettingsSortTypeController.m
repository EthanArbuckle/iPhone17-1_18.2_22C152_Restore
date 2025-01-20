@interface ICSettingsSortTypeController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsSortTypeController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsSortTypeController;
  [(ICSettingsSortTypeController *)&v4 viewDidAppear:a3];
  [(ICSettingsSortTypeController *)self ic_submitNavigationEventForIdentifier:@"SORT_TYPE" titleStringKey:@"NOTE_DEFAULT_SORT" navigationComponents:&off_1F1D8];
}

@end