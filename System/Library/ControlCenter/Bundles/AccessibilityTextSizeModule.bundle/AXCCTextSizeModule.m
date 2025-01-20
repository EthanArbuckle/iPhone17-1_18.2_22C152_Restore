@interface AXCCTextSizeModule
- (AXCCTextSizeModule)init;
- (CCUIContentModuleContentViewController)contentViewController;
- (CCUIContentModuleContext)contentModuleContext;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
- (void)expandModule;
- (void)moduleDidExpand;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation AXCCTextSizeModule

- (AXCCTextSizeModule)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeModule;
  v2 = [(AXCCTextSizeModule *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXCCTextSizeHelper);
    helper = v2->_helper;
    v2->_helper = v3;
  }
  return v2;
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl() && objc_msgSend_environment(v4, v5, v6, v7) != 1) {
    v8 = AXCCTextSizeSliderModuleViewController;
  }
  else {
    v8 = AXCCTextSizeModuleViewController;
  }
  id v9 = [v8 alloc];
  v11 = (CCUIContentModuleContentViewController *)objc_msgSend_initWithNibName_bundle_(v9, v10, 0, 0);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v11;

  v16 = objc_msgSend_contentModuleContext(self, v13, v14, v15);
  objc_msgSend_setContentModuleContext_(self->_contentViewController, v17, (uint64_t)v16, v18);

  objc_msgSend_setTextSizeDelegate_(self->_contentViewController, v19, (uint64_t)self, v20);
  objc_msgSend_setHelper_(self->_contentViewController, v21, (uint64_t)self->_helper, v22);
  v23 = self->_contentViewController;

  return v23;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl() && objc_msgSend_environment(v4, v5, v6, v7) != 1) {
    v8 = AXCCTextSizeSliderBackgroundViewController;
  }
  else {
    v8 = AXCCTextSizeBackgroundViewController;
  }
  id v9 = [v8 alloc];
  v11 = (AXCCTextSizeBackgroundViewControllerBase *)objc_msgSend_initWithNibName_bundle_(v9, v10, 0, 0);
  bgController = self->_bgController;
  self->_bgController = v11;

  objc_msgSend_setHelper_(self->_bgController, v13, (uint64_t)self->_helper, v14);
  uint64_t v15 = self->_bgController;

  return v15;
}

- (unint64_t)supportedGridSizeClasses
{
  return 3;
}

- (void)expandModule
{
  objc_msgSend_contentModuleContext(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v7, v4, v5, v6);
}

- (void)moduleDidExpand
{
  objc_msgSend_moduleDidExpand(self->_bgController, a2, v2, v3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_bgController, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

@end