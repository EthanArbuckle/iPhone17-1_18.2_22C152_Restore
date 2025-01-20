@interface CCUIDisplayModule
- (id)_brightnessGlyphPackageDescriptionForContext:(id)a3;
- (id)_brightnessGlyphStateForBrightnessLevel:(double)a3;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
- (void)displayModuleViewController:(id)a3 brightnessDidChange:(float)a4;
@end

@implementation CCUIDisplayModule

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = [CCUIDisplayModuleViewController alloc];
  v7 = (CCUIDisplayModuleViewController *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  moduleViewController = self->_moduleViewController;
  self->_moduleViewController = v7;

  v9 = self->_moduleViewController;
  v11 = objc_msgSend__brightnessGlyphPackageDescriptionForContext_(self, v10, (uint64_t)v4);

  objc_msgSend_setGlyphPackageDescription_(v9, v12, (uint64_t)v11);
  v13 = self->_moduleViewController;
  objc_msgSend_currentBrightness(v13, v14, v15);
  v19 = objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, v17, v18, v16);
  objc_msgSend_setGlyphState_(v13, v20, (uint64_t)v19);

  objc_msgSend_setDelegate_(self->_moduleViewController, v21, (uint64_t)self);
  v22 = self->_moduleViewController;

  return v22;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = [CCUIDisplayBackgroundViewController alloc];
  v7 = (CCUIDisplayBackgroundViewController *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  backgroundViewController = self->_backgroundViewController;
  self->_backgroundViewController = v7;

  v9 = self->_backgroundViewController;
  v11 = objc_msgSend__brightnessGlyphPackageDescriptionForContext_(self, v10, (uint64_t)v4);

  objc_msgSend_setHeaderGlyphPackageDescription_(v9, v12, (uint64_t)v11);
  v13 = self->_backgroundViewController;
  objc_msgSend_currentBrightness(self->_moduleViewController, v14, v15);
  v19 = objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, v17, v18, v16);
  objc_msgSend_setHeaderGlyphState_(v13, v20, (uint64_t)v19);

  v21 = self->_backgroundViewController;

  return v21;
}

- (unint64_t)supportedGridSizeClasses
{
  return 2;
}

- (void)displayModuleViewController:(id)a3 brightnessDidChange:(float)a4
{
  objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, a2, (uint64_t)a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphState_(self->_moduleViewController, v5, (uint64_t)v7);
  objc_msgSend_setHeaderGlyphState_(self->_backgroundViewController, v6, (uint64_t)v7);
}

- (id)_brightnessGlyphPackageDescriptionForContext:(id)a3
{
  v3 = (void *)MEMORY[0x263F33C68];
  id v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  id v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  v9 = objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, @"Brightness", v7);

  return v9;
}

- (id)_brightnessGlyphStateForBrightnessLevel:(double)a3
{
  if (a3 < 0.33) {
    return @"min";
  }
  if (a3 >= 1.0) {
    id v4 = @"max";
  }
  else {
    id v4 = @"full";
  }
  if (a3 >= 0.66) {
    return v4;
  }
  else {
    return @"mid";
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_moduleViewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end