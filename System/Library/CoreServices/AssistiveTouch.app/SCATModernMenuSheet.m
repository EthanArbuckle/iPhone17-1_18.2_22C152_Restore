@interface SCATModernMenuSheet
+ (BOOL)isValidForElement:(id)a3;
- (BOOL)allowsBackAction;
- (BOOL)allowsExitAction;
- (BOOL)areItemsSorted;
- (BOOL)delegatesScannerControl;
- (BOOL)isBackItemIdentifier:(id)a3;
- (BOOL)shouldAllowDwellSelection;
- (BOOL)shouldIncludeBackItem;
- (BOOL)shouldIncludeTextLabels;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (BOOL)shouldUseBackItemAsDoneItem;
- (CGRect)rectToClear;
- (Class)_menuItemClass;
- (NSArray)menuItems;
- (NSArray)menuItemsIfCreated;
- (NSString)description;
- (NSString)springBoardActionHandlerIdentifier;
- (SCATMenu)menu;
- (SCATModernMenuSheet)init;
- (SCATModernMenuSheet)initWithMenu:(id)a3;
- (SCATModernMenuSheetElementProviderDelegate)elementProviderDelegate;
- (SCATStaticElementProvider)elementProvider;
- (id)_filteredMenuItems:(id)a3;
- (id)alternateTipElement;
- (id)backTitle;
- (id)itemWithIdentifier:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (id)menuItemStruts;
- (int64_t)preferredTipObject;
- (unint64_t)numberOfItemsInFirstPage;
- (unint64_t)presentationMode;
- (void)_insertObjectsOnSameRow:(id)a3 intoArray:(id)a4 itemsPerRow:(unint64_t)a5;
- (void)_listenForMuteSwitchChangeIfNecessaryForItems:(id)a3;
- (void)dealloc;
- (void)didFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)invalidateMenuItems;
- (void)menuItemWasActivated:(id)a3;
- (void)reload;
- (void)setAreItemsSorted:(BOOL)a3;
- (void)setElementProviderDelegate:(id)a3;
- (void)setMenu:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setShouldIncludeBackItem:(BOOL)a3;
- (void)setSpringBoardActionHandlerIdentifier:(id)a3;
- (void)sortMenuItemsForNumberOfItemsPerRow:(unint64_t)a3;
@end

@implementation SCATModernMenuSheet

+ (BOOL)isValidForElement:(id)a3
{
  return 1;
}

- (SCATModernMenuSheet)init
{
  return 0;
}

- (SCATModernMenuSheet)initWithMenu:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCATModernMenuSheet;
  v5 = [(SCATModernMenuSheet *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SCATModernMenuSheet *)v5 setMenu:v4];
  }

  return v6;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(SCATModernMenuSheet *)self menuItems];
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  v7 = +[NSString stringWithFormat:@"%@<%p> items:%@", v4, self, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  if (+[AXSpringBoardServer isAvailable])
  {
    v3 = +[AXSpringBoardServer server];
    id v4 = [(SCATModernMenuSheet *)self springBoardActionHandlerIdentifier];
    [v3 removeActionHandler:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)SCATModernMenuSheet;
  [(SCATModernMenuSheet *)&v5 dealloc];
}

- (SCATStaticElementProvider)elementProvider
{
  v2 = [(SCATModernMenuSheet *)self elementProviderDelegate];
  v3 = [v2 elementProvider];

  return (SCATStaticElementProvider *)v3;
}

- (Class)_menuItemClass
{
  return (Class)objc_opt_class();
}

- (NSArray)menuItems
{
  menuItems = self->_menuItems;
  if (!menuItems)
  {
    id v4 = +[NSMutableArray array];
    if ([(SCATModernMenuSheet *)self shouldIncludeBackItem])
    {
      objc_super v5 = [(SCATModernMenuSheet *)self backTitle];
      unsigned int v6 = [(SCATModernMenuSheet *)self shouldUseBackItemAsDoneItem];
      if (v6) {
        CFStringRef v7 = @"SCATIcon_general_exit";
      }
      else {
        CFStringRef v7 = @"SCATIcon_general_back";
      }
      uint64_t v8 = v6 ^ 1;
      LOBYTE(v23) = 1;
      v9 = [(objc_class *)[(SCATModernMenuSheet *)self _menuItemClass] itemWithIdentifier:@"private_back" delegate:self title:v5 imageName:v7 activateBehavior:2 allowedWithGuidedAccess:1 allowedWithAssistiveAccess:v23];
      [v9 setShouldFlipForRTL:v8];
      [(NSArray *)v4 addObject:v9];
    }
    v10 = [(SCATModernMenuSheet *)self makeMenuItemsIfNeeded];
    v11 = [(SCATModernMenuSheet *)self _filteredMenuItems:v10];

    [(SCATModernMenuSheet *)self _listenForMuteSwitchChangeIfNecessaryForItems:v11];
    [(NSArray *)v4 addObjectsFromArray:v11];
    if (![(NSArray *)v4 count])
    {
      v12 = [(SCATModernMenuSheet *)self _menuItemClass];
      v13 = sub_100040EC8(@"NO_ITEMS");
      v14 = [(objc_class *)v12 itemWithIdentifier:@"private_empty" delegate:self title:v13 imageName:0 activateBehavior:2];

      +[SCATModernMenuItem imageSize];
      double v16 = round(v15 * 44.0 / 60.0);
      v17 = +[UIImage systemImageNamed:@"exclamationmark.circle"];
      v18 = +[UIFont systemFontOfSize:v16];
      v19 = +[UIImageSymbolConfiguration configurationWithFont:v18];
      v20 = [v17 imageWithConfiguration:v19];
      [v14 setImage:v20];

      [v14 setDisabled:1];
      [(NSArray *)v4 addObject:v14];
    }
    v21 = self->_menuItems;
    self->_menuItems = v4;

    menuItems = self->_menuItems;
  }

  return menuItems;
}

- (NSArray)menuItemsIfCreated
{
  return self->_menuItems;
}

- (void)_listenForMuteSwitchChangeIfNecessaryForItems:(id)a3
{
  id v4 = a3;
  if (+[AXSpringBoardServer isAvailable])
  {
    objc_super v5 = [v4 axFilterObjectsUsingBlock:&stru_1001AE5C0];
    unsigned int v6 = [v5 firstObject];

    CFStringRef v7 = +[AXSpringBoardServer server];
    uint64_t v8 = [(SCATModernMenuSheet *)self springBoardActionHandlerIdentifier];
    [v7 removeActionHandler:v8];

    if (v6)
    {
      objc_initWeak(&location, self);
      v9 = +[AXSpringBoardServer server];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000D0084;
      v12[3] = &unk_1001ABDA0;
      id v13 = v6;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000D0098;
      v10[3] = &unk_1001AE5E8;
      objc_copyWeak(&v11, &location);
      [v9 registerSpringBoardActionHandler:v12 withIdentifierCallback:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)sortMenuItemsForNumberOfItemsPerRow:(unint64_t)a3
{
  if (![(SCATModernMenuSheet *)self areItemsSorted])
  {
    objc_super v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    unsigned int v6 = [(SCATModernMenuSheet *)self menuItems];
    id v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(SCATModernMenuSheet *)self menuItems];
        v10 = [v9 objectAtIndex:v8];

        id v11 = [v10 menuItemGroupName];

        if (v11)
        {
          v12 = [(SCATModernMenuSheet *)self menuItems];
          unint64_t v13 = v8 + 1;
          v14 = [v12 axSafeObjectAtIndex:v8 + 1];

          double v15 = [v10 menuItemGroupName];
          double v16 = [v14 menuItemGroupName];
          unsigned int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            v18 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 2, v10, v14);
            [(SCATModernMenuSheet *)self _insertObjectsOnSameRow:v18 intoArray:v5 itemsPerRow:a3];

            unint64_t v8 = v13;
          }
          else
          {
            [(NSArray *)v5 addObject:v10];
          }
        }
        else
        {
          [(NSArray *)v5 addObject:v10];
        }

        ++v8;
        v19 = [(SCATModernMenuSheet *)self menuItems];
        id v20 = [v19 count];
      }
      while (v8 < (unint64_t)v20);
    }
    menuItems = self->_menuItems;
    self->_menuItems = v5;
  }
}

- (void)_insertObjectsOnSameRow:(id)a3 intoArray:(id)a4 itemsPerRow:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 count];
  unint64_t v11 = [(SCATModernMenuSheet *)self numberOfItemsInFirstPage];
  unint64_t v12 = (unint64_t)v10;
  if ((unint64_t)v10 >= v11) {
    unint64_t v12 = v10 - (unsigned char *)[(SCATModernMenuSheet *)self numberOfItemsInFirstPage];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v13 = v12 % a5 == a5 - 1;
  *((void *)&v20 + 1) = 0;
  long long v21 = 0u;
  v14 = objc_msgSend(v8, "reverseObjectEnumerator", 0);
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    id v16 = v15;
    unsigned int v17 = &v10[-v13];
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v14);
        }
        [v9 insertObject:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) atIndex:v17];
        v19 = (char *)v19 + 1;
      }
      while (v16 != v19);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }
}

- (id)itemWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(SCATModernMenuSheet *)self menuItems];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)invalidateMenuItems
{
  [(SCATModernMenuSheet *)self setMenuItems:0];

  [(SCATModernMenuSheet *)self setAreItemsSorted:0];
}

- (unint64_t)numberOfItemsInFirstPage
{
  return 0;
}

- (BOOL)isBackItemIdentifier:(id)a3
{
  return [a3 isEqualToString:@"private_back"];
}

- (void)reload
{
  [(SCATModernMenuSheet *)self invalidateMenuItems];
  id v4 = [(SCATModernMenuSheet *)self menu];
  v3 = [v4 menuVisualProvider];
  [v3 didReloadSheet:self];
}

- (id)_filteredMenuItems:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (AXAssistiveAccessEnabled())
  {
    objc_super v5 = +[NSPredicate predicateWithBlock:&stru_1001AE628];
    id v4 = [v3 filteredArrayUsingPredicate:v5];
  }
  id v6 = +[AXBackBoardServer server];
  unsigned int v7 = [v6 isGuidedAccessActive];

  if (v7)
  {
    id v8 = +[NSPredicate predicateWithBlock:&stru_1001AE648];
    uint64_t v9 = [v4 filteredArrayUsingPredicate:v8];

    id v4 = (void *)v9;
  }

  return v4;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"private_back"];

  if (v6)
  {
    unsigned int v7 = [(SCATModernMenuSheet *)self shouldUseBackItemAsDoneItem];
    id v8 = [(SCATModernMenuSheet *)self menu];
    uint64_t v9 = v8;
    if (v7)
    {
      [v8 hideWithCompletion:0];
LABEL_10:

      goto LABEL_11;
    }
    int v11 = [v8 popSheet];

    if ((v11 & 1) == 0)
    {
      uint64_t v9 = SWCHLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100115A20((uint64_t)self, (uint64_t)v4, v9);
      }
      goto LABEL_10;
    }
  }
  else
  {
    v10 = SWCHLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Nobody handled this menu item activated: %@", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_11:
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  return 0;
}

- (SCATModernMenuSheetElementProviderDelegate)elementProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementProviderDelegate);

  return (SCATModernMenuSheetElementProviderDelegate *)WeakRetained;
}

- (void)setElementProviderDelegate:(id)a3
{
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (BOOL)shouldIncludeBackItem
{
  return self->_shouldIncludeBackItem;
}

- (void)setShouldIncludeBackItem:(BOOL)a3
{
  self->_shouldIncludeBackItem = a3;
}

- (void)setMenuItems:(id)a3
{
}

- (BOOL)areItemsSorted
{
  return self->_areItemsSorted;
}

- (void)setAreItemsSorted:(BOOL)a3
{
  self->_areItemsSorted = a3;
}

- (NSString)springBoardActionHandlerIdentifier
{
  return self->_springBoardActionHandlerIdentifier;
}

- (void)setSpringBoardActionHandlerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springBoardActionHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menu, 0);

  objc_destroyWeak((id *)&self->_elementProviderDelegate);
}

- (void)didFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 element];
  unsigned int v7 = +[AXSettings sharedInstance];
  id v8 = [v7 switchControlScanningStyle];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 menuItem];
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    BOOL v10 = [v5 selectBehavior] == 4;
  }
  uint64_t v11 = [v5 parentGroup];
  v51 = v6;
  id v52 = v5;
  if (!v11) {
    goto LABEL_27;
  }
  int v12 = (void *)v11;
  id v13 = [(SCATModernMenuSheet *)self menu];
  uint64_t v14 = [v13 exitActionElement];
  if (v6 == (void *)v14)
  {

LABEL_27:
    if ([v6 isGroup]) {
      id v20 = v6;
    }
    else {
      id v20 = 0;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v33 = [(SCATModernMenuSheet *)self menuItems];
    id v34 = [v33 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (!v34) {
      goto LABEL_53;
    }
    id v35 = v34;
    uint64_t v36 = *(void *)v60;
    BOOL v37 = v8 == (id)2 && v10;
    BOOL v54 = v37;
LABEL_35:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v60 != v36) {
        objc_enumerationMutation(v33);
      }
      v39 = *(void **)(*((void *)&v59 + 1) + 8 * v38);
      if (![v39 isDisabled])
      {
        if (v39 == v9)
        {
          v40 = v9;
          uint64_t v41 = 2;
          goto LABEL_51;
        }
        if (v9)
        {
          v42 = [v9 scatElement];
          v43 = [v42 parentGroup];
          if (v43)
          {
          }
          else
          {
            v44 = [v39 scatElement];
            v45 = [v44 parentGroup];

            if (!v45) {
              goto LABEL_49;
            }
          }
        }
        if (v20)
        {
          v46 = [v39 scatElement];
          v47 = [v46 parentGroup];
          unsigned int v48 = [v47 isEqual:v20];

          if (v48)
          {
            if (!v54)
            {
              v40 = v39;
              uint64_t v41 = 0;
              goto LABEL_51;
            }
LABEL_49:
            v40 = v39;
            uint64_t v41 = 4;
            goto LABEL_51;
          }
        }
      }
      v40 = v39;
      uint64_t v41 = 3;
LABEL_51:
      [v40 setStyle:v41];
      if (v35 == (id)++v38)
      {
        id v35 = [v33 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (!v35)
        {
LABEL_53:

          id v5 = v52;
          goto LABEL_54;
        }
        goto LABEL_35;
      }
    }
  }
  long long v15 = (void *)v14;
  [(SCATModernMenuSheet *)self menu];
  BOOL v53 = v10;
  long long v16 = self;
  v18 = id v17 = v8;
  v19 = [v18 menuVisualProvider];
  unsigned int v50 = [v19 isElementTopLevelInMenu:v6];

  id v8 = v17;
  self = v16;
  BOOL v10 = v53;

  if (v50) {
    goto LABEL_27;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v20 = [(SCATModernMenuSheet *)self menuItems];
  id v21 = [v20 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v56;
    while (1)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (!v9)
        {
          id v49 = v5;
          _AXAssert();
        }
        if (objc_msgSend(v25, "isDisabled", v49))
        {
          v26 = v25;
          uint64_t v27 = 3;
LABEL_20:
          [v26 setStyle:v27];
          continue;
        }
        v26 = v9;
        if (v25 == v9)
        {
          uint64_t v27 = 2;
          goto LABEL_20;
        }
        v28 = [v9 scatElement];
        v29 = [v28 parentGroup];
        v30 = [v25 scatElement];
        v31 = [v30 parentGroup];

        if (v29 == v31) {
          uint64_t v32 = 4;
        }
        else {
          uint64_t v32 = 3;
        }
        [v25 setStyle:v32];
        id v5 = v52;
      }
      id v22 = [v20 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (!v22)
      {
LABEL_54:
        unsigned int v6 = v51;
        break;
      }
    }
  }
}

- (BOOL)allowsBackAction
{
  return 1;
}

- (BOOL)allowsExitAction
{
  return 1;
}

- (CGRect)rectToClear
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)makeMenuItemsIfNeeded
{
  return 0;
}

- (BOOL)shouldKeepScannerAwake
{
  return 0;
}

- (BOOL)shouldAllowDwellSelection
{
  return 1;
}

- (unint64_t)presentationMode
{
  return 0;
}

- (BOOL)delegatesScannerControl
{
  return 0;
}

- (BOOL)shouldUseBackItemAsDoneItem
{
  return 0;
}

- (id)backTitle
{
  if ([(SCATModernMenuSheet *)self shouldUseBackItemAsDoneItem]) {
    v2 = @"EXIT";
  }
  else {
    v2 = @"BACK";
  }
  id v3 = sub_100040EC8(v2);

  return v3;
}

- (BOOL)shouldIncludeTextLabels
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScannerMenuLabelsEnabled];

  return v3;
}

- (int64_t)preferredTipObject
{
  return 0;
}

- (id)alternateTipElement
{
  return 0;
}

- (id)menuItemStruts
{
  return 0;
}

@end