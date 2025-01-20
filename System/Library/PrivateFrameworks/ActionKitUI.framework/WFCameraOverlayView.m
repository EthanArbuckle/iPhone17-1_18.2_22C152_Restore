@interface WFCameraOverlayView
- (UIButton)flipButton;
- (UIImagePickerController)pickerController;
- (UILabel)photosLabel;
- (UIView)flashView;
- (WFCameraFlashButton)flashButton;
- (WFCameraOverlayView)initWithFrame:(CGRect)a3;
- (WFCameraShutterButton)shutterButton;
- (WFVolumeButtonManager)volumeButtonManager;
- (int64_t)takenPhotos;
- (int64_t)totalPhotos;
- (void)cancelPressed;
- (void)flashValueChanged;
- (void)flipPressed;
- (void)layoutSubviews;
- (void)setFlashButton:(id)a3;
- (void)setFlashView:(id)a3;
- (void)setFlipButton:(id)a3;
- (void)setPhotosLabel:(id)a3;
- (void)setPickerController:(id)a3;
- (void)setShutterButton:(id)a3;
- (void)setTakenPhotos:(int64_t)a3;
- (void)setTotalPhotos:(int64_t)a3;
- (void)setVolumeButtonManager:(id)a3;
- (void)shutterPressed;
- (void)updateButtons;
- (void)updateFlipButton;
- (void)updatePhotosLabel;
@end

@implementation WFCameraOverlayView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeButtonManager, 0);
  objc_destroyWeak((id *)&self->_photosLabel);
  objc_destroyWeak((id *)&self->_flipButton);
  objc_destroyWeak((id *)&self->_flashView);
  objc_destroyWeak((id *)&self->_flashButton);
  objc_destroyWeak((id *)&self->_shutterButton);
  objc_destroyWeak((id *)&self->_pickerController);
}

- (void)setVolumeButtonManager:(id)a3
{
}

- (WFVolumeButtonManager)volumeButtonManager
{
  return self->_volumeButtonManager;
}

- (void)setPhotosLabel:(id)a3
{
}

- (UILabel)photosLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosLabel);
  return (UILabel *)WeakRetained;
}

- (void)setFlipButton:(id)a3
{
}

- (UIButton)flipButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flipButton);
  return (UIButton *)WeakRetained;
}

- (void)setFlashView:(id)a3
{
}

- (UIView)flashView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashView);
  return (UIView *)WeakRetained;
}

- (void)setFlashButton:(id)a3
{
}

- (WFCameraFlashButton)flashButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashButton);
  return (WFCameraFlashButton *)WeakRetained;
}

- (int64_t)totalPhotos
{
  return self->_totalPhotos;
}

- (int64_t)takenPhotos
{
  return self->_takenPhotos;
}

- (void)setShutterButton:(id)a3
{
}

- (WFCameraShutterButton)shutterButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shutterButton);
  return (WFCameraShutterButton *)WeakRetained;
}

- (UIImagePickerController)pickerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerController);
  return (UIImagePickerController *)WeakRetained;
}

- (void)updateButtons
{
  v3 = [(WFCameraOverlayView *)self pickerController];
  uint64_t v4 = [v3 cameraDevice];

  int v5 = [MEMORY[0x263F82808] isFlashAvailableForCameraDevice:v4];
  if ((v5 & 1) == 0)
  {
    v6 = [(WFCameraOverlayView *)self pickerController];
    [v6 setCameraFlashMode:-1];
  }
  uint64_t v7 = [MEMORY[0x263F82808] isCameraDeviceAvailable:v4 != 1];
  v8 = [(WFCameraOverlayView *)self flipButton];
  [v8 setEnabled:v7];

  v9 = [(WFCameraOverlayView *)self flashButton];
  [v9 setHidden:v5 ^ 1u];

  v10 = [(WFCameraOverlayView *)self pickerController];
  uint64_t v11 = [v10 cameraFlashMode];
  v12 = [(WFCameraOverlayView *)self flashButton];
  [v12 setFlashMode:v11];

  [(WFCameraOverlayView *)self updateFlipButton];
}

- (void)updateFlipButton
{
  id v6 = [(WFCameraOverlayView *)self pickerController];
  if ([v6 cameraDevice]) {
    v3 = @"Camera chooser - front facing";
  }
  else {
    v3 = @"Camera chooser - rear facing";
  }
  uint64_t v4 = WFLocalizedString(v3);
  int v5 = [(WFCameraOverlayView *)self flipButton];
  [v5 setAccessibilityLabel:v4];
}

- (void)setPickerController:(id)a3
{
  objc_storeWeak((id *)&self->_pickerController, a3);
  [(WFCameraOverlayView *)self updateButtons];
}

- (void)flashValueChanged
{
  id v5 = [(WFCameraOverlayView *)self flashButton];
  uint64_t v3 = [v5 flashMode];
  uint64_t v4 = [(WFCameraOverlayView *)self pickerController];
  [v4 setCameraFlashMode:v3];
}

- (void)cancelPressed
{
  uint64_t v3 = [(WFCameraOverlayView *)self pickerController];
  uint64_t v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(WFCameraOverlayView *)self pickerController];
    id v6 = [v8 delegate];
    uint64_t v7 = [(WFCameraOverlayView *)self pickerController];
    [v6 imagePickerControllerDidCancel:v7];
  }
}

- (void)flipPressed
{
  uint64_t v3 = [(WFCameraOverlayView *)self pickerController];
  BOOL v4 = [v3 cameraDevice] != 1;

  char v5 = [(WFCameraOverlayView *)self pickerController];
  [v5 setCameraDevice:v4];

  [(WFCameraOverlayView *)self updateButtons];
}

- (void)setTotalPhotos:(int64_t)a3
{
  self->_totalPhotos = a3;
  [(WFCameraOverlayView *)self updatePhotosLabel];
}

- (void)setTakenPhotos:(int64_t)a3
{
  self->_takenPhotos = a3;
  [(WFCameraOverlayView *)self updatePhotosLabel];
}

- (void)updatePhotosLabel
{
  if (self->_totalPhotos > 1)
  {
    uint64_t v3 = NSString;
    BOOL v4 = @"of %d\nphotos";
    char v5 = @"of %d\nphotos";
    if ([@"of %d\nphotos" length])
    {
      id v6 = NSString;
      uint64_t v7 = [@"of %d\nphotos" stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
      id v8 = [v6 stringWithFormat:@"%@ (Pluralization)", v7];

      v9 = WFCurrentBundle();
      BOOL v4 = [v9 localizedStringForKey:v8 value:@"of %d\nphotos" table:0];
    }
    else
    {
      v10 = @"of %d\nphotos";
    }

    uint64_t v11 = objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_totalPhotos);
    id v18 = [v11 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

    v12 = NSString;
    v13 = WFLocalizedString(@"%1$d %2$@");
    int64_t takenPhotos = self->_takenPhotos;
    if (takenPhotos + 1 < self->_totalPhotos) {
      int64_t totalPhotos = takenPhotos + 1;
    }
    else {
      int64_t totalPhotos = self->_totalPhotos;
    }
    v16 = objc_msgSend(v12, "localizedStringWithFormat:", v13, totalPhotos, v18);
    v17 = [(WFCameraOverlayView *)self photosLabel];
    [v17 setText:v16];
  }
  else
  {
    id v18 = [(WFCameraOverlayView *)self photosLabel];
    [v18 setText:0];
  }
}

- (void)shutterPressed
{
  uint64_t v3 = [(WFCameraOverlayView *)self shutterButton];
  [v3 setEnabled:0];

  [(WFCameraOverlayView *)self setTakenPhotos:[(WFCameraOverlayView *)self takenPhotos] + 1];
  BOOL v4 = [(WFCameraOverlayView *)self pickerController];
  [v4 takePicture];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke;
  v5[3] = &unk_264900E20;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateKeyframesWithDuration:0 delay:v5 options:0 animations:0.200000003 completion:0.0];
}

uint64_t __37__WFCameraOverlayView_shutterPressed__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke_2;
  v4[3] = &unk_264900E20;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__WFCameraOverlayView_shutterPressed__block_invoke_3;
  v3[3] = &unk_264900E20;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.5 animations:0.5];
}

void __37__WFCameraOverlayView_shutterPressed__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) flashView];
  [v1 setAlpha:1.0];
}

void __37__WFCameraOverlayView_shutterPressed__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) flashView];
  [v1 setAlpha:0.0];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)WFCameraOverlayView;
  [(WFCameraOverlayView *)&v20 layoutSubviews];
  uint64_t v3 = [(WFCameraOverlayView *)self flipButton];
  BOOL v4 = [v3 superview];
  int v5 = [v4 isEqual:self];

  if (v5)
  {
    id v6 = [(WFCameraOverlayView *)self flipButton];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    double MinY = CGRectGetMinY(v21);
    v22.origin.x = v8;
    v22.origin.y = v10;
    v22.size.width = v12;
    v22.size.height = v14;
    CGFloat MaxY = CGRectGetMaxY(v22);
    CGAffineTransformMakeTranslation(&v19, 0.0, MinY + MaxY);
    v17 = [(WFCameraOverlayView *)self pickerController];
    CGAffineTransform v18 = v19;
    [v17 setCameraViewTransform:&v18];
  }
}

- (WFCameraOverlayView)initWithFrame:(CGRect)a3
{
  v127.receiver = self;
  v127.super_class = (Class)WFCameraOverlayView;
  uint64_t v3 = -[WFCameraOverlayView initWithFrame:](&v127, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [v4 setBackgroundColor:v5];

    [(WFCameraOverlayView *)v3 addSubview:v4];
    id v6 = [MEMORY[0x263F824E8] buttonWithType:1];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = WFLocalizedString(@"Switches between the front and back facing cameras");
    [v6 setAccessibilityHint:v7];

    CGFloat v8 = [MEMORY[0x263F825C8] whiteColor];
    [v6 setTintColor:v8];

    double v9 = [MEMORY[0x263F85308] actionKitImageNamed:@"CameraFlip"];
    CGFloat v10 = [v9 UIImage];
    [v6 setImage:v10 forState:0];

    double v11 = WFLocalizedString(@"Camera flip");
    [v6 setAccessibilityLabel:v11];

    [v6 addTarget:v3 action:sel_flipPressed forControlEvents:64];
    v123 = v6;
    [(WFCameraOverlayView *)v3 setFlipButton:v6];
    id v12 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v13 = [MEMORY[0x263F825C8] whiteColor];
    [v12 setTextColor:v13];

    CGFloat v14 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v12 setFont:v14];

    [v12 setNumberOfLines:2];
    [v12 setTextAlignment:1];
    [v4 addSubview:v12];
    [(WFCameraOverlayView *)v3 setPhotosLabel:v12];
    [(WFCameraOverlayView *)v3 updatePhotosLabel];
    v15 = [MEMORY[0x263F824E8] buttonWithType:1];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x263F825C8] whiteColor];
    [v15 setTintColor:v16];

    v17 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    CGAffineTransform v18 = [v15 titleLabel];
    [v18 setFont:v17];

    CGAffineTransform v19 = WFLocalizedString(@"Cancel");
    [v15 setTitle:v19 forState:0];

    [v15 addTarget:v3 action:sel_cancelPressed forControlEvents:64];
    [v4 addSubview:v15];
    objc_super v20 = objc_alloc_init(WFCameraFlashButton);
    [(WFCameraFlashButton *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v21 = [(WFCameraOverlayView *)v3 pickerController];
    -[WFCameraFlashButton setFlashMode:](v20, "setFlashMode:", [v21 cameraFlashMode]);

    [(WFCameraFlashButton *)v20 addTarget:v3 action:sel_flashValueChanged forControlEvents:4096];
    [(WFCameraOverlayView *)v3 addSubview:v20];
    [(WFCameraOverlayView *)v3 setFlashButton:v20];
    CGRect v22 = objc_alloc_init(WFCameraShutterButton);
    [(WFCameraShutterButton *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFCameraShutterButton *)v22 addTarget:v3 action:sel_shutterPressed forControlEvents:64];
    [v4 addSubview:v22];
    [(WFCameraOverlayView *)v3 setShutterButton:v22];
    id v23 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [MEMORY[0x263F825C8] blackColor];
    [v23 setBackgroundColor:v24];

    [v23 setAlpha:0.0];
    [(WFCameraOverlayView *)v3 addSubview:v23];
    [(WFCameraOverlayView *)v3 sendSubviewToBack:v23];
    [(WFCameraOverlayView *)v3 setFlashView:v23];
    v25 = [(WFCameraShutterButton *)v22 centerXAnchor];
    v26 = [v4 centerXAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v4 addConstraint:v27];

    v28 = [(WFCameraShutterButton *)v22 centerYAnchor];
    v29 = [v4 centerYAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v4 addConstraint:v30];

    v120 = v23;
    uint64_t v31 = _NSDictionaryOfVariableBindings(&cfstr_SidebarviewFla.isa, v4, v23, 0);
    v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[flashView]|" options:0 metrics:0 views:v31];
    [(WFCameraOverlayView *)v3 addConstraints:v32];

    v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[flashView]|" options:0 metrics:0 views:v31];
    [(WFCameraOverlayView *)v3 addConstraints:v33];

    v34 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v35 = [v34 userInterfaceIdiom];

    v121 = (void *)v31;
    v122 = v20;
    if (v35 == 1)
    {
      v36 = v123;
      [v4 addSubview:v123];
      [(WFCameraFlashButton *)v20 removeFromSuperview];
      v37 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[sidebarView]|" options:0 metrics:0 views:v31];
      [(WFCameraOverlayView *)v3 addConstraints:v37];

      v38 = [v4 rightAnchor];
      v39 = [(WFCameraOverlayView *)v3 rightAnchor];
      v40 = [v38 constraintEqualToAnchor:v39];
      [(WFCameraOverlayView *)v3 addConstraint:v40];

      v41 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:102.0];
      [v4 addConstraint:v41];

      v42 = [v15 centerXAnchor];
      v43 = [v4 centerXAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [v4 addConstraint:v44];

      v45 = [v15 centerYAnchor];
      v46 = [v4 bottomAnchor];
      v47 = [v45 constraintEqualToAnchor:v46 constant:-40.0];
      [v4 addConstraint:v47];

      v48 = [v15 centerXAnchor];
      v49 = [v4 centerXAnchor];
      v50 = [v48 constraintEqualToAnchor:v49];
      [v4 addConstraint:v50];

      v51 = [v15 leadingAnchor];
      v52 = [v4 layoutMarginsGuide];
      v53 = [v52 leadingAnchor];
      v54 = [v51 constraintGreaterThanOrEqualToAnchor:v53];
      [v4 addConstraint:v54];

      v55 = [v15 trailingAnchor];
      v56 = [v4 layoutMarginsGuide];
      v57 = [v56 trailingAnchor];
      v58 = [v55 constraintLessThanOrEqualToAnchor:v57];
      [v4 addConstraint:v58];

      v59 = [v123 centerXAnchor];
      v60 = [v4 centerXAnchor];
      v61 = [v59 constraintEqualToAnchor:v60];
      [v4 addConstraint:v61];

      v62 = [v123 centerYAnchor];
      v63 = [v4 topAnchor];
      v64 = [v62 constraintEqualToAnchor:v63 constant:40.0];
      [v4 addConstraint:v64];

      v65 = [MEMORY[0x263F08938] constraintWithItem:v12 attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.5 constant:0.0];
      [v4 addConstraint:v65];

      v66 = [v12 centerXAnchor];
      v67 = [v4 centerXAnchor];
      v68 = [v66 constraintEqualToAnchor:v67];
      [v4 addConstraint:v68];

      v69 = [v12 leadingAnchor];
      v70 = [v4 layoutMarginsGuide];
      v71 = [v70 leadingAnchor];
      v72 = [v69 constraintGreaterThanOrEqualToAnchor:v71];
      [v4 addConstraint:v72];

      v73 = [v12 trailingAnchor];
      v74 = [v4 layoutMarginsGuide];
      v75 = [v74 trailingAnchor];
      v76 = [v73 constraintLessThanOrEqualToAnchor:v75];
      [v4 addConstraint:v76];
    }
    else
    {
      [(WFCameraOverlayView *)v3 addSubview:v123];
      v77 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[sidebarView]-|" options:0 metrics:0 views:v31];
      [(WFCameraOverlayView *)v3 addConstraints:v77];

      v78 = [(WFCameraFlashButton *)v20 topAnchor];
      [(WFCameraOverlayView *)v3 safeAreaLayoutGuide];
      v80 = v79 = v20;
      v81 = [v80 topAnchor];
      v82 = [v78 constraintEqualToAnchor:v81];
      [(WFCameraOverlayView *)v3 addConstraint:v82];

      v83 = [v4 bottomAnchor];
      v84 = [(WFCameraOverlayView *)v3 layoutMarginsGuide];
      v85 = [v84 bottomAnchor];
      v86 = [v83 constraintEqualToAnchor:v85];
      [(WFCameraOverlayView *)v3 addConstraint:v86];

      v87 = [v123 topAnchor];
      v88 = [(WFCameraOverlayView *)v3 layoutMarginsGuide];
      v89 = [v88 topAnchor];
      v90 = [v87 constraintEqualToAnchor:v89];
      [(WFCameraOverlayView *)v3 addConstraint:v90];

      v91 = [v123 rightAnchor];
      v92 = [(WFCameraOverlayView *)v3 layoutMarginsGuide];
      v93 = [v92 rightAnchor];
      v94 = [v91 constraintEqualToAnchor:v93];
      [(WFCameraOverlayView *)v3 addConstraint:v94];

      v95 = [(WFCameraFlashButton *)v79 leftAnchor];
      v96 = [(WFCameraOverlayView *)v3 layoutMarginsGuide];
      v97 = [v96 leftAnchor];
      v98 = [v95 constraintEqualToAnchor:v97];
      [(WFCameraOverlayView *)v3 addConstraint:v98];

      v99 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:102.0];
      [v4 addConstraint:v99];

      v100 = [v15 centerYAnchor];
      v101 = [v4 centerYAnchor];
      v102 = [v100 constraintEqualToAnchor:v101];
      [v4 addConstraint:v102];

      v103 = [v15 leadingAnchor];
      v104 = [v4 layoutMarginsGuide];
      v105 = [v104 leadingAnchor];
      v106 = [v103 constraintEqualToAnchor:v105];
      [v4 addConstraint:v106];

      v107 = [v15 trailingAnchor];
      v108 = [(WFCameraShutterButton *)v22 leadingAnchor];
      v109 = [v107 constraintLessThanOrEqualToAnchor:v108 constant:-10.0];
      [v4 addConstraint:v109];

      v110 = [v12 centerYAnchor];
      v111 = [v4 centerYAnchor];
      v112 = [v110 constraintEqualToAnchor:v111];
      [v4 addConstraint:v112];

      v113 = [v12 trailingAnchor];
      v114 = [v4 layoutMarginsGuide];
      v115 = [v114 trailingAnchor];
      v116 = [v113 constraintEqualToAnchor:v115];
      [v4 addConstraint:v116];

      v73 = [v12 leadingAnchor];
      v74 = [(WFCameraShutterButton *)v22 trailingAnchor];
      v75 = [v73 constraintGreaterThanOrEqualToAnchor:v74 constant:10.0];
      [v4 addConstraint:v75];
      v36 = v123;
    }

    [(WFCameraOverlayView *)v3 updateButtons];
    objc_initWeak(&location, v3);
    v117 = [WFVolumeButtonManager alloc];
    v124[0] = MEMORY[0x263EF8330];
    v124[1] = 3221225472;
    v124[2] = __37__WFCameraOverlayView_initWithFrame___block_invoke;
    v124[3] = &unk_2648FFF60;
    objc_copyWeak(&v125, &location);
    v118 = [(WFVolumeButtonManager *)v117 initWithPressHandler:v124];
    [(WFCameraOverlayView *)v3 setVolumeButtonManager:v118];

    objc_destroyWeak(&v125);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__WFCameraOverlayView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shutterPressed];
}

@end