@interface WDAtrialFibrillationEventMetadataViewController
- (BOOL)_addSectionIfNonNull:(id)a3;
- (BOOL)firstViewDidLayoutSubviews;
- (HKCategorySample)event;
- (HKDataMetadataViewControllerDelegate)delegate;
- (NSMutableArray)sections;
- (WDAtrialFibrillationEventMetadataViewController)initWithEvent:(id)a3 delegate:(id)a4;
- (id)_atrialFibrillationEducationContainerView;
- (id)_shortVersionNumberFromString:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_loadSections;
- (void)_reloadAtrialFibrillationEducationTableHeaderView;
- (void)heartbeatSequecesListQueryComplete:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFirstViewDidLayoutSubviews:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation WDAtrialFibrillationEventMetadataViewController

- (WDAtrialFibrillationEventMetadataViewController)initWithEvent:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  v9 = [(WDAtrialFibrillationEventMetadataViewController *)&v14 initWithStyle:1];
  v10 = v9;
  if (v9)
  {
    v9->_firstViewDidLayoutSubviews = 1;
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sections = v10->_sections;
    v10->_sections = v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  [(HKTableViewController *)&v11 viewDidLoad];
  v3 = [(WDAtrialFibrillationEventMetadataViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  v5 = [v4 localizedStringForKey:@"DETAILS" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  [(WDAtrialFibrillationEventMetadataViewController *)self setTitle:v5];

  double v6 = *MEMORY[0x263F46380];
  id v7 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  [v7 setEstimatedRowHeight:v6];

  id v8 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  [v8 _setSectionContentInsetFollowsLayoutMargins:1];

  double v9 = *MEMORY[0x263F463A8];
  v10 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  [v10 _setSectionCornerRadius:v9];

  [(WDAtrialFibrillationEventMetadataViewController *)self _loadSections];
  [(WDAtrialFibrillationEventMetadataViewController *)self _reloadAtrialFibrillationEducationTableHeaderView];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDAtrialFibrillationEventMetadataViewController;
  [(WDAtrialFibrillationEventMetadataViewController *)&v6 viewDidLayoutSubviews];
  if ([(WDAtrialFibrillationEventMetadataViewController *)self firstViewDidLayoutSubviews])
  {
    [(WDAtrialFibrillationEventMetadataViewController *)self setFirstViewDidLayoutSubviews:0];
    v3 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
    v4 = [v3 tableHeaderView];
    v5 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
    [v5 setTableHeaderView:v4];
  }
}

- (BOOL)_addSectionIfNonNull:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    objc_super v6 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
    [v6 addObject:v5];
  }
  return a3 != 0;
}

- (void)_loadSections
{
  v44[2] = *MEMORY[0x263EF8340];
  v3 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  [v3 removeAllObjects];

  v4 = [(WDAtrialFibrillationEventMetadataViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(WDAtrialFibrillationEventMetadataViewController *)self delegate];
    objc_super v6 = [v5 displayTypeController];
  }
  else
  {
    objc_super v6 = 0;
  }

  id v7 = [(WDAtrialFibrillationEventMetadataViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(WDAtrialFibrillationEventMetadataViewController *)self delegate];
    double v9 = [v8 unitController];
  }
  else
  {
    double v9 = 0;
  }

  v10 = [(WDAtrialFibrillationEventMetadataViewController *)self delegate];
  objc_super v11 = [v10 healthStore];

  id v12 = objc_alloc(MEMORY[0x263F467A0]);
  v13 = [(WDAtrialFibrillationEventMetadataViewController *)self event];
  objc_super v14 = (void *)[v12 initWithEvent:v13 healthStore:v11 displayTypeController:v6 unitController:v9 delegate:self];

  [(WDAtrialFibrillationEventMetadataViewController *)self _addSectionIfNonNull:v14];
  v15 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  id v16 = objc_alloc(MEMORY[0x263F466B0]);
  v17 = [(WDAtrialFibrillationEventMetadataViewController *)self event];
  v18 = (void *)[v16 initWithSample:v17 displayTypeController:v6 unitController:v9];
  [v15 addObject:v18];

  v19 = [v11 profileIdentifier];
  uint64_t v20 = [v19 type];

  if (v20 != 2)
  {
    id v21 = objc_alloc(MEMORY[0x263F466B8]);
    v22 = [(WDAtrialFibrillationEventMetadataViewController *)self event];
    v23 = (void *)[v21 initWithSample:v22];

    if (!v23)
    {
      id v24 = objc_alloc(MEMORY[0x263F466C0]);
      v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      v26 = [v25 localizedStringForKey:@"DEVICE_DETAILS" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
      v23 = (void *)[v24 initWithTitle:v26];
    }
    v27 = [(WDAtrialFibrillationEventMetadataViewController *)self event];
    v28 = [v27 metadata];
    v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F0AAC0]];

    if (v29)
    {
      v30 = [(WDAtrialFibrillationEventMetadataViewController *)self _shortVersionNumberFromString:v29];
      v31 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      v32 = [v31 localizedStringForKey:@"ATRIAL_FIBRILLATION_PRODUCT_FEATURE_VERSION_WATCH" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Antimony"];
      v41 = v9;
      v44[0] = *MEMORY[0x263F09BF8];
      uint64_t v33 = v44[0];
      v44[1] = @"FeatureVersion";
      [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
      v34 = v40 = v14;
      HKUIJoinStringsForAutomationIdentifier();
      v35 = v42 = v6;
      [v23 addText:v30 detail:v32 baseIdentifier:v35];

      v36 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      v37 = [v36 localizedStringForKey:@"ATRIAL_FIBRILLATION_PRODUCT_UPDATE_VERSION_WATCH" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Antimony"];
      v43[0] = v33;
      v43[1] = @"UpdateVersion";
      double v9 = v41;
      v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      v39 = HKUIJoinStringsForAutomationIdentifier();
      [v23 addText:v29 detail:v37 baseIdentifier:v39];

      objc_super v14 = v40;
      objc_super v6 = v42;
    }
    -[WDAtrialFibrillationEventMetadataViewController _addSectionIfNonNull:](self, "_addSectionIfNonNull:", v23, v40);
  }
}

- (id)_shortVersionNumberFromString:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
}

- (void)_reloadAtrialFibrillationEducationTableHeaderView
{
  id v18 = [(WDAtrialFibrillationEventMetadataViewController *)self _atrialFibrillationEducationContainerView];
  uint64_t v3 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  [v3 setTableHeaderView:v18];

  v4 = [v18 widthAnchor];
  id v5 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  objc_super v6 = [v5 widthAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v8 = [v18 centerXAnchor];
  double v9 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  v10 = [v9 centerXAnchor];
  objc_super v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [v18 topAnchor];
  v13 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  objc_super v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v16 = [(WDAtrialFibrillationEventMetadataViewController *)self tableView];
  v17 = [v16 tableHeaderView];
  [v17 layoutIfNeeded];
}

- (id)_atrialFibrillationEducationContainerView
{
  id v2 = objc_alloc(MEMORY[0x263F1CB60]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = objc_alloc_init(MEMORY[0x263F47698]);
  [v3 addSubview:v4];
  objc_msgSend(v4, "hk_alignConstraintsWithView:", v3);

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v8 = a3;
  if (!v8) {
    goto LABEL_3;
  }
  id v4 = [(WDAtrialFibrillationEventMetadataViewController *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  objc_super v6 = [v8 preferredContentSizeCategory];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
LABEL_3:
  }
    [(WDAtrialFibrillationEventMetadataViewController *)self _reloadAtrialFibrillationEducationTableHeaderView];
}

- (void)heartbeatSequecesListQueryComplete:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__WDAtrialFibrillationEventMetadataViewController_heartbeatSequecesListQueryComplete___block_invoke;
  block[3] = &unk_26458DC98;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __86__WDAtrialFibrillationEventMetadataViewController_heartbeatSequecesListQueryComplete___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];

  char v7 = [v6 sectionTitle];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];

  char v7 = [v6 sectionFooter];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];

  int64_t v7 = [v6 numberOfRowsInSection];
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v10 = [v6 row];
  objc_super v11 = [v9 cellForIndex:v10 tableView:v7];

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v6 row];
  double v9 = [(WDAtrialFibrillationEventMetadataViewController *)self navigationController];
  [v10 selectCellForIndex:v8 navigationController:v9 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(WDAtrialFibrillationEventMetadataViewController *)self sections];
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v8 row];
  [v13 willDisplayCell:v9 forIndex:v12 tableView:v10];
}

- (void)viewControllerWillEnterAdaptiveModal
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C468]);
  int64_t v4 = (void *)MEMORY[0x263F1C3C0];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __87__WDAtrialFibrillationEventMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  objc_super v11 = &unk_26458DD38;
  objc_copyWeak(&v12, &location);
  id v5 = [v4 actionWithHandler:&v8];
  id v6 = objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  id v7 = [(WDAtrialFibrillationEventMetadataViewController *)self navigationItem];
  [v7 setLeftBarButtonItem:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __87__WDAtrialFibrillationEventMetadataViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2 = [(WDAtrialFibrillationEventMetadataViewController *)self navigationItem];
  [v2 setLeftBarButtonItem:0];
}

- (BOOL)firstViewDidLayoutSubviews
{
  return self->_firstViewDidLayoutSubviews;
}

- (void)setFirstViewDidLayoutSubviews:(BOOL)a3
{
  self->_firstViewDidLayoutSubviews = a3;
}

- (HKCategorySample)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKDataMetadataViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end