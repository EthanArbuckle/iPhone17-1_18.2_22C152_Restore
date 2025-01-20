@interface SCATCursorManager
- (BOOL)isCursorUIHidden;
- (NSString)description;
- (SCATCursorController)containingGroupCursorController;
- (SCATCursorController)focusedItemCursorController;
- (SCATCursorController)menuItemCursorController;
- (SCATCursorManager)initWithDisplaySource:(id)a3;
- (SCATCursorManagerDelegate)delegate;
- (SCATDisplaySource)displaySourceDelegate;
- (id)_cursorPathAndFrame:(CGRect *)a3 forElementFrame:(CGRect)a4 inDisplayContext:(id)a5;
- (id)cursors;
- (id)displayContextForCursor:(id)a3;
- (id)displayContextForCursor:(id)a3 forDisplayID:(unsigned int)a4;
- (id)styleProvider;
- (void)_path:(id *)a3 frame:(CGRect *)a4 isSimpleRect:(BOOL *)a5 forFocusContext:(id)a6 cursor:(id)a7;
- (void)_reorderLayersIfNeededForDisplayID:(unsigned int)a3;
- (void)_theme:(int64_t *)a3 level:(int64_t *)a4 forFocusContext:(id)a5 cursor:(id)a6 options:(int)a7;
- (void)_updateCursor:(id)a3 withFocusContext:(id)a4 shouldAnimate:(BOOL)a5 options:(int)a6;
- (void)_updateZoom:(CGRect)a3 withElement:(id)a4 cursorController:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginSelectTimeoutAnimation:(double)a3;
- (void)cancelSelectTimeoutAnimationIfNeeded;
- (void)dealloc;
- (void)hideCursor:(BOOL)a3 animated:(BOOL)a4;
- (void)setContainingGroupCursorController:(id)a3;
- (void)setCursorUIHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaySourceDelegate:(id)a3;
- (void)setFocusedItemCursorController:(id)a3;
- (void)setMenuItemCursorController:(id)a3;
- (void)updateMainCursorWithElement:(id)a3;
- (void)updateWithFocusContext:(id)a3 animated:(BOOL)a4 options:(int)a5;
@end

@implementation SCATCursorManager

- (SCATCursorManager)initWithDisplaySource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCATCursorManager;
  v5 = [(SCATCursorManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(SCATCursorManager *)v5 setDisplaySourceDelegate:v4];
    v7 = objc_alloc_init(SCATCursorController);
    [(SCATCursorManager *)v6 setFocusedItemCursorController:v7];
    [(SCATCursorController *)v7 setDelegate:v6];
    v8 = objc_alloc_init(SCATCursorController);

    [(SCATCursorManager *)v6 setContainingGroupCursorController:v8];
    [(SCATCursorController *)v8 setDelegate:v6];
    v9 = objc_alloc_init(SCATCursorController);

    [(SCATCursorManager *)v6 setMenuItemCursorController:v9];
    [(SCATCursorController *)v9 setDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  [(SCATCursorManager *)self setFocusedItemCursorController:self->_focusedItemCursorController];
  v3 = [(SCATCursorManager *)self containingGroupCursorController];
  [v3 setDelegate:0];

  [(SCATCursorManager *)self setContainingGroupCursorController:self->_containingGroupCursorController];
  id v4 = [(SCATCursorManager *)self menuItemCursorController];
  [v4 setDelegate:0];

  [(SCATCursorManager *)self setMenuItemCursorController:self->_menuItemCursorController];
  v5.receiver = self;
  v5.super_class = (Class)SCATCursorManager;
  [(SCATCursorManager *)&v5 dealloc];
}

- (NSString)description
{
  v3 = +[NSNumber numberWithBool:[(SCATCursorManager *)self isCursorUIHidden]];
  id v4 = [(SCATCursorManager *)self focusedItemCursorController];
  objc_super v5 = [(SCATCursorManager *)self containingGroupCursorController];
  v6 = [(SCATCursorManager *)self menuItemCursorController];
  v7 = +[NSString stringWithFormat:@"SCATCursorManager:<%p>. HIDDEN:%@\n\tFocusCursor:%@\n\tGroupCursor:%@\n\tMenuCursor:%@\n\t", self, v3, v4, v5, v6];

  return (NSString *)v7;
}

- (id)displayContextForCursor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SCATCursorManager *)self menuItemCursorController];
  unsigned int v6 = [v4 isEqual:v5];

  v7 = [(SCATCursorManager *)self displaySourceDelegate];
  v8 = v7;
  if (v6) {
    [v7 scatFrontCursorUIContext];
  }
  else {
  v9 = [v7 scatBackCursorUIContext];
  }

  return v9;
}

- (id)displayContextForCursor:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(SCATCursorManager *)self menuItemCursorController];
  unsigned int v8 = [v6 isEqual:v7];

  v9 = [(SCATCursorManager *)self displaySourceDelegate];
  v10 = v9;
  if (v8) {
    [v9 scatFrontCursorUIContextForDisplayID:v4];
  }
  else {
  objc_super v11 = [v9 scatBackCursorUIContextForDisplayID:v4];
  }

  return v11;
}

- (id)cursors
{
  v3 = [(SCATCursorManager *)self focusedItemCursorController];
  uint64_t v4 = [(SCATCursorManager *)self containingGroupCursorController];
  v8[1] = v4;
  objc_super v5 = [(SCATCursorManager *)self menuItemCursorController];
  v8[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (id)styleProvider
{
  return +[SCATStyleProvider sharedStyleProvider];
}

- (void)_updateZoom:(CGRect)a3 withElement:(id)a4 cursorController:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v29 = a4;
  id v11 = a5;
  if (_AXSZoomTouchEnabled())
  {
    unint64_t v12 = (unint64_t)[v29 scatTraits];
    if ((kAXIsEditingTrait & v12) != 0)
    {
      [v29 scatTextCursorFrame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = +[ZoomServices sharedInstance];
      v22 = [(SCATCursorManager *)self displayContextForCursor:v11];
      v23 = [v22 window];
      v24 = [v23 screen];
      v25 = [v24 displayIdentity];
      -[UIView notifyZoomFocusDidChangeWithType:rect:contextId:displayId:](v21, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 3, 0, [v25 displayID], v14, v16, v18, v20);

LABEL_12:
      goto LABEL_13;
    }
    unint64_t v26 = v12;
    if (AXDeviceIsPhoneIdiom())
    {
      if (width <= 250.0 || (kAXButtonTrait & v26) != 0)
      {
        if (width <= 100.0 && height <= 100.0) {
          goto LABEL_11;
        }
        AX_CGRectGetCenter();
        double x = v27 + -2.5;
        double y = v28 + -2.5;
      }
      double width = 5.0;
      double height = 5.0;
    }
LABEL_11:
    v21 = [(SCATCursorManager *)self displayContextForCursor:v11];
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)3, v31, v21);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_updateCursor:(id)a3 withFocusContext:(id)a4 shouldAnimate:(BOOL)a5 options:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  uint64_t v20 = 0;
  [(SCATCursorManager *)self _theme:&v21 level:&v20 forFocusContext:v10 cursor:v9 options:v6];
  char v19 = 1;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v18 = size;
  if (v20)
  {
    id v16 = 0;
    [(SCATCursorManager *)self _path:&v16 frame:&origin isSimpleRect:&v19 forFocusContext:v10 cursor:v9];
    id v12 = v16;
    uint64_t v13 = v20;
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = 0;
  }
  objc_msgSend(v9, "updateTheme:level:path:frame:isSimpleRect:animated:options:", v21, v13, v12, origin, v18);
  id v14 = [(SCATCursorManager *)self focusedItemCursorController];
  if (v14 != v9) {
    goto LABEL_7;
  }
  unsigned int v15 = [v10 shouldBeTrackedByZoom];

  if (v15)
  {
    id v14 = [v10 element];
    -[SCATCursorManager _updateZoom:withElement:cursorController:](self, "_updateZoom:withElement:cursorController:", v14, v9, origin, v18);
LABEL_7:
  }
}

- (void)updateWithFocusContext:(id)a3 animated:(BOOL)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  -[SCATCursorManager _reorderLayersIfNeededForDisplayID:](self, "_reorderLayersIfNeededForDisplayID:", [v8 displayID]);
  if (v8)
  {
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    *((void *)&v18 + 1) = 0;
    long long v19 = 0uLL;
    id v9 = [(SCATCursorManager *)self cursors];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [(SCATCursorManager *)self _updateCursor:*(void *)(*((void *)&v18 + 1) + 8 * i) withFocusContext:v8 shouldAnimate:v6 options:v5];
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    id v9 = [(SCATCursorManager *)self cursors];
    id v14 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) updateLevel:0 animated:v6 options:v5];
        }
        id v15 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

- (void)updateMainCursorWithElement:(id)a3
{
  id v4 = a3;
  -[SCATCursorManager _reorderLayersIfNeededForDisplayID:](self, "_reorderLayersIfNeededForDisplayID:", [v4 scatDisplayId]);
  id v6 = +[SCATFocusContext adHocFocusContext:v4];

  uint64_t v5 = [(SCATCursorManager *)self focusedItemCursorController];
  [(SCATCursorManager *)self _updateCursor:v5 withFocusContext:v6 shouldAnimate:0 options:0];
}

- (void)beginSelectTimeoutAnimation:(double)a3
{
  uint64_t v5 = [(SCATCursorManager *)self focusedItemCursorController];
  id v10 = [v5 cursorBackgroundLayer];

  id v6 = +[CABasicAnimation animationWithKeyPath:@"fillColor"];
  [v6 setValue:@"scatBeginSelectTimeoutAnimation" forKey:@"scatAnimationID"];
  v7 = +[AXSettings sharedInstance];
  [v7 assistiveTouchCursorColor];

  id v8 = (CGColor *)AXSAssistiveTouchCursorColor();
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v8, 0.5);
  [v6 setToValue:CopyWithAlpha];
  [v6 setDuration:a3];
  [v6 setDelegate:self];
  [v6 setRemovedOnCompletion:0];
  [v10 addAnimation:v6 forKey:@"scatBeginSelectTimeoutAnimation"];
  if (CopyWithAlpha) {
    CFRelease(CopyWithAlpha);
  }
}

- (void)cancelSelectTimeoutAnimationIfNeeded
{
  v2 = [(SCATCursorManager *)self focusedItemCursorController];
  id v3 = [v2 cursorBackgroundLayer];

  [v3 removeAnimationForKey:@"scatBeginSelectTimeoutAnimation"];
}

- (void)hideCursor:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SCATCursorManager *)self isCursorUIHidden] != a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = [(SCATCursorManager *)self cursors];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hide:v5 animate:v4];
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(SCATCursorManager *)self setCursorUIHidden:v5];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v5 = objc_msgSend(a3, "valueForKey:", @"scatAnimationID", a4);
  unsigned int v6 = [v5 isEqualToString:@"scatBeginSelectTimeoutAnimation"];

  if (v6)
  {
    v7 = [(SCATCursorManager *)self focusedItemCursorController];
    id v10 = [v7 cursorBackgroundLayer];

    id v8 = +[CABasicAnimation animationWithKeyPath:@"strokeColor"];
    [v8 setValue:@"scatEndSelectTimeoutAnimation" forKey:@"scatAnimationID"];
    id v9 = [v10 restingStrokeColor];
    objc_msgSend(v8, "setToValue:", objc_msgSend(v9, "CGColor"));

    [v8 setDuration:0.3];
    [v8 setRemovedOnCompletion:1];
    [v10 addAnimation:v8 forKey:@"scatEndSelectTimeoutAnimation"];
  }
}

- (void)_reorderLayersIfNeededForDisplayID:(unsigned int)a3
{
  BOOL v5 = [(SCATCursorManager *)self focusedItemCursorController];
  v11[0] = v5;
  unsigned int v6 = [(SCATCursorManager *)self containingGroupCursorController];
  v11[1] = v6;
  v7 = [(SCATCursorManager *)self menuItemCursorController];
  v11[2] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:3];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CDBB8;
  v9[3] = &unk_1001AE4E0;
  v9[4] = self;
  unsigned int v10 = a3;
  [v8 enumerateObjectsUsingBlock:v9];
}

- (void)_theme:(int64_t *)a3 level:(int64_t *)a4 forFocusContext:(id)a5 cursor:(id)a6 options:(int)a7
{
  char v7 = a7;
  id v46 = a5;
  id v12 = a6;
  long long v13 = [(SCATCursorManager *)self focusedItemCursorController];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    long long v15 = [v46 element];
    uint64_t v16 = [v46 menuElement];

    if (v15 != v16)
    {
      if ((v7 & 8) != 0)
      {
        int64_t v22 = 4;
        goto LABEL_37;
      }
      double v17 = [v46 element];
      long long v18 = [v17 scatOverrideCursorTheme];

      long long v19 = [v46 element];
      long long v20 = v19;
      if (v18)
      {
        long long v21 = [v19 scatOverrideCursorTheme];
        int64_t v22 = [v21 unsignedIntValue];

LABEL_37:
        int64_t v39 = 1;
        goto LABEL_38;
      }
      uint64_t v40 = [v19 scatIndicatesOwnFocus];

      if ((v40 & 1) == 0)
      {
        if ([v46 selectBehavior] == 4)
        {
          int64_t v22 = 3;
          goto LABEL_37;
        }
        if ([v46 selectBehavior] == 1)
        {
          int64_t v39 = 1;
          int64_t v22 = 1;
          goto LABEL_38;
        }
        [v46 selectBehavior];
LABEL_36:
        int64_t v22 = 0;
        goto LABEL_37;
      }
    }
    goto LABEL_26;
  }
  long long v23 = [(SCATCursorManager *)self containingGroupCursorController];
  unsigned int v24 = [v12 isEqual:v23];

  if (v24)
  {
    long long v25 = [v46 element];
    unsigned __int8 v26 = [v25 scatHidesGroupCursorWhenFocused];

    if (v26) {
      goto LABEL_26;
    }
    double v27 = [v46 element];
    double v28 = [v46 menuElement];

    if (v27 == v28) {
      goto LABEL_26;
    }
    if ([v46 selectBehavior] == 4)
    {
      id v29 = [v46 element];
      unsigned int v30 = [v29 scatIsAuxiliaryElement];
    }
    else
    {
      unsigned int v30 = 1;
    }
    int64_t v39 = 0;
    int64_t v22 = 0;
    if ((v7 & 1) == 0 && v30)
    {
      v41 = [v46 element];
      if ([v41 scatIndicatesOwnFocus])
      {
        v42 = [v46 element];
        unsigned int v43 = [v42 scatIsAuxiliaryElement];

        if (!v43) {
          goto LABEL_26;
        }
      }
      else
      {
      }
      v44 = [v46 parentGroup];
      v45 = v44;
      if (v44 && ![v44 isRootGroup])
      {
        int64_t v22 = 2;
        int64_t v39 = 1;
      }
      else
      {
        int64_t v39 = 0;
        int64_t v22 = 0;
      }
    }
  }
  else
  {
    CGRect v31 = [(SCATCursorManager *)self menuItemCursorController];
    unsigned int v32 = [v12 isEqual:v31];

    if (!v32) {
      goto LABEL_36;
    }
    uint64_t v33 = [v46 menuElement];
    if (!v33
      || (v34 = (void *)v33,
          [(SCATCursorManager *)self delegate],
          v35 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v36 = [v35 cursorManagerShouldHideMenuCursor:self],
          v35,
          v34,
          (v36 & 1) != 0))
    {
LABEL_26:
      int64_t v39 = 0;
      int64_t v22 = 0;
      goto LABEL_38;
    }
    v37 = [v46 menuElement];
    v38 = [v46 element];

    int64_t v22 = 0;
    if (v37 == v38) {
      int64_t v39 = 1;
    }
    else {
      int64_t v39 = 2;
    }
  }
LABEL_38:
  if (a4) {
    *a4 = v39;
  }
  if (a3) {
    *a3 = v22;
  }
}

- (void)_path:(id *)a3 frame:(CGRect *)a4 isSimpleRect:(BOOL *)a5 forFocusContext:(id)a6 cursor:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v47 = size;
  long long v15 = -[SCATCursorManager displayContextForCursor:forDisplayID:](self, "displayContextForCursor:forDisplayID:", v13, [v12 displayID]);
  uint64_t v16 = [(SCATCursorManager *)self focusedItemCursorController];
  unsigned int v17 = [v13 isEqual:v16];

  if (v17)
  {
    uint64_t v18 = [v12 element];
LABEL_9:
    int64_t v22 = (void *)v18;
    goto LABEL_10;
  }
  long long v19 = [(SCATCursorManager *)self containingGroupCursorController];
  unsigned int v20 = [v13 isEqual:v19];

  if (!v20)
  {
    long long v23 = [(SCATCursorManager *)self menuItemCursorController];
    unsigned int v24 = [v13 isEqual:v23];

    if (!v24)
    {
      int64_t v22 = 0;
      goto LABEL_22;
    }
    uint64_t v18 = [v12 menuElement];
    goto LABEL_9;
  }
  long long v21 = [v12 parentGroup];
  if ([v21 scatIsAuxiliaryElement])
  {
    do
    {
      int64_t v22 = [v21 parentGroup];

      long long v21 = v22;
    }
    while (([v22 scatIsAuxiliaryElement] & 1) != 0);
LABEL_10:
    if (v22) {
      goto LABEL_11;
    }
LABEL_22:
    BOOL v27 = 0;
    long long v25 = 0;
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  int64_t v22 = v21;
  if (!v21) {
    goto LABEL_22;
  }
LABEL_11:
  if ([v22 scatPath])
  {
    long long v25 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v22 scatPath]);
    if ([v22 scatPathIsInSceneReferenceSpace])
    {
      uint64_t v26 = [v25 convertPathToView:v15];

      +[HNDScreen convertRect:toView:](HNDScreen, "convertRect:toView:", v15, -[HNDHandManager screenFrame:]_0());
      BOOL v27 = 0;
      origin.double x = v28;
      origin.double y = v29;
      v47.double width = v30;
      v47.double height = v31;
      long long v25 = (void *)v26;
      if (!a3) {
        goto LABEL_24;
      }
LABEL_23:
      *a3 = v25;
      goto LABEL_24;
    }
    [v22 scatFrame];
    +[HNDScreen convertRect:toView:](HNDScreen, "convertRect:toView:", v15);
    BOOL v27 = 0;
    origin.double x = v41;
    origin.double y = v42;
    v47.double width = v43;
    v47.double height = v44;
    if (a3) {
      goto LABEL_23;
    }
  }
  else
  {
    [v22 scatFrame];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v48.origin.double x = CGRectZero.origin.x;
    v48.origin.double y = CGRectZero.origin.y;
    v48.size.double width = CGRectZero.size.width;
    v48.size.double height = CGRectZero.size.height;
    v49.origin.double x = v33;
    v49.origin.double y = v35;
    v49.size.double width = v37;
    v49.size.double height = v39;
    BOOL v40 = CGRectEqualToRect(v48, v49);
    if (v40)
    {
      long long v25 = 0;
    }
    else
    {
      long long v25 = -[SCATCursorManager _cursorPathAndFrame:forElementFrame:inDisplayContext:](self, "_cursorPathAndFrame:forElementFrame:inDisplayContext:", &origin, v15, v33, v35, v37, v39);
    }
    BOOL v27 = !v40;
    if (a3) {
      goto LABEL_23;
    }
  }
LABEL_24:
  if (a5) {
    *a5 = v27;
  }
  if (a4)
  {
    CGSize v45 = v47;
    a4->CGPoint origin = origin;
    a4->CGSize size = v45;
  }
}

- (id)_cursorPathAndFrame:(CGRect *)a3 forElementFrame:(CGRect)a4 inDisplayContext:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = CGRectZero.origin.y;
  CGFloat v12 = CGRectZero.size.width;
  CGFloat v13 = CGRectZero.size.height;
  id v14 = a5;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  v64.origin.CGFloat x = CGRectZero.origin.x;
  v64.origin.CGFloat y = v11;
  v64.size.CGFloat width = v12;
  v64.size.CGFloat height = v13;
  if (CGRectEqualToRect(v57, v64)) {
    _AXAssert();
  }
  long long v15 = [(SCATCursorManager *)self styleProvider];
  [v15 cursorBackgroundBorderWidth];
  double v17 = v16;

  uint64_t v18 = [(SCATCursorManager *)self styleProvider];
  [v18 cursorElementPadding];
  double v20 = v19;

  long long v21 = [(SCATCursorManager *)self styleProvider];
  [v21 cursorRoundedRectCornerRadius];
  double v55 = v22;

  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  CGRect v59 = CGRectInset(v58, -v20, -v20);
  double v23 = v59.origin.x;
  double v24 = v59.size.width;
  double v25 = (40.0 - v59.size.height) * 0.5;
  if (v59.size.height >= 40.0) {
    double v25 = 0.0;
  }
  double v26 = v59.origin.y - v25;
  if (v59.size.height >= 40.0) {
    double v27 = v59.size.height;
  }
  else {
    double v27 = 40.0;
  }
  CGFloat v28 = [v14 _screen];
  [v28 nativeBounds];
  double v33 = sub_100040BE4(v23, v26, v24, v27, v29, v30, v31, v32);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  +[HNDScreen convertRect:toView:](HNDScreen, "convertRect:toView:", v14, v33, v35, v37, v39);
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;

  v60.origin.CGFloat x = 0.0;
  v60.origin.CGFloat y = 0.0;
  v60.size.CGFloat width = v45;
  v60.size.CGFloat height = v47;
  CGRect v61 = CGRectInset(v60, v17 * 0.5, v17 * 0.5);
  CGRect v62 = CGRectIntegral(v61);
  double v48 = v62.origin.x;
  double v49 = v62.origin.y;
  double v50 = v62.size.width;
  double v51 = v62.size.height;
  if (CGRectIsEmpty(v62)
    || (v63.origin.x = v48, v63.origin.y = v49, v63.size.width = v50, v63.size.CGFloat height = v51, CGRectIsInfinite(v63))
    || !CGFloatIsValid())
  {
    v53 = 0;
  }
  else
  {
    int IsValid = CGFloatIsValid();
    v53 = 0;
    if (IsValid && v50 > 0.0 && v51 > 0.0)
    {
      v53 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v48, v49, v50, v51, v55);
    }
  }
  if (a3)
  {
    a3->origin.CGFloat x = v41;
    a3->origin.CGFloat y = v43;
    a3->size.CGFloat width = v45;
    a3->size.CGFloat height = v47;
  }

  return v53;
}

- (SCATDisplaySource)displaySourceDelegate
{
  return self->_displaySourceDelegate;
}

- (void)setDisplaySourceDelegate:(id)a3
{
}

- (SCATCursorManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATCursorManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATCursorController)focusedItemCursorController
{
  return self->_focusedItemCursorController;
}

- (void)setFocusedItemCursorController:(id)a3
{
}

- (SCATCursorController)containingGroupCursorController
{
  return self->_containingGroupCursorController;
}

- (void)setContainingGroupCursorController:(id)a3
{
}

- (SCATCursorController)menuItemCursorController
{
  return self->_menuItemCursorController;
}

- (void)setMenuItemCursorController:(id)a3
{
}

- (BOOL)isCursorUIHidden
{
  return self->_cursorUIHidden;
}

- (void)setCursorUIHidden:(BOOL)a3
{
  self->_cursorUIHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItemCursorController, 0);
  objc_storeStrong((id *)&self->_containingGroupCursorController, 0);
  objc_storeStrong((id *)&self->_focusedItemCursorController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displaySourceDelegate, 0);
}

@end