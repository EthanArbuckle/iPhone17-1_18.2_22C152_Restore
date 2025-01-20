@interface BCSDataDetectorsSupportedAction
- (BCSDataDetectorsSupportedAction)initWithData:(id)a3 codePayload:(id)a4;
- (BOOL)preferItemsInSubmenu;
- (CNContact)contact;
- (DDScannerResult)scannerResult;
- (NSString)icsString;
- (id)_actionStringsArray;
- (id)_hostingViewForAction;
- (id)actionIcon;
- (id)actionIconSystemImageName;
- (id)actionPickerItems;
- (id)contentPreviewString;
- (id)debugDescriptionExtraInfoDictionary;
- (id)defaultActionTargetApplicationBundleIdentifier;
- (id)localizedActionDescription;
- (id)localizedDefaultActionDescription;
- (id)menuElements;
- (id)shortDescription;
- (id)url;
- (unint64_t)menuElementsCount;
- (void)_hostingViewForAction;
- (void)_performActionAndShowActionPickerIfNeeded:(BOOL)a3;
- (void)_setUpActionMenuIfNeeded;
- (void)determineActionabilityWithCompletionHandler:(id)a3;
- (void)performAction;
- (void)performDefaultAction;
@end

@implementation BCSDataDetectorsSupportedAction

- (BCSDataDetectorsSupportedAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_8;
        }
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSDataDetectorsSupportedAction;
  v8 = [(BCSAction *)&v11 initWithData:v6 codePayload:v7];
  if (!v8)
  {
    self = 0;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  self = v8;
  v9 = self;
LABEL_9:

  return v9;
}

- (id)url
{
  v3 = [(BCSAction *)self data];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(BCSAction *)self data];
  id v6 = v5;
  if (isKindOfClass)
  {
    uint64_t v7 = [v5 url];
LABEL_5:
    objc_super v11 = (void *)v7;

    goto LABEL_7;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if (v8)
  {
    id v6 = [(BCSAction *)self data];
    v9 = [v6 scannerResult];
    uint64_t v10 = [v9 coreResult];

    uint64_t v7 = _bcs_urlFromDDResult(v10);
    goto LABEL_5;
  }
  objc_super v11 = 0;
LABEL_7:
  return v11;
}

- (id)localizedActionDescription
{
  if ([(NSArray *)self->_actions count] < 2) {
    [(BCSDataDetectorsSupportedAction *)self localizedDefaultActionDescription];
  }
  else {
  v3 = _BCSLocalizedString(@"Choose Action", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }
  return v3;
}

- (id)localizedDefaultActionDescription
{
  if ([(NSArray *)self->_actions count])
  {
    v3 = [(NSArray *)self->_actions firstObject];
    v4 = [v3 notificationTitle];
  }
  else
  {
    v4 = &stru_26D608FC8;
  }
  return v4;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  v2 = [(NSArray *)self->_actions firstObject];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 notificationIconBundleIdentifier];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)actionPickerItems
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_actions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [BCSDataDetectionActionPickerItem alloc];
        objc_super v11 = -[BCSDataDetectionActionPickerItem initWithAction:ddAction:](v10, "initWithAction:ddAction:", self, v9, (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)performDefaultAction
{
}

- (void)performAction
{
}

- (void)_performActionAndShowActionPickerIfNeeded:(BOOL)a3
{
  uint64_t v5 = [(BCSAction *)self delegate];
  if (a3 || !self->_defaultDDAction)
  {
    NSUInteger v6 = [(NSArray *)self->_actions count];
    if (v6)
    {
      NSUInteger v7 = v6;
      if (objc_opt_respondsToSelector())
      {
        char v8 = [v5 presentingViewControllerForAction:self];
        if (v8)
        {
          if (v7 == 1 || !a3)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSDataDetectorsSupportedAction: performing default DDAction", v29, 2u);
            }
            v25 = [getDDDetectionControllerClass() sharedController];
            v26 = [(NSArray *)self->_actions firstObject];
            v27 = [v8 view];
            [v25 performAction:v26 inView:v27 interactionDelegate:0];

            v28 = +[BCSAWDLogger sharedLogger];
            [v28 logBarcodeActivatedEventForAction:self];
          }
          else
          {
            [(BCSAction *)self showActionPicker];
          }
        }
        else
        {
          BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v17) {
            -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:](v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
      }
      else
      {
        BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v9) {
          -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:](v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSDataDetectorsSupportedAction: perform the default DD action.", buf, 2u);
    }
    if _bcs_deviceIsPad() && (objc_opt_respondsToSelector())
    {
      [v5 sourceRectForPopoverActionPicker:self];
      -[DDUIAction dd_performActionWithRect:](self->_defaultDDAction, "dd_performActionWithRect:");
    }
    else
    {
      [(DDUIAction *)self->_defaultDDAction dd_performAction];
    }
  }
}

- (id)debugDescriptionExtraInfoDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(BCSDataDetectorsSupportedAction *)self url];
  uint64_t v5 = [v4 absoluteString];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"url"];
  }
  NSUInteger v6 = [(BCSAction *)self data];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v8 = [(BCSAction *)self data];
    BOOL v9 = [v8 scannerResult];

    uint64_t v10 = _bcs_addressDictionaryFromScannerResult(v9);
    if (v10) {
      [v3 setObject:v10 forKeyedSubscript:@"address"];
    }
  }
  uint64_t v11 = [(BCSDataDetectorsSupportedAction *)self _actionStringsArray];
  [v3 setObject:v11 forKeyedSubscript:@"actions"];

  return v3;
}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, BOOL))a3;
  uint64_t v5 = [(BCSAction *)self data];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  NSUInteger v7 = [(BCSAction *)self data];
  char v8 = v7;
  if (isKindOfClass)
  {
    BOOL v9 = [v7 scannerResult];
    scannerResult = self->_scannerResult;
    self->_scannerResult = v9;

    uint64_t v11 = [(DDScannerResult *)self->_scannerResult coreResult];
    uint64_t v12 = 0;
LABEL_9:
    char v22 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  uint64_t v14 = [(BCSAction *)self data];
  uint64_t v15 = v14;
  if (v13)
  {
    uint64_t v16 = [v14 icsString];
    icsString = self->_icsString;
    self->_icsString = v16;

    uint64_t v12 = 0;
LABEL_8:
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    uint64_t v12 = [(BCSDataDetectorsSupportedAction *)self url];
    goto LABEL_8;
  }
  uint64_t v19 = [(BCSAction *)self data];
  uint64_t v20 = [v19 contact];
  contact = self->_contact;
  self->_contact = v20;

  uint64_t v12 = 0;
  char v22 = 0;
  uint64_t v11 = 0;
LABEL_10:
  uint64_t v23 = [getDDDetectionControllerClass() sharedController];
  uint64_t v24 = [v23 barcodeActionsForContext:0 URL:v12 result:v11 contact:self->_contact ics:self->_icsString];
  actions = self->_actions;
  self->_actions = v24;

  NSUInteger v26 = [(NSArray *)self->_actions count];
  if ((v22 & 1) == 0 && v26 >= 2)
  {
    v27 = [(NSArray *)self->_actions firstObject];
    v30[0] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    v29 = self->_actions;
    self->_actions = v28;
  }
  v4[2](v4, [(NSArray *)self->_actions count] != 0);
}

- (id)_actionStringsArray
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_actions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "localizedName", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)actionIcon
{
  [(BCSDataDetectorsSupportedAction *)self _setUpActionMenuIfNeeded];
  if (self->_contact)
  {
    id UIImageClass = getUIImageClass();
    v4 = @"person.crop.circle.fill";
LABEL_5:
    uint64_t v5 = [UIImageClass systemImageNamed:v4];
LABEL_6:
    uint64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  if (self->_icsString)
  {
    id UIImageClass = getUIImageClass();
    v4 = @"calendar";
    goto LABEL_5;
  }
  defaultDDAction = self->_defaultDDAction;
  if (defaultDDAction)
  {
    uint64_t v5 = [(DDUIAction *)defaultDDAction image];
    goto LABEL_6;
  }
  BOOL v9 = [(NSArray *)self->_actions firstObject];

  if (!v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)BCSDataDetectorsSupportedAction;
    uint64_t v5 = [(BCSAction *)&v11 actionIcon];
    goto LABEL_6;
  }
  uint64_t v10 = [(NSArray *)self->_actions firstObject];
  uint64_t v6 = [v10 icon];

LABEL_7:
  return v6;
}

- (id)actionIconSystemImageName
{
  [(BCSDataDetectorsSupportedAction *)self _setUpActionMenuIfNeeded];
  if (self->_contact)
  {
    v3 = 0;
    v4 = @"person.crop.circle.fill";
  }
  else if (self->_icsString)
  {
    v3 = 0;
    v4 = @"calendar";
  }
  else
  {
    defaultDDAction = self->_defaultDDAction;
    if (defaultDDAction) {
      [(DDUIAction *)defaultDDAction dd_action];
    }
    else {
    v3 = [(NSArray *)self->_actions firstObject];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(DDUIAction *)self->_defaultDDAction dd_action];
      v4 = [v6 variantIconName];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)shortDescription
{
  [(BCSDataDetectorsSupportedAction *)self _setUpActionMenuIfNeeded];
  defaultDDAction = self->_defaultDDAction;
  if (defaultDDAction)
  {
    uint64_t v4 = [(DDUIAction *)defaultDDAction title];
LABEL_3:
    uint64_t v5 = (void *)v4;
    goto LABEL_6;
  }
  uint64_t v6 = [(NSArray *)self->_actions firstObject];

  if (!v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)BCSDataDetectorsSupportedAction;
    uint64_t v4 = [(BCSAction *)&v9 shortDescription];
    goto LABEL_3;
  }
  uint64_t v7 = [(NSArray *)self->_actions firstObject];
  uint64_t v5 = [v7 compactTitle];

LABEL_6:
  return v5;
}

- (id)_hostingViewForAction
{
  v3 = [(BCSAction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 presentingViewControllerForAction:self];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 view];
    }
    else
    {
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v15) {
        [(BCSDataDetectorsSupportedAction *)v15 _hostingViewForAction];
      }
      uint64_t v6 = 0;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      [(BCSDataDetectorsSupportedAction *)v7 _hostingViewForAction];
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_setUpActionMenuIfNeeded
{
}

double __59__BCSDataDetectorsSupportedAction__setUpActionMenuIfNeeded__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (BOOL)preferItemsInSubmenu
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(BCSAction *)self detectedCode];

  if (v3)
  {
    if (_bcs_isCurrentProcessSafari())
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v4 = [self->_ddUIMenu children];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
            char v10 = [v9 hasPrefix:@"com.apple.datadetectors.DDShareAction"];

            if (v10)
            {
              LOBYTE(v3) = 1;
              goto LABEL_14;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v3) = 0;
LABEL_14:
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)menuElements
{
  v8[1] = *MEMORY[0x263EF8340];
  if (self->_ddUIMenu)
  {
    BOOL v3 = [(BCSDataDetectorsSupportedAction *)self preferItemsInSubmenu];
    uint64_t v4 = [self->_ddUIMenu children];
    if (v3)
    {
      uint64_t v5 = [(BCSAction *)self subMenuWithMenuItems:v4];

      v8[0] = v5;
      uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCSDataDetectorsSupportedAction;
    uint64_t v4 = [(BCSAction *)&v7 menuElements];
  }
  return v4;
}

- (unint64_t)menuElementsCount
{
  [(BCSDataDetectorsSupportedAction *)self _setUpActionMenuIfNeeded];
  ddUIMenu = self->_ddUIMenu;
  if (ddUIMenu)
  {
    uint64_t v4 = [ddUIMenu children];
    unint64_t v5 = [v4 count];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCSDataDetectorsSupportedAction;
    return [(BCSAction *)&v7 menuElementsCount];
  }
}

- (id)contentPreviewString
{
  [(BCSDataDetectorsSupportedAction *)self _setUpActionMenuIfNeeded];
  ddUIMenu = self->_ddUIMenu;
  if (ddUIMenu)
  {
    uint64_t v4 = [ddUIMenu title];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BCSDataDetectorsSupportedAction;
    uint64_t v4 = [(BCSAction *)&v6 contentPreviewString];
  }
  return v4;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)icsString
{
  return self->_icsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icsString, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_defaultDDAction, 0);
  objc_storeStrong((id *)&self->_ddUIMenu, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)_performActionAndShowActionPickerIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_223007000, &_os_log_internal, a3, "BCSDataDetectorsSupportedAction: -[BCSAction presentingViewControllerForAction:] must return non-nil view controller to perform action.", a5, a6, a7, a8, 0);
}

- (void)_performActionAndShowActionPickerIfNeeded:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_hostingViewForAction
{
}

@end