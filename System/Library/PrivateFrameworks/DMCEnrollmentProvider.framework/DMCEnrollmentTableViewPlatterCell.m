@interface DMCEnrollmentTableViewPlatterCell
- (DMCEnrollmentTableViewPlatterCell)initWithCellData:(id)a3 parentTableView:(id)a4 useShadow:(BOOL)a5;
- (DMCEnrollmentTemplateTableViewController)tableViewController;
- (NSArray)cellData;
- (NSNumber)customHorizontalMargin;
- (UITableView)parentTableView;
- (UIView)shadowView;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (double)previousWidth;
- (void)layoutSubviews;
- (void)setCellData:(id)a3;
- (void)setCustomHorizontalMargin:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setParentTableView:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setShadowView:(id)a3;
- (void)setTableViewController:(id)a3;
@end

@implementation DMCEnrollmentTableViewPlatterCell

- (DMCEnrollmentTableViewPlatterCell)initWithCellData:(id)a3 parentTableView:(id)a4 useShadow:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v49.receiver = self;
  v49.super_class = (Class)DMCEnrollmentTableViewPlatterCell;
  v13 = [(DMCEnrollmentTableViewPlatterCell *)&v49 initWithStyle:0 reuseIdentifier:v12];

  if (v13)
  {
    v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DMCEnrollmentTableViewPlatterCell *)v13 setBackgroundColor:v14];

    [(DMCEnrollmentTableViewPlatterCell *)v13 setSelectionStyle:0];
    v15 = [(DMCEnrollmentTableViewPlatterCell *)v13 contentView];
    v16 = [v15 layer];
    [v16 setMasksToBounds:0];

    objc_storeStrong((id *)&v13->_cellData, a3);
    objc_storeWeak((id *)&v13->_parentTableView, v10);
    if (v5)
    {
      uint64_t v17 = objc_opt_new();
      shadowView = v13->_shadowView;
      v13->_shadowView = (UIView *)v17;

      v19 = [MEMORY[0x263F1C550] systemBackgroundColor];
      [(UIView *)v13->_shadowView setBackgroundColor:v19];

      v20 = [(UIView *)v13->_shadowView layer];
      [v20 setMasksToBounds:0];

      v21 = [(UIView *)v13->_shadowView layer];
      objc_msgSend(v21, "setShadowOffset:", 0.0, 3.0);

      v22 = [(UIView *)v13->_shadowView layer];
      [v22 setShadowRadius:5.0];

      v23 = [(UIView *)v13->_shadowView layer];
      LODWORD(v24) = 1053609165;
      [v23 setShadowOpacity:v24];

      id v25 = [MEMORY[0x263F1C550] lightGrayColor];
      uint64_t v26 = [v25 CGColor];
      v27 = [(UIView *)v13->_shadowView layer];
      [v27 setShadowColor:v26];
    }
    v28 = [[DMCEnrollmentTemplateTableViewController alloc] initWithIconNames:0 iconImages:0 title:0 subTitle:0 layoutStyle:1];
    tableViewController = v13->_tableViewController;
    v13->_tableViewController = v28;

    v30 = [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController tableView];
    [v30 setScrollEnabled:0];

    v31 = [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController tableView];
    [v31 setAutoresizingMask:18];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = v9;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v32);
          }
          [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController addSectionWithCellData:*(void *)(*((void *)&v45 + 1) + 8 * v35++) animated:0];
        }
        while (v33 != v35);
        uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v33);
    }

    [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController willMoveToParentViewController:0];
    v36 = [(DMCEnrollmentTableViewPlatterCell *)v13 contentView];
    [v36 addSubview:v13->_shadowView];

    v37 = [(DMCEnrollmentTableViewPlatterCell *)v13 contentView];
    v38 = [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController tableView];
    [v37 addSubview:v38];

    [(DMCEnrollmentTemplateTableViewController *)v13->_tableViewController didMoveToParentViewController:0];
    objc_initWeak(&location, v13);
    uint64_t v50 = objc_opt_class();
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke;
    v42[3] = &unk_2645E8EB0;
    objc_copyWeak(&v43, &location);
    id v40 = (id)[(DMCEnrollmentTableViewPlatterCell *)v13 registerForTraitChanges:v39 withHandler:v42];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke_2;
  block[3] = &unk_2645E90A0;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentTableView];
  [v1 reloadData];
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)DMCEnrollmentTableViewPlatterCell;
  [(DMCEnrollmentTableViewPlatterCell *)&v57 layoutSubviews];
  v3 = [(DMCEnrollmentTableViewPlatterCell *)self layer];
  [v3 setMasksToBounds:0];

  [(DMCEnrollmentTableViewPlatterCell *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8 + 6.0;
  double v11 = v10 + -12.0;
  v12 = [(DMCEnrollmentTableViewPlatterCell *)self shadowView];
  objc_msgSend(v12, "setFrame:", v9, v5, v11, v7);

  v13 = [(DMCEnrollmentTableViewPlatterCell *)self customHorizontalMargin];

  if (v13)
  {
    [(DMCEnrollmentTableViewPlatterCell *)self bounds];
    double v15 = v14;
    double v5 = v16;
    double v18 = v17;
    double v7 = v19;
    v20 = [(DMCEnrollmentTableViewPlatterCell *)self customHorizontalMargin];
    [v20 floatValue];
    double v9 = v15 + v21;

    v22 = [(DMCEnrollmentTableViewPlatterCell *)self customHorizontalMargin];
    [v22 floatValue];
    double v11 = v18 - (float)(v23 + v23);
  }
  double v24 = [(DMCEnrollmentTableViewPlatterCell *)self tableViewController];
  id v25 = [v24 tableView];
  objc_msgSend(v25, "setFrame:", v9, v5, v11, v7);

  uint64_t v26 = [MEMORY[0x263F1C550] clearColor];
  v27 = [(DMCEnrollmentTemplateTableViewController *)self->_tableViewController tableView];
  [v27 setBackgroundColor:v26];

  v28 = [(DMCEnrollmentTableViewPlatterCell *)self layer];
  [v28 cornerRadius];
  double v30 = v29;
  v31 = [(DMCEnrollmentTableViewPlatterCell *)self shadowView];
  id v32 = [v31 layer];
  [v32 setCornerRadius:v30];

  uint64_t v33 = (void *)MEMORY[0x263F1C478];
  uint64_t v34 = [(DMCEnrollmentTableViewPlatterCell *)self shadowView];
  [v34 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  id v43 = [(DMCEnrollmentTableViewPlatterCell *)self layer];
  [v43 cornerRadius];
  objc_msgSend(v33, "bezierPathWithRoundedRect:cornerRadius:", v36, v38, v40, v42, v44);
  id v45 = objc_claimAutoreleasedReturnValue();
  uint64_t v46 = [v45 CGPath];
  long long v47 = [(DMCEnrollmentTableViewPlatterCell *)self shadowView];
  long long v48 = [v47 layer];
  [v48 setShadowPath:v46];

  [(DMCEnrollmentTableViewPlatterCell *)self previousWidth];
  double v50 = v49;
  v51 = [(DMCEnrollmentTableViewPlatterCell *)self contentView];
  [v51 bounds];
  double v53 = v52;

  if (v50 != v53)
  {
    v54 = [(DMCEnrollmentTableViewPlatterCell *)self contentView];
    [v54 bounds];
    [(DMCEnrollmentTableViewPlatterCell *)self setPreviousWidth:v55];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__DMCEnrollmentTableViewPlatterCell_layoutSubviews__block_invoke;
    block[3] = &unk_2645E90A0;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__DMCEnrollmentTableViewPlatterCell_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentTableView];
  [v1 reloadData];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(DMCEnrollmentTableViewPlatterCell *)self tableViewController];
  [v4 setInProgress:v3];
}

- (double)cellHeight
{
  id v2 = [(DMCEnrollmentTableViewPlatterCell *)self tableViewController];
  BOOL v3 = [v2 tableView];
  [v3 contentSize];
  double v5 = v4;

  return v5;
}

- (double)estimatedCellHeight
{
  return 200.0;
}

- (DMCEnrollmentTemplateTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (NSNumber)customHorizontalMargin
{
  return self->_customHorizontalMargin;
}

- (void)setCustomHorizontalMargin:(id)a3
{
}

- (UITableView)parentTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTableView);
  return (UITableView *)WeakRetained;
}

- (void)setParentTableView:(id)a3
{
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (NSArray)cellData
{
  return self->_cellData;
}

- (void)setCellData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellData, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_parentTableView);
  objc_storeStrong((id *)&self->_customHorizontalMargin, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

@end