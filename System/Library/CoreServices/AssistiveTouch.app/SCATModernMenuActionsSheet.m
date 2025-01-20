@interface SCATModernMenuActionsSheet
- (BOOL)_addTapReplacementGestureIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (BOOL)_itemBelongsOnShortFirstPage:(id)a3 shouldAddControlCenterActions:(BOOL)a4 shouldIncludeSpotlight:(BOOL)a5;
- (id)_bestScrollMenuItemsForScrollableElement:(id)a3;
- (id)_escapableElements;
- (id)_menuItemForScrollAction:(int)a3;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)storedNumberOfItemsInFirstPage;
- (void)_addAdditionalShortcutsIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)_addScrollShortcutIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)_addTapIfApplicableForElement:(id)a3 toMenuItems:(id)a4;
- (void)setStoredNumberOfItemsInFirstPage:(unint64_t)a3;
@end

@implementation SCATModernMenuActionsSheet

- (unint64_t)numberOfItemsInFirstPage
{
  v3 = [(SCATModernMenuSheet *)self menuItems];

  if (!v3) {
    _AXAssert();
  }

  return [(SCATModernMenuActionsSheet *)self storedNumberOfItemsInFirstPage];
}

- (id)_menuItemForScrollAction:(int)a3
{
  return +[SCATModernMenuScrollFactory menuItemForScrollAction:*(void *)&a3 withDelegate:self];
}

- (id)_bestScrollMenuItemsForScrollableElement:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [v4 uiElement];
  v7 = [v6 arrayWithAXAttribute:2089];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "intValue", (void)v19);
        if ([v4 scatSupportsAction:v13])
        {
          v14 = [(SCATModernMenuActionsSheet *)self _menuItemForScrollAction:v13];
          [v5 addObject:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if (![v5 count])
  {
    uint64_t v15 = 2006;
    if (([v4 scatSupportsAction:2006] & 1) == 0)
    {
      uint64_t v15 = 2008;
      if (([v4 scatSupportsAction:2008] & 1) == 0)
      {
        uint64_t v15 = 2009;
        if (([v4 scatSupportsAction:2009] & 1) == 0)
        {
          unint64_t v16 = (unint64_t)[v4 scatTraits];
          if ((kAXCausesPageTurnTrait & v16) == 0) {
            goto LABEL_17;
          }
          uint64_t v15 = 2019;
        }
      }
    }
    v17 = -[SCATModernMenuActionsSheet _menuItemForScrollAction:](self, "_menuItemForScrollAction:", v15, (void)v19);
    [v5 addObject:v17];
  }
LABEL_17:

  return v5;
}

- (void)_addTapIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!v21) {
    goto LABEL_11;
  }
  v7 = [(SCATModernMenuSheet *)self menu];
  uint64_t v8 = [v7 pointPicker];
  if (v8)
  {
    id v9 = (void *)v8;
    if (![v21 scatIsAXElement])
    {

LABEL_11:
      v17 = [(SCATModernMenuSheet *)self menu];
      v18 = [v17 screenPoint];

      if (!v18) {
        goto LABEL_14;
      }
      uint64_t v19 = AXSSwitchControlMenuItemGesturesTap;
      uint64_t v15 = [(SCATModernMenuSheet *)self menu];
      unint64_t v16 = +[SCATMenuItemFactory menuItemsForItem:v19 menu:v15 delegate:self];
      long long v20 = [v16 firstObject];
      [v6 addObject:v20];

      goto LABEL_13;
    }
    id v10 = [v21 uiElement];
    unsigned __int8 v11 = [v10 BOOLWithAXAttribute:2150];

    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  unint64_t v12 = (unint64_t)[v21 scatTraits];
  if ((kAXAdjustableTrait & v12) == 0
    || ([v21 uiElement],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 BOOLWithAXAttribute:2019],
        v13,
        v14))
  {
    uint64_t v15 = [(SCATModernMenuSheet *)self menu];
    unint64_t v16 = +[SCATModernMenuActionsFactory menuItemForTapWithMenu:v15 delegate:self];
    [v6 addObject:v16];
LABEL_13:
  }
LABEL_14:
}

- (void)_addScrollShortcutIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a4;
  v7 = [a3 scrollableElement];
  uint64_t v8 = [(SCATModernMenuActionsSheet *)self _bestScrollMenuItemsForScrollableElement:v7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([v6 containsObject:v13] & 1) == 0) {
          [v6 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)_addTapReplacementGestureIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 scatIsAXElement])
  {
    uint64_t v8 = [v6 uiElement];
    id v9 = [v8 arrayWithAXAttribute:12016];

    id v10 = [v9 count];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      id v22 = v6;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v21 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            v18 = [(SCATModernMenuSheet *)self menu];
            uint64_t v19 = +[SCATMenuItemFactory menuItemsForItem:v17 menu:v18 delegate:self];
            [v7 axSafelyAddObjectsFromArray:v19];
          }
          id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }

      id v6 = v22;
      id v9 = v21;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_addAdditionalShortcutsIfApplicableForElement:(id)a3 toMenuItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 scatIsAXElement])
  {
    uint64_t v8 = [v6 uiElement];
    id v9 = [v8 arrayWithAXAttribute:12015];

    if (v9)
    {
      v18 = v9;
      id v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v14);
            long long v16 = [(SCATModernMenuSheet *)self menu];
            uint64_t v17 = +[SCATMenuItemFactory menuItemsForItem:v15 menu:v16 delegate:self];
            [v7 axSafelyAddObjectsFromArray:v17];

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }

      id v9 = v18;
      id v6 = v19;
    }
  }
}

- (id)makeMenuItemsIfNeeded
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = [(SCATModernMenuSheet *)self menu];
  uint64_t v5 = [v4 element];

  v65 = +[AXSettings sharedInstance];
  v69 = (void *)v3;
  if (+[AXSpringBoardServer isAvailable])
  {
    id v6 = +[AXSpringBoardServer server];
    unsigned int v67 = [v6 isControlCenterVisible];

    id v7 = +[AXSpringBoardServer server];
    unsigned int v8 = [v7 isShowingLongLookNotification];

    id v9 = +[AXSpringBoardServer server];
    if ([v9 isShowingHomescreen])
    {
      unsigned int v10 = 1;
    }
    else
    {
      id v12 = +[AXSpringBoardServer server];
      unsigned int v10 = [v12 isLockScreenVisible];
    }
    id v11 = v65;
  }
  else
  {
    unsigned int v10 = 0;
    unsigned int v8 = 0;
    unsigned int v67 = 0;
    id v11 = v65;
  }
  if ([v11 switchControlTapBehavior] == (id)1)
  {
    BOOL v13 = 1;
  }
  else if ([v11 switchControlTapBehavior] == (id)2)
  {
    id v14 = +[SCATScannerManager sharedManager];
    if ([v14 isUsingPointMode])
    {
      BOOL v13 = 0;
    }
    else
    {
      uint64_t v15 = [(SCATModernMenuSheet *)self menu];
      [v15 delegate];
      v17 = uint64_t v16 = v5;
      v18 = [(SCATModernMenuSheet *)self menu];
      BOOL v13 = [v17 itemMenuStateForMenu:v18] != (id)2;

      uint64_t v5 = v16;
      id v11 = v65;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  id v19 = +[SCATScannerManager sharedManager];
  unsigned int v20 = [v19 isExternalDisplayConnected];

  if ([v11 switchControlTapBehavior] == (id)2)
  {
    long long v21 = (void *)v5;
    long long v22 = [(SCATModernMenuSheet *)self menu];
    long long v23 = [v22 delegate];
    long long v24 = [(SCATModernMenuSheet *)self menu];
    if ([v23 itemMenuStateForMenu:v24])
    {
      BOOL v25 = 0;
    }
    else
    {
      unint64_t v26 = (unint64_t)[v21 scatTraits];
      BOOL v25 = (kAXAdjustableTrait & ~v26) == 0;
    }

    uint64_t v5 = (uint64_t)v21;
    id v11 = v65;
    if (!v13) {
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v25 = 0;
    if (!v13) {
      goto LABEL_23;
    }
  }
  if (!v25) {
    goto LABEL_29;
  }
LABEL_23:
  unsigned int v27 = [v11 switchControlShouldUseShortFirstPage];
  if ((v27 & v10) == 1)
  {
    unsigned int v66 = (v67 | v8) ^ 1;
    goto LABEL_27;
  }
  if (!v27)
  {
LABEL_29:
    id v28 = v69;
    unsigned int v66 = 0;
    int v63 = 0;
    if (v13) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  unsigned int v66 = 0;
LABEL_27:
  id v28 = +[NSMutableArray array];
  int v63 = 1;
  if (![(SCATModernMenuActionsSheet *)self _addTapReplacementGestureIfApplicableForElement:v5 toMenuItems:v28])LABEL_30:[(SCATModernMenuActionsSheet *)self _addTapIfApplicableForElement:v5 toMenuItems:v28]; {
LABEL_31:
  }
  v64 = (void *)v5;
  if (v20)
  {
    uint64_t v29 = AXSSwitchControlMenuItemSwitchDisplay;
    v30 = [(SCATModernMenuSheet *)self menu];
    v31 = +[SCATMenuItemFactory menuItemsForItem:v29 menu:v30 delegate:self];
    v32 = [v31 firstObject];
    [v28 addObject:v32];
  }
  v68 = v28;
  [v11 switchControlTopLevelMenuItems];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v33 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v72;
    uint64_t v36 = AXSSwitchControlMenuItemTypeKey;
    uint64_t v37 = AXSSwitchControlMenuItemEnabledKey;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v72 != v35) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        v40 = [v39 objectForKeyedSubscript:v36];
        v41 = [v39 objectForKeyedSubscript:v37];
        unsigned int v42 = [v41 BOOLValue];

        if (v42)
        {
          unsigned int v43 = [(SCATModernMenuActionsSheet *)self _itemBelongsOnShortFirstPage:v40 shouldAddControlCenterActions:v67 shouldIncludeSpotlight:v66];
          v44 = [(SCATModernMenuSheet *)self menu];
          v45 = +[SCATMenuItemFactory menuItemsForItem:v40 menu:v44 delegate:self];
          if (v43) {
            v46 = v68;
          }
          else {
            v46 = v69;
          }
          [v46 axSafelyAddObjectsFromArray:v45];
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    }
    while (v34);
  }
  v47 = +[AXSettings sharedInstance];
  v48 = v69;
  if ([v47 switchControlTapBehavior] == (id)2) {
    goto LABEL_48;
  }
  v49 = [(SCATModernMenuSheet *)self menu];
  v50 = [v49 element];
  if (([v50 scatSupportsAction:2013] | v67) == 1)
  {

LABEL_48:
LABEL_49:
    uint64_t v51 = AXSSwitchControlMenuItemEscape;
    v52 = [(SCATModernMenuSheet *)self menu];
    v53 = +[SCATMenuItemFactory menuItemsForItem:v51 menu:v52 delegate:self];
    [v69 axSafelyAddObjectsFromArray:v53];

    goto LABEL_50;
  }
  v61 = [(SCATModernMenuActionsSheet *)self _escapableElements];
  id v62 = [v61 count];

  if (v62) {
    goto LABEL_49;
  }
LABEL_50:
  if (v63) {
    [(SCATModernMenuActionsSheet *)self _addAdditionalShortcutsIfApplicableForElement:v64 toMenuItems:v68];
  }
  v54 = [(SCATModernMenuSheet *)self menu];
  v55 = [v54 delegate];
  v56 = [(SCATModernMenuSheet *)self menu];
  unsigned int v57 = v63 & ([v55 shouldShowAppWideScrollActionsInMenu:v56] ^ 1);

  if (v57 == 1) {
    [(SCATModernMenuActionsSheet *)self _addScrollShortcutIfApplicableForElement:v64 toMenuItems:v68];
  }
  if (v63 && [v68 count])
  {
    -[SCATModernMenuActionsSheet setStoredNumberOfItemsInFirstPage:](self, "setStoredNumberOfItemsInFirstPage:", [v68 count]);
    if (v69 == v68) {
      _AXAssert();
    }
    [v68 addObjectsFromArray:v69];
    id v58 = v68;

    v48 = v58;
  }
  id v59 = v48;

  return v59;
}

- (BOOL)_itemBelongsOnShortFirstPage:(id)a3 shouldAddControlCenterActions:(BOOL)a4 shouldIncludeSpotlight:(BOOL)a5
{
  id v8 = a3;
  if (qword_1001F0B70 != -1) {
    dispatch_once(&qword_1001F0B70, &stru_1001ADB90);
  }
  if ([v8 isEqualToString:AXSSwitchControlMenuItemEdit])
  {
    id v9 = [(SCATModernMenuSheet *)self menu];
    unsigned int v10 = [v9 element];
    if ([v10 scatIsKeyboardKey])
    {
      a4 = 1;
    }
    else
    {
      BOOL v13 = [(SCATModernMenuSheet *)self menu];
      id v14 = [v13 element];
      uint64_t v15 = [v14 keyboardContainer];
      a4 = v15 != 0;
    }
  }
  else if ([v8 isEqualToString:AXSSwitchControlMenuItemHome])
  {
    if (+[AXSpringBoardServer isAvailable])
    {
      id v11 = +[AXSpringBoardServer server];
      unsigned __int8 v12 = [v11 isScreenLockedWithPasscode:0];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
    a4 = v12 & !a4;
  }
  else if (([v8 isEqualToString:AXSSwitchControlMenuItemEscape] & 1) == 0)
  {
    if ([v8 isEqualToString:AXSSwitchControlMenuItemIncrementDecrement])
    {
      uint64_t v16 = [(SCATModernMenuSheet *)self menu];
      uint64_t v17 = [v16 element];
      unint64_t v18 = (unint64_t)[v17 scatTraits];
      a4 = (kAXAdjustableTrait & ~v18) == 0;
    }
    else
    {
      a4 = a5;
      if (([v8 isEqualToString:AXSSwitchControlMenuItemDeviceSpotlightSearch] & 1) == 0) {
        a4 = [(id)qword_1001F0B68 containsObject:v8];
      }
    }
  }

  return a4;
}

- (int64_t)preferredTipObject
{
  return 2;
}

- (id)_escapableElements
{
  v2 = +[HNDAccessibilityManager sharedManager];
  uint64_t v3 = [v2 elementsForMatchingBlock:&stru_1001ADBB0];

  return v3;
}

- (unint64_t)storedNumberOfItemsInFirstPage
{
  return self->_storedNumberOfItemsInFirstPage;
}

- (void)setStoredNumberOfItemsInFirstPage:(unint64_t)a3
{
  self->_storedNumberOfItemsInFirstPage = a3;
}

@end