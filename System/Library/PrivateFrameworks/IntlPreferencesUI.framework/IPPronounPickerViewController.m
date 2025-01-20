@interface IPPronounPickerViewController
+ (BOOL)canDisplayPronounPicker;
+ (BOOL)shouldDisplayPronounPickerByDefault;
+ (double)heightForExplanatoryText:(id)a3 width:(double)a4;
+ (id)pronounPickerHeaderText;
+ (id)pronounPickerViewControllerWithDelegate:(id)a3;
+ (id)unsupportedLanguageFooterText;
+ (id)viewForExplanatoryText:(id)a3 width:(double)a4;
- (BOOL)shouldShowLanguagePopup;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)viewHasChangedSize;
- (IPPronounPickerViewController)initWithDelegate:(id)a3;
- (IPPronounPickerViewControllerDelegate)delegate;
- (IPPronounValidator)pronounValidator;
- (NSArray)pronounInfos;
- (NSString)currentLanguage;
- (id)createLanguageMenuButton;
- (id)pronounInfoForEntryField:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pronounInfoIndexFromSectionIndex:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)autofillEmptyFields;
- (void)handleCancel;
- (void)handleDone;
- (void)handlePronounFieldContentDidChange:(id)a3;
- (void)initializePronounInfos;
- (void)pronounFieldContentDidChange:(id)a3;
- (void)sendResultToDelegate:(id)a3;
- (void)setCurrentLanguage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPronounInfos:(id)a3;
- (void)setPronounValidator:(id)a3;
- (void)setUpTableHeaderAndFooter;
- (void)setViewHasChangedSize:(BOOL)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateDoneButton;
- (void)userChangedLanguage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation IPPronounPickerViewController

+ (id)pronounPickerViewControllerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[IPPronounPickerViewController alloc] initWithDelegate:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v4];
  return v5;
}

+ (BOOL)canDisplayPronounPicker
{
  return +[IPPronounValidator canDisplayPronounPicker];
}

+ (BOOL)shouldDisplayPronounPickerByDefault
{
  return +[IPPronounValidator shouldDisplayPronounPickerByDefault];
}

- (IPPronounPickerViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IPPronounPickerViewController;
  v5 = [(IPPronounPickerViewController *)&v24 initWithStyle:1];
  v6 = v5;
  if (v5)
  {
    v7 = [(IPPronounPickerViewController *)v5 navigationItem];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"Pronouns" value:&stru_26F10C080 table:@"PronounPicker"];
    [v7 setTitle:v9];

    v10 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v6 action:sel_handleCancel];
    [v7 setLeftBarButtonItem:v10];

    id v11 = objc_alloc(MEMORY[0x263F1C468]);
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"Add" value:&stru_26F10C080 table:@"PronounPicker"];
    v14 = (void *)[v11 initWithTitle:v13 style:2 target:v6 action:sel_handleDone];
    [v7 setRightBarButtonItem:v14];

    v15 = [v7 rightBarButtonItem];
    [v15 setEnabled:0];

    [(IPPronounPickerViewController *)v6 setDelegate:v4];
    v16 = (void *)0x264E94000;
    v17 = +[IPPronounValidator initialPronounPickerLanguage];
    [(IPPronounPickerViewController *)v6 setCurrentLanguage:v17];

    v18 = [IPPronounValidator alloc];
    v19 = [(IPPronounPickerViewController *)v6 currentLanguage];
    if (v19)
    {
      v20 = (void *)MEMORY[0x263EFF960];
      v16 = [(IPPronounPickerViewController *)v6 currentLanguage];
      v21 = [v20 localeWithLocaleIdentifier:v16];
    }
    else
    {
      v21 = 0;
    }
    v22 = [(IPPronounValidator *)v18 initWithLocale:v21];
    [(IPPronounPickerViewController *)v6 setPronounValidator:v22];

    if (v19)
    {
    }
    [(IPPronounPickerViewController *)v6 setViewHasChangedSize:0];
    [(IPPronounPickerViewController *)v6 initializePronounInfos];
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPPronounPickerViewController;
  [(IPPronounPickerViewController *)&v5 viewWillAppear:a3];
  [(IPPronounPickerViewController *)self setViewHasChangedSize:1];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IPPronounPickerViewController;
  [(IPPronounPickerViewController *)&v9 viewDidAppear:a3];
  id v4 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(IPPronounPickerViewController *)self pronounInfos];
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 entryField];
    [v8 becomeFirstResponder];
  }
}

- (void)viewDidLayoutSubviews
{
  if ([(IPPronounPickerViewController *)self viewHasChangedSize])
  {
    [(IPPronounPickerViewController *)self setViewHasChangedSize:0];
    [(IPPronounPickerViewController *)self setUpTableHeaderAndFooter];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v5 = [v4 count];

  return v5 + [(IPPronounPickerViewController *)self shouldShowLanguagePopup];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v95[4] = *MEMORY[0x263EF8340];
  int64_t v5 = -[IPPronounPickerViewController pronounInfoIndexFromSectionIndex:](self, "pronounInfoIndexFromSectionIndex:", objc_msgSend(a4, "section", a3));
  v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:0];
  v7 = v6;
  if (v5 < 0)
  {
    v27 = [v6 contentView];
    v28 = objc_opt_new();
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"Language" value:&stru_26F10C080 table:@"PronounPicker"];
    [v28 setText:v30];

    v26 = v27;
    v31 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v28 setFont:v31];

    [v28 setAdjustsFontForContentSizeCategory:1];
    [v27 addSubview:v28];
    v32 = [(IPPronounPickerViewController *)self createLanguageMenuButton];
    [v26 addSubview:v32];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 intrinsicContentSize];
    double v34 = v33;
    [v32 intrinsicContentSize];
    double v36 = v34 + v35 + 50.0;
    v37 = [(IPPronounPickerViewController *)self tableView];
    [v37 frame];
    double v39 = v38;

    if (v36 <= v39)
    {
      v92 = (void *)MEMORY[0x263F08938];
      v58 = [v32 trailingAnchor];
      v89 = [v26 trailingAnchor];
      v87 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", -20.0);
      v94[0] = v87;
      v59 = [v32 topAnchor];
      v83 = [v26 topAnchor];
      v85 = v59;
      v81 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", 12.0);
      v94[1] = v81;
      v60 = [v32 bottomAnchor];
      v77 = [v26 bottomAnchor];
      v79 = v60;
      v75 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", -12.0);
      v94[2] = v75;
      v61 = [v28 leadingAnchor];
      v71 = [v26 leadingAnchor];
      v73 = v61;
      v69 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", 20.0);
      v94[3] = v69;
      v62 = [v28 trailingAnchor];
      v66 = [v32 leadingAnchor];
      v67 = v62;
      v50 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", -10.0);
      v94[4] = v50;
      v51 = [v28 firstBaselineAnchor];
      v52 = [v32 firstBaselineAnchor];
      v53 = [v51 constraintEqualToAnchor:v52];
      v94[5] = v53;
      v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:6];
      [v92 activateConstraints:v54];
    }
    else
    {
      v91 = v7;
      [v32 intrinsicContentSize];
      double v41 = v40;
      v42 = [(IPPronounPickerViewController *)self tableView];
      [v42 frame];
      double v44 = v43 + -50.0;

      if (v41 > v44)
      {
        v45 = [(IPPronounPickerViewController *)self tableView];
        [v45 frame];
        double v41 = v46 + -50.0;
      }
      v65 = (void *)MEMORY[0x263F08938];
      v64 = [v28 leadingAnchor];
      v89 = [v26 leadingAnchor];
      v87 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", 20.0);
      v93[0] = v87;
      v47 = [v28 trailingAnchor];
      v83 = [v26 trailingAnchor];
      v85 = v47;
      v81 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", -20.0);
      v93[1] = v81;
      v48 = [v28 topAnchor];
      v77 = [v26 topAnchor];
      v79 = v48;
      v75 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", 12.0);
      v93[2] = v75;
      v49 = [v32 trailingAnchor];
      v71 = [v26 trailingAnchor];
      v73 = v49;
      v69 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", -20.0);
      v93[3] = v69;
      v67 = [v32 widthAnchor];
      v66 = [v67 constraintEqualToConstant:v41];
      v93[4] = v66;
      v50 = [v32 topAnchor];
      v51 = [v28 bottomAnchor];
      v52 = [v50 constraintEqualToAnchor:v51 constant:10.0];
      v93[5] = v52;
      v53 = [v32 bottomAnchor];
      v54 = [v26 bottomAnchor];
      [v53 constraintEqualToAnchor:v54 constant:-12.0];
      v56 = v55 = v26;
      v93[6] = v56;
      v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:7];
      [v65 activateConstraints:v57];

      v26 = v55;
      v58 = v64;
      v7 = v91;
    }

    [v7 setSelectionStyle:0];
  }
  else
  {
    v8 = [(IPPronounPickerViewController *)self pronounInfos];
    [v8 objectAtIndexedSubscript:v5];
    objc_super v9 = v88 = v5;
    v10 = [v9 entryField];

    id v11 = [v7 contentView];
    [v11 addSubview:v10];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setDelegate:self];
    v70 = (void *)MEMORY[0x263F08938];
    v84 = [v10 leadingAnchor];
    v86 = [v7 contentView];
    v82 = [v86 leadingAnchor];
    v80 = [v84 constraintEqualToAnchor:v82 constant:20.0];
    v95[0] = v80;
    v74 = [v10 trailingAnchor];
    v76 = [v7 contentView];
    v72 = [v76 trailingAnchor];
    v68 = [v74 constraintEqualToAnchor:v72 constant:-20.0];
    v95[1] = v68;
    v12 = [v10 topAnchor];
    [v7 contentView];
    v13 = v78 = self;
    v14 = [v13 topAnchor];
    v15 = [v12 constraintEqualToAnchor:v14 constant:11.0];
    v95[2] = v15;
    v16 = [v10 bottomAnchor];
    v17 = [v7 contentView];
    [v17 bottomAnchor];
    v18 = v90 = v7;
    v19 = [v16 constraintEqualToAnchor:v18 constant:-11.0];
    v95[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:4];
    [v70 activateConstraints:v20];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *MEMORY[0x263F1D778];
    v23 = [(IPPronounPickerViewController *)v78 pronounInfos];
    objc_super v24 = [v23 objectAtIndexedSubscript:v88];
    v25 = [v24 entryField];
    v26 = v10;
    [v21 addObserver:v78 selector:sel_pronounFieldContentDidChange_ name:v22 object:v25];

    v7 = v90;
    [v90 setSelectionStyle:0];
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  int64_t v5 = [(IPPronounPickerViewController *)self pronounInfoIndexFromSectionIndex:a4];
  if (v5 < 0)
  {
    v14 = 0;
  }
  else
  {
    int64_t v6 = v5;
    v7 = [(IPPronounPickerViewController *)self pronounInfos];
    v8 = [v7 objectAtIndexedSubscript:v6];
    objc_super v9 = [v8 exampleLabel];

    v10 = [(IPPronounPickerViewController *)self pronounInfos];
    id v11 = [v10 objectAtIndexedSubscript:v6];
    v12 = [v11 generateExampleLabelText];
    [v9 setAttributedText:v12];

    id v13 = objc_alloc(MEMORY[0x263F1CB60]);
    v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v14 addSubview:v9];
    v26 = (void *)MEMORY[0x263F08938];
    v32 = [v9 leadingAnchor];
    double v33 = [v14 safeAreaLayoutGuide];
    v31 = [v33 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:20.0];
    v34[0] = v30;
    v28 = [v9 trailingAnchor];
    v29 = [v14 safeAreaLayoutGuide];
    v27 = [v29 trailingAnchor];
    v25 = [v28 constraintEqualToAnchor:v27 constant:-20.0];
    v34[1] = v25;
    objc_super v24 = [v9 topAnchor];
    v15 = [v14 safeAreaLayoutGuide];
    v16 = [v15 topAnchor];
    v17 = [v24 constraintEqualToAnchor:v16 constant:7.33];
    v34[2] = v17;
    v18 = [v9 bottomAnchor];
    v19 = [v14 safeAreaLayoutGuide];
    v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v34[3] = v21;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
    [v26 activateConstraints:v22];
  }
  return v14;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(IPPronounPickerViewController *)self pronounInfoForEntryField:v4];
    v8 = [(IPPronounPickerViewController *)self pronounInfos];
    uint64_t v9 = [v8 indexOfObject:v7];

    v10 = [(IPPronounPickerViewController *)self pronounInfos];
    id v11 = [(IPPronounPickerViewController *)self pronounInfos];
    v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", (v9 + 1) % (unint64_t)objc_msgSend(v11, "count"));
    id v13 = [v12 entryField];
    [v13 becomeFirstResponder];
  }
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t v4 = [(IPPronounPickerViewController *)self pronounInfoForEntryField:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_handlePronounFieldContentDidChange_ object:v4];
    [(IPPronounPickerViewController *)self handlePronounFieldContentDidChange:v5];
  }
  MEMORY[0x270F9A758]();
}

- (void)handleDone
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v33 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
      uint64_t v9 = [v8 entryField];
      char v10 = [v9 isFirstResponder];

      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_handlePronounFieldContentDidChange_ object:v8];
    [(IPPronounPickerViewController *)self handlePronounFieldContentDidChange:v8];
    id v11 = [(IPPronounPickerViewController *)self navigationItem];
    v12 = [v11 rightBarButtonItem];
    int v13 = [v12 isEnabled];

    if (!v13) {
      return;
    }
  }
  else
  {
LABEL_9:
  }
  v14 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v15 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v21 = objc_alloc(MEMORY[0x263F089A8]);
        uint64_t v22 = [v20 value];
        v23 = [v20 morphology];
        objc_super v24 = (void *)[v21 initWithPronoun:v22 morphology:v23 dependentMorphology:0];
        [v14 addObject:v24];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }

  v25 = (void *)MEMORY[0x263F08B58];
  v26 = [(IPPronounPickerViewController *)self currentLanguage];
  v27 = [v25 localizedForLanguageIdentifier:v26 withPronouns:v14];

  [(IPPronounPickerViewController *)self sendResultToDelegate:v27];
}

- (void)handleCancel
{
}

- (void)pronounFieldContentDidChange:(id)a3
{
  uint64_t v4 = [a3 object];
  id v5 = [(IPPronounPickerViewController *)self pronounInfoForEntryField:v4];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_handlePronounFieldContentDidChange_ object:v5];
  [(IPPronounPickerViewController *)self performSelector:sel_handlePronounFieldContentDidChange_ withObject:v5 afterDelay:0.5];
}

- (BOOL)shouldShowLanguagePopup
{
  return 1;
}

- (int64_t)pronounInfoIndexFromSectionIndex:(int64_t)a3
{
  return a3 - [(IPPronounPickerViewController *)self shouldShowLanguagePopup];
}

- (void)sendResultToDelegate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [(IPPronounPickerViewController *)self pronounValidator];
    [v4 rememberUserEntry:v6];

    id v5 = [(IPPronounPickerViewController *)self delegate];
    [v5 pronounPickerViewController:self didFinishWithTermOfAddress:v6];
  }
  else
  {
    id v5 = [(IPPronounPickerViewController *)self delegate];
    [v5 pronounPickerViewControllerDidCancel:self];
  }
}

- (void)handlePronounFieldContentDidChange:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 entryField];
  id v5 = [v4 markedTextRange];

  if (!v5 || [v5 isEmpty])
  {
    id v6 = [v14 entryField];
    uint64_t v7 = [v6 text];
    v8 = [(IPPronounPickerViewController *)self pronounValidator];
    [v14 entryFieldContentDidChange:v7 validator:v8 userEntered:1];

    [(IPPronounPickerViewController *)self autofillEmptyFields];
    [(IPPronounPickerViewController *)self updateDoneButton];
    uint64_t v9 = [(IPPronounPickerViewController *)self tableView];
    char v10 = (void *)MEMORY[0x263F088D0];
    uint64_t v11 = [(IPPronounPickerViewController *)self shouldShowLanguagePopup];
    v12 = [(IPPronounPickerViewController *)self pronounInfos];
    int v13 = objc_msgSend(v10, "indexSetWithIndexesInRange:", v11, objc_msgSend(v12, "count"));
    [v9 _reloadSectionHeaderFooters:v13 withRowAnimation:5];
  }
}

- (void)autofillEmptyFields
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v4 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v37 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
      if (![v9 textWasEnteredByUser]) {
        break;
      }
      if (([v9 hasValue] & 1) == 0)
      {
        if (![v9 hasErrorMessage])
        {

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = [(IPPronounPickerViewController *)self pronounInfos];
          uint64_t v27 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v33 != v29) {
                  objc_enumerationMutation(v14);
                }
                long long v31 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                if (([v31 hasValue] & 1) != 0
                  || ([v31 hasErrorMessage] & 1) != 0
                  || ![v31 textWasEnteredByUser])
                {
                  if (([v31 textWasEnteredByUser] & 1) == 0) {
                    [v31 autofillValue:&stru_26F10C080];
                  }
                }
                else
                {
                  [v31 setTextWasEnteredByUser:0];
                }
              }
              uint64_t v28 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v28);
          }
          goto LABEL_37;
        }
        uint64_t v11 = v3;
        v12 = @"???";
        goto LABEL_12;
      }
      char v10 = [v9 value];
      [v3 addObject:v10];

LABEL_13:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    uint64_t v11 = v3;
    v12 = &stru_26F10C080;
LABEL_12:
    [v11 addObject:v12];
    goto LABEL_13;
  }
LABEL_15:

  int v13 = [(IPPronounPickerViewController *)self pronounValidator];
  id v14 = [v13 autofillPronouns:v3];

  v15 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [(IPPronounPickerViewController *)self pronounInfos];
      v19 = [v18 objectAtIndexedSubscript:v17];
      char v20 = [v19 textWasEnteredByUser];

      if ((v20 & 1) == 0)
      {
        id v21 = [(IPPronounPickerViewController *)self pronounInfos];
        uint64_t v22 = [v21 objectAtIndexedSubscript:v17];
        v23 = v22;
        if (v14)
        {
          objc_super v24 = [v14 objectAtIndexedSubscript:v17];
          [v23 autofillValue:v24];
        }
        else
        {
          [v22 autofillValue:&stru_26F10C080];
        }
      }
      ++v17;
      v25 = [(IPPronounPickerViewController *)self pronounInfos];
      unint64_t v26 = [v25 count];
    }
    while (v17 < v26);
  }
LABEL_37:
}

- (void)updateDoneButton
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * v7) hasValidValue])
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  uint64_t v9 = [(IPPronounPickerViewController *)self navigationItem];
  char v10 = [v9 rightBarButtonItem];
  [v10 setEnabled:v8];
}

- (id)pronounInfoForEntryField:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 entryField];

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = [(IPPronounPickerViewController *)self pronounInfos];
  id v12 = [v5 objectAtIndexedSubscript:0];
LABEL_11:
  long long v13 = v12;

  return v13;
}

- (id)createLanguageMenuButton
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F1C490] plainButtonConfiguration];
  id v4 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v3 setBaseForegroundColor:v4];

  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));
  v52 = v3;
  uint64_t v5 = [MEMORY[0x263F1C488] buttonWithConfiguration:v3 primaryAction:0];
  [v5 setChangesSelectionAsPrimaryAction:1];
  v51 = v5;
  [v5 setShowsMenuAsPrimaryAction:1];
  obuint64_t j = self;
  uint64_t v6 = [(IPPronounPickerViewController *)self currentLanguage];
  uint64_t v7 = +[IPPronounValidator preferredPronounLocalizationForLanguage:v6];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  id v53 = [MEMORY[0x263EFF980] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v9 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = +[IPPronounValidator preferredPronounLocalizationForLanguage:*(void *)(*((void *)&v75 + 1) + 8 * i)];
        if (v14 && ([v8 containsObject:v14] & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
    }
    while (v11);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v15 = +[IPPronounValidator supportedPronounLocalizations];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v72 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        id v21 = +[IPPronounValidator preferredPronounLocalizationForLanguage:v20];
        if (v21
          && ([v8 containsObject:v20] & 1) == 0
          && ([v53 containsObject:v20] & 1) == 0)
        {
          [v53 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v17);
  }

  [v53 sortUsingComparator:&__block_literal_global];
  v58 = [MEMORY[0x263EFF980] array];
  v57 = [MEMORY[0x263EFF980] array];
  uint64_t v22 = obj;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obja = v8;
  uint64_t v23 = [obja countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v68 != v25) {
          objc_enumerationMutation(obja);
        }
        uint64_t v27 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        uint64_t v28 = (void *)MEMORY[0x263F1C3C0];
        uint64_t v29 = [MEMORY[0x263EFF960] currentLocale];
        long long v30 = [v29 localizedStringForLocaleIdentifier:v27];
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_2;
        v65[3] = &unk_264E941D8;
        v66 = v22;
        long long v31 = [v28 actionWithTitle:v30 image:0 identifier:v27 handler:v65];

        if (v7 && [v27 isEqualToString:v7]) {
          [v31 setState:1];
        }
        [v58 addObject:v31];
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v24);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v54 = v53;
  uint64_t v32 = [v54 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v62;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v62 != v34) {
          objc_enumerationMutation(v54);
        }
        long long v36 = *(void **)(*((void *)&v61 + 1) + 8 * m);
        long long v37 = (void *)MEMORY[0x263F1C3C0];
        long long v38 = [MEMORY[0x263EFF960] currentLocale];
        long long v39 = [v38 localizedStringForLocaleIdentifier:v36];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_3;
        v59[3] = &unk_264E941D8;
        v60 = v22;
        double v40 = [v37 actionWithTitle:v39 image:0 identifier:v36 handler:v59];

        if (v7 && [v36 isEqualToString:v7]) {
          [v40 setState:1];
        }
        [v57 addObject:v40];
      }
      uint64_t v33 = [v54 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v33);
  }

  double v41 = [MEMORY[0x263EFF980] array];
  uint64_t v42 = [(IPPronounPickerViewController *)v22 currentLanguage];

  if (!v42)
  {
    double v43 = (void *)MEMORY[0x263F1C3C0];
    double v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v45 = [v44 localizedStringForKey:@"Select" value:&stru_26F10C080 table:@"PronounPicker"];
    double v46 = [v43 actionWithTitle:v45 image:0 identifier:0 handler:&__block_literal_global_57];

    [v46 setAttributes:1];
    [v46 setState:1];
    [v41 addObject:v46];
  }
  if ([v58 count])
  {
    v47 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26F10C080 image:0 identifier:0 options:1 children:v58];
    [v41 addObject:v47];
  }
  if ([v57 count])
  {
    v48 = [MEMORY[0x263F1C7A8] menuWithTitle:&stru_26F10C080 image:0 identifier:0 options:1 children:v57];
    [v41 addObject:v48];
  }
  v49 = [MEMORY[0x263F1C7A8] menuWithChildren:v41];
  [v51 setMenu:v49];

  return v51;
}

uint64_t __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v4 currentLocale];
  uint64_t v8 = [v7 localizedStringForLocaleIdentifier:v6];

  uint64_t v9 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v10 = [v9 localizedStringForLocaleIdentifier:v5];

  uint64_t v11 = [v8 localizedCaseInsensitiveCompare:v10];
  return v11;
}

void __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 userChangedLanguage:v3];
}

void __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 userChangedLanguage:v3];
}

- (void)userChangedLanguage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [v10 entryField];
        int v12 = [v11 isFirstResponder];

        if (v12)
        {
          long long v13 = [v10 entryField];
          [v13 resignFirstResponder];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(IPPronounPickerViewController *)self setCurrentLanguage:v4];
  long long v14 = [IPPronounValidator alloc];
  long long v15 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  uint64_t v16 = [(IPPronounValidator *)v14 initWithLocale:v15];
  [(IPPronounPickerViewController *)self setPronounValidator:v16];

  [(IPPronounPickerViewController *)self initializePronounInfos];
  uint64_t v17 = [(IPPronounPickerViewController *)self tableView];
  [v17 setTableFooterView:0];

  uint64_t v18 = [(IPPronounPickerViewController *)self tableView];
  [v18 reloadData];

  [(IPPronounPickerViewController *)self updateDoneButton];
  v19 = [(IPPronounPickerViewController *)self pronounInfos];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];
  id v21 = [v20 entryField];
  [v21 becomeFirstResponder];
}

- (void)initializePronounInfos
{
  id v3 = [(IPPronounPickerViewController *)self pronounValidator];
  id v17 = [v3 exampleStrings];

  id v4 = [(IPPronounPickerViewController *)self pronounValidator];
  id v5 = [v4 examplePlaceholders];

  uint64_t v6 = [(IPPronounPickerViewController *)self pronounValidator];
  uint64_t v7 = [v6 displayedMorphologies];

  uint64_t v8 = [(IPPronounPickerViewController *)self pronounValidator];
  uint64_t v9 = [v8 language];

  uint64_t v10 = [MEMORY[0x263EFF980] array];
  if ([v7 count])
  {
    unint64_t v11 = 0;
    do
    {
      int v12 = [IPPronounPickerPronounInfo alloc];
      long long v13 = [v17 objectAtIndexedSubscript:v11];
      long long v14 = [v5 objectAtIndexedSubscript:v11];
      long long v15 = [v7 objectAtIndexedSubscript:v11];
      uint64_t v16 = [(IPPronounPickerPronounInfo *)v12 initWithExampleText:v13 examplePlaceholder:v14 morphology:v15 language:v9];
      [v10 addObject:v16];

      ++v11;
    }
    while (v11 < [v7 count]);
  }
  [(IPPronounPickerViewController *)self setPronounInfos:v10];
}

- (void)setUpTableHeaderAndFooter
{
  id v3 = [(IPPronounPickerViewController *)self tableView];
  id v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;

  uint64_t v7 = +[IPPronounPickerViewController pronounPickerHeaderText];
  uint64_t v8 = +[IPPronounPickerViewController viewForExplanatoryText:v7 width:v6];
  uint64_t v9 = [(IPPronounPickerViewController *)self tableView];
  [v9 setTableHeaderView:v8];

  uint64_t v10 = [(IPPronounPickerViewController *)self currentLanguage];

  if (!v10)
  {
    id v13 = +[IPPronounPickerViewController unsupportedLanguageFooterText];
    unint64_t v11 = +[IPPronounPickerViewController viewForExplanatoryText:v13 width:v6];
    int v12 = [(IPPronounPickerViewController *)self tableView];
    [v12 setTableFooterView:v11];
  }
}

+ (id)viewForExplanatoryText:(id)a3 width:(double)a4
{
  v27[3] = *MEMORY[0x263EF8340];
  id v25 = a3;
  double v5 = objc_opt_new();
  [v5 setAttributedText:v25];
  [v5 setNumberOfLines:0];
  [v5 setAdjustsFontForContentSizeCategory:1];
  double v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v5 setTextColor:v6];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = objc_opt_new();
  [v7 addSubview:v5];
  uint64_t v20 = (void *)MEMORY[0x263F08938];
  long long v23 = [v5 leadingAnchor];
  long long v24 = [v7 safeAreaLayoutGuide];
  long long v22 = [v24 leadingAnchor];
  id v21 = [v23 constraintEqualToAnchor:v22 constant:20.0];
  v27[0] = v21;
  v19 = [v5 trailingAnchor];
  uint64_t v8 = [v7 safeAreaLayoutGuide];
  uint64_t v9 = [v8 trailingAnchor];
  uint64_t v10 = [v19 constraintEqualToAnchor:v9 constant:-20.0];
  v27[1] = v10;
  unint64_t v11 = [v5 topAnchor];
  int v12 = [v7 safeAreaLayoutGuide];
  id v13 = [v12 topAnchor];
  long long v14 = [v11 constraintEqualToAnchor:v13 constant:20.0];
  v27[2] = v14;
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  [v20 activateConstraints:v15];

  [a1 heightForExplanatoryText:v25 width:a4];
  double v17 = v16;

  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v17);
  return v7;
}

+ (double)heightForExplanatoryText:(id)a3 width:(double)a4
{
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 3, 0, a4 + -40.0, 1.79769313e308);
  return v4 + 20.0 + 20.0;
}

+ (id)pronounPickerHeaderText
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F086A0]);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = [v3 localizedStringForKey:@"PRONOUN PICKER HEADER" value:&stru_26F10C080 table:@"PronounPicker"];
  uint64_t v9 = *MEMORY[0x263F814F0];
  double v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  v10[0] = v5;
  double v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = (void *)[v2 initWithString:v4 attributes:v6];

  return v7;
}

+ (id)unsupportedLanguageFooterText
{
  v12[2] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F81658] defaultParagraphStyle];
  id v3 = (void *)[v2 mutableCopy];

  [v3 setAlignment:1];
  id v4 = objc_alloc(MEMORY[0x263F086A0]);
  double v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v6 = [v5 localizedStringForKey:@"UNSUPPORTED LANGUAGE FOOTER" value:&stru_26F10C080 table:@"PronounPicker"];
  v11[0] = *MEMORY[0x263F814F0];
  uint64_t v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D268]];
  v11[1] = *MEMORY[0x263F81540];
  v12[0] = v7;
  v12[1] = v3;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = (void *)[v4 initWithString:v6 attributes:v8];

  return v9;
}

- (IPPronounPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IPPronounPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IPPronounValidator)pronounValidator
{
  return self->_pronounValidator;
}

- (void)setPronounValidator:(id)a3
{
}

- (NSArray)pronounInfos
{
  return self->_pronounInfos;
}

- (void)setPronounInfos:(id)a3
{
}

- (NSString)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
}

- (BOOL)viewHasChangedSize
{
  return self->_viewHasChangedSize;
}

- (void)setViewHasChangedSize:(BOOL)a3
{
  self->_viewHasChangedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_pronounInfos, 0);
  objc_storeStrong((id *)&self->_pronounValidator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end