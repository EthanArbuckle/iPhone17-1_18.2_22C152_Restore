@interface SCATMenu
- (AXElement)keyboardApplication;
- (AXElement)textElement;
- (AXUIElement)fallbackScrollDownAncestor;
- (AXUIElement)fallbackScrollLeftAncestor;
- (AXUIElement)fallbackScrollRightAncestor;
- (AXUIElement)fallbackScrollUpAncestor;
- (BOOL)_canPopSheet;
- (BOOL)_isCurrentSheetValidForElement:(id)a3;
- (BOOL)_viewIsSuitableScannerElement:(id)a3;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)allowsDwellSelection;
- (BOOL)canBeActiveElementManager;
- (BOOL)containsGestureSheet;
- (BOOL)containsSheet:(Class)a3;
- (BOOL)didActivateElement;
- (BOOL)isGroupingEnabled;
- (BOOL)isTransitioning;
- (BOOL)isVisible;
- (BOOL)isWaitingToBePresented;
- (BOOL)popSheet;
- (BOOL)shouldHideMenuCursor;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldNotResetPointPickerRefinement;
- (BOOL)wasPresentedWithTip;
- (BOOL)willScanFirstElementAfterPresentation;
- (NSHashTable)menuObservers;
- (NSMutableArray)menuSheetStack;
- (NSValue)screenPoint;
- (SCATAggregateElementProvider)elementProvider;
- (SCATElement)element;
- (SCATMenu)initWithDelegate:(id)a3;
- (SCATMenuDelegate)delegate;
- (SCATMenuVisualProvider)menuVisualProvider;
- (SCATModernMenuGesturesSheet)gestureSheet;
- (SCATModernMenuSheet)currentSheet;
- (SCATModernMenuSheet)rootSheet;
- (SCATPointPicker)pointPicker;
- (id)_elementProviderForSheet:(id)a3;
- (id)_elementWithRestorationInfo:(id)a3 options:(int *)a4;
- (id)_restorationInfoForElement:(id)a3;
- (id)_siblingOfElement:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5 options:(int *)a6;
- (id)arrayByShiftingItemsInArray:(id)a3 leftByNumberOfPositions:(unint64_t)a4;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)exitActionElement;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)parentSheetOfSheet:(id)a3;
- (id)updateAfterFetchWithCurrentlyScannedElement:(id)a3 options:(int *)a4;
- (int64_t)dockPosition;
- (int64_t)popoverPosition;
- (int64_t)tipObject;
- (int64_t)tipObjectForPresentingSheet:(id)a3;
- (unsigned)currentDisplayID;
- (void)_cleanMenuStacks;
- (void)_flushScannableMenuElements;
- (void)_handleAdjustValue:(BOOL)a3;
- (void)_initializeMenuVisualProvider;
- (void)_notifyMenuObserversWithSelector:(SEL)a3;
- (void)_popToRootLevelSheet;
- (void)_prepareMenuForScanning;
- (void)_prepareMenuForScanningIfNeeded;
- (void)_presentWithElement:(id)a3 pointPicker:(id)a4 useMenuTip:(BOOL)a5 sheetToShow:(id)a6;
- (void)_slideToPositionWithMode:(unint64_t)a3 positionIndex:(int64_t)a4;
- (void)_updateFallbackScrollAncestorsForElement:(id)a3;
- (void)_updateForGeometryChange;
- (void)_updateOptionsIfNeeded:(int *)a3 withResultElement:(id)a4;
- (void)_updateWithElement:(id)a3 forceUpdate:(BOOL)a4;
- (void)alertDidAppear:(id)a3;
- (void)appTransitionDidOccur:(id)a3;
- (void)closeCurrentScanningContext;
- (void)decrementValue;
- (void)didPressScreenChangingButton;
- (void)didTransitionToSheet:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)handleMenuWasActivatedByScanner;
- (void)hideWithCompletion:(id)a3;
- (void)incrementValue;
- (void)menuTipObjectDidChange;
- (void)orientationDidChange:(id)a3;
- (void)presentAutoscrollMenu;
- (void)presentSiriShortcutsMenu;
- (void)presentWithElement:(id)a3;
- (void)presentWithPointPicker:(id)a3;
- (void)presentWithRootLevelSheet:(id)a3 useCurrentElementAndPoint:(BOOL)a4;
- (void)pushSheet:(id)a3;
- (void)registerMenuObserver:(id)a3;
- (void)reloadFromCurrentSheet;
- (void)setCurrentSheet:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivateElement:(BOOL)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setElement:(id)a3;
- (void)setElementProvider:(id)a3;
- (void)setFallbackScrollDownAncestor:(id)a3;
- (void)setFallbackScrollLeftAncestor:(id)a3;
- (void)setFallbackScrollRightAncestor:(id)a3;
- (void)setFallbackScrollUpAncestor:(id)a3;
- (void)setIsWaitingToBePresented:(BOOL)a3;
- (void)setMenuObservers:(id)a3;
- (void)setMenuSheetStack:(id)a3;
- (void)setMenuVisualProvider:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setPopoverPosition:(int64_t)a3;
- (void)setScreenPoint:(id)a3;
- (void)setShouldNotResetPointPickerRefinement:(BOOL)a3;
- (void)setTextElement:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setWasPresentedWithTip:(BOOL)a3;
- (void)setWillScanFirstElementAfterPresentation:(BOOL)a3;
- (void)slideDockToPosition:(int64_t)a3;
- (void)slidePopoverToPosition:(int64_t)a3;
- (void)transitionToMenuSheet:(id)a3;
- (void)unregisterAllMenuObservers;
- (void)unregisterMenuObserver:(id)a3;
- (void)updateMenuVisualsForUpdatedElementVisuals;
- (void)willTransitionToSheet:(id)a3;
@end

@implementation SCATMenu

- (SCATMenu)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCATMenu;
  v5 = [(SCATMenu *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(SCATMenu *)v5 setDelegate:v4];
    v7 = +[NSHashTable weakObjectsHashTable];
    [(SCATMenu *)v6 setMenuObservers:v7];

    v8 = +[NSMutableArray array];
    [(SCATMenu *)v6 setMenuSheetStack:v8];

    [(SCATMenu *)v6 _initializeMenuVisualProvider];
    id v9 = +[AXSiriShortcutsManager sharedManager];
  }

  return v6;
}

- (void)_initializeMenuVisualProvider
{
  v3 = [[SCATModernMenuViewController alloc] initWithMenu:self];
  [(SCATMenu *)self setMenuVisualProvider:v3];
}

- (void)setElement:(id)a3
{
  v5 = (SCATElement *)a3;
  p_element = &self->_element;
  if (self->_element != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)p_element, a3);
    if (([(SCATElement *)v12 scatIsKeyboardKey] & 1) != 0
      || ([(SCATElement *)v12 keyboardContainer],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v8 = +[HNDAccessibilityManager sharedManager];
      id v9 = [v8 firstResponder];
    }
    else if ([(SCATElement *)v12 scatIsAXElement])
    {
      id v9 = v12;
    }
    else
    {
      id v9 = 0;
    }
    v10 = [(SCATElement *)v9 textOperations];
    unint64_t v11 = (unint64_t)[(SCATElement *)v9 traits];
    if ((kAXIsEditingTrait & v11) == 0
      && ([v10 containsObject:kAXTextOperationActionCopy] & 1) == 0
      && ([v10 containsObject:kAXTextOperationActionPaste] & 1) == 0
      && ([v10 containsObject:kAXTextOperationActionCut] & 1) == 0
      && ([v10 containsObject:kAXTextOperationActionSelectAll] & 1) == 0)
    {

      id v9 = 0;
    }
    [(SCATMenu *)self setTextElement:v9];

    v5 = v12;
  }

  _objc_release_x1(p_element, v5);
}

- (unsigned)currentDisplayID
{
  v3 = [(SCATMenu *)self element];

  if (!v3
    || ([(SCATMenu *)self element],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 scatDisplayId],
        v4,
        !v5))
  {
    v6 = [(SCATMenu *)self pointPicker];
    unsigned int v5 = [v6 currentDisplayID];
  }
  if (v5 <= 1) {
    return 1;
  }
  else {
    return v5;
  }
}

- (AXElement)keyboardApplication
{
  v2 = [(SCATMenu *)self textElement];
  if (!v2)
  {
    v3 = +[HNDAccessibilityManager sharedManager];
    v2 = [v3 lastKeyboardElement];
  }
  if ([v2 scatIsAXElement])
  {
    id v4 = [v2 application];
  }
  else
  {
    id v4 = 0;
  }

  return (AXElement *)v4;
}

- (BOOL)isVisible
{
  v2 = [(SCATMenu *)self menuVisualProvider];
  unsigned __int8 v3 = [v2 isVisible];

  return v3;
}

- (BOOL)isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (int64_t)tipObject
{
  unsigned __int8 v3 = [(SCATMenu *)self menuVisualProvider];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  unsigned int v5 = [(SCATMenu *)self menuVisualProvider];
  id v6 = [v5 tipObject];

  return (int64_t)v6;
}

- (BOOL)shouldHideMenuCursor
{
  v2 = [(SCATMenu *)self currentSheet];
  BOOL v3 = [v2 preferredTipObject] == (id)1
    || [v2 presentationMode] == (id)1 && objc_msgSend(v2, "preferredTipObject") != (id)2;

  return v3;
}

- (int64_t)tipObjectForPresentingSheet:(id)a3
{
  id v4 = a3;
  if (![(SCATMenu *)self wasPresentedWithTip]
    || [v4 presentationMode]
    || [(SCATMenu *)self popoverPosition])
  {
    int64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = (uint64_t)[v4 preferredTipObject];
    if (!v7)
    {
      v8 = [(SCATMenu *)self rootSheet];
      uint64_t v7 = (uint64_t)[v8 preferredTipObject];
      if (!v7)
      {
        CFStringRef v12 = @"Menu was presented with a tip, but its root sheet had no tip.  This may be an error.  Root sheet: %@";
        v13 = v8;
        LOBYTE(v11) = 1;
        _AXLogWithFacility();
        uint64_t v7 = 2;
      }
    }
    id v9 = [(SCATMenu *)self element];

    if (v9) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v7 == 2;
    }
    if (v10) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = v7;
    }
  }

  return v5;
}

- (void)presentWithElement:(id)a3
{
}

- (void)presentWithPointPicker:(id)a3
{
  id v12 = a3;
  if (!_AXSInUnitTestMode() && ([v12 hasPickedPoint] & 1) == 0) {
    _AXAssert();
  }
  [v12 pickedPointInDeviceCoordinates];
  double v5 = v4;
  double v7 = v6;
  id v8 = [v12 currentDisplayID];
  id v9 = +[HNDAccessibilityManager sharedManager];
  BOOL v10 = objc_msgSend(v9, "elementAtPoint:displayID:", v8, v5, v7);

  [(SCATMenu *)self setPointPicker:v12];
  uint64_t v11 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v5, v7);
  [(SCATMenu *)self setScreenPoint:v11];

  [(SCATMenu *)self _presentWithElement:v10 pointPicker:v12 useMenuTip:1 sheetToShow:0];
}

- (void)presentWithRootLevelSheet:(id)a3 useCurrentElementAndPoint:(BOOL)a4
{
  id v9 = a3;
  if (a4)
  {
    uint64_t v6 = [(SCATMenu *)self element];
    double v7 = [(SCATMenu *)self pointPicker];
    [(SCATMenu *)self _presentWithElement:v6 pointPicker:v7 useMenuTip:0 sheetToShow:v9];

    id v8 = (void *)v6;
  }
  else
  {
    [(SCATMenu *)self _presentWithElement:0 pointPicker:0 useMenuTip:0 sheetToShow:v9];
    id v8 = v9;
  }
}

- (void)presentSiriShortcutsMenu
{
  if (sub_100040890())
  {
    BOOL v3 = +[AXSiriShortcutsManager sharedManager];
    double v4 = [v3 shortcuts];
    id v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = [(SCATModernMenuSheet *)[SCATMenuSiriShorcutsSheet alloc] initWithMenu:self];
      [(SCATMenu *)self presentWithRootLevelSheet:v6 useCurrentElementAndPoint:0];
    }
  }
}

- (void)presentAutoscrollMenu
{
  BOOL v3 = [(SCATModernMenuSheet *)[SCATModernMenuAutoscrollSheet alloc] initWithMenu:self];
  [(SCATMenu *)self presentWithRootLevelSheet:v3 useCurrentElementAndPoint:1];
}

- (void)_presentWithElement:(id)a3 pointPicker:(id)a4 useMenuTip:(BOOL)a5 sheetToShow:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  uint64_t v11 = (SCATModernMenuActionsSheet *)a6;
  id v12 = a3;
  [(SCATMenu *)self setElement:v12];
  [(SCATMenu *)self setPointPicker:v10];
  [(SCATMenu *)self setWillScanFirstElementAfterPresentation:1];
  v13 = [(SCATMenu *)self screenPoint];
  if (!v13)
  {
    v14 = [(SCATMenu *)self element];

    if (!v14) {
      goto LABEL_5;
    }
    v13 = [(SCATMenu *)self element];
    [v13 scatScreenPointForOperations];
    v15 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
    [(SCATMenu *)self setScreenPoint:v15];
  }
LABEL_5:
  [(SCATMenu *)self _notifyMenuObserversWithSelector:"menuWillAppear:"];
  [(SCATMenu *)self setDockPosition:0];
  [(SCATMenu *)self setPopoverPosition:0];
  if (v7)
  {
    v16 = [(SCATMenu *)self element];
    if (v16)
    {
      [(SCATMenu *)self setWasPresentedWithTip:1];
    }
    else
    {
      v17 = [(SCATMenu *)self screenPoint];
      [(SCATMenu *)self setWasPresentedWithTip:v17 != 0];
    }
    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
    [(SCATMenu *)self setWasPresentedWithTip:0];
    if (!v11) {
LABEL_12:
    }
      uint64_t v11 = [(SCATModernMenuSheet *)[SCATModernMenuActionsSheet alloc] initWithMenu:self];
  }
  [(SCATMenu *)self _updateFallbackScrollAncestorsForElement:v12];
  [(SCATMenu *)self setCurrentSheet:0];
  v18 = +[NSMutableArray arrayWithObject:v11];
  [(SCATMenu *)self setMenuSheetStack:v18];

  [(SCATMenu *)self transitionToMenuSheet:v11];
  v19 = [(SCATMenu *)self menuVisualProvider];
  [v19 willBePresentedWithElement:v12 pointPicker:v10 sheetToShow:v11];

  AXPerformBlockAsynchronouslyOnMainThread();
  [(SCATMenu *)self setDidActivateElement:0];
}

- (void)hideWithCompletion:(id)a3
{
  id v10 = (void (**)(void))a3;
  if ([(SCATMenu *)self isVisible])
  {
    [(SCATMenu *)self _notifyMenuObserversWithSelector:"menuWillDisappear:"];
    double v4 = [(SCATMenu *)self currentSheet];
    [v4 menuWillDisappear];

    id v5 = [(SCATMenu *)self menuVisualProvider];
    [v5 hide];

    [(SCATMenu *)self _flushScannableMenuElements];
    if (v10) {
      v10[2](v10);
    }
    if (![(SCATMenu *)self shouldNotResetPointPickerRefinement])
    {
      uint64_t v6 = [(SCATMenu *)self pointPicker];
      [v6 resetRefinedSelectedPoint];
    }
    [(SCATMenu *)self setShouldNotResetPointPickerRefinement:0];
    [(SCATMenu *)self setScreenPoint:0];
    [(SCATMenu *)self setPointPicker:0];
    BOOL v7 = [(SCATMenu *)self menuVisualProvider];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SCATMenu *)self menuVisualProvider];
      [v9 setTipObject:0];
    }
    [(SCATMenu *)self _cleanMenuStacks];
    [(SCATMenu *)self _notifyMenuObserversWithSelector:"menuDidDisappear:"];
  }
}

- (BOOL)_isCurrentSheetValidForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATMenu *)self currentSheet];
  unsigned __int8 v6 = [(id)objc_opt_class() isValidForElement:v4];

  return v6;
}

- (id)updateAfterFetchWithCurrentlyScannedElement:(id)a3 options:(int *)a4
{
  id v6 = a3;
  BOOL v7 = [(SCATMenu *)self element];

  if (!v7)
  {
    v13 = 0;
    goto LABEL_16;
  }
  char v8 = +[HNDAccessibilityManager sharedManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100095DE8;
  v16[3] = &unk_1001AD560;
  v16[4] = self;
  id v9 = [v8 elementsForMatchingBlock:v16];
  id v10 = [v9 firstObject];

  if (!v10)
  {
    if ([(SCATMenu *)self isGroupingEnabled])
    {
      uint64_t v11 = [v8 firstScannerGroupable];
      if ([v11 isGroup])
      {
        id v12 = [v11 firstLeafDescendant];
      }
      else
      {
        id v12 = v11;
      }
      id v10 = v12;

      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    id v10 = [v8 firstScannerElement];
  }
  if (!v6)
  {
LABEL_13:
    [(SCATMenu *)self _updateWithElement:v10 forceUpdate:0];
    goto LABEL_14;
  }
LABEL_9:
  v14 = [(SCATMenu *)self _restorationInfoForElement:v6];
  [(SCATMenu *)self _updateWithElement:v10 forceUpdate:0];
  if (!v14)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = [(SCATMenu *)self _elementWithRestorationInfo:v14 options:a4];

LABEL_15:
LABEL_16:

  return v13;
}

- (void)_updateWithElement:(id)a3 forceUpdate:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(SCATMenu *)self element];
  unsigned int v8 = [v7 isEqual:v6];

  if (a4 || !v8)
  {
    [(SCATMenu *)self setElement:v6];
    if ((v8 & 1) == 0)
    {
      if ([(SCATMenu *)self _isCurrentSheetValidForElement:v6])
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v9 = [(SCATMenu *)self menuSheetStack];
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) reload];
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v11);
        }
      }
      else
      {
        [(SCATMenu *)self _popToRootLevelSheet];
      }
    }
    [(SCATMenu *)self reloadFromCurrentSheet];
  }
}

- (void)_updateFallbackScrollAncestorsForElement:(id)a3
{
  id v11 = a3;
  id v4 = [(SCATMenu *)self delegate];
  unsigned __int8 v5 = [v4 shouldShowAppWideScrollActionsInMenu:self];

  if ((v5 & 1) == 0)
  {
    id v6 = [v11 scrollableElement];
    BOOL v7 = +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", [v6 scrollAncestorForScrollAction:2006], 0);
    [(SCATMenu *)self setFallbackScrollDownAncestor:v7];

    unsigned int v8 = +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", [v6 scrollAncestorForScrollAction:2007], 0);
    [(SCATMenu *)self setFallbackScrollUpAncestor:v8];

    id v9 = +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", [v6 scrollAncestorForScrollAction:2008], 0);
    [(SCATMenu *)self setFallbackScrollLeftAncestor:v9];

    id v10 = +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", [v6 scrollAncestorForScrollAction:2009], 0);
    [(SCATMenu *)self setFallbackScrollRightAncestor:v10];
  }
}

- (id)_restorationInfoForElement:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableDictionary dictionary];
  id v6 = [(SCATMenu *)self element];

  if (v6 == v4)
  {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMenuElement"];
    goto LABEL_13;
  }
  if ([v4 isGroup])
  {
    BOOL v7 = [(SCATMenu *)self elementProvider];
    unsigned int v8 = [v7 elementProviders];
    id v9 = [v8 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [(SCATMenu *)self elementProvider];
      uint64_t v12 = [v11 elementProviders];
      v13 = [v12 firstObject];

      id v14 = [v13 indexOfObject:v4];
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        long long v15 = +[NSNumber numberWithUnsignedInteger:v14];
        CFStringRef v16 = @"MenuRowIndex";
LABEL_9:
        [v5 setObject:v15 forKeyedSubscript:v16];

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      v13 = 0;
    }
    _AXAssert();
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v4 menuItem];
    long long v15 = [v13 identifier];
    CFStringRef v16 = @"MenuItemIdentifier";
    goto LABEL_9;
  }
  v18 = [(SCATMenu *)self menuVisualProvider];
  unsigned __int8 v19 = [v18 isElementTopLevelInMenu:v4];

  if ((v19 & 1) == 0) {
    _AXAssert();
  }
LABEL_13:

  return v5;
}

- (id)_elementWithRestorationInfo:(id)a3 options:(int *)a4
{
  id v6 = a3;
  [(SCATMenu *)self _prepareMenuForScanningIfNeeded];
  BOOL v7 = [v6 objectForKeyedSubscript:@"IsMenuElement"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = [(SCATMenu *)self element];
  }
  else
  {
    id v10 = [v6 objectForKeyedSubscript:@"MenuRowIndex"];

    if (v10)
    {
      id v11 = [(SCATMenu *)self elementProvider];
      uint64_t v12 = [v11 elementProviders];
      v13 = [v12 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v15 = [(SCATMenu *)self elementProvider];
        CFStringRef v16 = [v15 elementProviders];
        long long v17 = [v16 firstObject];
      }
      else
      {
        long long v17 = 0;
      }
      id v28 = [v17 count];
      v29 = [v6 objectForKeyedSubscript:@"MenuRowIndex"];
      id v30 = [v29 unsignedIntegerValue];

      if (v30 >= v28)
      {
        id v34 = v30;
        v35 = v17;
        CFStringRef v33 = @"We tried to restore a row %lu that was not in our list of menu rows: %@";
        LOBYTE(v32) = 1;
        _AXLogWithFacility();
        id v9 = 0;
      }
      else
      {
        id v9 = [v17 objectAtIndexedSubscript:v30];
      }
    }
    else
    {
      v18 = [v6 objectForKeyedSubscript:@"MenuItemIdentifier"];

      if (v18)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        unsigned __int8 v19 = [(SCATMenu *)self currentSheet];
        v20 = [v19 menuItems];

        id v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v21)
        {
          v36 = self;
          v37 = a4;
          uint64_t v22 = *(void *)v39;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v39 != v22) {
                objc_enumerationMutation(v20);
              }
              v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              v25 = [v24 identifier];
              v26 = [v6 objectForKeyedSubscript:@"MenuItemIdentifier"];
              unsigned int v27 = [v25 isEqualToString:v26];

              if (v27)
              {
                id v21 = v24;
                goto LABEL_22;
              }
            }
            id v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v21) {
              continue;
            }
            break;
          }
LABEL_22:
          self = v36;
          a4 = v37;
        }

        id v9 = [v21 scatElement];
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  -[SCATMenu _updateOptionsIfNeeded:withResultElement:](self, "_updateOptionsIfNeeded:withResultElement:", a4, v9, v32, v33, v34, v35);

  return v9;
}

- (void)transitionToMenuSheet:(id)a3
{
  id v4 = a3;
  id v6 = [(SCATMenu *)self currentSheet];
  [(SCATMenu *)self setCurrentSheet:v4];
  unsigned __int8 v5 = [(SCATMenu *)self menuVisualProvider];
  [v5 transitionToMenuSheet:v4 fromSheet:v6];
}

- (SCATModernMenuSheet)rootSheet
{
  v2 = [(SCATMenu *)self menuSheetStack];
  BOOL v3 = [v2 firstObject];

  return (SCATModernMenuSheet *)v3;
}

- (void)pushSheet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(SCATMenu *)self currentSheet];

    id v4 = v7;
    if (v5 != v7)
    {
      if ([v7 allowsBackAction]) {
        [v7 setShouldIncludeBackItem:1];
      }
      [(SCATMenu *)self transitionToMenuSheet:v7];
      id v6 = [(SCATMenu *)self menuSheetStack];
      [v6 addObject:v7];

      id v4 = v7;
    }
  }
}

- (BOOL)popSheet
{
  BOOL v3 = [(SCATMenu *)self _canPopSheet];
  if (v3)
  {
    id v4 = [(SCATMenu *)self currentSheet];
    id v5 = [(SCATMenu *)self parentSheetOfSheet:v4];
    [(SCATMenu *)self transitionToMenuSheet:v5];
    [v4 setShouldIncludeBackItem:0];
    id v6 = [(SCATMenu *)self menuSheetStack];
    [v6 removeObject:v4];
  }
  return v3;
}

- (void)_popToRootLevelSheet
{
  id v6 = [(SCATMenu *)self menuSheetStack];
  if ([v6 count])
  {
    BOOL v3 = [(SCATMenu *)self currentSheet];
    id v4 = [v6 objectAtIndex:0];
    if (([v4 isEqual:v3] & 1) == 0)
    {
      [(SCATMenu *)self setCurrentSheet:v4];
      [(SCATMenu *)self transitionToMenuSheet:v4];
      id v5 = +[NSMutableArray arrayWithObject:v4];
      [(SCATMenu *)self setMenuSheetStack:v5];
    }
  }
}

- (void)_cleanMenuStacks
{
  id v3 = (id)objc_opt_new();
  [(SCATMenu *)self setMenuSheetStack:v3];
}

- (id)parentSheetOfSheet:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATMenu *)self menuSheetStack];
  id v6 = (char *)[v5 indexOfObject:v4];

  id v7 = 0;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v5 objectAtIndex:v6 - 1];
  }

  return v7;
}

- (BOOL)containsGestureSheet
{
  uint64_t v3 = objc_opt_class();

  return [(SCATMenu *)self containsSheet:v3];
}

- (BOOL)containsSheet:(Class)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(SCATMenu *)self menuSheetStack];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (SCATModernMenuGesturesSheet)gestureSheet
{
  objc_opt_class();
  uint64_t v3 = [(SCATMenu *)self menuSheetStack];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_1001AD580);
  id v5 = [v4 firstObject];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  return (SCATModernMenuGesturesSheet *)v6;
}

- (BOOL)_canPopSheet
{
  v2 = [(SCATMenu *)self menuSheetStack];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)menuTipObjectDidChange
{
}

- (void)willTransitionToSheet:(id)a3
{
  [(SCATMenu *)self setTransitioning:1];
  [(SCATMenu *)self _flushScannableMenuElements];

  [(SCATMenu *)self _notifyMenuObserversWithSelector:"menuWillBeginTransition:"];
}

- (void)didTransitionToSheet:(id)a3
{
  [(SCATMenu *)self setTransitioning:0];

  [(SCATMenu *)self _notifyMenuObserversWithSelector:"menuDidFinishTransition:"];
}

- (void)reloadFromCurrentSheet
{
  [(SCATMenu *)self _flushScannableMenuElements];

  [(SCATMenu *)self _updateForGeometryChange];
}

- (void)_updateForGeometryChange
{
  BOOL v3 = [(SCATMenu *)self menuVisualProvider];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SCATMenu *)self menuVisualProvider];
    [v5 updateForGeometryChange];
  }
}

- (void)_slideToPositionWithMode:(unint64_t)a3 positionIndex:(int64_t)a4
{
  if (a3) {
    [(SCATMenu *)self setDockPosition:a4];
  }
  else {
    [(SCATMenu *)self setPopoverPosition:a4];
  }

  [(SCATMenu *)self _updateForGeometryChange];
}

- (void)slidePopoverToPosition:(int64_t)a3
{
}

- (void)slideDockToPosition:(int64_t)a3
{
}

- (void)closeCurrentScanningContext
{
}

- (void)handleMenuWasActivatedByScanner
{
}

- (id)exitActionElement
{
  BOOL v3 = [(SCATMenu *)self currentSheet];
  if ([v3 allowsExitAction])
  {
    char v4 = [(SCATMenu *)self menuVisualProvider];
    id v5 = [v4 exitActionElement];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(SCATMenu *)self element];
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)updateMenuVisualsForUpdatedElementVisuals
{
  id v3 = [(SCATMenu *)self element];
  [(SCATMenu *)self _updateWithElement:v3 forceUpdate:1];
}

- (void)incrementValue
{
}

- (void)decrementValue
{
}

- (void)_handleAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCATMenu *)self element];
  if ([v5 scatIsAXElement])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [(SCATMenu *)self currentSheet];
    id v7 = [v6 menuItems];

    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      v26 = self;
      unsigned int v27 = v5;
      uint64_t v10 = *(void *)v33;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        long long v13 = objc_msgSend(v12, "identifier", v26);
        id v14 = v13;
        long long v15 = v3 ? @"action_increment" : @"action_decrement";
        unsigned __int8 v16 = [v13 isEqual:v15];

        if (v16) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v9) {
            goto LABEL_4;
          }
          id v17 = v7;
          id v5 = v27;
          goto LABEL_28;
        }
      }
      id v17 = v12;

      id v5 = v27;
      if (!v17) {
        goto LABEL_29;
      }
      [v17 setShouldSuppressAudioOutput:1];
      [v27 scatUpdateValue];
      v18 = [v27 scatValue];
      if (v3) {
        uint64_t v19 = 2004;
      }
      else {
        uint64_t v19 = 2005;
      }
      [v27 scatPerformAction:v19];
      double Current = CFAbsoluteTimeGetCurrent();
      id v21 = 0;
      while (CFAbsoluteTimeGetCurrent() - Current < 0.5)
      {
        +[NSThread sleepForTimeInterval:0.05];
        [v27 scatUpdateValue];
        uint64_t v22 = [v27 scatValue];

        id v21 = (void *)v22;
        if (([v18 isEqualToString:v22] & 1) == 0)
        {
          v23 = [(SCATMenu *)v26 delegate];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1000973E8;
          v30[3] = &unk_1001AACE0;
          id v31 = v17;
          [v23 menu:v26 speakAnnouncement:v22 completionBlock:v30];

          id v21 = (void *)v22;
          goto LABEL_27;
        }
      }
      if (v21 && [v18 isEqualToString:v21])
      {
        v24 = [(SCATMenu *)v26 delegate];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000973F4;
        v28[3] = &unk_1001AACE0;
        id v29 = v17;
        [v24 menu:v26 speakAnnouncement:v21 completionBlock:v28];

        v25 = [(SCATMenu *)v26 delegate];
        [v25 menu:v26 playSoundEffect:1004];
      }
      [v17 setShouldSuppressAudioOutput:0];
LABEL_27:
    }
    else
    {
      id v17 = v7;
    }
LABEL_28:
  }
LABEL_29:
}

- (void)registerMenuObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATMenu *)self menuObservers];
  [v5 addObject:v4];
}

- (void)unregisterMenuObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATMenu *)self menuObservers];
  [v5 removeObject:v4];
}

- (void)unregisterAllMenuObservers
{
  id v2 = [(SCATMenu *)self menuObservers];
  [v2 removeAllObjects];
}

- (void)_notifyMenuObserversWithSelector:(SEL)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(SCATMenu *)self menuObservers];
  uint64_t v6 = [v5 allObjects];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 performSelector:a3 withObject:self];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_updateOptionsIfNeeded:(int *)a3 withResultElement:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = [(SCATMenu *)self element];

    id v7 = v8;
    if (v6 == v8) {
      *a3 |= 5u;
    }
  }
  else
  {
    _AXAssert();
    id v7 = v8;
  }
}

- (id)firstElementWithOptions:(int *)a3
{
  [(SCATMenu *)self _prepareMenuForScanningIfNeeded];
  id v5 = [(SCATMenu *)self elementProvider];
  id v6 = [v5 firstElementWithOptions:a3];

  [(SCATMenu *)self _updateOptionsIfNeeded:a3 withResultElement:v6];

  return v6;
}

- (id)lastElementWithOptions:(int *)a3
{
  [(SCATMenu *)self _prepareMenuForScanningIfNeeded];
  id v5 = [(SCATMenu *)self elementProvider];
  id v6 = [v5 lastElementWithOptions:a3];

  [(SCATMenu *)self _updateOptionsIfNeeded:a3 withResultElement:v6];

  return v6;
}

- (id)_siblingOfElement:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5 options:(int *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  [(SCATMenu *)self _prepareMenuForScanningIfNeeded];
  if ([(SCATMenu *)self isTransitioning])
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [(SCATMenu *)self element];

    if (v12 == v10)
    {
      v20 = [(SCATMenu *)self firstElementWithOptions:a6];
      uint64_t v11 = v20;
      if (!v8)
      {
        uint64_t v21 = [v20 parentGroup];
        if (v21
          && (uint64_t v22 = (void *)v21, v23 = [(SCATMenu *)self isGroupingEnabled], v22, v23))
        {
          v24 = [v11 parentGroup];
          uint64_t v25 = [v24 previousSiblingOfChild:v11 didWrap:a5];
        }
        else
        {
          v24 = [(SCATMenu *)self elementProvider];
          uint64_t v25 = [v24 elementBefore:v10 didWrap:a5 options:a6];
        }
        v26 = (void *)v25;

        uint64_t v11 = v26;
      }
      *a5 = 1;
    }
    else
    {
      uint64_t v13 = [v10 parentGroup];
      if (v13
        && (long long v14 = (void *)v13, v15 = [(SCATMenu *)self isGroupingEnabled], v14, v15))
      {
        unsigned __int8 v16 = [v10 parentGroup];
        id v17 = v16;
        if (v8) {
          [v16 nextSiblingOfChild:v10 didWrap:a5];
        }
        else {
          [v16 previousSiblingOfChild:v10 didWrap:a5];
        }
      }
      else
      {
        uint64_t v19 = [(SCATMenu *)self elementProvider];
        id v17 = v19;
        if (v8) {
          [v19 elementAfter:v10 didWrap:a5 options:a6];
        }
        else {
          [v19 elementBefore:v10 didWrap:a5 options:a6];
        }
      uint64_t v18 = };
      uint64_t v11 = (void *)v18;
    }
    [(SCATMenu *)self _updateOptionsIfNeeded:a6 withResultElement:v11];
  }

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return [(SCATMenu *)self _siblingOfElement:a3 inDirection:1 didWrap:a4 options:a5];
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return [(SCATMenu *)self _siblingOfElement:a3 inDirection:0 didWrap:a4 options:a5];
}

- (id)identifier
{
  return off_1001EF898[0];
}

- (BOOL)canBeActiveElementManager
{
  BOOL v3 = [(SCATMenu *)self currentSheet];
  if (([v3 delegatesScannerControl] & 1) != 0 || !-[SCATMenu isVisible](self, "isVisible")) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = ![(SCATMenu *)self isTransitioning];
  }

  return v4;
}

- (BOOL)shouldKeepScannerAwake
{
  id v2 = [(SCATMenu *)self currentSheet];
  unsigned __int8 v3 = [v2 shouldKeepScannerAwake];

  return v3;
}

- (BOOL)allowsDwellSelection
{
  id v2 = [(SCATMenu *)self currentSheet];
  unsigned __int8 v3 = [v2 shouldAllowDwellSelection];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return 0;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)SCATMenu;
  [(SCATElementManager *)&v8 driver:a3 willFocusOnContext:v6];
  id v7 = [(SCATMenu *)self currentSheet];
  [v7 willFocusOnContext:v6];

  if ([(SCATMenu *)self willScanFirstElementAfterPresentation])
  {
    [(SCATMenu *)self setWillScanFirstElementAfterPresentation:0];
    [v6 setShouldPlayMenuSoundOnFocus:1];
  }
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SCATMenu;
  id v8 = a5;
  id v9 = a4;
  [(SCATElementManager *)&v12 driver:a3 didFocusOnContext:v9 oldContext:v8];
  id v10 = [(SCATMenu *)self currentSheet];
  [v10 didFocusOnContext:v9 oldContext:v8];

  uint64_t v11 = [(SCATMenu *)self menuVisualProvider];
  [v11 didFocusOnContext:v9 oldContext:v8];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCATMenu;
  id v6 = a4;
  [(SCATElementManager *)&v9 driver:a3 willUnfocusFromContext:v6];
  id v7 = [(SCATMenu *)self currentSheet];
  [v7 willUnfocusFromContext:v6];

  id v8 = [(SCATMenu *)self menuVisualProvider];
  [v8 willUnfocusFromContext:v6];
}

- (void)orientationDidChange:(id)a3
{
  uint64_t v4 = [(SCATMenu *)self element];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = +[HNDAccessibilityManager sharedManager];
    id v7 = [v6 scannerElementMatchingElement:v5];

    if (v7)
    {
      [(SCATMenu *)self setElement:v7];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = [(SCATMenu *)self menuSheetStack];
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * i) didChangeOrientation];
          }
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }

      [(SCATMenu *)self _updateForGeometryChange];
    }
    else
    {
      [(SCATMenu *)self hideWithCompletion:0];
    }
  }
  else
  {
    uint64_t v13 = [(SCATMenu *)self screenPoint];

    if (v13)
    {
      [(SCATMenu *)self _updateForGeometryChange];
    }
  }
}

- (void)appTransitionDidOccur:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATMenu;
  [(SCATElementManager *)&v4 appTransitionDidOccur:a3];
  [(SCATMenu *)self hideWithCompletion:0];
}

- (void)alertDidAppear:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCATMenu;
  [(SCATElementManager *)&v4 alertDidAppear:a3];
  [(SCATMenu *)self hideWithCompletion:0];
}

- (void)_flushScannableMenuElements
{
}

- (id)arrayByShiftingItemsInArray:(id)a3 leftByNumberOfPositions:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 count];
  unint64_t v7 = (unint64_t)v6;
  if ((unint64_t)v6 <= a4)
  {
    unint64_t v14 = a4;
    id v15 = v6;
    _AXAssert();
  }
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v7, v14, v15);
  if (v7 > a4)
  {
    unint64_t v9 = a4;
    do
    {
      id v10 = [v5 objectAtIndex:v9];
      [v8 addObject:v10];

      ++v9;
    }
    while (v7 != v9);
  }
  if (a4)
  {
    uint64_t v11 = 0;
    do
    {
      objc_super v12 = [v5 objectAtIndex:v11];
      [v8 addObject:v12];

      ++v11;
    }
    while (a4 != v11);
  }

  return v8;
}

- (void)_prepareMenuForScanningIfNeeded
{
  unsigned __int8 v3 = [(SCATMenu *)self elementProvider];
  if (v3)
  {
  }
  else if (![(SCATMenu *)self isTransitioning])
  {
    [(SCATMenu *)self _prepareMenuForScanning];
  }
}

- (void)_prepareMenuForScanning
{
  unsigned __int8 v3 = objc_alloc_init(SCATAggregateElementProvider);
  objc_super v4 = [(SCATMenu *)self currentSheet];
  id v5 = [(SCATMenu *)self _elementProviderForSheet:v4];
  if (v5) {
    [(SCATAggregateElementProvider *)v3 addProvider:v5];
  }
  id v6 = [(SCATMenu *)self menuVisualProvider];
  unint64_t v7 = [v6 extraProviderElements];

  if ([v7 count]) {
    id v8 = [(SCATAggregateElementProvider *)v3 addProviderWithElements:v7 passingTest:0];
  }
  unint64_t v9 = [(SCATMenu *)self exitActionElement];
  if (v9)
  {
    id v10 = [(SCATMenu *)self exitActionElement];
    uint64_t v13 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v13 count:1];
    id v12 = [(SCATAggregateElementProvider *)v3 addProviderWithElements:v11 passingTest:0];
  }
  [(SCATMenu *)self setElementProvider:v3];
}

- (id)_elementProviderForSheet:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATMenu *)self menuVisualProvider];
  id v6 = [v5 elementProviderForSheet:v4];

  return v6;
}

- (BOOL)_viewIsSuitableScannerElement:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isHidden] & 1) == 0 && (objc_msgSend(v4, "alpha"), v5 >= 0.05))
  {
    [v4 frame];
    BOOL v6 = !CGRectIsEmpty(v8);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)didPressScreenChangingButton
{
  [(SCATMenu *)self hideWithCompletion:0];
  id v3 = [(SCATMenu *)self delegate];
  [v3 didPressScreenChangingButtonInMenu:self];
}

- (SCATMenuVisualProvider)menuVisualProvider
{
  return self->_menuVisualProvider;
}

- (void)setMenuVisualProvider:(id)a3
{
}

- (SCATMenuDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATMenuDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATElement)element
{
  return self->_element;
}

- (AXElement)textElement
{
  return self->_textElement;
}

- (void)setTextElement:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  return self->_pointPicker;
}

- (void)setPointPicker:(id)a3
{
}

- (NSValue)screenPoint
{
  return self->_screenPoint;
}

- (void)setScreenPoint:(id)a3
{
}

- (NSMutableArray)menuSheetStack
{
  return self->_menuSheetStack;
}

- (void)setMenuSheetStack:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)shouldNotResetPointPickerRefinement
{
  return self->_shouldNotResetPointPickerRefinement;
}

- (void)setShouldNotResetPointPickerRefinement:(BOOL)a3
{
  self->_shouldNotResetPointPickerRefinement = a3;
}

- (int64_t)popoverPosition
{
  return self->_popoverPosition;
}

- (void)setPopoverPosition:(int64_t)a3
{
  self->_popoverPosition = a3;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (BOOL)wasPresentedWithTip
{
  return self->_wasPresentedWithTip;
}

- (void)setWasPresentedWithTip:(BOOL)a3
{
  self->_wasPresentedWithTip = a3;
}

- (BOOL)isWaitingToBePresented
{
  return self->_isWaitingToBePresented;
}

- (void)setIsWaitingToBePresented:(BOOL)a3
{
  self->_isWaitingToBePresented = a3;
}

- (BOOL)didActivateElement
{
  return self->_didActivateElement;
}

- (void)setDidActivateElement:(BOOL)a3
{
  self->_didActivateElement = a3;
}

- (SCATModernMenuSheet)currentSheet
{
  return self->_currentSheet;
}

- (void)setCurrentSheet:(id)a3
{
}

- (AXUIElement)fallbackScrollDownAncestor
{
  return self->_fallbackScrollDownAncestor;
}

- (void)setFallbackScrollDownAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollUpAncestor
{
  return self->_fallbackScrollUpAncestor;
}

- (void)setFallbackScrollUpAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollLeftAncestor
{
  return self->_fallbackScrollLeftAncestor;
}

- (void)setFallbackScrollLeftAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollRightAncestor
{
  return self->_fallbackScrollRightAncestor;
}

- (void)setFallbackScrollRightAncestor:(id)a3
{
}

- (NSHashTable)menuObservers
{
  return self->_menuObservers;
}

- (void)setMenuObservers:(id)a3
{
}

- (SCATAggregateElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
}

- (BOOL)willScanFirstElementAfterPresentation
{
  return self->_willScanFirstElementAfterPresentation;
}

- (void)setWillScanFirstElementAfterPresentation:(BOOL)a3
{
  self->_willScanFirstElementAfterPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_menuObservers, 0);
  objc_storeStrong((id *)&self->_fallbackScrollRightAncestor, 0);
  objc_storeStrong((id *)&self->_fallbackScrollLeftAncestor, 0);
  objc_storeStrong((id *)&self->_fallbackScrollUpAncestor, 0);
  objc_storeStrong((id *)&self->_fallbackScrollDownAncestor, 0);
  objc_storeStrong((id *)&self->_currentSheet, 0);
  objc_storeStrong((id *)&self->_menuSheetStack, 0);
  objc_storeStrong((id *)&self->_screenPoint, 0);
  objc_storeStrong((id *)&self->_pointPicker, 0);
  objc_storeStrong((id *)&self->_textElement, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_menuVisualProvider, 0);
}

@end