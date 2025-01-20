@interface DMCEnrollmentiCloudPromotionViewController
- (DMCEnrollmentiCloudPromotionViewController)initWithType:(unint64_t)a3 delegate:(id)a4;
- (DMCEnrollmentiCloudPromotionViewControllerDelegate)delegate;
- (NSString)quotaString;
- (unint64_t)type;
- (void)_setupBottomViewForType:(unint64_t)a3;
- (void)_setupUIForType:(unint64_t)a3;
- (void)leftBarButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQuotaString:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)viewControllerHasBeenDismissed;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentiCloudPromotionViewController

- (DMCEnrollmentiCloudPromotionViewController)initWithType:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v7 = DMCLocalizedString();
  if (a3 > 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = DMCLocalizedString();
  }
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentiCloudPromotionViewController;
  v9 = [(DMCEnrollmentTemplateTableViewController *)&v12 initWithIconNames:&unk_26D44B068 title:v7 subTitle:v8];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentiCloudPromotionViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v4 viewWillAppear:a3];
  if (([(DMCEnrollmentiCloudPromotionViewController *)self isBeingPresented] & 1) != 0
    || [(DMCEnrollmentiCloudPromotionViewController *)self isMovingToParentViewController])
  {
    [(DMCEnrollmentiCloudPromotionViewController *)self _setupUIForType:[(DMCEnrollmentiCloudPromotionViewController *)self type]];
  }
}

- (void)_setupUIForType:(unint64_t)a3
{
  v61[1] = *MEMORY[0x263EF8340];
  v5 = [(DMCEnrollmentiCloudPromotionViewController *)self navigationItem];
  [v5 setHidesBackButton:1];

  id v6 = objc_opt_new();
  unint64_t v7 = 0x263EFF000uLL;
  if (a3 == 1)
  {
    v50 = [(DMCEnrollmentiCloudPromotionViewController *)self quotaString];
    v14 = DMCLocalizedFormat();

    v15 = [DMCEnrollmentTableViewPromotionCell alloc];
    v16 = DMCLocalizedString();
    v17 = +[DMCIconFactory iCloudIcon];
    v18 = [(DMCEnrollmentTableViewPromotionCell *)v15 initWithTitle:v14 subtitle:v16 icon:v17];
    v60 = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    [v6 addObject:v19];

    unint64_t v7 = 0x263EFF000uLL;
  }
  else if (!a3)
  {
    v8 = [DMCEnrollmentTableViewPromotionCell alloc];
    v9 = DMCLocalizedString();
    v10 = DMCLocalizedString();
    v11 = +[DMCIconFactory iCloudIcon];
    objc_super v12 = [(DMCEnrollmentTableViewPromotionCell *)v8 initWithTitle:v9 subtitle:v10 icon:v11];
    v61[0] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:1];
    [v6 addObject:v13];

    unint64_t v7 = 0x263EFF000;
    [(DMCEnrollmentTemplateTableViewController *)self updateNavBarButtonType:1 forButtonPosition:0 enabled:1];
    [(DMCEnrollmentiCloudPromotionViewController *)self setModalInPresentation:1];
  }
  v20 = [DMCEnrollmentTableViewPromotionCell alloc];
  v21 = DMCLocalizedString();
  v22 = DMCLocalizedString();
  v23 = +[DMCIconFactory iCloudCollaborationIcon];
  v24 = [(DMCEnrollmentTableViewPromotionCell *)v20 initWithTitle:v21 subtitle:v22 icon:v23];
  v59 = v24;
  [*(id *)(v7 + 2240) arrayWithObjects:&v59 count:1];
  v26 = unint64_t v25 = v7;
  [v6 addObject:v26];

  v27 = [DMCEnrollmentTableViewPromotionCell alloc];
  v28 = DMCLocalizedString();
  v29 = DMCLocalizedString();
  v30 = +[DMCIconFactory notesIcon];
  v31 = [(DMCEnrollmentTableViewPromotionCell *)v27 initWithTitle:v28 subtitle:v29 icon:v30];
  v58 = v31;
  v32 = [*(id *)(v25 + 2240) arrayWithObjects:&v58 count:1];
  [v6 addObject:v32];

  if ([(DMCEnrollmentiCloudPromotionViewController *)self type] == 1)
  {
    v33 = [DMCEnrollmentTableViewPromotionCell alloc];
    v34 = DMCLocalizedString();
    v35 = DMCLocalizedString();
    v36 = +[DMCIconFactory workBadgeIcon];
    v37 = [(DMCEnrollmentTableViewPromotionCell *)v33 initWithTitle:v34 subtitle:v35 icon:v36];
    v57 = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
    [v6 addObject:v38];
  }
  if ([MEMORY[0x263F38B98] isPad])
  {
    v39 = [DMCEnrollmentTableViewPlatterCell alloc];
    v40 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
    v41 = [(DMCEnrollmentTableViewPlatterCell *)v39 initWithCellData:v6 parentTableView:v40 useShadow:0];

    v42 = [(DMCEnrollmentTableViewPlatterCell *)v41 tableViewController];
    [v42 setCustomTopMargin:&unk_26D44B0F8];

    [(DMCEnrollmentTableViewPlatterCell *)v41 setCustomHorizontalMargin:&unk_26D44B108];
    v43 = [(DMCEnrollmentTableViewPlatterCell *)v41 tableViewController];
    v44 = [v43 view];
    [v44 setNeedsLayout];

    v56 = v41;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
    [(DMCEnrollmentTemplateTableViewController *)self addSectionWithCellData:v45 animated:0];
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v41 = v6;
    uint64_t v46 = [(DMCEnrollmentTableViewPlatterCell *)v41 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v52 != v48) {
            objc_enumerationMutation(v41);
          }
          [(DMCEnrollmentTemplateTableViewController *)self addSectionWithCellData:*(void *)(*((void *)&v51 + 1) + 8 * i) animated:0];
        }
        uint64_t v47 = [(DMCEnrollmentTableViewPlatterCell *)v41 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v47);
    }
  }

  [(DMCEnrollmentiCloudPromotionViewController *)self _setupBottomViewForType:a3];
}

- (void)_setupBottomViewForType:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_initWeak(&location, self);
    v8 = [DMCEnrollmentConfirmationView alloc];
    v5 = DMCLocalizedString();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke_3;
    v10[3] = &unk_2645E9398;
    id v6 = &v11;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [(DMCEnrollmentConfirmationView *)v8 initWithConfirmationText:v5 cancelText:@" " confirmationAction:v10 cancelAction:&__block_literal_global_58];
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_initWeak(&location, self);
    objc_super v4 = [DMCEnrollmentConfirmationView alloc];
    v5 = DMCLocalizedString();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke;
    v12[3] = &unk_2645E9398;
    id v6 = &v13;
    objc_copyWeak(&v13, &location);
    uint64_t v7 = [(DMCEnrollmentConfirmationView *)v4 initWithConfirmationText:v5 cancelText:@" " confirmationAction:v12 cancelAction:&__block_literal_global_2];
  }
  v9 = (void *)v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
LABEL_7:
  [(DMCEnrollmentTemplateTableViewController *)self addBottomView:v9];
}

void __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 iCloudPromotionViewController:v3 didReceiveUserAction:1];

    id WeakRetained = v3;
  }
}

void __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 iCloudPromotionViewController:v3 didReceiveUserAction:1];

    id WeakRetained = v3;
  }
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4 = [(DMCEnrollmentiCloudPromotionViewController *)self delegate];
  [v4 iCloudPromotionViewController:self didReceiveUserAction:0];
}

- (void)viewControllerHasBeenDismissed
{
  id v3 = [(DMCEnrollmentiCloudPromotionViewController *)self delegate];
  [v3 iCloudPromotionViewController:self didReceiveUserAction:0];
}

- (NSString)quotaString
{
  return self->_quotaString;
}

- (void)setQuotaString:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (DMCEnrollmentiCloudPromotionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentiCloudPromotionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quotaString, 0);
}

@end