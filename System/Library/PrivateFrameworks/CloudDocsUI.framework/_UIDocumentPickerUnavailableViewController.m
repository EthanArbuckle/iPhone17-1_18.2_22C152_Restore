@interface _UIDocumentPickerUnavailableViewController
- (NSLayoutConstraint)imageToTitleConstraint;
- (NSLayoutConstraint)textToButtonConstraint;
- (NSLayoutConstraint)textToTextConstraint;
- (NSLayoutConstraint)titleToTextConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSURL)buttonURL;
- (UIButton)button;
- (UIImageView)leadImageView;
- (UILabel)textLabel;
- (UILabel)textLabel2;
- (UILabel)titleLabel;
- (_UIDocumentPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_buttonBackgroundImageForState:(unint64_t)a3 traits:(id)a4;
- (void)_buttonPressed:(id)a3;
- (void)_fontSizeDidChange:(id)a3;
- (void)dealloc;
- (void)setButton:(id)a3;
- (void)setButtonURL:(id)a3;
- (void)setImageToTitleConstraint:(id)a3;
- (void)setLeadImageView:(id)a3;
- (void)setTextLabel2:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextToButtonConstraint:(id)a3;
- (void)setTextToTextConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleToTextConstraint:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UIDocumentPickerUnavailableViewController

- (_UIDocumentPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v156[2] = *MEMORY[0x263EF8340];
  v153.receiver = self;
  v153.super_class = (Class)_UIDocumentPickerUnavailableViewController;
  v4 = [(_UIDocumentPickerUnavailableViewController *)&v153 initWithNibName:a3 bundle:a4];
  if (!v4) {
    return v4;
  }
  v5 = (void *)MEMORY[0x263F1C658];
  v6 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260] addingSymbolicTraits:0 options:1];
  uint64_t v7 = [v5 fontWithDescriptor:v6 size:0.0];

  v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v9 = [v8 localizedStringForKey:@"iCloud Drive[unavailable nav title]" value:@"iCloud Drive" table:@"Localizable"];
  [(_UIDocumentPickerUnavailableViewController *)v4 setTitle:v9];

  [(_UIDocumentPickerUnavailableViewController *)v4 setEdgesForExtendedLayout:0];
  id v10 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  [(_UIDocumentPickerUnavailableViewController *)v4 setLeadImageView:v10];

  v11 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v12 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  [v11 addSubview:v12];

  v13 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  v15 = [v14 centerXAnchor];
  v16 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v17 = [v16 centerXAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  v20 = [v19 topAnchor];
  v21 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v22 = [v21 topAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [(_UIDocumentPickerUnavailableViewController *)v4 setTopConstraint:v23];

  v24 = [(_UIDocumentPickerUnavailableViewController *)v4 topConstraint];
  [v24 setActive:1];

  id v25 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(_UIDocumentPickerUnavailableViewController *)v4 setTitleLabel:v25];

  v26 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  [v26 setNumberOfLines:1];

  v27 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  [v27 setTextAlignment:1];

  v28 = [MEMORY[0x263F1C658] _lightSystemFontOfSize:32.0];
  v29 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  [v29 setFont:v28];

  v30 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v31 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  [v30 addSubview:v31];

  v32 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  v34 = [v33 centerXAnchor];
  v35 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v36 = [v35 centerXAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  v39 = [v38 lastBaselineAnchor];
  v40 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  v41 = [v40 bottomAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  [(_UIDocumentPickerUnavailableViewController *)v4 setImageToTitleConstraint:v42];

  v43 = [(_UIDocumentPickerUnavailableViewController *)v4 imageToTitleConstraint];
  [v43 setActive:1];

  id v44 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(_UIDocumentPickerUnavailableViewController *)v4 setTextLabel:v44];

  v45 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  [v45 setNumberOfLines:0];

  v46 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  [v46 setTextAlignment:1];

  v47 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v152 = (void *)v7;
  [v47 setFont:v7];

  v48 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v49 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  [v48 addSubview:v49];

  v50 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

  v141 = (void *)MEMORY[0x263F08938];
  v150 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v146 = [v150 leftAnchor];
  v148 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v143 = [v148 layoutMarginsGuide];
  v51 = [v143 leftAnchor];
  v52 = [v146 constraintEqualToAnchor:v51];
  v156[0] = v52;
  v53 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v54 = [v53 rightAnchor];
  v55 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
  v56 = [v55 layoutMarginsGuide];
  v57 = [v56 rightAnchor];
  v58 = [v54 constraintEqualToAnchor:v57];
  v156[1] = v58;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:2];
  [v141 activateConstraints:v59];

  v60 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v61 = [v60 firstBaselineAnchor];
  v62 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  v63 = [v62 lastBaselineAnchor];
  v64 = [v61 constraintEqualToAnchor:v63];
  [(_UIDocumentPickerUnavailableViewController *)v4 setTitleToTextConstraint:v64];

  v65 = [(_UIDocumentPickerUnavailableViewController *)v4 titleToTextConstraint];
  [v65 setActive:1];

  if (+[_UIDocumentPickerDescriptor cloudMigrationStatus] <= 1)
  {
    v66 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v67 = [v66 localizedStringForKey:@"iCloud Drive[unavailable view title]" value:@"iCloud Drive" table:@"Localizable"];

    v68 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v69 = [v68 localizedStringForKey:@"NO_ICLOUD_MIGRATION_TEXT" value:@"Store your files in iCloud and access them anytime on all your devices." table:@"Localizable"];

    v70 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v71 = [v70 localizedStringForKey:@"NO_ICLOUD_MIGRATION_TEXT2", @"Make edits on any device or any app, the most up-to-date version of your document is available everywhere.", @"Localizable" value table];

    v72 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v73 = [v72 localizedStringForKey:@"Upgrade" value:@"Upgrade" table:@"Localizable"];

    v74 = [NSURL URLWithString:@"prefs:root=CASTLE&path=CKDATABASESERVICE"];
    [(_UIDocumentPickerUnavailableViewController *)v4 setButtonURL:v74];
LABEL_7:
    uint64_t v78 = 0;
    goto LABEL_8;
  }
  int v75 = +[_UIDocumentPickerDescriptor cloudEnabledStatus];
  v76 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  uint64_t v67 = [v76 localizedStringForKey:@"No Documents[unavailable view title]" value:@"No Documents" table:@"Localizable"];

  v77 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v74 = v77;
  if (v75 != -2)
  {
    uint64_t v69 = [v77 localizedStringForKey:@"NO_ICLOUD_DISABLED_TEXT" value:@"Documents in iCloud Drive are not available because the iCloud Drive setting is disabled." table:@"Localizable"];

    v79 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v73 = [v79 localizedStringForKey:@"Enable iCloud Drive" value:@"Enable iCloud Drive" table:@"Localizable"];

    v74 = [NSURL URLWithString:@"prefs:root=CASTLE&path=CKDATABASESERVICE"];
    [(_UIDocumentPickerUnavailableViewController *)v4 setButtonURL:v74];
    v71 = 0;
    goto LABEL_7;
  }
  uint64_t v69 = [v77 localizedStringForKey:@"NO_ICLOUD_MDM_TEXT" value:@"Access to iCloud documents has been disabled by a device management profile." table:@"Localizable"];
  v73 = 0;
  v71 = 0;
  uint64_t v78 = 1;
LABEL_8:

  v80 = [(_UIDocumentPickerUnavailableViewController *)v4 titleLabel];
  v149 = (void *)v67;
  [v80 setText:v67];

  v81 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v147 = (void *)v69;
  [v81 setText:v69];

  v82 = [(_UIDocumentPickerUnavailableViewController *)v4 leadImageView];
  [v82 setHidden:v78];

  v83 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
  v151 = v73;
  if ([v71 length])
  {
    id v84 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(_UIDocumentPickerUnavailableViewController *)v4 setTextLabel2:v84];

    v85 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v85 setNumberOfLines:0];

    v86 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v86 setTextAlignment:1];

    v87 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v87 setFont:v152];

    v88 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v89 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v88 addSubview:v89];

    v90 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v90 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v144 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];

    v91 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    v92 = [v91 firstBaselineAnchor];
    v93 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel];
    v94 = [v93 lastBaselineAnchor];
    v95 = [v92 constraintEqualToAnchor:v94];
    [(_UIDocumentPickerUnavailableViewController *)v4 setTextToTextConstraint:v95];

    v134 = (void *)MEMORY[0x263F08938];
    v142 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    v139 = [v142 leftAnchor];
    v140 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v138 = [v140 layoutMarginsGuide];
    v137 = [v138 leftAnchor];
    v136 = [v139 constraintEqualToAnchor:v137];
    v155[0] = v136;
    v135 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    v132 = [v135 rightAnchor];
    v133 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v131 = [v133 layoutMarginsGuide];
    v130 = [v131 rightAnchor];
    v96 = [v132 constraintEqualToAnchor:v130];
    v155[1] = v96;
    v97 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    v98 = [v97 centerXAnchor];
    v99 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v100 = [v99 centerXAnchor];
    v101 = [v98 constraintEqualToAnchor:v100];
    v155[2] = v101;
    v102 = [(_UIDocumentPickerUnavailableViewController *)v4 textToTextConstraint];
    v155[3] = v102;
    v103 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:4];
    [v134 activateConstraints:v103];

    v73 = v151;
    v104 = [(_UIDocumentPickerUnavailableViewController *)v4 textLabel2];
    [v104 setText:v71];

    v83 = (void *)v144;
  }
  if (v73)
  {
    v105 = +[BRTintColorButton buttonWithType:0];
    [(_UIDocumentPickerUnavailableViewController *)v4 setButton:v105];

    v106 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    [v106 setTitle:v73 forState:0];

    v107 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    [v107 setTranslatesAutoresizingMaskIntoConstraints:0];

    v108 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    [v108 addTarget:v4 action:sel__buttonPressed_ forControlEvents:64];

    v109 = [MEMORY[0x263F1C658] _thinSystemFontOfSize:26.0];
    v110 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    v111 = [v110 titleLabel];
    [v111 setFont:v109];

    v112 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v113 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    [v112 addSubview:v113];

    v114 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    v115 = [v114 topAnchor];
    v116 = [v83 lastBaselineAnchor];
    [v115 constraintEqualToAnchor:v116];
    v117 = v145 = v83;
    [(_UIDocumentPickerUnavailableViewController *)v4 setTextToButtonConstraint:v117];

    v118 = (void *)MEMORY[0x263F08938];
    v119 = [(_UIDocumentPickerUnavailableViewController *)v4 button];
    v120 = [v119 centerXAnchor];
    v121 = [(_UIDocumentPickerUnavailableViewController *)v4 view];
    v122 = [v121 centerXAnchor];
    [v120 constraintEqualToAnchor:v122];
    v124 = v123 = v71;
    v154[0] = v124;
    v125 = [(_UIDocumentPickerUnavailableViewController *)v4 textToButtonConstraint];
    v154[1] = v125;
    v126 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:2];
    v127 = v118;
    v83 = v145;
    [v127 activateConstraints:v126];

    v71 = v123;
    v73 = v151;
  }
  v128 = [MEMORY[0x263F08A00] defaultCenter];
  [v128 addObserver:v4 selector:sel__fontSizeDidChange_ name:*MEMORY[0x263F1D158] object:0];

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerUnavailableViewController;
  [(_UIDocumentPickerUnavailableViewController *)&v4 dealloc];
}

- (void)_buttonPressed:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [(_UIDocumentPickerUnavailableViewController *)self buttonURL];
  [v5 openSensitiveURL:v4 withOptions:0];
}

- (id)_buttonBackgroundImageForState:(unint64_t)a3 traits:(id)a4
{
  [a4 displayScale];
  __asm { FMOV            V0.2D, #7.0 }
  v9 = _UIGraphicsDrawIntoImageContextWithOptions();
  id v10 = [v9 imageWithRenderingMode:2];

  UIEdgeInsetsMakeWithEdges();
  v11 = objc_msgSend(v10, "resizableImageWithCapInsets:");

  return v11;
}

- (void)_fontSizeDidChange:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v70 = [(_UIDocumentPickerUnavailableViewController *)self traitCollection];
  objc_super v4 = [(_UIDocumentPickerUnavailableViewController *)self view];
  id v5 = [v4 window];
  v6 = [v5 screen];
  [v6 _referenceBounds];
  double v8 = v7;

  v9 = (void *)MEMORY[0x263F1C6B0];
  id v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v11 = [v9 imageNamed:@"iCloudNoDocs" inBundle:v10 compatibleWithTraitCollection:v70];

  [v11 alignmentRectInsets];
  if (v12 == 0.0)
  {
    [v70 displayScale];
    if (fabs(v13 + -1.0) >= 2.22044605e-16)
    {
      if (fabs(v13 + -2.0) >= 2.22044605e-16)
      {
        if (fabs(v13 + -3.0) >= 2.22044605e-16) {
          goto LABEL_9;
        }
        double v14 = 23.6666667;
      }
      else
      {
        double v14 = 23.5;
      }
    }
    else
    {
      double v14 = 25.0;
    }
    uint64_t v15 = objc_msgSend(v11, "imageWithAlignmentRectInsets:", v14, 0.0, 31.0, 0.0);

    v11 = (void *)v15;
  }
LABEL_9:
  v16 = [(_UIDocumentPickerUnavailableViewController *)self leadImageView];
  [v16 setImage:v11];

  v17 = (void *)MEMORY[0x263F1C658];
  v18 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260] addingSymbolicTraits:0 options:1];
  v19 = [v17 fontWithDescriptor:v18 size:0.0];

  v20 = (void *)MEMORY[0x263F1C658];
  v21 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0] addingSymbolicTraits:0 options:1];
  v22 = [v20 fontWithDescriptor:v21 size:0.0];

  [v70 displayScale];
  double v24 = v23;
  id v25 = [(_UIDocumentPickerUnavailableViewController *)self topConstraint];
  v26 = v25;
  double v27 = 28.0;
  if (v8 <= 480.0) {
    double v27 = 20.0;
  }
  double v28 = v27 + 1.0 / v24;
  if (v8 > 480.0) {
    double v29 = 21.0;
  }
  else {
    double v29 = 20.0;
  }
  [v25 setConstant:v28];

  v30 = [MEMORY[0x263F1C658] _lightSystemFontOfSize:32.0];
  v31 = (void *)MEMORY[0x263F1C658];
  [v19 _scaledValueForValue:32.0];
  v32 = objc_msgSend(v31, "_lightSystemFontOfSize:");
  v33 = [(_UIDocumentPickerUnavailableViewController *)self titleLabel];
  [v33 setFont:v32];

  v34 = [(_UIDocumentPickerUnavailableViewController *)self textLabel];
  [v34 setFont:v19];

  v35 = [(_UIDocumentPickerUnavailableViewController *)self textLabel2];
  [v35 setFont:v19];

  v36 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v37 = [v36 titleLabel];
  [v37 setFont:v22];

  v38 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v39 = [(_UIDocumentPickerUnavailableViewController *)self traitCollection];
  v40 = [(_UIDocumentPickerUnavailableViewController *)self _buttonBackgroundImageForState:0 traits:v39];
  [v38 setBackgroundImage:v40 forState:0];

  v41 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v42 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v43 = [v42 tintColor];
  [v41 setTitleColor:v43 forState:0];

  id v44 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v45 = [(_UIDocumentPickerUnavailableViewController *)self traitCollection];
  v46 = [(_UIDocumentPickerUnavailableViewController *)self _buttonBackgroundImageForState:1 traits:v45];
  [v44 setBackgroundImage:v46 forState:1];

  v47 = [(_UIDocumentPickerUnavailableViewController *)self button];
  v48 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v47 setTitleColor:v48 forState:1];

  v49 = [(_UIDocumentPickerUnavailableViewController *)self view];
  UIRoundToViewScale();
  double v51 = v50;
  v52 = [(_UIDocumentPickerUnavailableViewController *)self view];
  UIFloorToViewScale();
  double v54 = v53;
  v55 = [(_UIDocumentPickerUnavailableViewController *)self button];
  objc_msgSend(v55, "setContentEdgeInsets:", v51, 11.0, v54, 11.0);

  [v32 _bodyLeading];
  double v57 = v56 * 23.0;
  [v30 _bodyLeading];
  double v59 = v29 + v57 / v58;
  v60 = [(_UIDocumentPickerUnavailableViewController *)self imageToTitleConstraint];
  [v60 setConstant:v59];

  [v19 _scaledValueForValue:36.0];
  double v62 = v61;
  v63 = [(_UIDocumentPickerUnavailableViewController *)self titleToTextConstraint];
  [v63 setConstant:v62];

  [v19 _scaledValueForValue:28.0];
  double v65 = v64;
  v66 = [(_UIDocumentPickerUnavailableViewController *)self textToTextConstraint];
  [v66 setConstant:v65];

  [v19 _scaledValueForValue:24.0];
  double v68 = v67;
  uint64_t v69 = [(_UIDocumentPickerUnavailableViewController *)self textToButtonConstraint];
  [v69 setConstant:v68];
}

- (UIImageView)leadImageView
{
  return self->_leadImageView;
}

- (void)setLeadImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)textLabel2
{
  return self->_textLabel2;
}

- (void)setTextLabel2:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSURL)buttonURL
{
  return self->_buttonURL;
}

- (void)setButtonURL:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageToTitleConstraint
{
  return self->_imageToTitleConstraint;
}

- (void)setImageToTitleConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleToTextConstraint
{
  return self->_titleToTextConstraint;
}

- (void)setTitleToTextConstraint:(id)a3
{
}

- (NSLayoutConstraint)textToTextConstraint
{
  return self->_textToTextConstraint;
}

- (void)setTextToTextConstraint:(id)a3
{
}

- (NSLayoutConstraint)textToButtonConstraint
{
  return self->_textToButtonConstraint;
}

- (void)setTextToButtonConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textToTextConstraint, 0);
  objc_storeStrong((id *)&self->_titleToTextConstraint, 0);
  objc_storeStrong((id *)&self->_imageToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_buttonURL, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textLabel2, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_leadImageView, 0);
}

@end