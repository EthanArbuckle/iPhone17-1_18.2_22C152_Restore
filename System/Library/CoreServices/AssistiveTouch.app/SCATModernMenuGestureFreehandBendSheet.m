@interface SCATModernMenuGestureFreehandBendSheet
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuItemWasActivated:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandBendSheet

- (id)makeMenuItemsIfNeeded
{
  int IsPad = AXDeviceIsPad();
  v4 = +[NSMutableArray arrayWithCapacity:3];
  if (IsPad) {
    v5 = @"FREEHAND_BEND_RIGHT_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_BEND_RIGHT_ONE_LINE";
  }
  if (IsPad) {
    v6 = @"FREEHAND_BEND_LEFT_TWO_LINES";
  }
  else {
    v6 = @"FREEHAND_BEND_LEFT_ONE_LINE";
  }
  v7 = sub_100040EC8(v5);
  v8 = sub_100040EC8(v6);
  v9 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_bendRight" delegate:self title:v7 imagePrefixForTouchDependentGlyph:@"bendRight" shouldRotate:1 activateBehavior:2];
  [v4 addObject:v9];

  v10 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_bendLeft" delegate:self title:v8 imagePrefixForTouchDependentGlyph:@"bendLeft" shouldRotate:1 activateBehavior:2];
  [v4 addObject:v10];

  v11 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_straighten" delegate:self title:0 imagePrefixForTouchDependentGlyph:0 shouldRotate:1 activateBehavior:3];
  [v4 addObject:v11];

  if (IsPad)
  {
    v12 = [(SCATModernMenuGestureFreehandSheetBase *)self moveMenuItemWithPreferredNumberOfLines:1];
    [v4 addObject:v12];

    v13 = [(SCATModernMenuGestureFreehandSheetBase *)self touchToggleMenuItemWithPreferredNumberOfLines:1];
    [v4 addObject:v13];

    uint64_t v14 = [(SCATModernMenuGestureFreehandSheetBase *)self moveToolbarMenuItem];
  }
  else
  {
    if (![(SCATModernMenuGestureFreehandSheetBase *)self isLandscape]) {
      goto LABEL_12;
    }
    v15 = [(SCATModernMenuGestureFreehandSheetBase *)self moveMenuItemWithPreferredNumberOfLines:1];
    [v4 addObject:v15];

    uint64_t v14 = [(SCATModernMenuGestureFreehandSheetBase *)self touchToggleMenuItemWithPreferredNumberOfLines:1];
  }
  v16 = (void *)v14;
  [v4 addObject:v14];

LABEL_12:

  return v4;
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"freehand_straighten"];

  if (v6)
  {
    v7 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v7 curvatureForFreehandSheet:self];
    double v9 = v8;

    int IsPad = AXDeviceIsPad();
    if (v9 == 0.0)
    {
      if (IsPad) {
        v11 = @"FREEHAND_STRAIGHT_TWO_LINES";
      }
      else {
        v11 = @"FREEHAND_STRAIGHT_ONE_LINE";
      }
      v12 = sub_100040EC8(v11);
      v13 = @"straight";
    }
    else
    {
      if (IsPad) {
        uint64_t v14 = @"FREEHAND_STRAIGHTEN_TWO_LINES";
      }
      else {
        uint64_t v14 = @"FREEHAND_STRAIGHTEN_ONE_LINE";
      }
      v12 = sub_100040EC8(v14);
      v15 = @"straightenFromLeft";
      if (v9 > 0.0) {
        v15 = @"straightenFromRight";
      }
      v13 = v15;
    }
    [v4 setTitle:v12];
    [v4 setImagePrefixForTouchDependentGlyph:v13];
    [v4 setDisabled:v9 == 0.0];
  }
  v18.receiver = self;
  v18.super_class = (Class)SCATModernMenuGestureFreehandBendSheet;
  BOOL v16 = [(SCATModernMenuGestureFreehandSheetBase *)&v18 shouldUpdateMenuItem:v4];

  return v16;
}

- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 identifier];
  if ([v7 isEqualToString:@"freehand_bendRight"])
  {
    double v8 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v8 freehandSheet:self didHighlightBendRight:v4];
  }
  else if ([v7 isEqualToString:@"freehand_bendLeft"])
  {
    double v8 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v8 freehandSheet:self didHighlightBendLeft:v4];
  }
  else
  {
    if (![v7 isEqualToString:@"freehand_straighten"])
    {
      v9.receiver = self;
      v9.super_class = (Class)SCATModernMenuGestureFreehandBendSheet;
      [(SCATModernMenuGestureFreehandSheetBase *)&v9 menuItem:v6 didBecomeFocused:v4];
      goto LABEL_8;
    }
    double v8 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v8 freehandSheet:self didHighlightStraighten:v4];
  }

LABEL_8:
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"freehand_bendRight"])
  {
    id v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 bendRightForFreehandSheet:self];
  }
  else if ([v5 isEqualToString:@"freehand_bendLeft"])
  {
    id v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 bendLeftForFreehandSheet:self];
  }
  else
  {
    if (![v5 isEqualToString:@"freehand_straighten"])
    {
      v7.receiver = self;
      v7.super_class = (Class)SCATModernMenuGestureFreehandBendSheet;
      [(SCATModernMenuGestureFreehandSheetBase *)&v7 menuItemWasActivated:v4];
      goto LABEL_8;
    }
    id v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 straightenForFreehandSheet:self];
  }

LABEL_8:
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
    id v6 = &off_1001BB850;
    objc_super v7 = &off_1001BB838;
  }
  else
  {
    id v6 = &off_1001BB880;
    objc_super v7 = &off_1001BB868;
  }
  if (v5 == 1.0) {
    return v7;
  }
  else {
    return v6;
  }
}

@end