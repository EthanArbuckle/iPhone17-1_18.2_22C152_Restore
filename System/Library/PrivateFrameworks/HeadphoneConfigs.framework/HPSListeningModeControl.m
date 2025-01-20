@interface HPSListeningModeControl
- (BOOL)autoANCSupported;
- (BOOL)modeOffSupported;
- (BOOL)updateModeOffSupported:(id)a3;
- (BluetoothDeviceProtocol)device;
- (HPSListeningModeControl)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSMutableArray)modeControlLabelXPositionConstraints;
- (double)_validSegmentCount;
- (id)_locKeyForFailedToSelectIndex:(int64_t)a3;
- (id)getListeningModeString:(int)a3;
- (int)_modeForIndex:(int64_t)a3;
- (int)getListeningModeFromIndex:(int64_t)a3;
- (int64_t)_indexForMode:(int)a3;
- (int64_t)getIndexFromListeningMode:(int)a3;
- (void)_handleListeningModeSetFailure:(int)a3 index:(int64_t)a4;
- (void)_updateLabelLayoutForBounds;
- (void)addModeLabels;
- (void)addModeOptions;
- (void)initCommon;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)refreshListeningMode;
- (void)resetUI;
- (void)segmentControlValueChanged:(id)a3;
- (void)setAutoANCSupported:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setModeControlLabelXPositionConstraints:(id)a3;
- (void)setModeOffSupported:(BOOL)a3;
- (void)settingsChangedHandler:(id)a3;
- (void)setupConstraints;
- (void)startObservingOffModeChanges:(id)a3;
@end

@implementation HPSListeningModeControl

- (HPSListeningModeControl)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HPSListeningModeControl;
  v4 = [(HPSListeningModeControl *)&v7 initWithStyle:a3 reuseIdentifier:0];
  v5 = v4;
  if (v4) {
    [(HPSListeningModeControl *)v4 initCommon];
  }
  return v5;
}

- (void)initCommon
{
  self->_autoANCSupported = 0;
  self->_modeOffSupported = 1;
  v3 = [MEMORY[0x1E4F1CA48] array];
  modeControlLabelXPositionConstraints = self->_modeControlLabelXPositionConstraints;
  self->_modeControlLabelXPositionConstraints = v3;

  v5 = [(HPSListeningModeControl *)self contentView];
  v6 = [v5 layer];
  [v6 setMasksToBounds:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_settingsChangedHandler_ name:*MEMORY[0x1E4F50AE0] object:0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HPSListeningModeControl;
  id v4 = a3;
  [(PSTableCell *)&v10 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 userInfo];

  v6 = +[HPSDevice deviceKey];
  id v7 = [v5 objectForKeyedSubscript:v6];
  device = self->_device;
  self->_device = v7;

  if (self->_device)
  {
    -[HPSListeningModeControl startObservingOffModeChanges:](self, "startObservingOffModeChanges:");
    self->_autoANCSupported = [(BluetoothDeviceProtocol *)self->_device getAutoANCSupport];
    self->_modeOffSupported = [(HPSListeningModeControl *)self updateModeOffSupported:self->_device];
    v9 = [(BluetoothDeviceProtocol *)self->_device name];
    NSLog(&cfstr_ListeningModeR.isa, v9, self->_autoANCSupported, self->_modeOffSupported);
  }
  else
  {
    NSLog(&cfstr_ListeningModeR_0.isa);
  }
  [(HPSListeningModeControl *)self addModeOptions];
  [(HPSListeningModeControl *)self addModeLabels];
  [(HPSListeningModeControl *)self refreshListeningMode];
  [(HPSListeningModeControl *)self setupConstraints];
  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel_segmentControlValueChanged_ forControlEvents:4096];
}

- (void)addModeOptions
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (!self->_segmentedControl)
  {
    v3 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v3;

    [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(HPSListeningModeControl *)self contentView];
    [v5 addSubview:self->_segmentedControl];

    v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:25.0];
    unint64_t v7 = 0x1E4FB1000uLL;
    if (self->_modeOffSupported)
    {
      v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.closed.fill"];
      v9 = (void *)MEMORY[0x1E4FB1830];
      objc_super v10 = [MEMORY[0x1E4FB1618] systemGrayColor];
      v24[0] = v10;
      v11 = [MEMORY[0x1E4FB1618] labelColor];
      v24[1] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      v13 = [v9 configurationWithPaletteColors:v12];
      v14 = [v8 imageByApplyingSymbolConfiguration:v13];
      v15 = [v14 imageByApplyingSymbolConfiguration:v6];

      unint64_t v7 = 0x1E4FB1000;
      [(UISegmentedControl *)self->_segmentedControl insertSegmentWithImage:v15 atIndex:0 animated:0];

      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = 0;
    }
    v17 = [*(id *)(v7 + 2072) _systemImageNamed:@"person.open.fill"];
    v18 = [v17 imageByApplyingSymbolConfiguration:v6];

    uint64_t v19 = v16 + 1;
    [(UISegmentedControl *)self->_segmentedControl insertSegmentWithImage:v18 atIndex:v16 animated:0];
    if (self->_autoANCSupported)
    {
      v20 = [*(id *)(v7 + 2072) _systemImageNamed:@"person.and.sparkles.fill"];
      v21 = [v20 imageByApplyingSymbolConfiguration:v6];

      [(UISegmentedControl *)self->_segmentedControl insertSegmentWithImage:v21 atIndex:v16 + 1 animated:0];
      NSLog(&cfstr_ListeningModeA.isa);

      uint64_t v19 = v16 | 2;
    }
    v22 = [*(id *)(v7 + 2072) _systemImageNamed:@"person.closed.fill"];
    v23 = [v22 imageByApplyingSymbolConfiguration:v6];

    [(UISegmentedControl *)self->_segmentedControl insertSegmentWithImage:v23 atIndex:v19 animated:0];
    NSLog(&cfstr_ListeningModeA_0.isa);
  }
}

- (void)addModeLabels
{
  if (!self->_labelTransparency)
  {
    v3 = [HPSListeningModeLabel alloc];
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"ACTIVE_PASS_THROUGH" value:&stru_1F4097960 table:@"DeviceConfig"];
    v6 = [(HPSListeningModeLabel *)v3 initWithText:v5];
    labelTransparency = self->_labelTransparency;
    self->_labelTransparency = v6;

    v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 objectForKey:*MEMORY[0x1E4F1C438]];
    objc_super v10 = [v9 lowercaseString];
    int v11 = [v10 isEqualToString:@"en"];

    if (v11)
    {
      LODWORD(v12) = 0.5;
      [(UILabel *)self->_labelTransparency _setHyphenationFactor:v12];
    }
    [(UILabel *)self->_labelTransparency sizeToFit];
    if (self->_modeOffSupported)
    {
      v13 = [HPSListeningModeLabel alloc];
      v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"BYPASS" value:&stru_1F4097960 table:@"DeviceConfig"];
      uint64_t v16 = [(HPSListeningModeLabel *)v13 initWithText:v15];
      labelOff = self->_labelOff;
      self->_labelOff = v16;

      [(UILabel *)self->_labelOff sizeToFit];
      v18 = [(HPSListeningModeControl *)self contentView];
      [v18 addSubview:self->_labelOff];
    }
    uint64_t v19 = [HPSListeningModeLabel alloc];
    v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"ACTIVE_NOISE_CANCELLATION" value:&stru_1F4097960 table:@"DeviceConfig"];
    v22 = [(HPSListeningModeLabel *)v19 initWithText:v21];
    labelNoiseCancellation = self->_labelNoiseCancellation;
    self->_labelNoiseCancellation = v22;

    [(UILabel *)self->_labelNoiseCancellation setNumberOfLines:0];
    [(UILabel *)self->_labelNoiseCancellation sizeToFit];
    v24 = [[HPSListeningModeLabel alloc] initWithText:@"Place AirPods Max On Your Head To Use Noise Cancellation."];
    labelUnableToSetListeningMode = self->_labelUnableToSetListeningMode;
    self->_labelUnableToSetListeningMode = &v24->super;

    [(UILabel *)self->_labelUnableToSetListeningMode setNumberOfLines:0];
    [(UILabel *)self->_labelUnableToSetListeningMode sizeToFit];
    [(UILabel *)self->_labelUnableToSetListeningMode setAlpha:0.01];
    v26 = [(HPSListeningModeControl *)self contentView];
    [v26 addSubview:self->_labelTransparency];

    v27 = [(HPSListeningModeControl *)self contentView];
    [v27 addSubview:self->_labelNoiseCancellation];

    v28 = [(HPSListeningModeControl *)self contentView];
    [v28 addSubview:self->_labelUnableToSetListeningMode];

    NSLog(&cfstr_ListeningModeA_1.isa);
    if (self->_autoANCSupported)
    {
      v29 = [HPSListeningModeLabel alloc];
      v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"AUTO_ANC" value:&stru_1F4097960 table:@"DeviceConfig-B698"];
      v32 = [(HPSListeningModeLabel *)v29 initWithText:v31];
      labelAutoANC = self->_labelAutoANC;
      self->_labelAutoANC = v32;

      [(UILabel *)self->_labelAutoANC sizeToFit];
      v34 = [(HPSListeningModeControl *)self contentView];
      [v34 addSubview:self->_labelAutoANC];

      NSLog(&cfstr_ListeningModeA_2.isa);
    }
  }
}

- (void)layoutSubviews
{
  NSLog(&cfstr_ListeningModeL.isa, a2);
  v5.receiver = self;
  v5.super_class = (Class)HPSListeningModeControl;
  [(PSTableCell *)&v5 layoutSubviews];
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(HPSListeningModeControl *)self setBackgroundColor:v3];

  [(HPSListeningModeControl *)self _updateLabelLayoutForBounds];
  id v4 = [(HPSListeningModeControl *)self layer];
  [v4 setMasksToBounds:0];
}

- (void)setupConstraints
{
  v110[4] = *MEMORY[0x1E4F143B8];
  v3 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    NSLog(&cfstr_ListeningModeS.isa);
    v83 = (void *)MEMORY[0x1E4F28DC8];
    v95 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
    v101 = [(HPSListeningModeControl *)self contentView];
    v89 = [v101 topAnchor];
    v86 = [v95 constraintEqualToAnchor:v89];
    v110[0] = v86;
    v85 = [(UISegmentedControl *)self->_segmentedControl heightAnchor];
    v84 = [v85 constraintEqualToConstant:50.0];
    v110[1] = v84;
    objc_super v5 = [(UISegmentedControl *)self->_segmentedControl leadingAnchor];
    v6 = [(HPSListeningModeControl *)self contentView];
    unint64_t v7 = [v6 leadingAnchor];
    v8 = [v5 constraintEqualToAnchor:v7];
    v110[2] = v8;
    v9 = [(UISegmentedControl *)self->_segmentedControl trailingAnchor];
    objc_super v10 = [(HPSListeningModeControl *)self contentView];
    int v11 = [v10 trailingAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11];
    v110[3] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:4];
    [v83 activateConstraints:v13];

    v14 = [(HPSListeningModeControl *)self contentView];
    [v14 frame];
    double v16 = v15;
    [(HPSListeningModeControl *)self _validSegmentCount];
    double v18 = v16 / v17;

    double v19 = v18 * 0.5;
    if (self->_modeOffSupported)
    {
      v90 = (void *)MEMORY[0x1E4F28DC8];
      v102 = [(UILabel *)self->_labelOff topAnchor];
      v96 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
      v20 = [v102 constraintEqualToAnchor:v96 constant:5.0];
      v109[0] = v20;
      v21 = [(UILabel *)self->_labelOff widthAnchor];
      v22 = [v21 constraintEqualToConstant:v18];
      v109[1] = v22;
      v23 = [(UILabel *)self->_labelOff bottomAnchor];
      v24 = [(HPSListeningModeControl *)self contentView];
      v25 = [v24 bottomAnchor];
      v26 = [v23 constraintLessThanOrEqualToAnchor:v25];
      v109[2] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:3];
      [v90 activateConstraints:v27];

      v28 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
      v29 = [(UILabel *)self->_labelOff centerXAnchor];
      v30 = [(HPSListeningModeControl *)self contentView];
      v31 = [v30 leadingAnchor];
      v32 = [v29 constraintEqualToAnchor:v31 constant:v18 * 0.5];
      [v28 addObject:v32];

      double v19 = v18 + v19;
    }
    v91 = (void *)MEMORY[0x1E4F28DC8];
    v103 = [(UILabel *)self->_labelTransparency topAnchor];
    v97 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
    v33 = [v103 constraintEqualToAnchor:v97 constant:5.0];
    v108[0] = v33;
    v34 = [(UILabel *)self->_labelTransparency widthAnchor];
    v35 = [v34 constraintEqualToConstant:v18];
    v108[1] = v35;
    v36 = [(UILabel *)self->_labelTransparency bottomAnchor];
    v37 = [(HPSListeningModeControl *)self contentView];
    v38 = [v37 bottomAnchor];
    v39 = [v36 constraintLessThanOrEqualToAnchor:v38];
    v108[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:3];
    [v91 activateConstraints:v40];

    v41 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
    v42 = [(UILabel *)self->_labelTransparency centerXAnchor];
    v43 = [(HPSListeningModeControl *)self contentView];
    v44 = [v43 leadingAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:v19];
    [v41 addObject:v45];

    double v46 = v18 + v19;
    if (self->_autoANCSupported)
    {
      v92 = (void *)MEMORY[0x1E4F28DC8];
      v104 = [(UILabel *)self->_labelAutoANC topAnchor];
      v98 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
      v47 = [v104 constraintEqualToAnchor:v98 constant:5.0];
      v107[0] = v47;
      v48 = [(UILabel *)self->_labelAutoANC widthAnchor];
      v49 = [v48 constraintEqualToConstant:v18];
      v107[1] = v49;
      v50 = [(UILabel *)self->_labelAutoANC bottomAnchor];
      v51 = [(HPSListeningModeControl *)self contentView];
      v52 = [v51 bottomAnchor];
      v53 = [v50 constraintLessThanOrEqualToAnchor:v52];
      v107[2] = v53;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
      [v92 activateConstraints:v54];

      v55 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
      v56 = [(UILabel *)self->_labelAutoANC centerXAnchor];
      v57 = [(HPSListeningModeControl *)self contentView];
      v58 = [v57 leadingAnchor];
      v59 = [v56 constraintEqualToAnchor:v58 constant:v46];
      [v55 addObject:v59];

      double v46 = v18 + v46;
    }
    v87 = (void *)MEMORY[0x1E4F28DC8];
    v99 = [(UILabel *)self->_labelNoiseCancellation topAnchor];
    v93 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
    v60 = [v99 constraintEqualToAnchor:v93 constant:5.0];
    v106[0] = v60;
    v61 = [(UILabel *)self->_labelNoiseCancellation widthAnchor];
    v62 = [v61 constraintEqualToConstant:v18];
    v106[1] = v62;
    v63 = [(UILabel *)self->_labelNoiseCancellation bottomAnchor];
    v64 = [(HPSListeningModeControl *)self contentView];
    v65 = [v64 bottomAnchor];
    v66 = [v63 constraintLessThanOrEqualToAnchor:v65];
    v106[2] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:3];
    [v87 activateConstraints:v67];

    v88 = (void *)MEMORY[0x1E4F28DC8];
    v100 = [(UILabel *)self->_labelUnableToSetListeningMode topAnchor];
    v94 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
    v68 = [v100 constraintEqualToAnchor:v94 constant:5.0];
    v105[0] = v68;
    v69 = [(UILabel *)self->_labelUnableToSetListeningMode leadingAnchor];
    v70 = [(UISegmentedControl *)self->_segmentedControl leadingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    v105[1] = v71;
    v72 = [(UILabel *)self->_labelUnableToSetListeningMode trailingAnchor];
    v73 = [(UISegmentedControl *)self->_segmentedControl trailingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73];
    v105[2] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:3];
    [v88 activateConstraints:v75];

    v76 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
    v77 = [(UILabel *)self->_labelNoiseCancellation centerXAnchor];
    v78 = [(HPSListeningModeControl *)self contentView];
    v79 = [v78 leadingAnchor];
    v80 = [v77 constraintEqualToAnchor:v79 constant:v46];
    [v76 addObject:v80];

    v81 = (void *)MEMORY[0x1E4F28DC8];
    v82 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
    [v81 activateConstraints:v82];
  }
}

- (int)getListeningModeFromIndex:(int64_t)a3
{
  uint64_t v5 = -[HPSListeningModeControl _modeForIndex:](self, "_modeForIndex:");
  int v6 = v5;
  unint64_t v7 = [(HPSListeningModeControl *)self getListeningModeString:v5];
  NSLog(&cfstr_ListeningModeG.isa, a3, v7);

  return v6;
}

- (int64_t)getIndexFromListeningMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v5 = -[HPSListeningModeControl _indexForMode:](self, "_indexForMode:");
  int v6 = [(HPSListeningModeControl *)self getListeningModeString:v3];
  NSLog(&cfstr_ListeningModeG_0.isa, v6, v5);

  return v5;
}

- (id)getListeningModeString:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6EA8798[a3 - 1];
  }
}

- (void)settingsChangedHandler:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_ListeningModeS_0.isa);
  id v7 = [v4 object];

  int64_t v5 = [v7 address];
  int v6 = [(BluetoothDeviceProtocol *)self->_device address];

  if (v5 == v6) {
    [(HPSListeningModeControl *)self refreshListeningMode];
  }
}

- (void)refreshListeningMode
{
  uint64_t v3 = [(BluetoothDeviceProtocol *)self->_device listeningMode];
  id v4 = [(HPSListeningModeControl *)self getListeningModeString:v3];
  NSLog(&cfstr_ListeningModeR_1.isa, v4);

  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:[(HPSListeningModeControl *)self getIndexFromListeningMode:v3]];
  BOOL autoANCSupported = self->_autoANCSupported;
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v7 = [NSNumber numberWithInteger:v3];
  if (autoANCSupported)
  {
    id v11 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, @"ListeningModesV2ValueOnly", 0);

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = v8;
    objc_super v10 = @"HPSSetListeningModeUpdated";
  }
  else
  {
    id v11 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, @"ListeningModesValueOnly", 0);

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = v8;
    objc_super v10 = @"BTAccessorySetListeningModeUpdated";
  }
  [v8 postNotificationName:v10 object:0 userInfo:v11];
}

- (void)segmentControlValueChanged:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  uint64_t v5 = [(HPSListeningModeControl *)self getListeningModeFromIndex:v4];
  NSLog(&cfstr_ListeningModeS_1.isa, v4, v5);
  if (([(BluetoothDeviceProtocol *)self->_device setListeningMode:v5] & 1) == 0) {
    [(HPSListeningModeControl *)self _handleListeningModeSetFailure:v5 index:v4];
  }
  BOOL autoANCSupported = self->_autoANCSupported;
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v8 = [NSNumber numberWithInteger:v5];
  if (autoANCSupported)
  {
    id v12 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, @"ListeningModesV2", 0);

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v10 = v9;
    id v11 = @"HPSSetListeningModeUpdated";
  }
  else
  {
    id v12 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, @"ListeningModes", 0);

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v10 = v9;
    id v11 = @"BTAccessorySetListeningModeUpdated";
  }
  [v9 postNotificationName:v11 object:0 userInfo:v12];
}

- (void)resetUI
{
  NSLog(&cfstr_ListeningModeU.isa, a2);
  [(HPSListeningModeControl *)self setAlpha:0.0];
  [(UISegmentedControl *)self->_segmentedControl removeFromSuperview];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = 0;

  [(UILabel *)self->_labelTransparency removeFromSuperview];
  labelTransparency = self->_labelTransparency;
  self->_labelTransparency = 0;

  [(UILabel *)self->_labelOff removeFromSuperview];
  [(UILabel *)self->_labelNoiseCancellation removeFromSuperview];
  [(UILabel *)self->_labelUnableToSetListeningMode removeFromSuperview];
  [(UILabel *)self->_labelAutoANC removeFromSuperview];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  modeControlLabelXPositionConstraints = self->_modeControlLabelXPositionConstraints;
  self->_modeControlLabelXPositionConstraints = v5;

  self->_modeOffSupported = [(HPSListeningModeControl *)self updateModeOffSupported:self->_device];
  [(HPSListeningModeControl *)self addModeOptions];
  [(HPSListeningModeControl *)self addModeLabels];
  [(HPSListeningModeControl *)self refreshListeningMode];
  [(HPSListeningModeControl *)self setupConstraints];
  [(HPSListeningModeControl *)self layoutIfNeeded];

  [(HPSListeningModeControl *)self setAlpha:1.0];
}

- (void)_updateLabelLayoutForBounds
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HPSListeningModeControl *)self contentView];
  [v3 bounds];
  double v5 = v4;
  [(HPSListeningModeControl *)self _validSegmentCount];
  double v7 = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(HPSListeningModeControl *)self modeControlLabelXPositionConstraints];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = v5 / v7;
    double v12 = v11 * 0.5;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14) setConstant:v12];
        double v12 = v11 + v12;
        ++v14;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_handleListeningModeSetFailure:(int)a3 index:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  [(HPSListeningModeControl *)self setUserInteractionEnabled:0];
  uint64_t v7 = [(BluetoothDeviceProtocol *)self->_device listeningMode];
  v8 = [(HPSListeningModeControl *)self _locKeyForFailedToSelectIndex:a4];
  int v9 = [(BluetoothDeviceProtocol *)self->_device productId];
  if (v9 == 8224 || v9 == 8219)
  {
    double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v12 = v11;
    uint64_t v13 = @"DeviceConfig-B768";
  }
  else
  {
    if (v9 != 8206)
    {
      uint64_t v14 = +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:");
      goto LABEL_11;
    }
    double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v12 = v11;
    uint64_t v13 = @"DeviceConfig";
  }
  uint64_t v14 = [v11 localizedStringForKey:v8 value:&stru_1F4097960 table:v13];

LABEL_11:
  [(UILabel *)self->_labelUnableToSetListeningMode setText:v14];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:[(HPSListeningModeControl *)self getIndexFromListeningMode:v7]];
  long long v15 = [(HPSListeningModeControl *)self getListeningModeString:v5];
  long long v16 = [(HPSListeningModeControl *)self getListeningModeString:v7];
  NSLog(&cfstr_ListeningModeN.isa, v15, v16, [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex]);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke;
  v18[3] = &unk_1E6EA82F0;
  v18[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_2;
  v17[3] = &unk_1E6EA8778;
  v17[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:v17 completion:1.0];
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1216) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1208) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1224) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1232) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_3;
  v3[3] = &unk_1E6EA82F0;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_4;
  v2[3] = &unk_1E6EA8778;
  v2[4] = v4;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v3 options:v2 animations:1.0 completion:1.0];
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1216) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1208) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1224) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1232) setAlpha:0.01];
  v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

uint64_t __64__HPSListeningModeControl__handleListeningModeSetFailure_index___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserInteractionEnabled:1];
}

- (double)_validSegmentCount
{
  if (!self->_autoANCSupported)
  {
    if (!self->_modeOffSupported) {
      return 2.0;
    }
    return 3.0;
  }
  double result = 4.0;
  if (!self->_modeOffSupported) {
    return 3.0;
  }
  return result;
}

- (id)_locKeyForFailedToSelectIndex:(int64_t)a3
{
  BOOL autoANCSupported = self->_autoANCSupported;
  uint64_t v5 = @"NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR";
  if (autoANCSupported)
  {
    BOOL v6 = !self->_modeOffSupported;
    uint64_t v7 = 1;
    if (!v6) {
      uint64_t v7 = 2;
    }
    if (v7 == a3) {
      v8 = @"NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR_ADAPTIVE";
    }
    else {
      v8 = @"NOISE_CONTROL_MODE_REQUIRES_BOTH_BUDS_IN_EAR";
    }
    uint64_t v5 = v8;
  }

  return v5;
}

- (BOOL)autoANCSupported
{
  return self->_autoANCSupported;
}

- (void)setAutoANCSupported:(BOOL)a3
{
  self->_BOOL autoANCSupported = a3;
}

- (BOOL)modeOffSupported
{
  return self->_modeOffSupported;
}

- (void)setModeOffSupported:(BOOL)a3
{
  self->_modeOffSupported = a3;
}

- (BluetoothDeviceProtocol)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSMutableArray)modeControlLabelXPositionConstraints
{
  return self->_modeControlLabelXPositionConstraints;
}

- (void)setModeControlLabelXPositionConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeControlLabelXPositionConstraints, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_labelUnableToSetListeningMode, 0);
  objc_storeStrong((id *)&self->_labelNoiseCancellation, 0);
  objc_storeStrong((id *)&self->_labelOff, 0);
  objc_storeStrong((id *)&self->_labelTransparency, 0);
  objc_storeStrong((id *)&self->_labelAutoANC, 0);

  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

- (int)_modeForIndex:(int64_t)a3
{
  uint64_t v4 = self;
  LODWORD(a3) = sub_1E4CA42A4(a3);

  return a3;
}

- (int64_t)_indexForMode:(int)a3
{
  uint64_t v4 = self;
  int64_t v5 = sub_1E4CA46EC(a3);

  return v5;
}

- (void)startObservingOffModeChanges:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v5 = self;
  sub_1E4CA4860(a3);
  swift_unknownObjectRelease();
}

- (BOOL)updateModeOffSupported:(id)a3
{
  swift_unknownObjectRetain();
  int64_t v5 = self;
  BOOL v6 = sub_1E4CA5ADC((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

@end