@interface ICSettingsGesturesBottomRightViewController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsGesturesBottomRightViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsGesturesBottomRightViewController;
  [(ICSettingsGesturesBottomRightViewController *)&v4 viewDidAppear:a3];
  [(ICSettingsGesturesBottomRightViewController *)self ic_submitNavigationEventForIdentifier:@"BOTTOM_RIGHT_CORNER_SWIPE" titleStringKey:@"BOTTOM_RIGHT_CORNER_SWIPE" navigationComponents:&off_1F130];
}

@end