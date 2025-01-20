@interface TUIKeyboardBrightnessModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (CCUIContentModuleBackgroundViewController)backgroundViewController;
- (CCUIContentModuleContentViewController)contentViewController;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
@end

@implementation TUIKeyboardBrightnessModule

- (id)contentViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(TUIKeyboardBrightnessModuleViewController);
  v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  v10 = objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v14 = objc_msgSend_objectForInfoDictionaryKey_(v10, v11, *MEMORY[0x263EFFA90], v12, v13);
  objc_msgSend_setTitle_(v4, v15, (uint64_t)v14, v16, v17);

  v18 = (void *)MEMORY[0x263F1C6B0];
  v19 = (void *)MEMORY[0x263F086E0];
  uint64_t v20 = objc_opt_class();
  v24 = objc_msgSend_bundleForClass_(v19, v21, v20, v22, v23);
  v27 = objc_msgSend_imageNamed_inBundle_(v18, v25, @"KeyboardBrightness", (uint64_t)v24, v26);
  objc_msgSend_setGlyphImage_(v4, v28, (uint64_t)v27, v29, v30);

  v35 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v31, v32, v33, v34);
  objc_msgSend_setSelectedGlyphColor_(v4, v36, (uint64_t)v35, v37, v38);

  objc_storeStrong((id *)&self->_viewController, v4);

  return v4;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  v4 = objc_alloc_init(TUIKeyboardBrightnessBackgroundViewController);
  objc_storeStrong((id *)&self->_backgroundViewController, v4);

  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return (CCUIContentModuleContentViewController *)self->_viewController;
}

- (CCUIContentModuleBackgroundViewController)backgroundViewController
{
  return (CCUIContentModuleBackgroundViewController *)self->_backgroundViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end