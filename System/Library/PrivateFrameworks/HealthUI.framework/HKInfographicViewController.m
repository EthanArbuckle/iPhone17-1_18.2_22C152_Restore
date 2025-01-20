@interface HKInfographicViewController
- (HKInfographicViewController)initWithItems:(id)a3;
- (HKInfographicViewController)initWithItems:(id)a3 tableViewStyle:(int64_t)a4;
- (NSArray)items;
- (UITableView)tableView;
- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateTableViewTopPadding;
- (void)setItems:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKInfographicViewController

- (HKInfographicViewController)initWithItems:(id)a3
{
  return [(HKInfographicViewController *)self initWithItems:a3 tableViewStyle:2];
}

- (HKInfographicViewController)initWithItems:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKInfographicViewController;
  v7 = [(HKInfographicViewController *)&v10 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    v7->_tableViewStyle = a4;
    [(HKInfographicViewController *)v7 setItems:v6];
  }

  return v8;
}

- (void)viewDidLoad
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", self->_tableViewStyle, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(HKInfographicViewController *)self setTableView:v4];

  v5 = HKUIJoinStringsForAutomationIdentifier(&unk_1F3C1F408);
  id v6 = [(HKInfographicViewController *)self tableView];
  [v6 setAccessibilityIdentifier:v5];

  v7 = [(HKInfographicViewController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  if (self->_tableViewStyle)
  {
    v8 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    v9 = [(HKInfographicViewController *)self view];
    [v9 setBackgroundColor:v8];

    [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  else
  {
    objc_super v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v11 = [(HKInfographicViewController *)self view];
    [v11 setBackgroundColor:v10];

    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v12 = };
  v13 = [(HKInfographicViewController *)self tableView];
  [v13 setBackgroundColor:v12];

  v14 = [(HKInfographicViewController *)self tableView];
  [v14 setDataSource:self];

  v15 = [(HKInfographicViewController *)self tableView];
  [v15 setAllowsSelection:0];

  v16 = [(HKInfographicViewController *)self tableView];
  [v16 setSeparatorStyle:0];

  v17 = [(HKInfographicViewController *)self tableView];
  [v17 setEstimatedRowHeight:50.0];

  [(HKInfographicViewController *)self _updateTableViewTopPadding];
  double v18 = *MEMORY[0x1E4FB2F28];
  v19 = [(HKInfographicViewController *)self tableView];
  [v19 setRowHeight:v18];

  v20 = [(HKInfographicViewController *)self tableView];
  [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicViewControllerTextViewCell"];

  v21 = [(HKInfographicViewController *)self tableView];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicViewControllerLinkedTextViewCell"];

  v22 = [(HKInfographicViewController *)self tableView];
  [v22 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicButtonCell"];

  v23 = [(HKInfographicViewController *)self tableView];
  [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicViewControllerContentViewCell"];

  v24 = [(HKInfographicViewController *)self tableView];
  [v24 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicViewControllerTableViewCell"];

  v25 = [(HKInfographicViewController *)self tableView];
  [v25 registerClass:objc_opt_class() forCellReuseIdentifier:@"HKInfographicTitleDetailOptionalButtonCell"];

  v26 = [(HKInfographicViewController *)self view];
  v27 = [(HKInfographicViewController *)self tableView];
  [v26 addSubview:v27];

  v28 = [(HKInfographicViewController *)self tableView];
  v29 = [v28 leadingAnchor];
  v30 = [(HKInfographicViewController *)self view];
  v31 = [v30 leadingAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(HKInfographicViewController *)self tableView];
  v34 = [v33 trailingAnchor];
  v35 = [(HKInfographicViewController *)self view];
  v36 = [v35 trailingAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(HKInfographicViewController *)self tableView];
  v39 = [v38 topAnchor];
  v40 = [(HKInfographicViewController *)self view];
  v41 = [v40 safeAreaLayoutGuide];
  v42 = [v41 topAnchor];
  v43 = [v39 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [(HKInfographicViewController *)self tableView];
  v45 = [v44 bottomAnchor];
  v46 = [(HKInfographicViewController *)self view];
  v47 = [v46 bottomAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [(HKInfographicViewController *)self tableView];
  [v49 reloadData];

  v50.receiver = self;
  v50.super_class = (Class)HKInfographicViewController;
  [(HKInfographicViewController *)&v50 viewDidLoad];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKInfographicViewController;
  [(HKInfographicViewController *)&v3 viewWillLayoutSubviews];
  [(HKInfographicViewController *)self _updateTableViewTopPadding];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKInfographicViewController *)self items];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicViewControllerTextViewCell" forIndexPath:v7];
    v12 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v12];
LABEL_3:

    v13 = [v10 descriptionString];
    v14 = [(HKInfographicViewController *)self traitCollection];
    v15 = [(HKInfographicViewController *)self _updateAttributedString:v13 withTraitCollection:v14];
    v16 = [v11 descriptionLabel];
LABEL_4:
    v17 = v16;
    [v16 setAttributedText:v15];

LABEL_7:
    v24 = [v10 baseIdentifier];

    [v11 updateAutomationIdentifiersWith:v24];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicViewControllerLinkedTextViewCell" forIndexPath:v7];
    double v18 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v18];

    v19 = [v10 descriptionString];
    v20 = [(HKInfographicViewController *)self traitCollection];
    v21 = [(HKInfographicViewController *)self _updateAttributedString:v19 withTraitCollection:v20];
    v22 = [v11 descriptionLabel];
    [v22 setAttributedText:v21];

    v23 = [v10 didTapLinkedText];
    [v11 setDidTapLinkedText:v23];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicButtonCell" forIndexPath:v7];
    v27 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v27];

    v28 = [v26 configuration];
    v29 = [v26 buttonTapHandler];
    [v11 setConfiguration:v28 buttonTapHandler:v29];
LABEL_13:

    v30 = [v26 baseIdentifier];

    [v11 updateAutomationIdentifiersWith:v30];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicViewControllerContentViewCell" forIndexPath:v7];
    v31 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v31];

    v12 = [v10 titleString];
    v32 = [(HKInfographicViewController *)self traitCollection];
    v33 = [(HKInfographicViewController *)self _updateAttributedString:v12 withTraitCollection:v32];
    v34 = [v11 titleLabel];
    [v34 setAttributedText:v33];

    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicViewControllerTableViewCell" forIndexPath:v7];
    objc_msgSend(v11, "setSeparatorHidden:", objc_msgSend(v10, "separatorHidden"));
    v35 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v35];

    v36 = [v10 titleString];
    v37 = [(HKInfographicViewController *)self traitCollection];
    v38 = [(HKInfographicViewController *)self _updateAttributedString:v36 withTraitCollection:v37];
    v39 = [v11 titleLabel];
    [v39 setAttributedText:v38];

    v13 = [v10 valueString];
    v14 = [(HKInfographicViewController *)self traitCollection];
    v15 = [(HKInfographicViewController *)self _updateAttributedString:v13 withTraitCollection:v14];
    v16 = [v11 valueLabel];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v9;
    v11 = [v6 dequeueReusableCellWithIdentifier:@"HKInfographicTitleDetailOptionalButtonCell" forIndexPath:v7];
    v28 = [v26 titleString];
    v29 = [v26 detailString];
    v40 = [v26 buttonTextString];
    v41 = [v26 buttonAction];
    [v11 populateWithTitle:v28 detail:v29 buttonText:v40 buttonAction:v41];

    goto LABEL_13;
  }
  id v42 = objc_alloc(MEMORY[0x1E4FB1D08]);
  v11 = objc_msgSend(v42, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_8:

  return v11;
}

- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = (void *)[v5 mutableCopy];
    uint64_t v8 = [v7 length];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __75__HKInfographicViewController__updateAttributedString_withTraitCollection___block_invoke;
    v15 = &unk_1E6D531D0;
    id v16 = v6;
    id v17 = v7;
    id v9 = v7;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v12);
    id v10 = (id)objc_msgSend(v9, "copy", v12, v13, v14, v15);
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

void __75__HKInfographicViewController__updateAttributedString_withTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  id v8 = a2;
  id v18 = [v8 objectForKeyedSubscript:v7];
  uint64_t v9 = *MEMORY[0x1E4FB06B8];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

  if (v18)
  {
    v11 = [v18 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v7, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v11, a3, a4);
  }
  if (v10)
  {
    uint64_t v12 = [v10 image];
    uint64_t v13 = v12;
    if (v12)
    {
      v14 = [v12 configuration];
      v15 = v14;
      if (v14)
      {
        id v16 = [v14 configurationWithTraitCollection:*(void *)(a1 + 32)];
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v9, a3, a4);
        id v17 = [v13 imageWithConfiguration:v16];
        [v10 setImage:v17];
        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v9, v10, a3, a4);
      }
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(HKInfographicViewController *)self items];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)_updateTableViewTopPadding
{
  id v6 = [(HKInfographicViewController *)self tableView];
  [v6 _sectionContentInset];
  double v4 = v3;
  int64_t v5 = [(HKInfographicViewController *)self tableView];
  [v5 _setTopPadding:v4];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end