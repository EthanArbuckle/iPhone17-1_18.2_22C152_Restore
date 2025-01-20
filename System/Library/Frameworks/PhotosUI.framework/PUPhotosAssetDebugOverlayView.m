@interface PUPhotosAssetDebugOverlayView
- (BOOL)showInfoOverlay;
- (NSString)clientIdentifier;
- (PUPhotosAssetDebugOverlayView)init;
- (PUPhotosAssetDebugOverlayView)initWithClientIdentifier:(id)a3;
- (PUPhotosAssetDebugOverlayView)initWithCoder:(id)a3;
- (PUPhotosAssetDebugOverlayView)initWithFrame:(CGRect)a3;
- (PUPhotosAssetDebugOverlayViewDelegate)delegate;
- (UIButton)overlayButton;
- (UILabel)infoLabel;
- (UIView)buttonContainerView;
- (UIView)buttonImageView;
- (UIView)infoOverlayView;
- (id)_debugDescription;
- (id)_hdrImageTextForCurrentlyDisplayedImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_configureButtonImageView;
- (void)_fileRadar;
- (void)_openURL:(id)a3;
- (void)_setupView;
- (void)_toggleInfoOverlay;
- (void)_updateImageDynamicRangeOption:(int64_t)a3;
- (void)_updateInfoLabel;
- (void)_updateInfoOverlayAppearance;
- (void)_updateOverlayButton;
- (void)setDelegate:(id)a3;
- (void)setShowInfoOverlay:(BOOL)a3;
- (void)update;
@end

@implementation PUPhotosAssetDebugOverlayView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_infoOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayButton, 0);
  objc_storeStrong((id *)&self->_buttonImageView, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)showInfoOverlay
{
  return self->_showInfoOverlay;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (UIView)infoOverlayView
{
  return self->_infoOverlayView;
}

- (UIButton)overlayButton
{
  return self->_overlayButton;
}

- (UIView)buttonImageView
{
  return self->_buttonImageView;
}

- (UIView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (PUPhotosAssetDebugOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUPhotosAssetDebugOverlayViewDelegate *)WeakRetained;
}

- (PUPhotosAssetDebugOverlayView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUPhotosAssetDebugOverlayView.m" lineNumber:518 description:@"initWithCoder is unavailable"];

  return 0;
}

- (PUPhotosAssetDebugOverlayView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"PUPhotosAssetDebugOverlayView.m" lineNumber:513 description:@"initWithFrame is unavailable"];

  return 0;
}

- (PUPhotosAssetDebugOverlayView)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUPhotosAssetDebugOverlayView.m" lineNumber:508 description:@"init is unavailable"];

  return 0;
}

- (void)_updateImageDynamicRangeOption:(int64_t)a3
{
  id v5 = [(PUPhotosAssetDebugOverlayView *)self delegate];
  [v5 photosAssetDebugOverlayView:self didRequestPreferredImageDynamicRange:a3];
}

- (void)_openURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  id v5 = [v3 defaultWorkspace];
  [v5 openURL:v4 configuration:0 completionHandler:0];
}

- (void)_fileRadar
{
  v14[5] = *MEMORY[0x263EF8340];
  v13[0] = @"ComponentName";
  v13[1] = @"Title";
  v14[0] = @"Photos UI Core";
  v14[1] = @"[Photos View Usage] Insert Bug Title";
  v13[2] = @"ComponentID";
  v13[3] = @"Classification";
  v14[2] = @"936635";
  v14[3] = @"Other Bug";
  v13[4] = @"Description";
  v3 = NSString;
  id v4 = [(PUPhotosAssetDebugOverlayView *)self _debugDescription];
  id v5 = [v3 stringWithFormat:@"Photos Asset View Debug Info:\n%@\n\nPlease attach a screenshot.", v4];
  v14[4] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];

  v7 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__PUPhotosAssetDebugOverlayView__fileRadar__block_invoke;
  v11[3] = &unk_2642C51E0;
  id v12 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
  [v7 setQueryItems:v9];
  v10 = [v7 URL];
  [(PUPhotosAssetDebugOverlayView *)self _openURL:v10];
}

void __43__PUPhotosAssetDebugOverlayView__fileRadar__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

- (void)_toggleInfoOverlay
{
  uint64_t v3 = [(PUPhotosAssetDebugOverlayView *)self showInfoOverlay] ^ 1;

  [(PUPhotosAssetDebugOverlayView *)self setShowInfoOverlay:v3];
}

- (id)_hdrImageTextForCurrentlyDisplayedImage
{
  uint64_t v3 = [(PUPhotosAssetDebugOverlayView *)self delegate];
  id v4 = [v3 photosAssetDebugOverlayViewCurrentlyDisplayedImage:self];

  if (v4)
  {
    if ([v4 isHighDynamicRange]) {
      id v5 = @"YES";
    }
    else {
      id v5 = @"NO";
    }
  }
  else
  {
    id v5 = @"Unknown";
  }

  return v5;
}

- (id)_debugDescription
{
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PUPhotosAssetDebugOverlayView *)self delegate];
  uint64_t v4 = [v3 photosAssetDebugOverlayViewPreferredImageDynamicRange:self];

  id v5 = (void *)MEMORY[0x263EFF980];
  v6 = NSString;
  v7 = [(PUPhotosAssetDebugOverlayView *)self clientIdentifier];
  id v8 = [v6 stringWithFormat:@"Client Identifier: %@", v7];
  v33[0] = v8;
  if ((unint64_t)(v4 - 1) > 2) {
    id v9 = @"Unspecified";
  }
  else {
    id v9 = off_2642C5200[v4 - 1];
  }
  v10 = [NSString stringWithFormat:@"PreferredImageDynamicRange: %@", v9];
  v33[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  id v12 = [v5 arrayWithArray:v11];

  v13 = [(PUPhotosAssetDebugOverlayView *)self delegate];
  int v14 = [v13 photosAssetDebugOverlayViewHasEffectivePreferredImageDynamicRange:self];

  if (v14)
  {
    v15 = [(PUPhotosAssetDebugOverlayView *)self delegate];
    uint64_t v16 = [v15 photosAssetDebugOverlayViewEffectivePreferredImageDynamicRange:self];

    if ((unint64_t)(v16 - 1) > 2) {
      v17 = @"Unspecified";
    }
    else {
      v17 = off_2642C5200[v16 - 1];
    }
    v18 = [NSString stringWithFormat:@"nEffectivePreferredImageDynamicRange: %@", v17];
    [v12 addObject:v18];
  }
  v19 = NSString;
  v20 = [(PUPhotosAssetDebugOverlayView *)self _hdrImageTextForCurrentlyDisplayedImage];
  v21 = [v19 stringWithFormat:@"HDR Decoded Image? %@", v20];
  v32[0] = v21;
  v22 = NSString;
  v23 = NSNumber;
  v24 = [MEMORY[0x263F82B60] mainScreen];
  [v24 potentialEDRHeadroom];
  double v26 = v25;

  v27 = [v23 numberWithDouble:v26];
  v28 = [v22 stringWithFormat:@"Max EDR: %@", v27];
  v32[1] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  [v12 addObjectsFromArray:v29];

  v30 = [v12 componentsJoinedByString:@"\n"];

  return v30;
}

- (void)_updateInfoLabel
{
  uint64_t v3 = NSString;
  id v5 = [(PUPhotosAssetDebugOverlayView *)self _debugDescription];
  uint64_t v4 = [v3 stringWithFormat:@"[INTERNAL ONLY]\n%@", v5];
  [(UILabel *)self->_infoLabel setText:v4];
}

- (void)_updateInfoOverlayAppearance
{
  v37[8] = *MEMORY[0x263EF8340];
  if (!self->_infoOverlayView && !self->_infoLabel)
  {
    uint64_t v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    infoOverlayView = self->_infoOverlayView;
    self->_infoOverlayView = v3;

    id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
    v6 = [v5 colorWithAlphaComponent:0.8];
    [(UIView *)self->_infoOverlayView setBackgroundColor:v6];

    v7 = [(UIView *)self->_infoOverlayView layer];
    [v7 setCornerRadius:8.0];

    [(UIView *)self->_infoOverlayView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUPhotosAssetDebugOverlayView *)self addSubview:self->_infoOverlayView];
    id v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    [(UILabel *)v8 setNumberOfLines:0];
    [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    infoLabel = self->_infoLabel;
    self->_infoLabel = v8;

    [(UIView *)self->_infoOverlayView addSubview:self->_infoLabel];
    double v26 = (void *)MEMORY[0x263F08938];
    v36 = [(UIView *)self->_infoOverlayView topAnchor];
    v35 = [(PUPhotosAssetDebugOverlayView *)self topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:10.0];
    v37[0] = v34;
    v33 = [(UIView *)self->_infoOverlayView leadingAnchor];
    v32 = [(PUPhotosAssetDebugOverlayView *)self leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:10.0];
    v37[1] = v31;
    v29 = [(UIView *)self->_infoOverlayView trailingAnchor];
    v30 = [(PUPhotosAssetDebugOverlayView *)self buttonContainerView];
    v28 = [v30 leadingAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:-10.0];
    v37[2] = v27;
    double v25 = [(UIView *)self->_infoOverlayView bottomAnchor];
    v24 = [(PUPhotosAssetDebugOverlayView *)self bottomAnchor];
    v23 = [v25 constraintLessThanOrEqualToAnchor:v24 constant:-10.0];
    v37[3] = v23;
    v22 = [(UILabel *)self->_infoLabel topAnchor];
    v21 = [(UIView *)self->_infoOverlayView topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21 constant:10.0];
    v37[4] = v20;
    v19 = [(UILabel *)self->_infoLabel leadingAnchor];
    v18 = [(UIView *)self->_infoOverlayView leadingAnchor];
    v10 = [v19 constraintEqualToAnchor:v18 constant:10.0];
    v37[5] = v10;
    v11 = [(UILabel *)self->_infoLabel trailingAnchor];
    id v12 = [(UIView *)self->_infoOverlayView trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:-10.0];
    v37[6] = v13;
    int v14 = [(UILabel *)self->_infoLabel bottomAnchor];
    v15 = [(UIView *)self->_infoOverlayView bottomAnchor];
    uint64_t v16 = [v14 constraintEqualToAnchor:v15 constant:-10.0];
    v37[7] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:8];
    [v26 activateConstraints:v17];
  }
  [(PUPhotosAssetDebugOverlayView *)self _updateInfoLabel];
  [(UIView *)self->_infoOverlayView setHidden:[(PUPhotosAssetDebugOverlayView *)self showInfoOverlay] ^ 1];
}

- (void)_updateOverlayButton
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke;
  v35[3] = &unk_2642C5168;
  v35[4] = self;
  uint64_t v3 = [MEMORY[0x263F823D0] actionWithTitle:@"Toggle Info Overlay" image:0 identifier:0 handler:v35];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_2;
  v34[3] = &unk_2642C5168;
  v34[4] = self;
  uint64_t v4 = [MEMORY[0x263F823D0] actionWithTitle:@"File Radar" image:0 identifier:0 handler:v34];
  id v5 = (void *)MEMORY[0x263EFF980];
  v40[0] = v3;
  v40[1] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
  v7 = [v5 arrayWithArray:v6];

  id v8 = [(PUPhotosAssetDebugOverlayView *)self delegate];

  unint64_t v9 = 0x263F82000;
  if (v8)
  {
    double v26 = v7;
    v27 = v3;
    v10 = [MEMORY[0x263EFF980] array];
    v11 = [(PUPhotosAssetDebugOverlayView *)self delegate];
    uint64_t v12 = [v11 photosAssetDebugOverlayViewPreferredImageDynamicRange:self];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v29 = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_3;
    v30 = &unk_2642C51B8;
    v31 = self;
    uint64_t v33 = v12;
    id v13 = v10;
    id v32 = v13;
    int v14 = v28;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v15 = [&unk_26C836850 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(&unk_26C836850);
          }
          uint64_t v19 = [*(id *)(*((void *)&v36 + 1) + 8 * i) integerValue];
          v20 = @"Unspecified";
          if ((unint64_t)(v19 - 1) <= 2) {
            v20 = off_2642C5200[v19 - 1];
          }
          v29((uint64_t)v14, v19, (uint64_t)v20);
        }
        uint64_t v16 = [&unk_26C836850 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v16);
    }

    unint64_t v9 = 0x263F82000uLL;
    v21 = [MEMORY[0x263F82940] menuWithTitle:@"Adjust Dynamic Range" children:v13];
    v7 = v26;
    [v26 addObject:v21];

    uint64_t v3 = v27;
  }
  v22 = [*(id *)(v9 + 2368) menuWithTitle:&stru_26C82F0F0 children:v7];
  v23 = [(PUPhotosAssetDebugOverlayView *)self overlayButton];
  [v23 setMenu:v22];

  v24 = [(PUPhotosAssetDebugOverlayView *)self overlayButton];
  [v24 setShowsMenuAsPrimaryAction:1];

  double v25 = [(PUPhotosAssetDebugOverlayView *)self overlayButton];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleInfoOverlay];
}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fileRadar];
}

void __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_4;
  v6[3] = &unk_2642C5190;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  id v5 = [MEMORY[0x263F823D0] actionWithTitle:a3 image:0 identifier:0 handler:v6];
  [v5 setState:*(void *)(a1 + 48) == a2];
  [*(id *)(a1 + 40) addObject:v5];
}

uint64_t __53__PUPhotosAssetDebugOverlayView__updateOverlayButton__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateImageDynamicRangeOption:*(void *)(a1 + 40)];
}

- (void)_configureButtonImageView
{
  uint64_t v3 = [MEMORY[0x263F825C8] systemGrayColor];
  uint64_t v4 = [(PUPhotosAssetDebugOverlayView *)self buttonImageView];
  [v4 setTintColor:v3];

  id v5 = [(PUPhotosAssetDebugOverlayView *)self buttonImageView];
  [v5 setClipsToBounds:1];

  id v6 = [(PUPhotosAssetDebugOverlayView *)self buttonImageView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PUPhotosAssetDebugOverlayView *)self update];
    id v5 = obj;
  }
}

- (void)setShowInfoOverlay:(BOOL)a3
{
  self->_showInfoOverlay = a3;
  [(PUPhotosAssetDebugOverlayView *)self _updateInfoOverlayAppearance];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosAssetDebugOverlayView;
  -[PUPhotosAssetDebugOverlayView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (PUPhotosAssetDebugOverlayView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    id v5 = 0;
  }

  return v5;
}

- (void)update
{
  [(PUPhotosAssetDebugOverlayView *)self _updateInfoLabel];

  [(PUPhotosAssetDebugOverlayView *)self _updateOverlayButton];
}

- (void)_setupView
{
  v54[12] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F825C8] clearColor];
  [(PUPhotosAssetDebugOverlayView *)self setBackgroundColor:v3];

  uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  id v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(UIView *)v4 setBackgroundColor:v5];

  id v6 = [(UIView *)v4 layer];
  [v6 setCornerRadius:8.0];

  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  buttonContainerView = self->_buttonContainerView;
  self->_buttonContainerView = v4;

  [(PUPhotosAssetDebugOverlayView *)self addSubview:self->_buttonContainerView];
  id v8 = [MEMORY[0x263F827E8] systemImageNamed:@"ant.circle.fill"];
  unint64_t v9 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
  v10 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UIView *)v9 setTintColor:v10];

  [(UIView *)v9 setClipsToBounds:1];
  buttonImageView = self->_buttonImageView;
  self->_buttonImageView = v9;

  [(PUPhotosAssetDebugOverlayView *)self _configureButtonImageView];
  [(UIView *)self->_buttonContainerView addSubview:self->_buttonImageView];
  uint64_t v12 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
  overlayButton = self->_overlayButton;
  self->_overlayButton = v12;

  [(PUPhotosAssetDebugOverlayView *)self _updateOverlayButton];
  [(UIView *)self->_buttonContainerView addSubview:self->_overlayButton];
  int v14 = [(UIView *)self->_buttonContainerView widthAnchor];
  uint64_t v15 = [(PUPhotosAssetDebugOverlayView *)self widthAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15 multiplier:0.1];

  LODWORD(v17) = 1132068864;
  v48 = v16;
  [v16 setPriority:v17];
  v40 = (void *)MEMORY[0x263F08938];
  v53 = [(UIView *)self->_buttonContainerView topAnchor];
  v52 = [(PUPhotosAssetDebugOverlayView *)self topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:10.0];
  v54[0] = v51;
  v50 = [(UIView *)self->_buttonContainerView trailingAnchor];
  v49 = [(PUPhotosAssetDebugOverlayView *)self trailingAnchor];
  v47 = [v50 constraintEqualToAnchor:v49 constant:-10.0];
  v54[1] = v47;
  v46 = [(UIView *)self->_buttonContainerView heightAnchor];
  v45 = [(UIView *)self->_buttonContainerView widthAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v54[2] = v44;
  v54[3] = v16;
  v43 = [(UIView *)self->_buttonImageView topAnchor];
  uint64_t v42 = [(UIView *)self->_buttonContainerView topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:10.0];
  v54[4] = v41;
  long long v39 = [(UIView *)self->_buttonImageView bottomAnchor];
  long long v38 = [(UIView *)self->_buttonContainerView bottomAnchor];
  long long v37 = [v39 constraintEqualToAnchor:v38 constant:-10.0];
  v54[5] = v37;
  long long v36 = [(UIView *)self->_buttonImageView leadingAnchor];
  v35 = [(UIView *)self->_buttonContainerView leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:10.0];
  v54[6] = v34;
  uint64_t v33 = [(UIView *)self->_buttonImageView trailingAnchor];
  id v32 = [(UIView *)self->_buttonContainerView trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-10.0];
  v54[7] = v31;
  v30 = [(UIButton *)self->_overlayButton topAnchor];
  v29 = [(UIView *)self->_buttonContainerView topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v54[8] = v28;
  v18 = [(UIButton *)self->_overlayButton bottomAnchor];
  uint64_t v19 = [(UIView *)self->_buttonContainerView bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v54[9] = v20;
  v21 = [(UIButton *)self->_overlayButton leadingAnchor];
  v22 = [(UIView *)self->_buttonContainerView leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v54[10] = v23;
  v24 = [(UIButton *)self->_overlayButton trailingAnchor];
  double v25 = [(UIView *)self->_buttonContainerView trailingAnchor];
  double v26 = [v24 constraintEqualToAnchor:v25];
  v54[11] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:12];
  [v40 activateConstraints:v27];
}

- (PUPhotosAssetDebugOverlayView)initWithClientIdentifier:(id)a3
{
  id v5 = a3;
  if (PUPhotosAssetViewShowDebugOverlayView())
  {
    v10.receiver = self;
    v10.super_class = (Class)PUPhotosAssetDebugOverlayView;
    id v6 = -[PUPhotosAssetDebugOverlayView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    objc_super v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_clientIdentifier, a3);
      [(PUPhotosAssetDebugOverlayView *)v7 _setupView];
    }
    self = v7;
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end