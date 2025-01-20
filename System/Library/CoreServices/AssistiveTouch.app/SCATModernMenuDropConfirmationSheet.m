@interface SCATModernMenuDropConfirmationSheet
- (BOOL)shouldKeepScannerAwake;
- (id)makeMenuItemsIfNeeded;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuDropConfirmationSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = sub_100040EC8(@"PERFORM_DROP");
  v4 = +[SCATModernMenuItem itemWithIdentifier:@"kSCATPerformDropIdentifier" delegate:self title:v3 imageName:@"SCATIcon_gestures_drop" activateBehavior:0];

  v7 = v4;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"kSCATPerformDropIdentifier"];

  if (v6)
  {
    v7 = +[SCATScannerManager sharedManager];
    [v7 performDrop];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SCATModernMenuDropConfirmationSheet;
    [(SCATModernMenuSheet *)&v8 menuItemWasActivated:v4];
  }
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

@end