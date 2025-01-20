@interface MRUMirroringViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isConnectedToExternalDisplay;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)showMoreExpanded;
- (FBSDisplayMonitor)displayMonitor;
- (MRUMirroringController)controller;
- (id)leadingImageForMenuItem:(id)a3;
- (void)mirroringController:(id)a3 didChangeOutputDevice:(id)a4;
- (void)mirroringController:(id)a3 didUpdateBusyIdenifiers:(id)a4;
- (void)selectOutputDevice:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setController:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setShowMoreExpanded:(BOOL)a3;
- (void)stopMirroringDismissOnComplete:(BOOL)a3;
- (void)updateFooter;
- (void)updateGlyphPackageDescription;
- (void)updateItems;
- (void)updateState;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation MRUMirroringViewController

- (void)viewDidLoad
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)MRUMirroringViewController;
  [(CCUIMenuModuleViewController *)&v11 viewDidLoad];
  [(MRUMirroringViewController *)self updateGlyphPackageDescription];
  v3 = self;
  v12[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v5 = (id)[(MRUMirroringViewController *)self registerForTraitChanges:v4 withAction:sel_updateGlyphPackageDescription];

  v6 = [MEMORY[0x263F54168] screenMirroring];
  [(CCUIMenuModuleViewController *)self setTitle:v6];

  [(CCUIMenuModuleViewController *)self setMinimumMenuItems:4];
  [(CCUIMenuModuleViewController *)self setVisibleMenuItems:0.0];
  [(CCUIMenuModuleViewController *)self setIndentation:2];
  [(CCUIMenuModuleViewController *)self setUseTrailingCheckmarkLayout:1];
  v7 = (MRUMirroringController *)objc_alloc_init(MEMORY[0x263F54150]);
  controller = self->_controller;
  self->_controller = v7;

  v9 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x263F3F750]);
  displayMonitor = self->_displayMonitor;
  self->_displayMonitor = v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMirroringViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(MRUMirroringViewController *)self setShowMoreExpanded:0];
  [(MRUMirroringViewController *)self updateState];
  [(MRUMirroringController *)self->_controller setDelegate:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUMirroringViewController;
  [(CCUIMenuModuleViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(CCUIButtonModuleViewController *)self buttonView];
  [v4 setGlyphState:@"off"];

  [(MRUMirroringController *)self->_controller setDelegate:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMirroringViewController;
  [(CCUIButtonModuleViewController *)&v4 setContentRenderingMode:a3];
  [(MRUMirroringViewController *)self updateState];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUMirroringViewController;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v7, sel_willTransitionToExpandedContentMode_);
  [(MRUMirroringViewController *)self updateState];
  controller = self->_controller;
  if (v3)
  {
    [(MRUMirroringController *)controller startDetailedDiscovery];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_240620F14;
    v6[3] = &unk_2650C8A98;
    v6[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v6];
  }
  else
  {
    [(MRUMirroringController *)controller stopDetailedDiscovery];
    [(CCUIMenuModuleViewController *)self setBusy:0];
  }
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:3 scale:17.0];
    objc_super v5 = (void *)MEMORY[0x263F1C6B0];
    v6 = [v3 symbolName];
    objc_super v7 = [v5 _systemImageNamed:v6];

    v8 = [v7 imageWithConfiguration:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)mirroringController:(id)a3 didChangeOutputDevice:(id)a4
{
  [(MRUMirroringViewController *)self updateState];
  [(MRUMirroringViewController *)self updateItems];

  MEMORY[0x270F9A6D0](self, sel_updateFooter);
}

- (void)mirroringController:(id)a3 didUpdateBusyIdenifiers:(id)a4
{
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2406210F8;
    v5[3] = &unk_2650C8A98;
    v5[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v5];
  }
}

- (void)updateItems
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
    val = self;
    v25 = [(MRUMirroringController *)self->_controller availableOutputDevices];
    id v3 = objc_msgSend(v25, "msv_filter:", &unk_26F4BF3E0);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = sub_240621618;
    v40[3] = &unk_2650C8AE0;
    id v24 = v3;
    id v41 = v24;
    v23 = objc_msgSend(v25, "msv_filter:", v40);
    if (-[MRUMirroringViewController showMoreExpanded](self, "showMoreExpanded") || ![v24 count])
    {
      id v4 = [v24 arrayByAddingObjectsFromArray:v23];
    }
    else
    {
      id v4 = v24;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v5)
    {
      uint64_t v27 = *(void *)v37;
      p_controller = &self->_controller;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v9 = [(MRUMirroringController *)*p_controller busyIdentifiers];
          v10 = [v8 deviceID];
          uint64_t v11 = [v9 containsObject:v10];

          v12 = [(MRUMirroringController *)*p_controller selectedOutputDevice];
          uint64_t v13 = [v8 isEqual:v12];

          objc_initWeak(&location, val);
          v14 = [MRUMirroringMenuModuleItem alloc];
          v15 = [v8 name];
          v16 = [v8 deviceID];
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = sub_24062163C;
          v31[3] = &unk_2650C8B08;
          objc_copyWeak(&v32, &location);
          char v33 = v13;
          char v34 = v11;
          v31[4] = v8;
          v17 = [(CCUIMenuModuleItem *)v14 initWithTitle:v15 identifier:v16 handler:v31];

          v18 = [MEMORY[0x263F54150] symbolNameForOutputDevice:v8];
          [(MRUMirroringMenuModuleItem *)v17 setSymbolName:v18];

          [(CCUIMenuModuleItem *)v17 setBusy:v11];
          [(CCUIMenuModuleItem *)v17 setSelected:v13];
          [v28 addObject:v17];

          objc_destroyWeak(&v32);
          objc_destroyWeak(&location);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v5);
    }

    if (![(MRUMirroringViewController *)val showMoreExpanded])
    {
      unint64_t v19 = [v25 count];
      if (v19 > [obj count])
      {
        v20 = [MRUMirroringMenuModuleItem alloc];
        v21 = [MEMORY[0x263F54168] routingFooterShowMoreTitle];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = sub_2406216A0;
        v30[3] = &unk_2650C8B30;
        v30[4] = val;
        v22 = [(CCUIMenuModuleItem *)v20 initWithTitle:v21 identifier:@"showmore" handler:v30];
        [v28 addObject:v22];
      }
    }
    [(CCUIMenuModuleViewController *)val setMenuItems:v28];
    -[CCUIMenuModuleViewController setBusy:](val, "setBusy:", [v28 count] == 0);
  }
}

- (void)updateFooter
{
  id v3 = [(MRUMirroringController *)self->_controller selectedOutputDevice];

  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = [MEMORY[0x263F54168] stopMirroring];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_24062180C;
    v5[3] = &unk_2650C8B58;
    objc_copyWeak(&v6, &location);
    [(CCUIMenuModuleViewController *)self setFooterButtonTitle:v4 handler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_removeFooterButton);
  }
}

- (void)updateGlyphPackageDescription
{
  id v3 = [(MRUMirroringViewController *)self traitCollection];
  uint64_t v4 = [v3 accessibilityContrast];
  uint64_t v5 = @"Mirroring";
  if (v4 == 1) {
    uint64_t v5 = @"Mirroring_IC";
  }
  id v6 = v5;

  id v7 = [MEMORY[0x263F54130] packageDescriptionWithName:v6];

  [(CCUIMenuModuleViewController *)self setGlyphPackageDescription:v7];
}

- (void)updateState
{
  if ([(CCUIButtonModuleViewController *)self contentRenderingMode] == 1)
  {
    id v3 = [(CCUIButtonModuleViewController *)self buttonView];
    [v3 setGlyphState:@"off"];

    [(CCUIButtonModuleViewController *)self setSelected:0];
  }
  else
  {
    if ([(CCUIButtonModuleViewController *)self isExpanded])
    {
      [(CCUIButtonModuleViewController *)self setSelected:0];
      id v7 = [(CCUIButtonModuleViewController *)self buttonView];
      [v7 setGlyphState:@"off"];
    }
    else
    {
      uint64_t v4 = [(MRUMirroringController *)self->_controller selectedOutputDevice];
      [(CCUIButtonModuleViewController *)self setSelected:v4 != 0];

      id v7 = [(MRUMirroringController *)self->_controller selectedOutputDevice];
      if (v7) {
        uint64_t v5 = @"on";
      }
      else {
        uint64_t v5 = @"off";
      }
      id v6 = [(CCUIButtonModuleViewController *)self buttonView];
      [v6 setGlyphState:v5];
    }
  }
}

- (void)selectOutputDevice:(id)a3
{
  id v12 = a3;
  if ([(MRUMirroringViewController *)self isConnectedToExternalDisplay]
    && ([(MRUMirroringController *)self->_controller selectedOutputDevice],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = (void *)MEMORY[0x263F1C3F8];
    id v6 = [MEMORY[0x263F54168] airPlayErrorTitle];
    id v7 = [MEMORY[0x263F54168] airplayErrorExternalDisplay];
    v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = (void *)MEMORY[0x263F1C3F0];
    v10 = [MEMORY[0x263F54168] ok];
    uint64_t v11 = [v9 actionWithTitle:v10 style:0 handler:&unk_26F4BF400];
    [v8 addAction:v11];

    [(MRUMirroringViewController *)self showViewController:v8 sender:self];
  }
  else
  {
    [(MRUMirroringController *)self->_controller startMirroringToOutputDevice:v12 completion:0];
  }
}

- (void)stopMirroringDismissOnComplete:(BOOL)a3
{
  objc_initWeak(&location, self);
  controller = self->_controller;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_240621C4C;
  v6[3] = &unk_2650C8BA0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  [(MRUMirroringController *)controller stopMirroringWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)isConnectedToExternalDisplay
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(FBSDisplayMonitor *)self->_displayMonitor connectedIdentities];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isExternal] && objc_msgSend(v6, "connectionType") == 1)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (MRUMirroringController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (BOOL)showMoreExpanded
{
  return self->_showMoreExpanded;
}

- (void)setShowMoreExpanded:(BOOL)a3
{
  self->_showMoreExpanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end