@interface SCATModernMenuAutoscrollSheet
- (BOOL)allowsExitAction;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (BOOL)shouldUseBackItemAsDoneItem;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (unint64_t)presentationMode;
- (void)dealloc;
- (void)menuItemWasActivated:(id)a3;
- (void)sheetWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuAutoscrollSheet

- (void)dealloc
{
  v3 = +[SCATScannerManager sharedManager];
  v4 = [v3 autoscroller];

  if ([v4 isAutoscrolling]) {
    [v4 stop];
  }

  v5.receiver = self;
  v5.super_class = (Class)SCATModernMenuAutoscrollSheet;
  [(SCATModernMenuSheet *)&v5 dealloc];
}

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  v4 = sub_100040EC8(@"PAUSE");
  objc_super v5 = +[SCATModernMenuItem itemWithIdentifier:@"autoscroll_pause" delegate:self title:v4 imageName:0 activateBehavior:3];
  [v3 addObject:v5];

  v6 = sub_100040EC8(@"SLOWER");
  v7 = +[SCATModernMenuItem itemWithIdentifier:@"autoscroll_decreaseSpeed" delegate:self title:v6 imageName:@"SCATIcon_general_tortoise" activateBehavior:3];
  [v3 addObject:v7];

  v8 = sub_100040EC8(@"FASTER");
  v9 = +[SCATModernMenuItem itemWithIdentifier:@"autoscroll_increaseSpeed" delegate:self title:v8 imageName:@"SCATIcon_general_hare" activateBehavior:3];
  [v3 addObject:v9];

  if (AXDeviceIsPad())
  {
    v10 = sub_100040EC8(@"TOP");
    v11 = +[SCATModernMenuItem itemWithIdentifier:@"autoscroll_scrollToTop" delegate:self title:v10 imageName:0 activateBehavior:3];
    [v3 addObject:v11];
  }

  return v3;
}

- (unint64_t)presentationMode
{
  return 1;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 1;
}

- (BOOL)allowsExitAction
{
  return 0;
}

- (int64_t)preferredTipObject
{
  return 0;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (void)sheetWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATModernMenuAutoscrollSheet;
  [(SCATModernMenuSheet *)&v6 sheetWillDisappear:a3];
  v3 = +[SCATScannerManager sharedManager];
  v4 = [v3 autoscroller];

  if ([v4 isAutoscrolling]) {
    [v4 stop];
  }
  [v4 setScrollElement:0];
  objc_super v5 = +[HNDAccessibilityManager sharedManager];
  [v5 refreshElements];
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if ([v4 isEqualToString:@"autoscroll_pause"])
  {
    objc_super v5 = +[SCATScannerManager sharedManager];
    objc_super v6 = [v5 autoscroller];

    unsigned int v7 = [v6 isAutoscrolling];
    BOOL v8 = v7 == 0;
    if (v7) {
      v9 = @"PAUSE";
    }
    else {
      v9 = @"RESUME";
    }
    if (v8) {
      CFStringRef v10 = @"SCATIcon_autoscroll_resume";
    }
    else {
      CFStringRef v10 = @"SCATIcon_autoscroll_pause";
    }
    v11 = sub_100040EC8(v9);
    [v3 setTitle:v11];

    [v3 setImageName:v10];
  }

  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 identifier];
  if ([v5 isEqualToString:@"autoscroll_pause"])
  {
    objc_super v6 = +[SCATScannerManager sharedManager];
    unsigned int v7 = [v6 autoscroller];

    if ([v7 isAutoscrolling]) {
      [v7 pause];
    }
    else {
      [v7 resume];
    }
  }
  else
  {
    if ([v5 isEqualToString:@"autoscroll_increaseSpeed"])
    {
      BOOL v8 = +[SCATScannerManager sharedManager];
      v9 = [v8 autoscroller];

      [v9 increaseAutoscrollSpeed];
    }
    else if ([v5 isEqualToString:@"autoscroll_decreaseSpeed"])
    {
      CFStringRef v10 = +[SCATScannerManager sharedManager];
      v9 = [v10 autoscroller];

      [v9 decreaseAutoscrollSpeed];
    }
    else
    {
      if (![v5 isEqualToString:@"autoscroll_scrollToTop"])
      {
        v12.receiver = self;
        v12.super_class = (Class)SCATModernMenuAutoscrollSheet;
        [(SCATModernMenuSheet *)&v12 menuItemWasActivated:v4];
        goto LABEL_13;
      }
      v11 = +[SCATScannerManager sharedManager];
      v9 = [v11 autoscroller];

      [v9 scrollToTop];
    }
  }
LABEL_13:
}

@end