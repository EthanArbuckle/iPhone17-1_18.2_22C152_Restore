@interface SCATModernMenuGestureFreehandMainSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUseBackItemAsDoneItem;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandMainSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  if (AXDeviceIsPad())
  {
    v4 = [(SCATModernMenuGestureFreehandSheetBase *)self rotateMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v4];

    v5 = [(SCATModernMenuGestureFreehandSheetBase *)self bendMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v5];

    v6 = [(SCATModernMenuGestureFreehandSheetBase *)self moveMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v6];

    v7 = [(SCATModernMenuGestureFreehandSheetBase *)self touchToggleMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v7];

    v8 = sub_100040EC8(@"FREEHAND_MORE_TWO_LINES");
    v9 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_more" delegate:self title:v8 activateBehavior:2];
    [v3 addObject:v9];

    v10 = [(SCATModernMenuGestureFreehandSheetBase *)self moveToolbarMenuItem];
    [v3 addObject:v10];
  }
  else
  {
    if ([(SCATModernMenuGestureFreehandSheetBase *)self isLandscape])
    {
      v11 = [(SCATModernMenuGestureFreehandSheetBase *)self pathMenuItems];
      [v3 addObjectsFromArray:v11];
    }
    else
    {
      v11 = sub_100040EC8(@"FREEHAND_PATH");
      v12 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_path" delegate:self title:v11 imagePrefixForTouchDependentGlyph:@"adjust" shouldRotate:1 activateBehavior:2];
      [v3 addObject:v12];
    }
    v13 = sub_100040EC8(@"FREEHAND_TOUCH");
    v14 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_touch" delegate:self title:v13 activateBehavior:2];
    [v3 addObject:v14];

    v10 = sub_100040EC8(@"FREEHAND_MORE_ONE_LINE");
    v15 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_more" delegate:self title:v10 activateBehavior:2];
    [v3 addObject:v15];
  }

  return v3;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"freehand_path"]
    || [v5 isEqualToString:@"freehand_touch"]
    || [v5 isEqualToString:@"freehand_more"])
  {
    [(SCATModernMenuGestureFreehandSheetBase *)self pushFreehandSheetOfClass:objc_opt_class()];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SCATModernMenuGestureFreehandMainSheet;
    [(SCATModernMenuGestureFreehandSheetBase *)&v6 menuItemWasActivated:v4];
  }
}

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 1;
}

- (id)menuItemStruts
{
  if (!AXDeviceIsPad()) {
    return 0;
  }
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  if ([(SCATModernMenuGestureFreehandSheetBase *)self isLandscape])
  {
    objc_super v6 = &off_1001BB988;
    v7 = &off_1001BB970;
  }
  else
  {
    objc_super v6 = &off_1001BB9B8;
    v7 = &off_1001BB9A0;
  }
  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

@end