@interface SCATModernMenuGestureFreehandTouchSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (id)backTitle;
- (id)makeMenuItemsIfNeeded;
@end

@implementation SCATModernMenuGestureFreehandTouchSheet

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray arrayWithCapacity:3];
  v4 = [(SCATModernMenuGestureFreehandSheetBase *)self touchToggleMenuItemWithPreferredNumberOfLines:2];
  [v3 addObject:v4];

  v5 = [(SCATModernMenuGestureFreehandSheetBase *)self autoPressLiftItems];
  [v3 addObjectsFromArray:v5];

  if ([(SCATModernMenuGestureFreehandSheetBase *)self isLandscape])
  {
    v6 = [(SCATModernMenuGestureFreehandSheetBase *)self moveMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v6];

    v7 = [(SCATModernMenuGestureFreehandSheetBase *)self touchToggleMenuItemWithPreferredNumberOfLines:2];
    [v3 addObject:v7];
  }

  return v3;
}

- (id)backTitle
{
  return sub_100040EC8(@"FREEHAND_BACK_TWO_LINES");
}

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 1;
}

@end