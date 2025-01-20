@interface CARDebugDynamicTextPanel
- (CARDebugDynamicTextPanel)initWithPanelController:(id)a3;
- (NSArray)fontTextStyles;
- (SampleTextCollectionDataSource)sampleTextDataSource;
- (UIButton)largeButton;
- (UIButton)mediumButton;
- (UIButton)systemButton;
- (UIButton)xtraLargeButton;
- (UICollectionView)sampleTextCollectionView;
- (UILabel)currentSizeTitle;
- (id)_buttonWithTitle:(id)a3;
- (id)cellSpecifier;
- (id)phoneView;
- (void)_handleSizeButton:(id)a3;
- (void)_printFonts;
- (void)_sizeUpdated;
- (void)setCurrentSizeTitle:(id)a3;
- (void)setLargeButton:(id)a3;
- (void)setMediumButton:(id)a3;
- (void)setSampleTextCollectionView:(id)a3;
- (void)setSampleTextDataSource:(id)a3;
- (void)setSystemButton:(id)a3;
- (void)setXtraLargeButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARDebugDynamicTextPanel

- (CARDebugDynamicTextPanel)initWithPanelController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CARDebugDynamicTextPanel;
  v3 = [(CARSettingsPanel *)&v6 initWithPanelController:a3];
  v4 = v3;
  if (v3) {
    [(CARDebugDynamicTextPanel *)v3 _printFonts];
  }
  return v4;
}

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002AF98;
    v8[3] = &unk_100092008;
    objc_copyWeak(&v9, &location);
    v5 = [(CARSettingsCellSpecifier *)v4 initWithTitle:@"Debug Dynamic Text" image:0 accessoryType:1 actionBlock:v8];
    objc_super v6 = self->_cellSpecifier;
    self->_cellSpecifier = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (id)phoneView
{
  phoneView = self->_phoneView;
  if (!phoneView)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_phoneView;
    self->_phoneView = v4;

    objc_super v6 = [(CARDebugDynamicTextPanel *)self _buttonWithTitle:@"System"];
    [(CARDebugDynamicTextPanel *)self setSystemButton:v6];

    v7 = self->_phoneView;
    v8 = [(CARDebugDynamicTextPanel *)self systemButton];
    [(UIView *)v7 addSubview:v8];

    id v9 = [(CARDebugDynamicTextPanel *)self _buttonWithTitle:@"X-Large"];
    [(CARDebugDynamicTextPanel *)self setXtraLargeButton:v9];

    v10 = self->_phoneView;
    v11 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    [(UIView *)v10 addSubview:v11];

    v12 = [(CARDebugDynamicTextPanel *)self _buttonWithTitle:@"Large"];
    [(CARDebugDynamicTextPanel *)self setLargeButton:v12];

    v13 = self->_phoneView;
    v14 = [(CARDebugDynamicTextPanel *)self largeButton];
    [(UIView *)v13 addSubview:v14];

    v15 = [(CARDebugDynamicTextPanel *)self _buttonWithTitle:@"Medium"];
    [(CARDebugDynamicTextPanel *)self setMediumButton:v15];

    v16 = self->_phoneView;
    v17 = [(CARDebugDynamicTextPanel *)self mediumButton];
    [(UIView *)v16 addSubview:v17];

    v93 = [(CARDebugDynamicTextPanel *)self systemButton];
    v92 = [v93 topAnchor];
    v91 = [(UIView *)self->_phoneView topAnchor];
    v90 = [v92 constraintEqualToAnchor:v91 constant:20.0];
    v94[0] = v90;
    v89 = [(CARDebugDynamicTextPanel *)self mediumButton];
    v87 = [v89 topAnchor];
    v88 = [(CARDebugDynamicTextPanel *)self systemButton];
    v86 = [v88 bottomAnchor];
    v85 = [v87 constraintEqualToAnchor:v86 constant:20.0];
    v94[1] = v85;
    v84 = [(CARDebugDynamicTextPanel *)self largeButton];
    v82 = [v84 topAnchor];
    v83 = [(CARDebugDynamicTextPanel *)self mediumButton];
    v81 = [v83 bottomAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:20.0];
    v94[2] = v80;
    v79 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v77 = [v79 topAnchor];
    v78 = [(CARDebugDynamicTextPanel *)self largeButton];
    v76 = [v78 bottomAnchor];
    v75 = [v77 constraintEqualToAnchor:v76 constant:20.0];
    v94[3] = v75;
    v74 = [(CARDebugDynamicTextPanel *)self systemButton];
    v73 = [v74 centerXAnchor];
    v72 = [(UIView *)self->_phoneView centerXAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v94[4] = v71;
    v70 = [(CARDebugDynamicTextPanel *)self mediumButton];
    v69 = [v70 centerXAnchor];
    v68 = [(UIView *)self->_phoneView centerXAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v94[5] = v67;
    v66 = [(CARDebugDynamicTextPanel *)self largeButton];
    v65 = [v66 centerXAnchor];
    v64 = [(UIView *)self->_phoneView centerXAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v94[6] = v63;
    v62 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v61 = [v62 centerXAnchor];
    v60 = [(UIView *)self->_phoneView centerXAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v94[7] = v59;
    v58 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v57 = [v58 widthAnchor];
    v56 = [v57 constraintEqualToConstant:100.0];
    v94[8] = v56;
    v55 = [(CARDebugDynamicTextPanel *)self mediumButton];
    v53 = [v55 widthAnchor];
    v54 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v52 = [v54 widthAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v94[9] = v51;
    v50 = [(CARDebugDynamicTextPanel *)self largeButton];
    v48 = [v50 widthAnchor];
    v49 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v47 = [v49 widthAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v94[10] = v46;
    v45 = [(CARDebugDynamicTextPanel *)self systemButton];
    v43 = [v45 widthAnchor];
    v44 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v42 = [v44 widthAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v94[11] = v41;
    v40 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v39 = [v40 heightAnchor];
    v38 = [v39 constraintEqualToConstant:40.0];
    v94[12] = v38;
    v37 = [(CARDebugDynamicTextPanel *)self mediumButton];
    v35 = [v37 heightAnchor];
    v36 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v34 = [v36 heightAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v94[13] = v33;
    v32 = [(CARDebugDynamicTextPanel *)self largeButton];
    v31 = [v32 heightAnchor];
    v18 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v19 = [v18 heightAnchor];
    v20 = [v31 constraintEqualToAnchor:v19];
    v94[14] = v20;
    v21 = [(CARDebugDynamicTextPanel *)self systemButton];
    v22 = [v21 heightAnchor];
    v23 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    v24 = [v23 heightAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v94[15] = v25;
    v26 = +[NSArray arrayWithObjects:v94 count:16];
    +[NSLayoutConstraint activateConstraints:v26];

    v27 = [(CARDebugDynamicTextPanel *)self mediumButton];
    [v27 addTarget:self action:"_handleSizeButton:" forControlEvents:64];

    v28 = [(CARDebugDynamicTextPanel *)self largeButton];
    [v28 addTarget:self action:"_handleSizeButton:" forControlEvents:64];

    v29 = [(CARDebugDynamicTextPanel *)self xtraLargeButton];
    [v29 addTarget:self action:"_handleSizeButton:" forControlEvents:64];

    phoneView = self->_phoneView;
  }

  return phoneView;
}

- (void)viewDidLoad
{
  v71.receiver = self;
  v71.super_class = (Class)CARDebugDynamicTextPanel;
  [(CARSettingsPanel *)&v71 viewDidLoad];
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CARDebugDynamicTextPanel *)self setCurrentSizeTitle:v7];

  v8 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  v11 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  [v11 setFont:v10];

  v12 = [(CARDebugDynamicTextPanel *)self view];
  v13 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  [v12 addSubview:v13];

  id v14 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v14 setItemSize:85.0, 30.0];
  [v14 setSectionInset:10.0, 10.0, 10.0, 50.0];
  [v14 setMinimumLineSpacing:0.0];
  v70 = v14;
  [v14 setMinimumInteritemSpacing:0.0];
  v15 = [SampleTextCollectionDataSource alloc];
  v16 = [(CARDebugDynamicTextPanel *)self fontTextStyles];
  v17 = [(SampleTextCollectionDataSource *)v15 initWithFontTextStyles:v16];
  [(CARDebugDynamicTextPanel *)self setSampleTextDataSource:v17];

  id v18 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CARDebugDynamicTextPanel *)self setSampleTextCollectionView:v18];

  v19 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = +[UIColor tableBackgroundColor];
  v21 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  [v21 setBackgroundColor:v20];

  v22 = [(CARDebugDynamicTextPanel *)self sampleTextDataSource];
  v23 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  [v23 setDataSource:v22];

  v24 = [(CARDebugDynamicTextPanel *)self sampleTextDataSource];
  v25 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  [v25 setDelegate:v24];

  v26 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  uint64_t v27 = objc_opt_class();
  v28 = +[SampleTextCollectionViewCell reuseIdentifier];
  [v26 registerClass:v27 forCellWithReuseIdentifier:v28];

  v29 = [(CARDebugDynamicTextPanel *)self view];
  v30 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  [v29 addSubview:v30];

  v69 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  v66 = [v69 topAnchor];
  v68 = [(CARDebugDynamicTextPanel *)self view];
  v67 = [v68 safeAreaLayoutGuide];
  v65 = [v67 topAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:5.0];
  v72[0] = v64;
  v63 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  v61 = [v63 centerXAnchor];
  v62 = [(CARDebugDynamicTextPanel *)self view];
  v60 = [v62 safeAreaLayoutGuide];
  v59 = [v60 centerXAnchor];
  v58 = [v61 constraintEqualToAnchor:v59];
  v72[1] = v58;
  v57 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  v56 = [v57 heightAnchor];
  v55 = [v56 constraintEqualToConstant:20.0];
  v72[2] = v55;
  v54 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  v52 = [v54 topAnchor];
  v53 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  v51 = [v53 bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:0.0];
  v72[3] = v50;
  v49 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  v47 = [v49 leftAnchor];
  v48 = [(CARDebugDynamicTextPanel *)self view];
  v46 = [v48 safeAreaLayoutGuide];
  v45 = [v46 leftAnchor];
  v44 = [v47 constraintEqualToAnchor:v45 constant:0.0];
  v72[4] = v44;
  v43 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  v41 = [v43 rightAnchor];
  v42 = [(CARDebugDynamicTextPanel *)self view];
  v40 = [v42 safeAreaLayoutGuide];
  v31 = [v40 rightAnchor];
  v32 = [v41 constraintEqualToAnchor:v31 constant:-0.0];
  v72[5] = v32;
  v33 = [(CARDebugDynamicTextPanel *)self sampleTextCollectionView];
  v34 = [v33 bottomAnchor];
  v35 = [(CARDebugDynamicTextPanel *)self view];
  v36 = [v35 safeAreaLayoutGuide];
  v37 = [v36 bottomAnchor];
  v38 = [v34 constraintEqualToAnchor:v37 constant:-0.0];
  v72[6] = v38;
  v39 = +[NSArray arrayWithObjects:v72 count:7];
  +[NSLayoutConstraint activateConstraints:v39];

  [(CARDebugDynamicTextPanel *)self _sizeUpdated];
}

- (id)_buttonWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[UIButton buttonWithType:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setTitle:v3 forState:0];

  v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  objc_super v6 = [v4 titleLabel];
  [v6 setFont:v5];

  id v7 = [v4 titleLabel];
  [v7 setAdjustsFontForContentSizeCategory:1];

  v8 = +[UIColor externalSystemTealColor];
  [v4 setTitleColor:v8 forState:0];

  id v9 = +[UIColor _labelColor];
  [v4 setBackgroundColor:v9];

  UIInterfaceDefaultCornerRadius();
  double v11 = v10;
  v12 = [v4 layer];
  [v12 setCornerRadius:v11];

  return v4;
}

- (void)_handleSizeButton:(id)a3
{
  v4 = (UIButton *)a3;
  v8 = v4;
  if (self->_mediumButton == v4)
  {
    objc_super v6 = (id *)&UIContentSizeCategoryMedium;
  }
  else if (self->_largeButton == v4)
  {
    objc_super v6 = (id *)&UIContentSizeCategoryLarge;
  }
  else
  {
    if (self->_xtraLargeButton != v4)
    {
      id v5 = 0;
      goto LABEL_9;
    }
    objc_super v6 = (id *)&UIContentSizeCategoryExtraLarge;
  }
  id v5 = *v6;
LABEL_9:
  id v7 = +[CARPrototypePref contentSize];
  [v7 setValue:v5];
}

- (void)_sizeUpdated
{
  id v8 = [(CARDebugDynamicTextPanel *)self traitCollection];
  id v3 = [v8 preferredContentSizeCategory];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"UICTContentSizeCategory" withString:&stru_100094078];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"Accessibility" withString:@"A-"];
  objc_super v6 = +[NSString stringWithFormat:@"CurrentSize: %@", v5];
  id v7 = [(CARDebugDynamicTextPanel *)self currentSizeTitle];
  [v7 setText:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CARDebugDynamicTextPanel;
  [(CARDebugDynamicTextPanel *)&v4 traitCollectionDidChange:a3];
  [(CARDebugDynamicTextPanel *)self _sizeUpdated];
  [(CARDebugDynamicTextPanel *)self _printFonts];
}

- (NSArray)fontTextStyles
{
  v4[0] = UIFontTextStyleLargeTitle;
  v4[1] = UIFontTextStyleTitle1;
  v4[2] = UIFontTextStyleTitle2;
  v4[3] = UIFontTextStyleTitle3;
  v4[4] = UIFontTextStyleTitle4;
  v4[5] = UIFontTextStyleTitle5;
  v4[6] = UIFontTextStyleSubtitle;
  v4[7] = UIFontTextStyleSubtitle1;
  v4[8] = UIFontTextStyleSubtitle2;
  v4[9] = UIFontTextStyleSubtitle3;
  v4[10] = UIFontTextStyleHeadline;
  v4[11] = UIFontTextStyleHeadline1;
  v4[12] = UIFontTextStyleHeadline2;
  v4[13] = UIFontTextStyleSubheadline;
  v4[14] = UIFontTextStyleBody;
  v4[15] = UIFontTextStyleCallout;
  v4[16] = UIFontTextStyleFootnote;
  v4[17] = UIFontTextStyleCaption1;
  v4[18] = UIFontTextStyleCaption2;
  v4[19] = UIFontTextStyleFootnote1;
  v4[20] = UIFontTextStyleFootnote2;
  v4[21] = UIFontTextStyleSection1;
  v4[22] = UIFontTextStyleSection2;
  v4[23] = UIFontTextStyleSection3;
  v2 = +[NSArray arrayWithObjects:v4 count:24];

  return (NSArray *)v2;
}

- (void)_printFonts
{
  id v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(CARDebugDynamicTextPanel *)self fontTextStyles];
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v7);
        id v9 = [(CARDebugDynamicTextPanel *)self traitCollection];
        double v10 = +[UIFont preferredFontForTextStyle:v8 compatibleWithTraitCollection:v9];

        double v11 = +[NSString stringWithFormat:@"style=%@ font=%@", v8, v10];
        [v3 addObject:v11];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/CarPlayApp/CarPlaySettings/Panels/InternalSettingsPanels/DebugPanels/CARDebugDynamicTextPanel.m"];
  v13 = [v12 lastPathComponent];
  uint64_t v14 = objc_opt_class();
  v15 = +[NSString stringWithFormat:@"fonts:\n%@", v3];
  NSLog(@"RIXDEBUG: %@:%d %s (%@.%p) • %@", v13, 239, "-[CARDebugDynamicTextPanel _printFonts]", v14, self, v15);
}

- (UIButton)systemButton
{
  return self->_systemButton;
}

- (void)setSystemButton:(id)a3
{
}

- (UIButton)xtraLargeButton
{
  return self->_xtraLargeButton;
}

- (void)setXtraLargeButton:(id)a3
{
}

- (UIButton)largeButton
{
  return self->_largeButton;
}

- (void)setLargeButton:(id)a3
{
}

- (UIButton)mediumButton
{
  return self->_mediumButton;
}

- (void)setMediumButton:(id)a3
{
}

- (UILabel)currentSizeTitle
{
  return self->_currentSizeTitle;
}

- (void)setCurrentSizeTitle:(id)a3
{
}

- (UICollectionView)sampleTextCollectionView
{
  return self->_sampleTextCollectionView;
}

- (void)setSampleTextCollectionView:(id)a3
{
}

- (SampleTextCollectionDataSource)sampleTextDataSource
{
  return self->_sampleTextDataSource;
}

- (void)setSampleTextDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTextDataSource, 0);
  objc_storeStrong((id *)&self->_sampleTextCollectionView, 0);
  objc_storeStrong((id *)&self->_currentSizeTitle, 0);
  objc_storeStrong((id *)&self->_mediumButton, 0);
  objc_storeStrong((id *)&self->_largeButton, 0);
  objc_storeStrong((id *)&self->_xtraLargeButton, 0);
  objc_storeStrong((id *)&self->_systemButton, 0);
  objc_storeStrong((id *)&self->_phoneView, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end