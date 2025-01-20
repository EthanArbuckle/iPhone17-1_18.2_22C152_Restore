id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

nint64_t)supportedGridSizeClasses;
- (void)setContentModuleContext:(id)a3;
- (void)setVolumeBackgroundViewController:(id)a3;
- (void)setVolumeViewController:(id)a3;
- (void)volumeBackgroundViewController:(id)a3 didUpdatePrimaryInteractionEnabled:(BOOL)a4;
- (void)volumeBackgroundViewController:(id)a3 didUpdateSecondaryInteractionEnabled:(BOOL)a4;
- (void)volumeViewController:(id)a3 didChangeSystemVolumeValue:(float)a4;
@end

@implementation MediaControlsAudioModule

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isNewControlsEnabled(MEMORY[0x263F54140], v5, v6, v7)) {
    BOOL v11 = objc_msgSend_environment(v4, v8, v9, v10) != 1;
  }
  else {
    BOOL v11 = 0;
  }
  v12 = objc_msgSend_volumeViewController(self, v8, v9, v10);
  objc_msgSend_setPrimaryGlyphShouldBeTinted_(v12, v13, v11, v14);

  v18 = objc_msgSend_volumeViewController(self, v15, v16, v17);

  return v18;
}

- (MRUVolumeViewController)volumeViewController
{
  volumeViewController = self->_volumeViewController;
  if (!volumeViewController)
  {
    id v4 = objc_alloc(MEMORY[0x263F54180]);
    v8 = objc_msgSend_sharedController(MEMORY[0x263F54138], v5, v6, v7);
    BOOL v11 = (MRUVolumeViewController *)objc_msgSend_initWithAudioModuleController_(v4, v9, (uint64_t)v8, v10);
    v12 = self->_volumeViewController;
    self->_volumeViewController = v11;

    objc_msgSend_setDelegate_(self->_volumeViewController, v13, (uint64_t)self, v14);
    volumeViewController = self->_volumeViewController;
  }

  return volumeViewController;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  volumeBackgroundViewController = self->_volumeBackgroundViewController;
  if (!volumeBackgroundViewController)
  {
    id v5 = objc_alloc(MEMORY[0x263F54178]);
    uint64_t v9 = objc_msgSend_sharedController(MEMORY[0x263F54138], v6, v7, v8);
    v12 = (MRUVolumeBackgroundViewController *)objc_msgSend_initWithAudioModuleController_(v5, v10, (uint64_t)v9, v11);
    v13 = self->_volumeBackgroundViewController;
    self->_volumeBackgroundViewController = v12;

    objc_msgSend_setDelegate_(self->_volumeBackgroundViewController, v14, (uint64_t)self, v15);
    volumeBackgroundViewController = self->_volumeBackgroundViewController;
  }

  return volumeBackgroundViewController;
}

- (unint64_t)supportedGridSizeClasses
{
  return 2;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)volumeViewController:(id)a3 didChangeSystemVolumeValue:(float)a4
{
}

- (void)volumeBackgroundViewController:(id)a3 didUpdatePrimaryInteractionEnabled:(BOOL)a4
{
}

- (void)volumeBackgroundViewController:(id)a3 didUpdateSecondaryInteractionEnabled:(BOOL)a4
{
}

- (id)volumeBackgroundViewControllerStylingProvider
{
  return (id)((uint64_t (*)(MRUVolumeViewController *, char *))MEMORY[0x270F9A6D0])(self->_volumeViewController, sel_stylingProvider);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)setVolumeViewController:(id)a3
{
}

- (MRUVolumeBackgroundViewController)volumeBackgroundViewController
{
  return self->_volumeBackgroundViewController;
}

- (void)setVolumeBackgroundViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_volumeViewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end