@interface TextSettingsViewController
- (AXContentSizedTableView)tableView;
- (BOOL)selectedBoldTextEnabled;
- (BPSIllustratedWatchView)textPreviewIllustratedWatchView;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (BPSWatchView)textPreviewWatchView;
- (CGPoint)watchScreenInsetForDeviceSize:(unint64_t)a3 screenScale:(double)a4;
- (CGSize)watchScreenSizeForDeviceSize:(unint64_t)a3 screenScale:(double)a4;
- (NRDevice)device;
- (TextSettingsObserver)observer;
- (TextSettingsViewController)initWithDevice:(id)a3 observer:(id)a4;
- (UIImageView)watchScreenImageView;
- (UILabel)defaultTextSizeLabel;
- (id)_sliderTextImageWithSystemImageName:(id)a3;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)suggestedButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleString;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)defaultContentSizeValue;
- (unint64_t)selectedContentSizeValue;
- (void)alternateButtonPressed:(id)a3;
- (void)setDefaultContentSizeValue:(unint64_t)a3;
- (void)setDefaultTextSizeLabel:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)setObserver:(id)a3;
- (void)setSelectedBoldTextEnabled:(BOOL)a3;
- (void)setSelectedContentSizeValue:(unint64_t)a3;
- (void)setTableView:(id)a3;
- (void)setTextPreviewIllustratedWatchView:(id)a3;
- (void)setTextPreviewWatchView:(id)a3;
- (void)setWatchScreenImageView:(id)a3;
- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4;
- (void)suggestedButtonPressed:(id)a3;
- (void)switchToggled:(id)a3;
- (void)updateWatchScreenImageViewAndNotifyObserver:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TextSettingsViewController

- (TextSettingsViewController)initWithDevice:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TextSettingsViewController;
  v9 = [(TextSettingsViewController *)&v14 initWithTitle:&stru_C4E0 detailText:0 icon:0 contentLayout:3];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
    [(TextSettingsViewController *)v10 setStyle:10];
    v11 = [(TextSettingsViewController *)v10 device];
    [(TextSettingsViewController *)v10 setDefaultContentSizeValue:contentSizeValueOnDevice(v11)];

    [(TextSettingsViewController *)v10 setSelectedContentSizeValue:[(TextSettingsViewController *)v10 defaultContentSizeValue]];
    v12 = [(TextSettingsViewController *)v10 device];
    [(TextSettingsViewController *)v10 setSelectedBoldTextEnabled:boldTextIsEnabledOnDevice(v12)];
  }
  return v10;
}

- (void)viewDidLoad
{
  v99.receiver = self;
  v99.super_class = (Class)TextSettingsViewController;
  [(TextSettingsViewController *)&v99 viewDidLoad];
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  v6 = [(TextSettingsViewController *)self alternateChoiceButton];
  id v7 = [v6 titleLabel];
  [v7 setNumberOfLines:0];

  id v8 = [(TextSettingsViewController *)self alternateChoiceButton];
  v9 = [v8 titleLabel];
  [v9 setLineBreakMode:0];

  v10 = [AXContentSizedTableView alloc];
  v11 = [(TextSettingsViewController *)self contentView];
  [v11 bounds];
  v12 = -[AXContentSizedTableView initWithFrame:style:](v10, "initWithFrame:style:", 2);
  [(TextSettingsViewController *)self setTableView:v12];

  v13 = [(TextSettingsViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"AXBoldTextCellReuseIdentifier"];

  objc_super v14 = [(TextSettingsViewController *)self tableView];
  uint64_t v15 = objc_opt_class();
  v16 = +[AXSliderValueTableViewCell cellReuseIdentifier];
  [v14 registerClass:v15 forCellReuseIdentifier:v16];

  v17 = [(TextSettingsViewController *)self tableView];
  [v17 setRowHeight:UITableViewAutomaticDimension];

  v18 = [(TextSettingsViewController *)self tableView];
  [v18 setDelegate:self];

  v19 = [(TextSettingsViewController *)self tableView];
  [v19 setDataSource:self];

  v20 = BPSSeparatorColor();
  v21 = [(TextSettingsViewController *)self tableView];
  [v21 setSeparatorColor:v20];

  v22 = [(TextSettingsViewController *)self tableView];
  [v22 setScrollEnabled:0];

  v23 = [(TextSettingsViewController *)self tableView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  char v98 = 0;
  v24 = [(TextSettingsViewController *)self device];
  id v25 = contentSizeCategoryOnDeviceOrCompanion(v24, &v98);

  id v26 = objc_alloc_init((Class)UILabel);
  [(TextSettingsViewController *)self setDefaultTextSizeLabel:v26];

  if (v98) {
    v27 = @"companion.suggested.text.size";
  }
  else {
    v27 = @"default.suggested.text.size";
  }
  v28 = textSettingsLocalizedString(v27);
  v29 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v29 setText:v28];

  v30 = +[UIColor clearColor];
  v31 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v31 setBackgroundColor:v30];

  v32 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v32 setNumberOfLines:0];

  v33 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v33 setLineBreakMode:0];

  v34 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v35 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v35 setFont:v34];

  v36 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v36 setAdjustsFontForContentSizeCategory:1];

  v37 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v37 setTextAlignment:1];

  v38 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(TextSettingsViewController *)self device];
  id v40 = +[PBBridgeWatchAttributeController sizeFromDevice:v39];

  v41 = [(TextSettingsViewController *)self device];
  id v42 = +[PBBridgeWatchAttributeController materialFromDevice:v41];

  id v43 = [objc_alloc((Class)UIImageView) initWithImage:0];
  [(TextSettingsViewController *)self setWatchScreenImageView:v43];

  v44 = [(TextSettingsViewController *)self watchScreenImageView];
  [v44 setContentMode:1];

  if (_os_feature_enabled_impl())
  {
    id v45 = objc_msgSend(objc_alloc((Class)BPSIllustratedWatchView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(TextSettingsViewController *)self setTextPreviewIllustratedWatchView:v45];

    v46 = [(TextSettingsViewController *)self textPreviewIllustratedWatchView];
    v47 = [(TextSettingsViewController *)self watchScreenImageView];
    [v46 addSubview:v47];

    v48 = [(TextSettingsViewController *)self textPreviewIllustratedWatchView];
    [v48 watchScreenInsetGuide];
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;

    v57 = [(TextSettingsViewController *)self watchScreenImageView];
    objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

    id v58 = objc_alloc((Class)UIStackView);
    v59 = [(TextSettingsViewController *)self textPreviewIllustratedWatchView];
    v102[0] = v59;
    v60 = [(TextSettingsViewController *)self tableView];
    v102[1] = v60;
    v61 = [(TextSettingsViewController *)self defaultTextSizeLabel];
    v102[2] = v61;
    v62 = v102;
  }
  else
  {
    id v63 = [objc_alloc((Class)BPSWatchView) initWithStyle:2];
    [(TextSettingsViewController *)self setTextPreviewWatchView:v63];

    v64 = [(TextSettingsViewController *)self textPreviewWatchView];
    [v64 overrideMaterial:v42 size:v40];

    v65 = [(TextSettingsViewController *)self textPreviewWatchView];
    [v65 setTranslatesAutoresizingMaskIntoConstraints:0];

    v66 = [(TextSettingsViewController *)self textPreviewWatchView];
    v67 = [(TextSettingsViewController *)self watchScreenImageView];
    [v66 addSubview:v67];

    [(TextSettingsViewController *)self watchScreenSizeForDeviceSize:v40 screenScale:v5];
    double v69 = v68;
    double v71 = v70;
    [(TextSettingsViewController *)self watchScreenInsetForDeviceSize:v40 screenScale:v5];
    double v73 = v72;
    double v75 = v74;
    v76 = [(TextSettingsViewController *)self watchScreenImageView];
    objc_msgSend(v76, "setFrame:", v73, v75, v69, v71);

    id v58 = objc_alloc((Class)UIStackView);
    v59 = [(TextSettingsViewController *)self textPreviewWatchView];
    v101[0] = v59;
    v60 = [(TextSettingsViewController *)self tableView];
    v101[1] = v60;
    v61 = [(TextSettingsViewController *)self defaultTextSizeLabel];
    v101[2] = v61;
    v62 = v101;
  }
  v77 = +[NSArray arrayWithObjects:v62 count:3];
  id v78 = [v58 initWithArrangedSubviews:v77];

  [v78 setAxis:1];
  [v78 setAlignment:3];
  [v78 setBaselineRelativeArrangement:1];
  [v78 setSpacing:2.0];
  [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
  v79 = [(TextSettingsViewController *)self contentView];
  [v79 addSubview:v78];

  v97 = [(TextSettingsViewController *)self contentView];
  v96 = [v97 topAnchor];
  v95 = [v78 topAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v100[0] = v94;
  v93 = [(TextSettingsViewController *)self contentView];
  v92 = [v93 leadingAnchor];
  v91 = [v78 leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v100[1] = v90;
  v89 = [(TextSettingsViewController *)self contentView];
  v80 = [v89 trailingAnchor];
  v81 = [v78 trailingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  v100[2] = v82;
  v83 = [(TextSettingsViewController *)self contentView];
  v84 = [v83 bottomAnchor];
  v85 = [v78 bottomAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  v100[3] = v86;
  v87 = +[NSArray arrayWithObjects:v100 count:4];
  +[NSLayoutConstraint activateConstraints:v87];

  v88 = [(TextSettingsViewController *)self tableView];
  [v88 reloadData];

  [(TextSettingsViewController *)self updateWatchScreenImageViewAndNotifyObserver:1];
}

- (void)setSelectedContentSizeValue:(unint64_t)a3
{
  self->_selectedContentSizeValue = a3;
  BOOL v4 = [(TextSettingsViewController *)self defaultContentSizeValue] != a3;
  id v5 = [(TextSettingsViewController *)self defaultTextSizeLabel];
  [v5 setHidden:v4];
}

- (CGPoint)watchScreenInsetForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  if (a4 <= 2.0)
  {
    if (a3 == 2)
    {
      double v5 = 56.0;
      double v4 = 25.5;
      goto LABEL_17;
    }
    if (a3 == 7)
    {
      double v5 = 50.5;
      double v4 = 19.5;
      goto LABEL_17;
    }
    if (a3 != 8)
    {
      double v5 = 54.0;
      double v4 = 24.5;
      goto LABEL_17;
    }
    double v5 = 50.5;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 2uLL:
      double v5 = 74.0;
      double v4 = 32.0;
      break;
    case 7uLL:
      double v5 = 65.0;
LABEL_12:
      double v4 = 20.5;
      break;
    case 8uLL:
      double v4 = 21.0;
      double v5 = 66.0;
      break;
    default:
      double v4 = 30.0;
      double v5 = 71.0;
      break;
  }
LABEL_17:
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)watchScreenSizeForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  if (a4 <= 2.0)
  {
    switch(a3)
    {
      case 2uLL:
        double v4 = 85.0;
        uint64_t v6 = 0x4051000000000000;
        break;
      case 8uLL:
        double v4 = 95.0;
        double v5 = 78.0;
        goto LABEL_17;
      case 7uLL:
        double v4 = 98.0;
        uint64_t v6 = 0x4054000000000000;
        break;
      default:
        double v4 = 89.0;
        double v5 = 71.0;
        goto LABEL_17;
    }
    double v5 = *(double *)&v6;
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        double v4 = 108.0;
        double v5 = 86.0;
        break;
      case 8uLL:
        double v4 = 123.0;
        double v5 = 101.0;
        break;
      case 7uLL:
        double v4 = 126.0;
        double v5 = 103.0;
        break;
      default:
        double v4 = 113.0;
        double v5 = 90.0;
        break;
    }
  }
LABEL_17:
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)updateWatchScreenImageViewAndNotifyObserver:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TextSettingsViewController *)self isViewLoaded])
  {
    double v5 = [(TextSettingsViewController *)self device];
    uint64_t v6 = contentSizeCategoryOnDeviceForValue(v5, [(TextSettingsViewController *)self selectedContentSizeValue]);

    uint64_t v7 = [(TextSettingsViewController *)self selectedBoldTextEnabled];
    if (v3)
    {
      id v8 = [(TextSettingsViewController *)self observer];
      [v8 didSelectContentSizeCategory:v6 boldTextEnabled:v7];
    }
    v9 = cachedTextPreviewImage(v6, v7);
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
      AXPerformBlockOnMainThread();
    }
  }
}

void __74__TextSettingsViewController_updateWatchScreenImageViewAndNotifyObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) watchScreenImageView];
  [v3 setImage:v2];

  id v4 = [*(id *)(a1 + 32) watchScreenImageView];
  [v4 setNeedsDisplay];
}

- (id)titleString
{
  return textSettingsLocalizedString(@"text.settings.title");
}

- (id)detailString
{
  uint64_t v2 = [(TextSettingsViewController *)self device];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned int v4 = [v3 BOOLValue];

  if (v4) {
    textSettingsLocalizedTinkerString(@"text.settings.subtitle");
  }
  else {
  double v5 = textSettingsLocalizedString(@"text.settings.subtitle");
  }

  return v5;
}

- (id)suggestedButtonTitle
{
  return textSettingsLocalizedString(@"continue");
}

- (id)alternateButtonTitle
{
  return textSettingsLocalizedString(@"set.up.later");
}

- (void)suggestedButtonPressed:(id)a3
{
  uint64_t v4 = [(TextSettingsViewController *)self selectedContentSizeValue];
  double v5 = [(TextSettingsViewController *)self device];
  contentSizeSetValueOnDevice(v4, v5);

  uint64_t v6 = [(TextSettingsViewController *)self selectedBoldTextEnabled];
  uint64_t v7 = [(TextSettingsViewController *)self device];
  boldTextSetEnabledOnDevice(v6, v7);

  id v8 = [(TextSettingsViewController *)self miniFlowDelegate];
  [v8 miniFlowStepComplete:self];
}

- (void)alternateButtonPressed:(id)a3
{
  uint64_t v4 = [(TextSettingsViewController *)self device];
  [(TextSettingsViewController *)self setSelectedContentSizeValue:contentSizeValueOnDevice(v4)];

  double v5 = [(TextSettingsViewController *)self device];
  [(TextSettingsViewController *)self setSelectedBoldTextEnabled:boldTextIsEnabledOnDevice(v5)];

  [(TextSettingsViewController *)self updateWatchScreenImageViewAndNotifyObserver:1];
  uint64_t v6 = [(TextSettingsViewController *)self tableView];
  [v6 reloadData];

  id v7 = [(TextSettingsViewController *)self miniFlowDelegate];
  [v7 miniFlowStepComplete:self];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    id v8 = +[AXSliderValueTableViewCell cellReuseIdentifier];
    v9 = [v6 dequeueReusableCellWithIdentifier:v8 forIndexPath:v7];

    [v9 setDelegate:self];
    [v9 setMinimumValue:0.0];
    v10 = [(TextSettingsViewController *)self device];
    id v11 = contentSizeCategoriesOnDevice(v10);
    objc_msgSend(v9, "setMaximumValue:", (double)((unint64_t)objc_msgSend(v11, "count") - 1));

    v12 = [(TextSettingsViewController *)self device];
    [v9 setValue:(double)(unint64_t)contentSizeValueOnDevice(v12)];

    v13 = [(TextSettingsViewController *)self _sliderTextImageWithSystemImageName:@"textformat.size.smaller"];
    [v9 setMinimumValueImage:v13];

    id v14 = [(TextSettingsViewController *)self _sliderTextImageWithSystemImageName:@"textformat.size.larger"];
    [v9 setMaximumValueImage:v14];
  }
  else
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"AXBoldTextCellReuseIdentifier" forIndexPath:v7];
    uint64_t v15 = textSettingsLocalizedString(@"bold.text");
    v16 = [v9 textLabel];
    [v16 setText:v15];

    [v9 setSelectionStyle:0];
    id v14 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v17 = [(TextSettingsViewController *)self device];
    [v14 setOn:boldTextIsEnabledOnDevice(v17) animated:0];

    [v14 addTarget:self action:"switchToggled:" forControlEvents:4096];
    [v9 setAccessoryView:v14];
  }

  return v9;
}

- (void)switchToggled:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [v5 isOn];
  if (v4 != [(TextSettingsViewController *)self selectedBoldTextEnabled])
  {
    -[TextSettingsViewController setSelectedBoldTextEnabled:](self, "setSelectedBoldTextEnabled:", [v5 isOn]);
    [(TextSettingsViewController *)self updateWatchScreenImageViewAndNotifyObserver:1];
  }
}

- (id)_sliderTextImageWithSystemImageName:(id)a3
{
  id v3 = a3;
  unsigned int v4 = BPSFontWithSize();
  id v5 = BPSTextColor();
  id v6 = +[UIImageSymbolConfiguration configurationWithFont:v4];
  id v7 = +[UIImage systemImageNamed:v3];

  id v8 = [v7 imageByApplyingSymbolConfiguration:v6];
  v9 = [v8 imageWithTintColor:v5 renderingMode:1];

  return v9;
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  double v6 = (double)[(TextSettingsViewController *)self selectedContentSizeValue];
  if (v6 != a4)
  {
    -[TextSettingsViewController setSelectedContentSizeValue:](self, "setSelectedContentSizeValue:", (unint64_t)a4, v6);
    [(TextSettingsViewController *)self updateWatchScreenImageViewAndNotifyObserver:1];
  }
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (NRDevice)device
{
  return self->_device;
}

- (TextSettingsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (TextSettingsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (AXContentSizedTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (BPSWatchView)textPreviewWatchView
{
  return self->_textPreviewWatchView;
}

- (void)setTextPreviewWatchView:(id)a3
{
}

- (BPSIllustratedWatchView)textPreviewIllustratedWatchView
{
  return self->_textPreviewIllustratedWatchView;
}

- (void)setTextPreviewIllustratedWatchView:(id)a3
{
}

- (UIImageView)watchScreenImageView
{
  return self->_watchScreenImageView;
}

- (void)setWatchScreenImageView:(id)a3
{
}

- (unint64_t)selectedContentSizeValue
{
  return self->_selectedContentSizeValue;
}

- (BOOL)selectedBoldTextEnabled
{
  return self->_selectedBoldTextEnabled;
}

- (void)setSelectedBoldTextEnabled:(BOOL)a3
{
  self->_selectedBoldTextEnabled = a3;
}

- (UILabel)defaultTextSizeLabel
{
  return self->_defaultTextSizeLabel;
}

- (void)setDefaultTextSizeLabel:(id)a3
{
}

- (unint64_t)defaultContentSizeValue
{
  return self->_defaultContentSizeValue;
}

- (void)setDefaultContentSizeValue:(unint64_t)a3
{
  self->_defaultContentSizeValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextSizeLabel, 0);
  objc_storeStrong((id *)&self->_watchScreenImageView, 0);
  objc_storeStrong((id *)&self->_textPreviewIllustratedWatchView, 0);
  objc_storeStrong((id *)&self->_textPreviewWatchView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->miniFlowDelegate);
}

@end