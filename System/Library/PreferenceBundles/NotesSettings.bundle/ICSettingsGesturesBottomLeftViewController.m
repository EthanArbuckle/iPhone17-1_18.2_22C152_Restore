@interface ICSettingsGesturesBottomLeftViewController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsGesturesBottomLeftViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsGesturesBottomLeftViewController;
  [(ICSettingsGesturesBottomLeftViewController *)&v4 viewDidAppear:a3];
  [(ICSettingsGesturesBottomLeftViewController *)self ic_submitNavigationEventForIdentifier:@"BOTTOM_LEFT_CORNER_SWIPE" titleStringKey:@"BOTTOM_LEFT_CORNER_SWIPE" navigationComponents:&off_1F118];
}

@end