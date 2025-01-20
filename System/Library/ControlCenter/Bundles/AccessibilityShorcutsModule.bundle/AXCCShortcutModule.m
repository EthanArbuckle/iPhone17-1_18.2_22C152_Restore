@interface AXCCShortcutModule
- (AXCCShortcutModule)init;
- (AXCCShortcutModuleViewController)contentViewController;
- (BOOL)isSelected;
- (CCUIContentModuleContext)contentModuleContext;
- (id)glyphState;
- (void)expandModule;
- (void)openAccessibilityShortcutSettings;
- (void)optionToggled;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation AXCCShortcutModule

- (AXCCShortcutModule)init
{
  v39.receiver = self;
  v39.super_class = (Class)AXCCShortcutModule;
  v2 = [(AXCCShortcutModule *)&v39 init];
  if (v2)
  {
    v3 = [AXCCShortcutModuleViewController alloc];
    uint64_t v5 = objc_msgSend_initWithNibName_bundle_(v3, v4, 0, 0);
    contentViewController = v2->_contentViewController;
    v2->_contentViewController = (AXCCShortcutModuleViewController *)v5;

    objc_msgSend_setShortcutDelegate_(v2->_contentViewController, v7, (uint64_t)v2);
    objc_msgSend_setModule_(v2->_contentViewController, v8, (uint64_t)v2);
    v9 = v2->_contentViewController;
    v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = (void *)MEMORY[0x263F086E0];
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_bundleForClass_(v11, v13, v12);
    v16 = objc_msgSend_imageNamed_inBundle_(v10, v15, @"AccessibilityIcon", v14);
    objc_msgSend_setGlyphImage_(v9, v17, (uint64_t)v16);

    v18 = v2->_contentViewController;
    v19 = (void *)MEMORY[0x263F1C6B0];
    v20 = (void *)MEMORY[0x263F086E0];
    uint64_t v21 = objc_opt_class();
    v23 = objc_msgSend_bundleForClass_(v20, v22, v21);
    v25 = objc_msgSend_imageNamed_inBundle_(v19, v24, @"AccessibilityIcon", v23);
    objc_msgSend_setSelectedGlyphImage_(v18, v26, (uint64_t)v25);

    v27 = v2->_contentViewController;
    v30 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v28, v29);
    objc_msgSend_setSelectedGlyphColor_(v27, v31, (uint64_t)v30);

    if ((objc_msgSend_isExpanded(v2->_contentViewController, v32, v33) & 1) == 0)
    {
      uint64_t isSelected = objc_msgSend_isSelected(v2, v34, v35);
      objc_msgSend_setSelected_(v2->_contentViewController, v37, isSelected);
    }
  }
  return v2;
}

- (id)glyphState
{
  if (objc_msgSend_appearsSelected(self, a2, v2)) {
    return @"enabled";
  }
  else {
    return @"disabled";
  }
}

- (void)optionToggled
{
  if ((objc_msgSend_isExpanded(self->_contentViewController, a2, v2) & 1) == 0)
  {
    uint64_t isSelected = objc_msgSend_isSelected(self, v4, v5);
    contentViewController = self->_contentViewController;
    objc_msgSend_setSelected_(contentViewController, v6, isSelected);
  }
}

- (void)openAccessibilityShortcutSettings
{
  objc_msgSend_URLWithString_(NSURL, a2, @"prefs:root=ACCESSIBILITY&path=TRIPLE_CLICK_TITLE");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_contentModuleContext(self, v3, v4);
  objc_msgSend_openURL_completionHandler_(v5, v6, (uint64_t)v7, 0);
}

- (void)expandModule
{
  uint64_t v4 = objc_msgSend_visibleShortcuts(self->_contentViewController, a2, v2);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7 == 1)
  {
    v10 = objc_msgSend_visibleShortcuts(self->_contentViewController, v8, v9);
    v13 = objc_msgSend_firstObject(v10, v11, v12);
    uint64_t v16 = objc_msgSend_intValue(v13, v14, v15);

    LODWORD(v10) = objc_msgSend_valueForTripleClickOption_(MEMORY[0x263F229B8], v17, v16);
    uint64_t v18 = v10 ^ 1;
    uint64_t v21 = objc_msgSend_contentModuleContext(self, v19, v20);
    v22 = (void *)MEMORY[0x263F33CD8];
    v25 = objc_msgSend_titleForTripleClickOption_(MEMORY[0x263F229B8], v23, v16);
    if (v10) {
      objc_msgSend_statusUpdateWithMessage_type_(v22, v24, (uint64_t)v25, 2);
    }
    else {
    v26 = objc_msgSend_statusUpdateWithMessage_type_(v22, v24, (uint64_t)v25, 1);
    }
    objc_msgSend_enqueueStatusUpdate_(v21, v27, (uint64_t)v26);

    objc_msgSend_setSelected_(self->_contentViewController, v28, v18);
    v30 = (void *)MEMORY[0x263F229B8];
    objc_msgSend_toggleTripleClickOption_(v30, v29, v16);
  }
  else
  {
    objc_msgSend_contentModuleContext(self, v8, v9);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestExpandModule(v33, v31, v32);
  }
}

- (BOOL)isSelected
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend_visibleShortcuts(self->_contentViewController, a2, v2, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, v18, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = (void *)MEMORY[0x263F229B8];
        uint64_t v11 = objc_msgSend_intValue(*(void **)(*((void *)&v14 + 1) + 8 * i), v5, v6);
        if (objc_msgSend_valueForTripleClickOption_(v10, v12, v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v14, v18, 16);
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (AXCCShortcutModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end