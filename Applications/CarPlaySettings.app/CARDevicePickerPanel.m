@interface CARDevicePickerPanel
- (BOOL)isSpinnerVisible;
- (CAFPairedDevices)pairedDevices;
- (CARDevicePickerCellSpecifier)cellSpecifier;
- (UIViewController)currentViewController;
- (void)carManager:(id)a3 didUpdatePairedDevices:(id)a4;
- (void)refreshViewControllerIfNeeded;
- (void)setCurrentViewController:(id)a3;
- (void)setIsSpinnerVisible:(BOOL)a3;
- (void)setPairedDevices:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARDevicePickerPanel

- (CARDevicePickerCellSpecifier)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARDevicePickerCellSpecifier alloc];
    v5 = sub_1000210C8(@"DEVICE_PICKER_CELL_TITLE");
    v6 = +[CARSettingsImageCache devicePickerImage];
    v7 = [(CARSettingsPanel *)self panelController];
    v8 = [v7 carSession];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1000161B0;
    v15 = &unk_100092008;
    objc_copyWeak(&v16, &location);
    v9 = [(CARDevicePickerCellSpecifier *)v4 initWithTitle:v5 image:v6 accessoryType:1 carSession:v8 actionBlock:&v12];

    [(CARDevicePickerCellSpecifier *)v9 refreshSpecifierIfNeeded];
    v10 = self->_cellSpecifier;
    self->_cellSpecifier = v9;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CARDevicePickerPanel;
  [(CARSettingsPanel *)&v5 viewDidLoad];
  [(CARDevicePickerPanel *)self refreshViewControllerIfNeeded];
  v3 = +[CARSettingsAppDelegate sharedDelegate];
  v4 = [v3 carManager];
  [v4 addObserver:self];
}

- (void)refreshViewControllerIfNeeded
{
  v3 = [(CARDevicePickerPanel *)self pairedDevices];

  if (v3)
  {
    v4 = [(CARDevicePickerPanel *)self currentViewController];
    objc_super v5 = [v4 view];
    [v5 removeFromSuperview];

    v6 = [(CARDevicePickerPanel *)self currentViewController];
    [v6 removeFromParentViewController];

    v7 = [_TtC15CarPlaySettings22CARDevicePickerManager alloc];
    v8 = [(CARDevicePickerPanel *)self pairedDevices];
    v9 = [(CARSettingsPanel *)self panelController];
    v10 = [v9 carSession];
    v64 = [(CARDevicePickerManager *)v7 initWithPairedDevices:v8 carSession:v10];

    v11 = [(CARDevicePickerManager *)v64 viewController];
    [v11 willMoveToParentViewController:self];
    [(CARDevicePickerPanel *)self addChildViewController:v11];
    v12 = [(CARDevicePickerPanel *)self view];
    uint64_t v13 = [v11 view];
    [v12 addSubview:v13];

    v14 = [v11 view];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v62 = [v11 view];
    v58 = [v62 leadingAnchor];
    v60 = [(CARDevicePickerPanel *)self view];
    v56 = [v60 leadingAnchor];
    v54 = [v58 constraintEqualToAnchor:v56];
    v67[0] = v54;
    v52 = [v11 view];
    v48 = [v52 trailingAnchor];
    v50 = [(CARDevicePickerPanel *)self view];
    v47 = [v50 trailingAnchor];
    v44 = [v48 constraintEqualToAnchor:v47];
    v67[1] = v44;
    v42 = [v11 view];
    v39 = [v42 topAnchor];
    v40 = [(CARDevicePickerPanel *)self view];
    v15 = [v40 topAnchor];
    id v16 = [v39 constraintEqualToAnchor:v15];
    v67[2] = v16;
    v17 = [v11 view];
    v18 = [v17 bottomAnchor];
    v19 = [(CARDevicePickerPanel *)self view];
    v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v67[3] = v21;
    v22 = +[NSArray arrayWithObjects:v67 count:4];
    +[NSLayoutConstraint activateConstraints:v22];

    v23 = [(CARSettingsPanel *)self navigationItem];
    [v11 _setExistingNavigationItem:v23];

    v24 = v64;
    [(CARDevicePickerPanel *)self setCurrentViewController:v11];
  }
  else
  {
    if ([(CARDevicePickerPanel *)self isSpinnerVisible]) {
      return;
    }
    v25 = [(CARDevicePickerPanel *)self currentViewController];
    v26 = [v25 view];
    [v26 removeFromSuperview];

    v27 = [(CARDevicePickerPanel *)self currentViewController];
    [v27 removeFromParentViewController];

    v24 = +[CARSettingsUtilities loadingViewController];
    [v24 willMoveToParentViewController:self];
    [(CARDevicePickerPanel *)self addChildViewController:v24];
    v28 = [(CARDevicePickerPanel *)self view];
    v29 = [v24 view];
    [v28 addSubview:v29];

    v30 = [v24 view];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    v65 = [v24 view];
    v61 = [v65 leadingAnchor];
    v63 = [(CARDevicePickerPanel *)self view];
    v59 = [v63 leadingAnchor];
    v57 = [v61 constraintEqualToAnchor:v59];
    v66[0] = v57;
    v55 = [v24 view];
    v51 = [v55 trailingAnchor];
    v53 = [(CARDevicePickerPanel *)self view];
    v49 = [v53 trailingAnchor];
    v46 = [v51 constraintEqualToAnchor:v49];
    v66[1] = v46;
    v45 = [v24 view];
    v41 = [v45 topAnchor];
    v43 = [(CARDevicePickerPanel *)self view];
    v31 = [v43 topAnchor];
    v32 = [v41 constraintEqualToAnchor:v31];
    v66[2] = v32;
    v33 = [v24 view];
    v34 = [v33 bottomAnchor];
    v35 = [(CARDevicePickerPanel *)self view];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v66[3] = v37;
    v38 = +[NSArray arrayWithObjects:v66 count:4];
    +[NSLayoutConstraint activateConstraints:v38];

    [(CARDevicePickerPanel *)self setCurrentViewController:v24];
    [(CARDevicePickerPanel *)self setIsSpinnerVisible:1];
  }
}

- (void)carManager:(id)a3 didUpdatePairedDevices:(id)a4
{
  id v7 = a4;
  id v5 = [(CARDevicePickerPanel *)self pairedDevices];

  v6 = v7;
  if (v5 != v7)
  {
    [(CARDevicePickerPanel *)self setPairedDevices:v7];
    [(CARDevicePickerPanel *)self refreshViewControllerIfNeeded];
    v6 = v7;
  }
}

- (CAFPairedDevices)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (BOOL)isSpinnerVisible
{
  return self->_isSpinnerVisible;
}

- (void)setIsSpinnerVisible:(BOOL)a3
{
  self->_isSpinnerVisible = a3;
}

- (UIViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end