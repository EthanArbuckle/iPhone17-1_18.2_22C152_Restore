@interface SCATModernMenuGestureFreehandSheetBase
- (BOOL)delegatesScannerControl;
- (BOOL)isLandscape;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateItemsOnOrientationChange;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (Class)_menuItemClass;
- (SCATModernMenuGestureFreehandSheetDelegate)delegate;
- (id)_imageNameForPrefix:(id)a3;
- (id)_titleForLocalizableString:(id)a3 state:(BOOL)a4;
- (id)autoPressLiftItems;
- (id)bendMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)elementProvider;
- (id)moveMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)moveToolbarMenuItem;
- (id)pathMenuItems;
- (id)rotateMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (id)touchToggleMenuItemWithPreferredNumberOfLines:(unint64_t)a3;
- (unint64_t)presentationMode;
- (void)didChangeOrientation;
- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4;
- (void)menuItemWasActivated:(id)a3;
- (void)pushFreehandSheetOfClass:(Class)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuItems:(id)a3;
@end

@implementation SCATModernMenuGestureFreehandSheetBase

- (BOOL)shouldUpdateItemsOnOrientationChange
{
  return 0;
}

- (id)pathMenuItems
{
  v3 = +[NSMutableArray arrayWithCapacity:3];
  v4 = [(SCATModernMenuGestureFreehandSheetBase *)self moveMenuItemWithPreferredNumberOfLines:1];
  [v3 addObject:v4];

  v5 = [(SCATModernMenuGestureFreehandSheetBase *)self rotateMenuItemWithPreferredNumberOfLines:1];
  [v3 addObject:v5];

  v6 = [(SCATModernMenuGestureFreehandSheetBase *)self bendMenuItemWithPreferredNumberOfLines:1];
  [v3 addObject:v6];

  return v3;
}

- (id)moveMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_MOVE_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_MOVE_ONE_LINE";
  }
  v6 = sub_100040EC8(v5);
  v7 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_move" delegate:self title:v6 imagePrefixForTouchDependentGlyph:@"move" shouldRotate:1 activateBehavior:2];
  [v7 setPreferredNumberOfTitleLines:a3];

  return v7;
}

- (id)rotateMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_ROTATE_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_ROTATE_ONE_LINE";
  }
  v6 = sub_100040EC8(v5);
  v7 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_rotate" delegate:self title:v6 imagePrefixForTouchDependentGlyph:@"rotate" shouldRotate:1 activateBehavior:2];
  [v7 setPreferredNumberOfTitleLines:a3];

  return v7;
}

- (id)bendMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  if (a3 == 2) {
    v5 = @"FREEHAND_BEND_TWO_LINES";
  }
  else {
    v5 = @"FREEHAND_BEND_ONE_LINE";
  }
  v6 = sub_100040EC8(v5);
  v7 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_bend" delegate:self title:v6 imagePrefixForTouchDependentGlyph:@"bend" shouldRotate:1 activateBehavior:2];
  [v7 setPreferredNumberOfTitleLines:a3];

  return v7;
}

- (id)touchToggleMenuItemWithPreferredNumberOfLines:(unint64_t)a3
{
  v4 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_touch_toggle" delegate:self title:0 activateBehavior:3];
  [v4 setPreferredNumberOfTitleLines:a3];

  return v4;
}

- (id)moveToolbarMenuItem
{
  v3 = sub_100040EC8(@"FREEHAND_MOVE_MENU");
  v4 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_move_menu" delegate:self title:v3 activateBehavior:3];

  return v4;
}

- (id)autoPressLiftItems
{
  v3 = +[NSMutableArray arrayWithCapacity:2];
  v4 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_auto_press_toggle" delegate:self title:0 activateBehavior:3];
  [v3 addObject:v4];

  v5 = +[SCATModernMenuGestureFreehandItem itemWithIdentifier:@"freehand_auto_lift_toggle" delegate:self title:0 activateBehavior:3];
  [v3 addObject:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "updateItem", (void)v12);
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)pushFreehandSheetOfClass:(Class)a3
{
  id v4 = [a3 alloc];
  v5 = [(SCATModernMenuSheet *)self menu];
  id v8 = [v4 initWithMenu:v5];

  id v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
  [v8 setDelegate:v6];

  id v7 = [(SCATModernMenuSheet *)self menu];
  [v7 pushSheet:v8];
}

- (BOOL)isLandscape
{
  v2 = +[SCATScannerManager sharedManager];
  unsigned __int8 v3 = [v2 isLandscape];

  return v3;
}

- (id)_imageNameForPrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
  LODWORD(self) = [v5 isTouchOnForFreehandSheet:self];

  if (self) {
    CFStringRef v6 = @"SCATIcon_freehand_%@TouchOn";
  }
  else {
    CFStringRef v6 = @"SCATIcon_freehand_%@TouchOff";
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);

  return v7;
}

- (id)_titleForLocalizableString:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = sub_100040EC8(a3);
  if (v4) {
    CFStringRef v6 = @"FREEHAND_ON";
  }
  else {
    CFStringRef v6 = @"FREEHAND_OFF";
  }
  id v7 = sub_100040EC8(v6);
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  return v8;
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"freehand_touch_toggle"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    id v7 = [v6 isTouchOnForFreehandSheet:self];

    if ([v4 preferredNumberOfTitleLines] == (id)2) {
      CFStringRef v8 = @"FREEHAND_TOUCH_STATE_TWO_LINES";
    }
    else {
      CFStringRef v8 = @"FREEHAND_TOUCH_STATE_ONE_LINE";
    }
    uint64_t v9 = [(SCATModernMenuGestureFreehandSheetBase *)self _titleForLocalizableString:v8 state:v7];
    [v4 setTitle:v9];

    CFStringRef v10 = @"SCATIcon_freehand_touchOff";
    CFStringRef v11 = @"SCATIcon_freehand_touchOn";
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"freehand_auto_press_toggle"])
  {
    long long v12 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    id v7 = [v12 isAutoPressOnForFreehandSheet:self];

    long long v13 = [(SCATModernMenuGestureFreehandSheetBase *)self _titleForLocalizableString:@"FREEHAND_AUTO_PRESS_STATE" state:v7];
    [v4 setTitle:v13];

    CFStringRef v10 = @"SCATIcon_freehand_autoPressOff";
    CFStringRef v11 = @"SCATIcon_freehand_autoPressOn";
LABEL_10:
    if (v7) {
      CFStringRef v16 = v11;
    }
    else {
      CFStringRef v16 = v10;
    }
    [v4 setImageName:v16];
LABEL_14:
    BOOL v17 = 1;
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"freehand_auto_lift_toggle"])
  {
    long long v14 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    id v7 = [v14 isAutoLiftOnForFreehandSheet:self];

    long long v15 = [(SCATModernMenuGestureFreehandSheetBase *)self _titleForLocalizableString:@"FREEHAND_AUTO_LIFT_STATE" state:v7];
    [v4 setTitle:v15];

    CFStringRef v10 = @"SCATIcon_freehand_autoLiftOff";
    CFStringRef v11 = @"SCATIcon_freehand_autoLiftOn";
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"freehand_move_menu"])
  {
    v19 = [(SCATModernMenuSheet *)self menu];
    if ([v19 dockPosition] == (id)1) {
      CFStringRef v20 = @"SCATIcon_freehand_menuBottom";
    }
    else {
      CFStringRef v20 = @"SCATIcon_freehand_menuTop";
    }
    [v4 setImageName:v20];

    goto LABEL_14;
  }
  v21 = [v4 imagePrefixForTouchDependentGlyph];
  BOOL v17 = v21 != 0;
  if (v21)
  {
    v22 = [(SCATModernMenuGestureFreehandSheetBase *)self _imageNameForPrefix:v21];
    [v4 setImageName:v22];
  }
  if ([v4 shouldRotate])
  {
    v23 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v23 angleForFreehandSheet:self];
    double v25 = v24;

    [v4 setIconImageAngle:v25 + 1.57079633];
    BOOL v17 = 1;
  }

LABEL_15:
  return v17;
}

- (BOOL)shouldKeepScannerAwake
{
  return 1;
}

- (unint64_t)presentationMode
{
  return 1;
}

- (BOOL)delegatesScannerControl
{
  return 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 isEqualToString:@"freehand_move"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 moveForFreehandSheet:self];
LABEL_24:

    goto LABEL_25;
  }
  if ([v5 isEqualToString:@"freehand_rotate"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 rotateForFreehandSheet:self];
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"freehand_bend"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 bendForFreehandSheet:self];
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"freehand_touch_toggle"])
  {
    id v7 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v7 toggleTouchForFreehandSheet:self];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CFStringRef v6 = [(SCATModernMenuSheet *)self menuItems];
    id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(id *)(*((void *)&v15 + 1) + 8 * i);
          if (v12 != v4) {
            [v12 updateItem];
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"freehand_auto_press_toggle"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 autoPressToggledForFreehandSheet:self];
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"freehand_auto_lift_toggle"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 autoLiftToggledForFreehandSheet:self];
    goto LABEL_24;
  }
  if ([v5 isEqualToString:@"freehand_move_menu"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 moveToolbarForFreehandSheet:self];
    goto LABEL_24;
  }
  v14.receiver = self;
  v14.super_class = (Class)SCATModernMenuGestureFreehandSheetBase;
  [(SCATModernMenuSheet *)&v14 menuItemWasActivated:v4];
LABEL_25:
  if ([(SCATModernMenuSheet *)self isBackItemIdentifier:v5])
  {
    long long v13 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v13 didPopFreehandSheet:self];
  }
}

- (void)menuItem:(id)a3 didBecomeFocused:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [a3 identifier];
  if ([v7 isEqualToString:@"freehand_move"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 freehandSheet:self didHighlightMove:v4];
  }
  else if ([v7 isEqualToString:@"freehand_rotate"])
  {
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 freehandSheet:self didHighlightRotate:v4];
  }
  else
  {
    if (![v7 isEqualToString:@"freehand_bend"]) {
      goto LABEL_8;
    }
    CFStringRef v6 = [(SCATModernMenuGestureFreehandSheetBase *)self delegate];
    [v6 freehandSheet:self didHighlightBend:v4];
  }

LABEL_8:
}

- (void)setMenuItems:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATModernMenuSheet *)self menuItems];
  v15.receiver = self;
  v15.super_class = (Class)SCATModernMenuGestureFreehandSheetBase;
  [(SCATModernMenuSheet *)&v15 setMenuItems:v4];
  if (v5 != v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setDelegate:", 0, (void)v11);
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)elementProvider
{
  unsigned __int8 v3 = +[NSMutableArray arrayWithCapacity:4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SCATModernMenuSheet *)self menuItems];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v9 isDisabled] & 1) == 0)
        {
          uint64_t v10 = [v9 scatElement];
          [v3 axSafelyAddObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v11 = [[SCATStaticElementProvider alloc] initWithElements:v3];

  return v11;
}

- (void)didChangeOrientation
{
  v2.receiver = self;
  v2.super_class = (Class)SCATModernMenuGestureFreehandSheetBase;
  [(SCATModernMenuSheet *)&v2 didChangeOrientation];
  AXPerformBlockOnMainThreadAfterDelay();
}

- (Class)_menuItemClass
{
  return (Class)objc_opt_class();
}

- (SCATModernMenuGestureFreehandSheetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATModernMenuGestureFreehandSheetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end