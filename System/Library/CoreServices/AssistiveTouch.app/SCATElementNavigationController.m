@interface SCATElementNavigationController
- (AXElement)firstResponder;
- (AXElement)lastScannedElementCommunity;
- (BOOL)_deferFocusToNativeFocusElementIfNeeded:(id)a3;
- (BOOL)_didFocusLastOnKeyboardElement;
- (BOOL)_isKeyboardContainerElement:(id)a3 allowKeyboardContainerItself:(BOOL)a4;
- (BOOL)_isScanningKeyboardContainer:(id)a3;
- (BOOL)_shouldTrackNativeFocusElement;
- (BOOL)areGroupVisualScrollersEnabled;
- (BOOL)areTopLevelVisualScrollersEnabled;
- (BOOL)isGroupingEnabled;
- (BOOL)isMenuOpeningElementEnabled;
- (BOOL)shouldRescanAfterFetch;
- (BOOL)shouldRescanFromTopAfterFetch;
- (BOOL)shouldScanKeyboardOnAppearance;
- (HNDAccessibilityManagerProtocol)axManager;
- (NSIndexPath)keyboardIndexPath;
- (NSString)startingSceneIdentifier;
- (NSValue)keyboardKeyCenterPoint;
- (SCATElementNavigationController)init;
- (SCATElementNavigationControllerDelegate)delegate;
- (SCATFocusContext)currentFocusContext;
- (SCATMenuOpeningAuxiliaryElementManager)menuOpeningAuxElementManager;
- (SCATVisualScrollersAuxiliaryElementManager)groupVisualScrollersAuxElementManager;
- (SCATVisualScrollersAuxiliaryElementManager)topLevelVisualScrollersAuxElementManager;
- (id)_firstKeyboardFocusContext;
- (id)_indexPathForKeyboardElement:(id)a3;
- (id)_keyboardElementForIndexPath:(id)a3;
- (id)_nativeFocusElementContext;
- (id)_replacementForLastFocusedKeyboardItem;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)focusContextAfterDrillOutOnGroup:(id)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3;
- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3;
- (id)numberOfItemsInCurrentScanCycle;
- (int)keyboardSelectBehavior;
- (unint64_t)_depthForElement:(id)a3;
- (void)_attemptToRestoreFocusContext:(id)a3 scannerManager:(id)a4 foundNewElements:(BOOL)a5;
- (void)_giveUpWaitingForFetchAfterPause;
- (void)_menuOpeningElementActivated:(id)a3;
- (void)_pauseScanningForLikelyScreenChange;
- (void)_pauseScanningTemporarily;
- (void)_resetFetchFlags;
- (void)_startWaitingForFetchAfterTemporaryPause;
- (void)_stopWaitingForFetchAfterTemporaryPause;
- (void)_trackLastFocusedKeyboardItem:(id)a3;
- (void)_trackLastScannedElementCommunityFromFocusContext:(id)a3;
- (void)_updateMenuOpeningElementEnabledWithFocusContext:(id)a3;
- (void)_updateVisualScrollersWithFocusContext:(id)a3 oldContext:(id)a4;
- (void)alertDidAppear:(id)a3;
- (void)appTransitionDidOccur:(id)a3;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)firstResponderDidChange:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)scannerManager:(id)a3 didActivateElement:(id)a4;
- (void)scannerManager:(id)a3 nativeFocusElementDidChange:(id)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)screenChangingButtonWasPressed:(id)a3;
- (void)screenDidChange:(id)a3 data:(id)a4;
- (void)setAxManager:(id)a3;
- (void)setCurrentFocusContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstResponder:(id)a3;
- (void)setGroupVisualScrollersAuxElementManager:(id)a3;
- (void)setGroupVisualScrollersEnabled:(BOOL)a3;
- (void)setKeyboardIndexPath:(id)a3;
- (void)setKeyboardKeyCenterPoint:(id)a3;
- (void)setKeyboardSelectBehavior:(int)a3;
- (void)setLastScannedElementCommunity:(id)a3;
- (void)setMenuOpeningAuxElementManager:(id)a3;
- (void)setMenuOpeningElementEnabled:(BOOL)a3;
- (void)setShouldRescanAfterFetch:(BOOL)a3;
- (void)setShouldRescanFromTopAfterFetch:(BOOL)a3;
- (void)setShouldScanKeyboardOnAppearance:(BOOL)a3;
- (void)setStartingSceneIdentifier:(id)a3;
- (void)setTopLevelVisualScrollersAuxElementManager:(id)a3;
- (void)setTopLevelVisualScrollersEnabled:(BOOL)a3;
@end

@implementation SCATElementNavigationController

- (SCATElementNavigationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCATElementNavigationController;
  v2 = [(SCATElementNavigationController *)&v5 init];
  if (v2)
  {
    v3 = +[HNDAccessibilityManager sharedManager];
    [(SCATElementNavigationController *)v2 setAxManager:v3];
  }
  return v2;
}

- (BOOL)isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (HNDAccessibilityManagerProtocol)axManager
{
  v2 = objc_opt_class();

  return (HNDAccessibilityManagerProtocol *)[v2 sharedManager];
}

- (void)setAxManager:(id)a3
{
}

- (id)identifier
{
  return off_1001EF890[0];
}

- (void)_menuOpeningElementActivated:(id)a3
{
  id v4 = [(SCATElementNavigationController *)self delegate];
  [v4 presentPostScanningMenuForElementNavigationController:self];
}

- (void)setMenuOpeningElementEnabled:(BOOL)a3
{
  if (self->_menuOpeningElementEnabled != a3)
  {
    BOOL v3 = a3;
    self->_menuOpeningElementEnabled = a3;
    objc_super v5 = [(SCATElementNavigationController *)self menuOpeningAuxElementManager];

    if (!v5)
    {
      v6 = objc_opt_new();
      [(SCATElementNavigationController *)self setMenuOpeningAuxElementManager:v6];
      [(SCATElementManager *)self appendAuxiliaryElementManager:v6 withRole:1];
      v7 = [v6 menuOpeningElement];
      [v7 addTarget:self action:"_menuOpeningElementActivated:" forControlEvents:64];
    }
    id v8 = [(SCATElementNavigationController *)self menuOpeningAuxElementManager];
    [v8 setEnabled:v3];
  }
}

- (void)setTopLevelVisualScrollersEnabled:(BOOL)a3
{
  if (self->_topLevelVisualScrollersEnabled != a3)
  {
    BOOL v3 = a3;
    self->_topLevelVisualScrollersEnabled = a3;
    objc_super v5 = [(SCATElementNavigationController *)self topLevelVisualScrollersAuxElementManager];

    if (!v5)
    {
      v6 = [[SCATVisualScrollersAuxiliaryElementManager alloc] initWithMode:0];
      [(SCATElementNavigationController *)self setTopLevelVisualScrollersAuxElementManager:v6];
      [(SCATElementManager *)self appendAuxiliaryElementManager:v6 withRole:1];
    }
    id v7 = [(SCATElementNavigationController *)self topLevelVisualScrollersAuxElementManager];
    [v7 setEnabled:v3];
  }
}

- (void)setGroupVisualScrollersEnabled:(BOOL)a3
{
  if (self->_groupVisualScrollersEnabled != a3)
  {
    BOOL v3 = a3;
    self->_groupVisualScrollersEnabled = a3;
    objc_super v5 = [(SCATElementNavigationController *)self groupVisualScrollersAuxElementManager];

    if (!v5)
    {
      v6 = [[SCATVisualScrollersAuxiliaryElementManager alloc] initWithMode:1];
      [(SCATElementNavigationController *)self setGroupVisualScrollersAuxElementManager:v6];
      [(SCATElementManager *)self appendAuxiliaryElementManager:v6 withRole:2];
    }
    id v7 = [(SCATElementNavigationController *)self groupVisualScrollersAuxElementManager];
    [v7 setEnabled:v3];
  }
}

- (void)setCurrentFocusContext:(id)a3
{
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = [(SCATElementNavigationController *)self startingSceneIdentifier];
  id v5 = [v4 length];

  if (!v5) {
    goto LABEL_3;
  }
  v6 = [(SCATElementNavigationController *)self axManager];
  id v7 = [(SCATElementNavigationController *)self startingSceneIdentifier];
  id v8 = [v6 firstElementInScene:v7];

  [(SCATElementNavigationController *)self setStartingSceneIdentifier:0];
  if (!v8)
  {
LABEL_3:
    v9 = [(SCATElementNavigationController *)self axManager];
    v10 = [(SCATElementNavigationController *)self lastScannedElementCommunity];
    id v8 = [v9 firstItemForScanningWithElementCommunity:v10];
  }

  return v8;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = [(SCATElementNavigationController *)self axManager];
  id v5 = [(SCATElementNavigationController *)self lastScannedElementCommunity];
  v6 = [v4 lastItemForScanningWithElementCommunity:v5];

  return v6;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  BOOL v23 = 0;
  unsigned int v8 = [v7 scatIsAuxiliaryElement];
  if (v8)
  {
    uint64_t v9 = [(SCATElementManager *)self auxiliaryElementAfter:v7];
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_16;
    }
    v11 = [v7 scatAuxiliaryElementManager];
    v12 = [v11 contextElement];

    if ([v12 isGroup])
    {
      id v13 = [v12 lastChild];
    }
    else
    {
      if (!v12)
      {
        v21 = [(SCATElementNavigationController *)self axManager];
        v22 = [(SCATElementNavigationController *)self lastScannedElementCommunity];
        v10 = [v21 firstItemForScanningWithElementCommunity:v22];

        BOOL v23 = 1;
        if (v10) {
          goto LABEL_16;
        }
        goto LABEL_9;
      }
      id v13 = v12;
    }
    id v14 = v13;

    id v7 = v14;
  }
LABEL_9:
  v15 = [(SCATElementNavigationController *)self axManager];
  v10 = [v15 nextItemForScanningFromItem:v7 didWrap:&v23];

  if (v23) {
    char v16 = v8;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = [(SCATElementManager *)self firstAuxiliaryElementWithRole:[(SCATElementManager *)self roleForElement:v7]];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;

      BOOL v23 = 0;
      v10 = v19;
    }
  }
LABEL_16:
  if (a4) {
    *a4 = v23;
  }

  return v10;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  BOOL v23 = 0;
  unsigned int v8 = [v7 scatIsAuxiliaryElement];
  if (v8)
  {
    uint64_t v9 = [(SCATElementManager *)self auxiliaryElementBefore:v7];
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_16;
    }
    v11 = [v7 scatAuxiliaryElementManager];
    v12 = [v11 contextElement];

    if ([v12 isGroup])
    {
      id v13 = [v12 firstChild];
    }
    else
    {
      if (!v12)
      {
        v21 = [(SCATElementNavigationController *)self axManager];
        v22 = [(SCATElementNavigationController *)self lastScannedElementCommunity];
        v10 = [v21 lastItemForScanningWithElementCommunity:v22];

        BOOL v23 = 1;
        if (v10) {
          goto LABEL_16;
        }
        goto LABEL_9;
      }
      id v13 = v12;
    }
    id v14 = v13;

    id v7 = v14;
  }
LABEL_9:
  v15 = [(SCATElementNavigationController *)self axManager];
  v10 = [v15 previousItemForScanningFromItem:v7 didWrap:&v23];

  if (v23) {
    char v16 = v8;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = [(SCATElementManager *)self lastAuxiliaryElementWithRole:[(SCATElementManager *)self roleForElement:v7]];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;

      BOOL v23 = 0;
      v10 = v19;
    }
  }
LABEL_16:
  if (a4) {
    *a4 = v23;
  }

  return v10;
}

- (id)_nativeFocusElementContext
{
  BOOL v3 = +[HNDAccessibilityManager sharedManager];
  id v4 = [v3 nativeFocusElement];

  if (v4)
  {
    id v5 = +[SCATFocusContext focusContextWithElement:v4 elementManager:self selectBehavior:0 options:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)numberOfItemsInCurrentScanCycle
{
  if (![(SCATElementNavigationController *)self isGroupingEnabled])
  {
    unsigned int v8 = [(SCATElementNavigationController *)self axManager];
    id v7 = [v8 elements];

    if (v7)
    {
      uint64_t v9 = (char *)[v7 count];
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  BOOL v3 = [(SCATElementNavigationController *)self currentFocusContext];
  id v4 = [v3 element];
  unsigned int v5 = [v4 scatIsAuxiliaryElement];

  if (v5)
  {
    v6 = [(SCATElementNavigationController *)self axManager];
    id v7 = [v6 rootScannerGroup];
  }
  else
  {
    v6 = [(SCATElementNavigationController *)self currentFocusContext];
    unsigned int v10 = [v6 selectBehavior];
    v11 = [(SCATElementNavigationController *)self currentFocusContext];
    v12 = [v11 element];
    id v7 = v12;
    if (v10 != 4)
    {
      uint64_t v13 = [v12 parentGroup];

      id v7 = (void *)v13;
    }
  }
  if (!v7)
  {
LABEL_13:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = (char *)[v7 count];
  id v14 = [v7 parentGroup];

  if (v14) {
    ++v9;
  }
LABEL_14:

  if ([(SCATElementNavigationController *)self isMenuOpeningElementEnabled]) {
    uint64_t v9 = &v9[[(SCATElementManager *)self auxiliaryElementCountWithRole:1]];
  }

  return +[NSNumber numberWithUnsignedInteger:v9];
}

- (void)_giveUpWaitingForFetchAfterPause
{
  BOOL v3 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemSCElementNav identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v25 = 138543362;
        v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v25, 0xCu);
      }
    }
  }
  unsigned int v10 = +[SCATScannerManager sharedManager];
  if ([(SCATElementNavigationController *)self shouldRescanFromTopAfterFetch])
  {
    v11 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = +[AXSubsystemSCElementNav identifier];
      id v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        char v16 = AXColorizeFormatLog();
        v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          int v25 = 138543362;
          v26 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
    [v10 beginScanningWithFocusContext:0];
  }
  else if ([(SCATElementNavigationController *)self shouldRescanAfterFetch])
  {
    v18 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v19 = [v18 ignoreLogging];

    if ((v19 & 1) == 0)
    {
      v20 = +[AXSubsystemSCElementNav identifier];
      v21 = AXLoggerForFacility();

      os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v21, v22))
      {
        BOOL v23 = AXColorizeFormatLog();
        v24 = _AXStringForArgs();
        if (os_log_type_enabled(v21, v22))
        {
          int v25 = 138543362;
          v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}@", (uint8_t *)&v25, 0xCu);
        }
      }
    }
    [v10 resumeScanning];
  }
  [(SCATElementNavigationController *)self _resetFetchFlags];
}

- (void)_stopWaitingForFetchAfterTemporaryPause
{
}

- (void)_startWaitingForFetchAfterTemporaryPause
{
}

- (void)_pauseScanningTemporarily
{
  BOOL v3 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemSCElementNav identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v18 = 138543362;
        unsigned __int8 v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _stopWaitingForFetchAfterTemporaryPause];
  unsigned int v10 = +[SCATScannerManager sharedManager];
  if ([v10 isActive])
  {
    v11 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = +[AXSubsystemSCElementNav identifier];
      id v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        char v16 = AXColorizeFormatLog();
        v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          int v18 = 138543362;
          unsigned __int8 v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
    [(SCATElementNavigationController *)self setShouldRescanAfterFetch:1];
    [v10 pauseScanningWithScreenLockDisabled:1];
  }
}

- (void)_pauseScanningForLikelyScreenChange
{
  [(SCATElementNavigationController *)self _pauseScanningTemporarily];
  [(SCATElementNavigationController *)self setShouldRescanFromTopAfterFetch:1];
  BOOL v3 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemSCElementNav identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _startWaitingForFetchAfterTemporaryPause];
}

- (void)_resetFetchFlags
{
  BOOL v3 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = +[AXSubsystemSCElementNav identifier];
    v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self setShouldRescanAfterFetch:0];
  [(SCATElementNavigationController *)self setShouldRescanFromTopAfterFetch:0];
}

- (void)orientationDidChange:(id)a3
{
  unsigned __int8 v4 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    v6 = +[AXSubsystemSCElementNav identifier];
    os_log_type_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog();
      int v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        int v11 = 138543362;
        unsigned __int8 v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _pauseScanningTemporarily];
}

- (void)appTransitionDidOccur:(id)a3
{
  unsigned __int8 v4 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    v6 = +[AXSubsystemSCElementNav identifier];
    os_log_type_t v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog();
      int v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        int v11 = 138543362;
        unsigned __int8 v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _pauseScanningTemporarily];
  [(SCATElementNavigationController *)self setShouldRescanFromTopAfterFetch:1];
}

- (void)screenDidChange:(id)a3 data:(id)a4
{
  id v5 = a3;
  v6 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v7 = [v6 ignoreLogging];

  if ((v7 & 1) == 0)
  {
    os_log_type_t v8 = +[AXSubsystemSCElementNav identifier];
    uint64_t v9 = AXLoggerForFacility();

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      int v11 = AXColorizeFormatLog();
      unsigned __int8 v12 = _AXStringForArgs();
      if (os_log_type_enabled(v9, v10))
      {
        int v20 = 138543362;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  if (![(SCATElementNavigationController *)self _didFocusLastOnKeyboardElement])
  {
    [(SCATElementNavigationController *)self _pauseScanningTemporarily];
    [(SCATElementNavigationController *)self setShouldRescanFromTopAfterFetch:1];
    uint64_t v13 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v14 = [v13 ignoreLogging];

    if ((v14 & 1) == 0)
    {
      os_log_type_t v15 = +[AXSubsystemSCElementNav identifier];
      char v16 = AXLoggerForFacility();

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        int v18 = AXColorizeFormatLog();
        unsigned __int8 v19 = _AXStringForArgs();
        if (os_log_type_enabled(v16, v17))
        {
          int v20 = 138543362;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
  [(SCATElementNavigationController *)self firstResponderDidChange:v5];
}

- (void)alertDidAppear:(id)a3
{
  unsigned __int8 v4 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    v6 = +[AXSubsystemSCElementNav identifier];
    unsigned __int8 v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog();
      os_log_type_t v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        int v11 = 138543362;
        unsigned __int8 v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _pauseScanningTemporarily];
  [(SCATElementNavigationController *)self setShouldRescanFromTopAfterFetch:1];
}

- (void)screenChangingButtonWasPressed:(id)a3
{
  unsigned __int8 v4 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    v6 = +[AXSubsystemSCElementNav identifier];
    unsigned __int8 v7 = AXLoggerForFacility();

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog();
      os_log_type_t v10 = _AXStringForArgs();
      if (os_log_type_enabled(v7, v8))
      {
        int v11 = 138543362;
        unsigned __int8 v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _pauseScanningForLikelyScreenChange];
}

- (void)_trackLastScannedElementCommunityFromFocusContext:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [v10 selectBehavior];
  unsigned __int8 v5 = [v10 element];
  v6 = v5;
  if (v4 != 4)
  {
    uint64_t v7 = [v5 parentGroup];

    v6 = (void *)v7;
  }
  if (v6)
  {
    while (1)
    {
      os_log_type_t v8 = [v6 elementCommunity];

      if (v8) {
        break;
      }
      uint64_t v9 = [v6 parentGroup];

      v6 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    uint64_t v9 = [v6 elementCommunity];
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_9:
  [(SCATElementNavigationController *)self setLastScannedElementCommunity:v9];
}

- (void)firstResponderDidChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(SCATElementNavigationController *)self axManager];
  v6 = [v5 firstResponder];

  uint64_t v7 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = +[AXSubsystemSCElementNav identifier];
    id v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      id v35 = v4;
      unsigned __int8 v12 = AXColorizeFormatLog();
      uint64_t v13 = [(SCATElementNavigationController *)self firstResponder];
      unsigned __int8 v14 = [v13 elemLog];
      [v6 elemLog];
      v34 = v33 = v14;
      os_log_type_t v15 = _AXStringForArgs();

      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%{public}@", buf, 0xCu);
      }

      id v4 = v35;
    }
  }
  uint64_t v16 = [(SCATElementNavigationController *)self firstResponder];
  os_log_type_t v17 = v6;
  if ((void *)v16 == v6) {
    goto LABEL_26;
  }
  int v18 = (void *)v16;
  unsigned __int8 v19 = [(SCATElementNavigationController *)self firstResponder];
  unsigned __int8 v20 = [v19 isEqual:v6];

  if ((v20 & 1) == 0)
  {
    [(SCATElementNavigationController *)self setShouldScanKeyboardOnAppearance:0];
    if (v6)
    {
      if (![(SCATElementNavigationController *)self _didFocusLastOnKeyboardElement])
      {
        os_log_type_t v17 = [(SCATElementNavigationController *)self _firstKeyboardFocusContext];
        v21 = +[AXSubsystemSCElementNav sharedInstance];
        unsigned __int8 v22 = [v21 ignoreLogging];

        if (v17)
        {
          if ((v22 & 1) == 0)
          {
            BOOL v23 = +[AXSubsystemSCElementNav identifier];
            v24 = AXLoggerForFacility();

            os_log_type_t v25 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v24, v25))
            {
              v26 = AXColorizeFormatLog();
              v27 = _AXStringForArgs();
              if (os_log_type_enabled(v24, v25))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v27;
                _os_log_impl((void *)&_mh_execute_header, v24, v25, "%{public}@", buf, 0xCu);
              }
            }
          }
          [v4 beginScanningWithFocusContext:v17];
        }
        else
        {
          if ((v22 & 1) == 0)
          {
            v28 = +[AXSubsystemSCElementNav identifier];
            v29 = AXLoggerForFacility();

            os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v29, v30))
            {
              v31 = AXColorizeFormatLog();
              v32 = _AXStringForArgs();
              if (os_log_type_enabled(v29, v30))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v32;
                _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}@", buf, 0xCu);
              }
            }
          }
          [(SCATElementNavigationController *)self setShouldScanKeyboardOnAppearance:1];
        }
LABEL_26:
      }
    }
  }
  [(SCATElementNavigationController *)self setFirstResponder:v6];
}

- (void)_updateVisualScrollersWithFocusContext:(id)a3 oldContext:(id)a4
{
  id v15 = a4;
  [(SCATElementNavigationController *)self setTopLevelVisualScrollersEnabled:1];
  unsigned __int8 v5 = [(SCATElementNavigationController *)self currentFocusContext];
  v6 = [v5 element];

  if (([v6 scatIsAuxiliaryElement] & 1) == 0)
  {
    uint64_t v7 = [(SCATElementNavigationController *)self topLevelVisualScrollersAuxElementManager];
    [v7 setContextElement:v6];
  }
  if ([(SCATElementNavigationController *)self isGroupingEnabled])
  {
    if ([v6 scatIsAuxiliaryElement])
    {
      unsigned __int8 v8 = [v6 scatAuxiliaryElementManager];
      uint64_t v9 = [v8 contextElement];
    }
    else
    {
      id v10 = [v15 element];
      if ([v10 isGroup])
      {
        os_log_type_t v11 = [v15 element];
        unsigned __int8 v12 = [v11 firstChild];
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        int isKindOfClass = 0;
      }

      if ([v6 isGroup]
        && (([v6 isRootGroup] | isKindOfClass) & 1) != 0)
      {
        id v14 = v6;
      }
      else
      {
        id v14 = [v6 parentGroup];
      }
      uint64_t v9 = v14;
      unsigned __int8 v8 = [(SCATElementNavigationController *)self groupVisualScrollersAuxElementManager];
      [v8 setContextElement:v9];
    }

    [(SCATElementNavigationController *)self setGroupVisualScrollersEnabled:v9 != 0];
  }
  else
  {
    [(SCATElementNavigationController *)self setGroupVisualScrollersEnabled:0];
  }
}

- (void)_updateMenuOpeningElementEnabledWithFocusContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[AXSettings sharedInstance];
  id v6 = [v5 switchControlTapBehavior];

  if (v6 == (id)2)
  {
    uint64_t v7 = [v4 element];
    unsigned __int8 v8 = [(SCATElementNavigationController *)self menuOpeningAuxElementManager];
    unsigned int v9 = [v8 containsElement:v7];

    id v10 = SWCHLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 67109379;
      int v20 = v9;
      __int16 v21 = 2113;
      unsigned __int8 v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Always tap menu: %d contains element: %{private}@", (uint8_t *)&v19, 0x12u);
    }

    if (v9)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v12 = v7;
      if ([v12 scatIsAuxiliaryElement])
      {
        uint64_t v13 = [v12 scatAuxiliaryElementManager];
        BOOL v14 = [v13 role] == (id)1;
      }
      else
      {
        BOOL v14 = 0;
      }
      id v15 = [v12 parentGroup];
      uint64_t v16 = [(SCATElementNavigationController *)self axManager];
      os_log_type_t v17 = [v16 rootScannerGroup];

      BOOL v11 = (v15 == v17 || v14) && [v4 selectBehavior] != 4;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  int v18 = SWCHLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = 67109120;
    int v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Always tap menu: %d", (uint8_t *)&v19, 8u);
  }

  [(SCATElementNavigationController *)self setMenuOpeningElementEnabled:v11];
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SCATElementNavigationController;
  [(SCATElementManager *)&v17 driver:a3 didFocusOnContext:v8 oldContext:a5];
  unsigned int v9 = +[AXSubsystemSCElementNav sharedInstance];
  LOBYTE(a3) = [v9 ignoreLogging];

  if ((a3 & 1) == 0)
  {
    id v10 = +[AXSubsystemSCElementNav identifier];
    BOOL v11 = AXLoggerForFacility();

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = AXColorizeFormatLog();
      uint64_t v16 = [v8 elemLog];
      BOOL v14 = _AXStringForArgs();

      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        int v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }
  -[SCATElementNavigationController setCurrentFocusContext:](self, "setCurrentFocusContext:", v8, v16);
  [(SCATElementNavigationController *)self _trackLastFocusedKeyboardItem:v8];
  [(SCATElementNavigationController *)self _trackLastScannedElementCommunityFromFocusContext:v8];
  [(SCATElementNavigationController *)self _updateMenuOpeningElementEnabledWithFocusContext:v8];
  id v15 = [v8 element];
  [v15 setScatAssistiveTechFocused:1];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCATElementNavigationController;
  id v5 = a4;
  [(SCATElementManager *)&v7 driver:a3 willUnfocusFromContext:v5];
  id v6 = objc_msgSend(v5, "element", v7.receiver, v7.super_class);

  [v6 setScatAssistiveTechFocused:0];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  id v5 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = +[AXSubsystemSCElementNav identifier];
    id v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = AXColorizeFormatLog();
      BOOL v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self setKeyboardIndexPath:0];
  [(SCATElementNavigationController *)self setKeyboardKeyCenterPoint:0];
  [(SCATElementNavigationController *)self setMenuOpeningElementEnabled:0];
}

- (unint64_t)_depthForElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parentGroup];

  if (v4)
  {
    id v4 = 0;
    id v5 = v3;
    do
    {
      ++v4;
      id v3 = [v5 parentGroup];

      unsigned __int8 v6 = [v3 parentGroup];

      id v5 = v3;
    }
    while (v6);
  }

  return (unint64_t)v4;
}

- (void)_attemptToRestoreFocusContext:(id)a3 scannerManager:(id)a4 foundNewElements:(BOOL)a5
{
  BOOL v72 = a5;
  id v7 = a3;
  id v8 = a4;
  os_log_type_t v9 = [v7 element];
  id v10 = [(SCATElementNavigationController *)self axManager];
  id v11 = [v10 scannerElementMatchingElement:v9];

  unint64_t v12 = (unint64_t)[v11 scatTraits];
  if ((kAXAutoCorrectCandidateTrait & v12) != 0)
  {
    if ([v9 scatIsAXElement])
    {
      uint64_t v13 = [v9 label];
    }
    else
    {
      uint64_t v13 = 0;
    }
    if ([v11 scatIsAXElement])
    {
      BOOL v14 = [v11 label];
    }
    else
    {
      BOOL v14 = 0;
    }
    if (v13 != v14)
    {
      id v15 = [v11 parentGroup];
      uint64_t v16 = [v15 firstLeafDescendant];

      id v11 = (id)v16;
    }
  }
  if (v11)
  {
    int v17 = 0;
  }
  else if ([v9 scatIsAuxiliaryElement])
  {
    id v11 = v9;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
    id v11 = 0;
  }
  int v18 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v19 = [v18 ignoreLogging];

  if ((v19 & 1) == 0)
  {
    int v20 = +[AXSubsystemSCElementNav identifier];
    __int16 v21 = AXLoggerForFacility();

    os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v21, v22))
    {
      id v73 = v8;
      id v69 = v7;
      BOOL v23 = AXColorizeFormatLog();
      if (objc_opt_respondsToSelector()) {
        [v9 elemLog];
      }
      else {
      v24 = [v9 description];
      }
      if (objc_opt_respondsToSelector()) {
        [v11 elemLog];
      }
      else {
        [v11 description];
      }
      v68 = v66 = v24;
      os_log_type_t v25 = _AXStringForArgs();

      if (os_log_type_enabled(v21, v22))
      {
        *(_DWORD *)buf = 138543362;
        v77 = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}@", buf, 0xCu);
      }

      id v7 = v69;
      id v8 = v73;
    }
  }
  if (!v11) {
    goto LABEL_41;
  }
  if ((v17 | ![(SCATElementNavigationController *)self isGroupingEnabled])) {
    goto LABEL_37;
  }
  unint64_t v26 = [(SCATElementNavigationController *)self _depthForElement:v9];
  unint64_t v27 = [(SCATElementNavigationController *)self _depthForElement:v11];
  v28 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v29 = [v28 ignoreLogging];

  if ((v29 & 1) == 0)
  {
    id v74 = v8;
    os_log_type_t v30 = +[AXSubsystemSCElementNav identifier];
    v31 = AXLoggerForFacility();

    os_log_type_t v32 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v31, v32))
    {
      id v70 = v7;
      v33 = AXColorizeFormatLog();
      v66 = (void *)v26;
      v68 = (void *)v27;
      v34 = _AXStringForArgs();
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138543362;
        v77 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%{public}@", buf, 0xCu);
      }

      id v7 = v70;
    }

    id v8 = v74;
  }
  if (v27 == v26)
  {
LABEL_37:
    id v35 = +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:](SCATFocusContext, "focusContextWithElement:elementManager:selectBehavior:options:", v11, self, objc_msgSend(v7, "selectBehavior", v66, v68), 0);
    v36 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v37 = [v36 ignoreLogging];

    if ((v37 & 1) == 0)
    {
      v38 = +[AXSubsystemSCElementNav identifier];
      v39 = AXLoggerForFacility();

      os_log_type_t v40 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v39, v40))
      {
        id v75 = v8;
        id v71 = v7;
        v41 = AXColorizeFormatLog();
        v67 = [v35 elemLog];
        v42 = _AXStringForArgs();

        if (os_log_type_enabled(v39, v40))
        {
          *(_DWORD *)buf = 138543362;
          v77 = v42;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "%{public}@", buf, 0xCu);
          goto LABEL_47;
        }
        goto LABEL_47;
      }
      goto LABEL_48;
    }
  }
  else
  {
LABEL_41:
    if (![(SCATElementNavigationController *)self _didFocusLastOnKeyboardElement])
    {
      id v35 = 0;
      goto LABEL_50;
    }
    id v35 = [(SCATElementNavigationController *)self _replacementForLastFocusedKeyboardItem];
    v43 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v44 = [v43 ignoreLogging];

    if ((v44 & 1) == 0)
    {
      v45 = +[AXSubsystemSCElementNav identifier];
      v39 = AXLoggerForFacility();

      os_log_type_t v40 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v39, v40))
      {
        id v75 = v8;
        id v71 = v7;
        v41 = AXColorizeFormatLog();
        v67 = [v35 elemLog];
        v42 = _AXStringForArgs();

        if (os_log_type_enabled(v39, v40))
        {
          *(_DWORD *)buf = 138543362;
          v77 = v42;
          goto LABEL_46;
        }
LABEL_47:

        id v7 = v71;
        id v8 = v75;
      }
LABEL_48:
    }
  }
LABEL_50:
  if ([(SCATElementNavigationController *)self shouldRescanAfterFetch]
    || [v8 isActive] && !v35)
  {
    v46 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v48 = +[AXSubsystemSCElementNav identifier];
      v49 = AXLoggerForFacility();

      os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = AXColorizeFormatLog();
        v52 = _AXStringForArgs();
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 138543362;
          v77 = v52;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "%{public}@", buf, 0xCu);
        }
      }
    }
    [v8 beginScanningWithFocusContext:v35];
  }
  else
  {
    unsigned int v53 = [v8 isActive];
    v54 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v55 = [v54 ignoreLogging];

    if (v53 && v35)
    {
      if ((v55 & 1) == 0)
      {
        v56 = +[AXSubsystemSCElementNav identifier];
        v57 = AXLoggerForFacility();

        os_log_type_t v58 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = AXColorizeFormatLog();
          v60 = _AXStringForArgs();
          if (os_log_type_enabled(v57, v58))
          {
            *(_DWORD *)buf = 138543362;
            v77 = v60;
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "%{public}@", buf, 0xCu);
          }
        }
      }
      [v8 continueScanningWithFocusContext:v35 foundNewElements:v72];
    }
    else
    {
      if ((v55 & 1) == 0)
      {
        v61 = +[AXSubsystemSCElementNav identifier];
        v62 = AXLoggerForFacility();

        os_log_type_t v63 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v62, v63))
        {
          v64 = AXColorizeFormatLog();
          v65 = _AXStringForArgs();
          if (os_log_type_enabled(v62, v63))
          {
            *(_DWORD *)buf = 138543362;
            v77 = v65;
            _os_log_impl((void *)&_mh_execute_header, v62, v63, "%{public}@", buf, 0xCu);
          }
        }
      }
      [v8 useFocusContextOnResume:v35];
    }
  }
}

- (BOOL)_shouldTrackNativeFocusElement
{
  v2 = +[SCATScannerManager sharedManager];
  id v3 = [v2 activeScannerDriver];
  BOOL v4 = [v3 driverType] == 1;

  return v4;
}

- (BOOL)_deferFocusToNativeFocusElementIfNeeded:(id)a3
{
  return 0;
}

- (void)scannerManager:(id)a3 nativeFocusElementDidChange:(id)a4
{
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v12 = [v11 ignoreLogging];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = +[AXSubsystemSCElementNav identifier];
    BOOL v14 = AXLoggerForFacility();

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = AXColorizeFormatLog();
      int v17 = _AXStringForArgs();
      if (os_log_type_enabled(v14, v15))
      {
        int v47 = 138543362;
        v48 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@", (uint8_t *)&v47, 0xCu);
      }
    }
  }
  [(SCATElementNavigationController *)self _stopWaitingForFetchAfterTemporaryPause];
  int v18 = [(SCATElementNavigationController *)self _firstKeyboardFocusContext];
  if (v18 && [(SCATElementNavigationController *)self shouldScanKeyboardOnAppearance])
  {
    unsigned __int8 v19 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v20 = [v19 ignoreLogging];

    if ((v20 & 1) == 0)
    {
      __int16 v21 = +[AXSubsystemSCElementNav identifier];
      os_log_type_t v22 = AXLoggerForFacility();

      os_log_type_t v23 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = AXColorizeFormatLog();
        os_log_type_t v25 = _AXStringForArgs();
        if (os_log_type_enabled(v22, v23))
        {
          int v47 = 138543362;
          v48 = v25;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}@", (uint8_t *)&v47, 0xCu);
        }
      }
    }
    [v9 beginScanningWithFocusContext:v18];
    [(SCATElementNavigationController *)self setShouldScanKeyboardOnAppearance:0];
  }
  else
  {

    if ([(SCATElementNavigationController *)self shouldRescanFromTopAfterFetch])
    {
      unint64_t v26 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v27 = [v26 ignoreLogging];

      if ((v27 & 1) == 0)
      {
        v28 = +[AXSubsystemSCElementNav identifier];
        unsigned __int8 v29 = AXLoggerForFacility();

        os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = AXColorizeFormatLog();
          os_log_type_t v32 = _AXStringForArgs();
          if (os_log_type_enabled(v29, v30))
          {
            int v47 = 138543362;
            v48 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}@", (uint8_t *)&v47, 0xCu);
          }
        }
      }
      [v9 beginScanningWithFocusContext:0];
    }
    else if (v7 || [(SCATElementNavigationController *)self isGroupingEnabled])
    {
      v33 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v34 = [v33 ignoreLogging];

      if ((v34 & 1) == 0)
      {
        id v35 = +[AXSubsystemSCElementNav identifier];
        v36 = AXLoggerForFacility();

        os_log_type_t v37 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = AXColorizeFormatLog();
          v39 = _AXStringForArgs();
          if (os_log_type_enabled(v36, v37))
          {
            int v47 = 138543362;
            v48 = v39;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "%{public}@", (uint8_t *)&v47, 0xCu);
          }
        }
      }
      [(SCATElementNavigationController *)self _attemptToRestoreFocusContext:v10 scannerManager:v9 foundNewElements:v7];
    }
    else if ([(SCATElementNavigationController *)self shouldRescanAfterFetch])
    {
      os_log_type_t v40 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v41 = [v40 ignoreLogging];

      if ((v41 & 1) == 0)
      {
        v42 = +[AXSubsystemSCElementNav identifier];
        v43 = AXLoggerForFacility();

        os_log_type_t v44 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v43, v44))
        {
          v45 = AXColorizeFormatLog();
          v46 = _AXStringForArgs();
          if (os_log_type_enabled(v43, v44))
          {
            int v47 = 138543362;
            v48 = v46;
            _os_log_impl((void *)&_mh_execute_header, v43, v44, "%{public}@", (uint8_t *)&v47, 0xCu);
          }
        }
      }
      [v9 resumeScanning];
    }
  }
  [(SCATElementNavigationController *)self _resetFetchFlags];
}

- (id)_firstKeyboardFocusContext
{
  id v3 = [(SCATElementNavigationController *)self axManager];
  BOOL v4 = [v3 firstKeyboardItem];

  if (v4)
  {
    id v5 = +[SCATFocusContext focusContextWithElement:v4 elementManager:self selectBehavior:0 options:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_isKeyboardContainerElement:(id)a3 allowKeyboardContainerItself:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SCATElementNavigationController *)self isGroupingEnabled])
  {
    BOOL v7 = [v6 keyboardContainer];
    unsigned int v8 = v7 != 0;
  }
  else
  {
    unsigned int v8 = [v6 scatIsKeyboardKey];
  }
  unsigned int v9 = [v6 isGroup] ^ 1;
  LOBYTE(v10) = v9 & v8;
  if ((v9 & 1) == 0 && v8) {
    unsigned int v10 = [v6 isKeyboardContainer] ^ 1 | v4;
  }

  return v10;
}

- (BOOL)_isScanningKeyboardContainer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 element];
  unsigned int v6 = [v4 selectBehavior];

  LOBYTE(self) = [(SCATElementNavigationController *)self _isKeyboardContainerElement:v5 allowKeyboardContainerItself:v6 == 4];
  return (char)self;
}

- (BOOL)_didFocusLastOnKeyboardElement
{
  unsigned int v3 = [(SCATElementNavigationController *)self isGroupingEnabled];
  if (v3)
  {
    id v4 = [(SCATElementNavigationController *)self keyboardIndexPath];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_10:

      return v5;
    }
    if ([(SCATElementNavigationController *)self isGroupingEnabled])
    {
      id v4 = 0;
      BOOL v5 = 0;
      goto LABEL_10;
    }
  }
  else if ([(SCATElementNavigationController *)self isGroupingEnabled])
  {
    return 0;
  }
  unsigned int v6 = [(SCATElementNavigationController *)self keyboardKeyCenterPoint];
  BOOL v5 = v6 != 0;

  if (v3)
  {
    id v4 = 0;
    goto LABEL_10;
  }
  return v5;
}

- (id)_indexPathForKeyboardElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup] && objc_msgSend(v4, "isKeyboardContainer"))
  {
    BOOL v5 = +[NSIndexPath indexPathWithIndex:0];
  }
  else
  {
    unsigned int v6 = [v4 parentGroup];
    BOOL v7 = v6;
    if (v6 && (id v8 = [v6 indexOfObject:v4], v8 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      id v9 = v8;
      unsigned int v10 = [(SCATElementNavigationController *)self _indexPathForKeyboardElement:v7];
      BOOL v5 = [v10 indexPathByAddingIndex:v9];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)_keyboardElementForIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _AXAssert();
  }
  if ([v4 length] == (id)1)
  {
    id v5 = [(SCATElementNavigationController *)self axManager];
    unsigned int v6 = [v5 rootKeyboardGroup];
  }
  else
  {
    BOOL v7 = [v4 indexPathByRemovingLastIndex];
    unsigned int v6 = [(SCATElementNavigationController *)self _keyboardElementForIndexPath:v7];

    if (![v6 isGroup]) {
      goto LABEL_10;
    }
    id v5 = v6;
    id v8 = objc_msgSend(v4, "indexAtPosition:", (char *)objc_msgSend(v4, "length") - 1);
    if (v8 >= [v5 count])
    {
      unsigned int v6 = v5;
    }
    else
    {
      unsigned int v6 = [v5 objectAtIndex:v8];
    }
  }

LABEL_10:

  return v6;
}

- (void)_trackLastFocusedKeyboardItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 element];
  if (![(SCATElementNavigationController *)self _isScanningKeyboardContainer:v4])
  {
    id v9 = 0;
    goto LABEL_9;
  }
  if (![(SCATElementNavigationController *)self isGroupingEnabled])
  {
    if (([v5 scatIsAXElement] & 1) == 0)
    {
      unsigned __int8 v19 = v5;
      _AXAssert();
    }
    objc_msgSend(v5, "centerPoint", v19);
    id v9 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
    unsigned int v10 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v11 = [v10 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      int v17 = +[AXSubsystemSCElementNav identifier];
      uint64_t v13 = AXLoggerForFacility();

      os_log_type_t v18 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v13, v18))
      {
        unsigned int v6 = 0;
        goto LABEL_21;
      }
      os_log_type_t v15 = AXColorizeFormatLog();
      unsigned __int8 v19 = v9;
      uint64_t v16 = _AXStringForArgs();
      if (os_log_type_enabled(v13, v18))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, v18, "%{public}@", buf, 0xCu);
      }
      unsigned int v6 = 0;
      goto LABEL_18;
    }
LABEL_9:
    unsigned int v6 = 0;
    goto LABEL_22;
  }
  unsigned int v6 = [(SCATElementNavigationController *)self _indexPathForKeyboardElement:v5];
  BOOL v7 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    unsigned __int8 v12 = +[AXSubsystemSCElementNav identifier];
    uint64_t v13 = AXLoggerForFacility();

    os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v13, v14))
    {
      id v9 = 0;
      goto LABEL_21;
    }
    os_log_type_t v15 = AXColorizeFormatLog();
    unsigned __int8 v19 = v6;
    uint64_t v16 = _AXStringForArgs();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
    }
    id v9 = 0;
LABEL_18:

LABEL_21:
    goto LABEL_22;
  }
  id v9 = 0;
LABEL_22:
  -[SCATElementNavigationController setKeyboardIndexPath:](self, "setKeyboardIndexPath:", v6, v19);
  [(SCATElementNavigationController *)self setKeyboardKeyCenterPoint:v9];
  -[SCATElementNavigationController setKeyboardSelectBehavior:](self, "setKeyboardSelectBehavior:", [v4 selectBehavior]);
}

- (id)_replacementForLastFocusedKeyboardItem
{
  if ([(SCATElementNavigationController *)self isGroupingEnabled])
  {
    unsigned int v3 = [(SCATElementNavigationController *)self keyboardIndexPath];
    id v4 = [(SCATElementNavigationController *)self _keyboardElementForIndexPath:v3];
  }
  else
  {
    id v5 = [(SCATElementNavigationController *)self axManager];
    unsigned int v6 = [(SCATElementNavigationController *)self keyboardKeyCenterPoint];
    [v6 CGPointValue];
    id v4 = objc_msgSend(v5, "elementAtPoint:");

    if (([v4 scatIsKeyboardKey] & 1) == 0)
    {

      goto LABEL_11;
    }
  }
  if (!v4)
  {
LABEL_11:
    BOOL v7 = [(SCATElementNavigationController *)self _firstKeyboardFocusContext];
    goto LABEL_12;
  }
  if (([v4 isGroup] & 1) == 0
    && ([(SCATElementNavigationController *)self keyboardSelectBehavior] == 3
     || [(SCATElementNavigationController *)self keyboardSelectBehavior] == 4))
  {
    [(SCATElementNavigationController *)self setKeyboardSelectBehavior:0];
  }
  BOOL v7 = +[SCATFocusContext focusContextWithElement:v4 elementManager:self selectBehavior:[(SCATElementNavigationController *)self keyboardSelectBehavior] options:0];

LABEL_12:

  return v7;
}

- (void)scannerManager:(id)a3 didActivateElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SCATElementNavigationController *)self _isKeyboardContainerElement:v7 allowKeyboardContainerItself:0])
  {
    unsigned __int8 v8 = [(SCATElementNavigationController *)self nextFocusContextAfterActivatingKeyboardElement:v7];
    [v6 beginScanningWithFocusContext:v8];
LABEL_3:

    goto LABEL_23;
  }
  id v9 = [v7 scatActivateBehavior];
  unsigned int v10 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v11 = [v10 ignoreLogging];

  if (v9)
  {
    if (v11) {
      goto LABEL_23;
    }
    unsigned __int8 v12 = +[AXSubsystemSCElementNav identifier];
    unsigned __int8 v8 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v13))
    {
      os_log_type_t v14 = AXColorizeFormatLog();
      if (objc_opt_respondsToSelector()) {
        [v7 elemLog];
      }
      else {
      os_log_type_t v22 = [v7 description];
      }
      unsigned __int8 v19 = _AXStringForArgs();

      if (os_log_type_enabled(v8, v13))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v8, v13, "%{public}@", buf, 0xCu);
      }
    }
    goto LABEL_3;
  }
  if ((v11 & 1) == 0)
  {
    os_log_type_t v15 = +[AXSubsystemSCElementNav identifier];
    uint64_t v16 = AXLoggerForFacility();

    os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v18 = AXColorizeFormatLog();
      if (objc_opt_respondsToSelector()) {
        [v7 elemLog];
      }
      else {
      __int16 v21 = [v7 description];
      }
      unsigned __int8 v20 = _AXStringForArgs();

      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(v6, "beginScanningWithFocusContext:", 0, v21);
LABEL_23:
}

- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATElementNavigationController *)self axManager];
  id v6 = [v5 scannerElementMatchingElement:v4];

  if (v6)
  {
    id v7 = v6;

    id v4 = v7;
  }
  if ([(SCATElementNavigationController *)self _isKeyboardContainerElement:v4 allowKeyboardContainerItself:0])
  {
    unsigned __int8 v8 = [(SCATElementNavigationController *)self nextFocusContextAfterActivatingKeyboardElement:v4];
  }
  else
  {
    id v9 = +[SCATScannerManager sharedManager];
    unsigned int v10 = [v9 menu];
    unsigned int v11 = [v10 didActivateElement];

    if (v11)
    {
      if ([v4 scatActivateBehavior] == (id)1)
      {
        unsigned __int8 v8 = +[SCATFocusContext focusContextWithElement:v4 elementManager:self selectBehavior:0 options:0];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
      unsigned __int8 v12 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v13 = [v12 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        os_log_type_t v14 = +[AXSubsystemSCElementNav identifier];
        os_log_type_t v15 = AXLoggerForFacility();

        os_log_type_t v16 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v15, v16))
        {
          os_log_type_t v17 = AXColorizeFormatLog();
          if (objc_opt_respondsToSelector()) {
            [v4 elemLog];
          }
          else {
          unsigned __int8 v20 = [v4 description];
          }
          [v4 scatActivateBehavior];
          os_log_type_t v18 = _AXStringForArgs();

          if (os_log_type_enabled(v15, v16))
          {
            *(_DWORD *)buf = 138543362;
            os_log_type_t v22 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 switchControlRestartScanningAtCurrentKey];

  if (v6)
  {
    id v7 = +[SCATFocusContext focusContextWithElement:v4 elementManager:self selectBehavior:0 options:0];
  }
  else
  {
    id v7 = [(SCATElementNavigationController *)self _firstKeyboardFocusContext];
    unsigned __int8 v8 = +[AXSubsystemSCElementNav sharedInstance];
    int v9 = [v8 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      unsigned int v10 = +[AXSubsystemSCElementNav identifier];
      unsigned int v11 = AXLoggerForFacility();

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v11, v12))
      {
        unsigned __int8 v13 = AXColorizeFormatLog();
        if (objc_opt_respondsToSelector()) {
          [v4 elemLog];
        }
        else {
        os_log_type_t v14 = [v4 description];
        }
        os_log_type_t v17 = [v7 elemLog];
        os_log_type_t v15 = _AXStringForArgs();

        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138543362;
          unsigned __int8 v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
        }
      }
    }
  }

  return v7;
}

- (id)focusContextAfterDrillOutOnGroup:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyboardContainer]
    && ([v4 elementCommunity], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    unsigned int v6 = [(SCATElementNavigationController *)self firstElementWithOptions:0];
    id v7 = +[SCATFocusContext focusContextWithElement:v6 elementManager:self selectBehavior:0 options:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCATElementNavigationController;
    id v7 = [(SCATElementManager *)&v9 focusContextAfterDrillOutOnGroup:v4];
  }

  return v7;
}

- (SCATElementNavigationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATElementNavigationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SCATFocusContext)currentFocusContext
{
  return self->_currentFocusContext;
}

- (BOOL)shouldRescanAfterFetch
{
  return self->_shouldRescanAfterFetch;
}

- (void)setShouldRescanAfterFetch:(BOOL)a3
{
  self->_shouldRescanAfterFetch = a3;
}

- (BOOL)shouldRescanFromTopAfterFetch
{
  return self->_shouldRescanFromTopAfterFetch;
}

- (void)setShouldRescanFromTopAfterFetch:(BOOL)a3
{
  self->_shouldRescanFromTopAfterFetch = a3;
}

- (NSValue)keyboardKeyCenterPoint
{
  return self->_keyboardKeyCenterPoint;
}

- (void)setKeyboardKeyCenterPoint:(id)a3
{
}

- (NSIndexPath)keyboardIndexPath
{
  return self->_keyboardIndexPath;
}

- (void)setKeyboardIndexPath:(id)a3
{
}

- (int)keyboardSelectBehavior
{
  return self->_keyboardSelectBehavior;
}

- (void)setKeyboardSelectBehavior:(int)a3
{
  self->_keyboardSelectBehavior = a3;
}

- (AXElement)lastScannedElementCommunity
{
  return self->_lastScannedElementCommunity;
}

- (void)setLastScannedElementCommunity:(id)a3
{
}

- (NSString)startingSceneIdentifier
{
  return self->_startingSceneIdentifier;
}

- (void)setStartingSceneIdentifier:(id)a3
{
}

- (AXElement)firstResponder
{
  return self->_firstResponder;
}

- (void)setFirstResponder:(id)a3
{
}

- (BOOL)shouldScanKeyboardOnAppearance
{
  return self->_shouldScanKeyboardOnAppearance;
}

- (void)setShouldScanKeyboardOnAppearance:(BOOL)a3
{
  self->_shouldScanKeyboardOnAppearance = a3;
}

- (SCATMenuOpeningAuxiliaryElementManager)menuOpeningAuxElementManager
{
  return self->_menuOpeningAuxElementManager;
}

- (void)setMenuOpeningAuxElementManager:(id)a3
{
}

- (BOOL)isMenuOpeningElementEnabled
{
  return self->_menuOpeningElementEnabled;
}

- (SCATVisualScrollersAuxiliaryElementManager)topLevelVisualScrollersAuxElementManager
{
  return self->_topLevelVisualScrollersAuxElementManager;
}

- (void)setTopLevelVisualScrollersAuxElementManager:(id)a3
{
}

- (BOOL)areTopLevelVisualScrollersEnabled
{
  return self->_topLevelVisualScrollersEnabled;
}

- (SCATVisualScrollersAuxiliaryElementManager)groupVisualScrollersAuxElementManager
{
  return self->_groupVisualScrollersAuxElementManager;
}

- (void)setGroupVisualScrollersAuxElementManager:(id)a3
{
}

- (BOOL)areGroupVisualScrollersEnabled
{
  return self->_groupVisualScrollersEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupVisualScrollersAuxElementManager, 0);
  objc_storeStrong((id *)&self->_topLevelVisualScrollersAuxElementManager, 0);
  objc_storeStrong((id *)&self->_menuOpeningAuxElementManager, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_storeStrong((id *)&self->_startingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_lastScannedElementCommunity, 0);
  objc_storeStrong((id *)&self->_keyboardIndexPath, 0);
  objc_storeStrong((id *)&self->_keyboardKeyCenterPoint, 0);
  objc_storeStrong((id *)&self->_currentFocusContext, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_axManager, 0);
}

@end