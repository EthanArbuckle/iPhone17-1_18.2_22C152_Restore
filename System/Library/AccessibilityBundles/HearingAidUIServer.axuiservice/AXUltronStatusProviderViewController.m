@interface AXUltronStatusProviderViewController
- (void)updateDisplay:(id)a3 confidence:(double)a4;
- (void)viewDidLoad;
@end

@implementation AXUltronStatusProviderViewController

- (void)viewDidLoad
{
  v68.receiver = self;
  v68.super_class = (Class)AXUltronStatusProviderViewController;
  [(AXUltronStatusProviderViewController *)&v68 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F22868]);
  v4 = (AXDispatchTimer *)[v3 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
  clearTimer = self->_clearTimer;
  self->_clearTimer = v4;

  id v6 = objc_alloc(MEMORY[0x263F1CB60]);
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(AXUltronStatusProviderViewController *)self view];
  [v12 addSubview:v11];

  v13 = [(AXUltronStatusProviderViewController *)self view];
  v14 = (void *)MEMORY[0x263F08938];
  v15 = [(AXUltronStatusProviderViewController *)self view];
  v16 = [v14 constraintWithItem:v11 attribute:7 relatedBy:0 toItem:v15 attribute:7 multiplier:0.25 constant:0.0];
  [v13 addConstraint:v16];

  v17 = [(AXUltronStatusProviderViewController *)self view];
  v18 = [MEMORY[0x263F08938] constraintWithItem:v11 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
  [v17 addConstraint:v18];

  v19 = [(AXUltronStatusProviderViewController *)self view];
  v20 = (void *)MEMORY[0x263F08938];
  v21 = [(AXUltronStatusProviderViewController *)self view];
  v22 = [v20 constraintWithItem:v11 attribute:6 relatedBy:0 toItem:v21 attribute:6 multiplier:1.0 constant:-10.0];
  [v19 addConstraint:v22];

  v23 = [(AXUltronStatusProviderViewController *)self view];
  v24 = (void *)MEMORY[0x263F08938];
  v25 = [(AXUltronStatusProviderViewController *)self view];
  v26 = [v24 constraintWithItem:v11 attribute:3 relatedBy:0 toItem:v25 attribute:3 multiplier:1.0 constant:10.0];
  [v23 addConstraint:v26];

  v27 = [v11 layer];
  [v27 setCornerRadius:8.0];

  v28 = [v11 layer];
  [v28 setBorderWidth:3.0];

  v29 = [MEMORY[0x263F1C550] blackColor];
  id v30 = [v29 colorWithAlphaComponent:1.0];
  uint64_t v31 = [v30 CGColor];
  v32 = [v11 layer];
  [v32 setBorderColor:v31];

  v33 = [MEMORY[0x263F1C550] yellowColor];
  v34 = [v33 colorWithAlphaComponent:0.85];
  [v11 setBackgroundColor:v34];

  v35 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v7, v8, v9, v10);
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 addSubview:v35];
  v36 = [(AXUltronStatusProviderViewController *)self view];
  v37 = [MEMORY[0x263F08938] constraintWithItem:v35 attribute:7 relatedBy:0 toItem:v11 attribute:7 multiplier:1.0 constant:-20.0];
  [v36 addConstraint:v37];

  v38 = [(AXUltronStatusProviderViewController *)self view];
  v39 = [MEMORY[0x263F08938] constraintWithItem:v35 attribute:10 relatedBy:0 toItem:v11 attribute:10 multiplier:1.0 constant:0.0];
  [v38 addConstraint:v39];

  v40 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v7, v8, v9, v10);
  listenType = self->_listenType;
  self->_listenType = v40;

  v42 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2B8] addingSymbolicTraits:32770 options:0];
  v43 = self->_listenType;
  v44 = (void *)MEMORY[0x263F1C658];
  [v42 pointSize];
  v45 = objc_msgSend(v44, "fontWithDescriptor:size:", v42);
  [(UILabel *)v43 setFont:v45];

  v46 = self->_listenType;
  v47 = [MEMORY[0x263F1C550] blackColor];
  [(UILabel *)v46 setTextColor:v47];

  [(UILabel *)self->_listenType setTextAlignment:0];
  [(UILabel *)self->_listenType setText:@"Sound Detections"];
  [(UILabel *)self->_listenType setClipsToBounds:0];
  [(UILabel *)self->_listenType setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 addSubview:self->_listenType];
  v48 = [(AXUltronStatusProviderViewController *)self view];
  v49 = [MEMORY[0x263F08938] constraintWithItem:self->_listenType attribute:5 relatedBy:0 toItem:v35 attribute:5 multiplier:1.0 constant:10.0];
  [v48 addConstraint:v49];

  v50 = [(AXUltronStatusProviderViewController *)self view];
  v51 = [MEMORY[0x263F08938] constraintWithItem:self->_listenType attribute:10 relatedBy:0 toItem:v35 attribute:10 multiplier:1.0 constant:0.0];
  [v50 addConstraint:v51];

  v52 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  confidence = self->_confidence;
  self->_confidence = v52;

  v54 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D300] addingSymbolicTraits:0x8000 options:0];

  v55 = self->_confidence;
  v56 = (void *)MEMORY[0x263F1C658];
  [v54 pointSize];
  v57 = objc_msgSend(v56, "fontWithDescriptor:size:", v54);
  [(UILabel *)v55 setFont:v57];

  v58 = self->_confidence;
  v59 = [MEMORY[0x263F1C550] blueColor];
  [(UILabel *)v58 setTextColor:v59];

  [(UILabel *)self->_confidence setTextAlignment:0];
  [(UILabel *)self->_confidence setClipsToBounds:0];
  [(UILabel *)self->_confidence setNumberOfLines:0];
  [(UILabel *)self->_confidence setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 addSubview:self->_confidence];
  v60 = [(AXUltronStatusProviderViewController *)self view];
  v61 = [MEMORY[0x263F08938] constraintWithItem:self->_confidence attribute:5 relatedBy:0 toItem:self->_listenType attribute:6 multiplier:1.0 constant:5.0];
  [v60 addConstraint:v61];

  v62 = [(AXUltronStatusProviderViewController *)self view];
  v63 = [MEMORY[0x263F08938] constraintWithItem:self->_confidence attribute:10 relatedBy:0 toItem:v35 attribute:10 multiplier:1.0 constant:0.0];
  [v62 addConstraint:v63];

  v64 = [(AXUltronStatusProviderViewController *)self view];
  v65 = [MEMORY[0x263F08938] constraintWithItem:v35 attribute:8 relatedBy:1 toItem:self->_listenType attribute:8 multiplier:1.0 constant:0.0];
  [v64 addConstraint:v65];

  v66 = [(AXUltronStatusProviderViewController *)self view];
  v67 = [MEMORY[0x263F08938] constraintWithItem:v35 attribute:8 relatedBy:1 toItem:self->_confidence attribute:8 multiplier:1.0 constant:0.0];
  [v66 addConstraint:v67];
}

- (void)updateDisplay:(id)a3 confidence:(double)a4
{
  id v6 = a3;
  [(AXDispatchTimer *)self->_clearTimer cancel];
  double v7 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke;
  v11[3] = &unk_2650A2340;
  id v12 = v6;
  v13 = self;
  double v14 = a4;
  id v8 = v6;
  [v7 animateWithDuration:v11 animations:0.2];
  clearTimer = self->_clearTimer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_2;
  v10[3] = &unk_2650A2318;
  v10[4] = self;
  [(AXDispatchTimer *)clearTimer afterDelay:v10 processBlock:5.0];
}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F21D38]])
  {
    v2 = *(void **)(*(void *)(a1 + 40) + 976);
    id v3 = @"Baby Crying";
  }
  else
  {
    if (([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F21D80]] & 1) == 0) {
      goto LABEL_6;
    }
    v2 = *(void **)(*(void *)(a1 + 40) + 976);
    id v3 = @"Shouting";
  }
  [v2 setText:v3];
LABEL_6:
  [*(id *)(*(void *)(a1 + 40) + 976) sizeToFit];
  v4 = AXFormatFloatWithPercentage();
  [*(id *)(*(void *)(a1 + 40) + 984) setText:v4];

  v5 = *(void **)(*(void *)(a1 + 40) + 984);

  return [v5 sizeToFit];
}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_3;
  v2[3] = &unk_2650A2318;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.2];
}

uint64_t __65__AXUltronStatusProviderViewController_updateDisplay_confidence___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) setText:@"Listening"];
  [*(id *)(*(void *)(a1 + 32) + 976) sizeToFit];
  v2 = *(void **)(*(void *)(a1 + 32) + 984);

  return [v2 setText:&stru_26F411CB0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearTimer, 0);
  objc_storeStrong((id *)&self->_confidence, 0);

  objc_storeStrong((id *)&self->_listenType, 0);
}

@end