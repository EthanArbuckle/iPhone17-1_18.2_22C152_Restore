@interface DMCEnrollmentTemplateTableViewController
- (BOOL)inProgress;
- (DMCEnrollmentTableViewIconCell)iconCell;
- (DMCEnrollmentTableViewTextCell)subtitleCell;
- (DMCEnrollmentTableViewTitleCell)titleCell;
- (DMCEnrollmentTemplateTableViewController)initWithIconImages:(id)a3 title:(id)a4 subTitle:(id)a5;
- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6 layoutStyle:(unint64_t)a7;
- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 title:(id)a4 subTitle:(id)a5;
- (DMCEnrollmentTemplateTableViewController)initWithStyle:(int64_t)a3;
- (NSArray)iconNames;
- (NSMutableArray)cellDataCollection;
- (NSNumber)customTopMargin;
- (NSString)subtitleText;
- (NSString)titleText;
- (SEL)_actionSelectorForBarButtonPosition:(unint64_t)a3;
- (UITableView)tableView;
- (UIView)bottomContainerView;
- (UIView)bottomView;
- (UIView)floatyBottomView;
- (UIVisualEffectView)effectView;
- (double)_lastCellBlockedHeight;
- (double)gapBetweenButtons;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_addCellData:(id)a3 createNewSection:(BOOL)a4 animated:(BOOL)a5;
- (unint64_t)addCellData:(id)a3 animated:(BOOL)a4;
- (unint64_t)addSectionWithCellData:(id)a3 animated:(BOOL)a4;
- (unint64_t)headerSection;
- (unint64_t)layoutStyle;
- (void)_addBottomView:(id)a3;
- (void)_adjustFloatyViewFrameWithKeyboardFrame:(CGRect)a3 animationDuration:(double)a4;
- (void)_maskNavigationBar;
- (void)_setUpBackdrops;
- (void)_setupHeaderSectionWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6;
- (void)_setupNotification;
- (void)_touchViewFrame:(id)a3;
- (void)_updateEffectiveViewVisibility;
- (void)_updateFloatyViewForKeyboardFrame:(CGRect)a3 duration:(double)a4;
- (void)addBottomView:(id)a3;
- (void)addCellData:(id)a3 toSection:(unint64_t)a4 animated:(BOOL)a5;
- (void)addFloatyBottomView:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)removeCellData:(id)a3 fromSection:(unint64_t)a4 animated:(BOOL)a5;
- (void)setBottomContainerView:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setCellDataCollection:(id)a3;
- (void)setCustomTopMargin:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFloatyBottomView:(id)a3;
- (void)setGapBetweenButtons:(double)a3;
- (void)setHeaderSection:(unint64_t)a3;
- (void)setIconCell:(id)a3;
- (void)setIconNames:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setSubtitleCell:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleCell:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateContinueButtonStatus;
- (void)updateNavBarButtonType:(unint64_t)a3 forButtonPosition:(unint64_t)a4 enabled:(BOOL)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DMCEnrollmentTemplateTableViewController

- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 title:(id)a4 subTitle:(id)a5
{
  return [(DMCEnrollmentTemplateTableViewController *)self initWithIconNames:a3 iconImages:0 title:a4 subTitle:a5 layoutStyle:0];
}

- (DMCEnrollmentTemplateTableViewController)initWithIconImages:(id)a3 title:(id)a4 subTitle:(id)a5
{
  return [(DMCEnrollmentTemplateTableViewController *)self initWithIconNames:0 iconImages:a3 title:a4 subTitle:a5 layoutStyle:0];
}

- (DMCEnrollmentTemplateTableViewController)initWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6 layoutStyle:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [(DMCEnrollmentTemplateTableViewController *)self initWithStyle:2];
  v17 = v16;
  if (v16)
  {
    v16->_layoutStyle = a7;
    [(DMCEnrollmentTemplateTableViewController *)v16 _setupHeaderSectionWithIconNames:v12 iconImages:v13 title:v14 subTitle:v15];
  }

  return v17;
}

- (DMCEnrollmentTemplateTableViewController)initWithStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  v4 = [(DMCEnrollmentTemplateTableViewController *)&v12 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CA40]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:style:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v6;

    [(UITableView *)v4->_tableView setBounces:1];
    [(UITableView *)v4->_tableView setAlwaysBounceVertical:0];
    [(UITableView *)v4->_tableView setDelegate:v4];
    [(UITableView *)v4->_tableView setDataSource:v4];
    [(UITableView *)v4->_tableView setClipsToBounds:0];
    v8 = [(DMCEnrollmentTemplateTableViewController *)v4 view];
    [v8 addSubview:v4->_tableView];

    uint64_t v9 = objc_opt_new();
    cellDataCollection = v4->_cellDataCollection;
    v4->_cellDataCollection = (NSMutableArray *)v9;

    [(DMCEnrollmentTemplateTableViewController *)v4 _setupNotification];
  }
  return v4;
}

- (void)_setupNotification
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardDidShow_ name:*MEMORY[0x263F1D418] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];
}

- (void)_setupHeaderSectionWithIconNames:(id)a3 iconImages:(id)a4 title:(id)a5 subTitle:(id)a6
{
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_new();
  if ([v26 count])
  {
    id v14 = (NSArray *)[v26 copy];
    iconNames = self->_iconNames;
    self->_iconNames = v14;

    v16 = [[DMCEnrollmentTableViewIconCell alloc] initWithIconNames:v26];
  }
  else
  {
    if (![v10 count]) {
      goto LABEL_6;
    }
    v16 = [[DMCEnrollmentTableViewIconCell alloc] initWithIconImages:v10 layoutStyle:self->_layoutStyle];
  }
  iconCell = self->_iconCell;
  self->_iconCell = v16;

  [v13 addObject:self->_iconCell];
LABEL_6:
  if ([v11 length])
  {
    v18 = (NSString *)[v11 copy];
    titleText = self->_titleText;
    self->_titleText = v18;

    v20 = [[DMCEnrollmentTableViewTitleCell alloc] initWithTitle:v11];
    titleCell = self->_titleCell;
    self->_titleCell = v20;

    [v13 addObject:self->_titleCell];
  }
  if ([v12 length])
  {
    v22 = (NSString *)[v12 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v22;

    v24 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:v12 bold:0];
    subtitleCell = self->_subtitleCell;
    self->_subtitleCell = v24;

    [v13 addObject:self->_subtitleCell];
  }
  if ([v13 count]) {
    self->_headerSection = [(DMCEnrollmentTemplateTableViewController *)self addSectionWithCellData:v13 animated:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v8 viewWillAppear:a3];
  v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v5 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v5 setBackgroundColor:v4];

  uint64_t v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v7 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  [v7 setBackgroundColor:v6];

  [(DMCEnrollmentTemplateTableViewController *)self _maskNavigationBar];
}

- (void)viewWillLayoutSubviews
{
  v77.receiver = self;
  v77.super_class = (Class)DMCEnrollmentTemplateTableViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v77 viewWillLayoutSubviews];
  v3 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = [MEMORY[0x263F38B98] isPad];
  double v13 = 38.0;
  if (!v12) {
    double v13 = 0.0;
  }
  double v76 = v13;
  id v14 = [(DMCEnrollmentTemplateTableViewController *)self view];
  id v15 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  [v14 sendSubviewToBack:v15];

  v16 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  double v75 = v9;
  if (v16)
  {
  }
  else
  {
    v17 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];

    if (!v17)
    {
      double v74 = 0.0;
      goto LABEL_22;
    }
  }
  v18 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v18 bounds];
  CGFloat v19 = CGRectGetWidth(v78) + v76 * -2.0 + -34.0;
  v20 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v20 safeAreaInsets];
  double v22 = v19 + v21 * -2.0;

  v23 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
  objc_msgSend(v23, "sizeThatFits:", v22, 1.79769313e308);
  double v25 = v24;

  id v26 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  objc_msgSend(v26, "sizeThatFits:", v22, 1.79769313e308);
  double v28 = v27;

  v29 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
  if (v29) {
    double v30 = 24.0;
  }
  else {
    double v30 = 0.0;
  }

  [(DMCEnrollmentTemplateTableViewController *)self gapBetweenButtons];
  if (v30 >= v31) {
    double v32 = v30;
  }
  else {
    double v32 = v31;
  }
  v33 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v33 safeAreaInsets];
  double v35 = v34 + 32.0;

  v36 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];

  if (v36) {
    double v35 = v32 + v28 + v35;
  }
  v37 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];

  double v38 = -0.0;
  if (v37) {
    double v38 = v25;
  }
  double v39 = v35 + v38;
  v40 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v40 bounds];
  CGFloat v41 = CGRectGetMaxY(v79) - v39;
  v42 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v42 bounds];
  double Width = CGRectGetWidth(v80);
  v44 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  double v74 = v39;
  objc_msgSend(v44, "setFrame:", 0.0, v41, Width, v39);

  v45 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v45 safeAreaInsets];
  double v47 = v76 + 17.0 + v46;
  v48 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  if (v48) {
    double v49 = v28 + v32 + 24.0;
  }
  else {
    double v49 = 24.0;
  }
  v50 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
  objc_msgSend(v50, "setFrame:", v47, v49, v22, v25);

  v51 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v51 safeAreaInsets];
  double v53 = v76 + 17.0 + v52;
  v54 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  objc_msgSend(v54, "setFrame:", v53, 24.0, v22, v28);

  if (([MEMORY[0x263F38B98] isPad] & 1) == 0)
  {
    v55 = [(DMCEnrollmentTemplateTableViewController *)self view];
    [v55 safeAreaInsets];
    double v75 = 8.0 - v56;
  }
  double v7 = v72;
  double v5 = v73;
  double v11 = v71;
LABEL_22:
  v57 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  [v57 verticalScrollIndicatorInsets];
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;

  v64 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  objc_msgSend(v64, "setVerticalScrollIndicatorInsets:", v59, v61, v63, -v76);

  v65 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v65 bounds];
  CGFloat v66 = CGRectGetWidth(v81) + v76 * -2.0;
  v67 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v67 bounds];
  CGFloat v68 = CGRectGetMaxY(v82) - v74 + 1.0;
  v69 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  objc_msgSend(v69, "setFrame:", v76, 0.0, v66, v68);

  v70 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  objc_msgSend(v70, "setContentInset:", v5, v7, v75, v11);

  [(DMCEnrollmentTemplateTableViewController *)self _updateEffectiveViewVisibility];
}

- (void)addBottomView:(id)a3
{
  id v6 = a3;
  double v4 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];

  if (v4)
  {
    double v5 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
    [v5 removeFromSuperview];
  }
  [(DMCEnrollmentTemplateTableViewController *)self _addBottomView:v6];
  [(DMCEnrollmentTemplateTableViewController *)self setBottomView:v6];
}

- (void)addFloatyBottomView:(id)a3
{
  id v6 = a3;
  double v4 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];

  if (v4)
  {
    double v5 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
    [v5 removeFromSuperview];
  }
  [(DMCEnrollmentTemplateTableViewController *)self _addBottomView:v6];
  [(DMCEnrollmentTemplateTableViewController *)self setFloatyBottomView:v6];
}

- (void)_addBottomView:(id)a3
{
  id v4 = a3;
  double v5 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(DMCEnrollmentTemplateTableViewController *)self setBottomContainerView:v6];

    double v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
    double v8 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
    [v8 setBackgroundColor:v7];

    double v9 = [(DMCEnrollmentTemplateTableViewController *)self view];
    double v10 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
    [v9 addSubview:v10];

    [(DMCEnrollmentTemplateTableViewController *)self _setUpBackdrops];
  }
  id v11 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  [v11 addSubview:v4];
}

- (void)setIconNames:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_iconNames, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    iconNames = self->_iconNames;
    self->_iconNames = v4;

    [(DMCEnrollmentTableViewIconCell *)self->_iconCell setIconNames:v6];
  }
}

- (void)setTitleText:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    id v4 = (NSString *)[v8 copy];
    titleText = self->_titleText;
    self->_titleText = v4;

    id v6 = self->_titleText;
    double v7 = [(DMCEnrollmentTemplateTableViewController *)self titleCell];
    [v7 setTitle:v6];
  }
}

- (void)setSubtitleText:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSString *)self->_subtitleText isEqualToString:v4])
  {
    double v5 = (NSString *)[v4 copy];
    subtitleText = self->_subtitleText;
    self->_subtitleText = v5;

    double v7 = [(DMCEnrollmentTemplateTableViewController *)self subtitleCell];
    if (v7)
    {
    }
    else if ([v4 length])
    {
      double v13 = [[DMCEnrollmentTableViewTextCell alloc] initWithText:v4 bold:0];
      [(DMCEnrollmentTemplateTableViewController *)self setSubtitleCell:v13];

      id v11 = [(DMCEnrollmentTemplateTableViewController *)self subtitleCell];
      v17[0] = v11;
      int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      [(DMCEnrollmentTemplateTableViewController *)self addCellData:v12 toSection:[(DMCEnrollmentTemplateTableViewController *)self headerSection] animated:0];
      goto LABEL_9;
    }
    uint64_t v8 = [(DMCEnrollmentTemplateTableViewController *)self subtitleCell];
    if (!v8) {
      goto LABEL_10;
    }
    double v9 = (void *)v8;
    uint64_t v10 = [v4 length];

    if (v10) {
      goto LABEL_10;
    }
    id v11 = [(DMCEnrollmentTemplateTableViewController *)self subtitleCell];
    v16 = v11;
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    [(DMCEnrollmentTemplateTableViewController *)self removeCellData:v12 fromSection:[(DMCEnrollmentTemplateTableViewController *)self headerSection] animated:0];
LABEL_9:

LABEL_10:
    id v14 = self->_subtitleText;
    id v15 = [(DMCEnrollmentTemplateTableViewController *)self subtitleCell];
    [v15 setText:v14];
  }
}

- (void)setInProgress:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_inProgress != a3)
  {
    self->_inProgress = a3;
    BOOL v4 = !a3;
    double v5 = [(DMCEnrollmentTemplateTableViewController *)self view];
    [v5 setUserInteractionEnabled:v4];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v8);
                }
                double v13 = *(void **)(*((void *)&v17 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
                  [v13 setEnabled:v4];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v10);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }

    [(DMCEnrollmentTemplateTableViewController *)self updateContinueButtonStatus];
  }
}

- (void)updateContinueButtonStatus
{
  if ([(DMCEnrollmentTemplateTableViewController *)self inProgress]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(DMCEnrollmentTemplateTableViewController *)self updateNavBarButtonType:v3 forButtonPosition:1 enabled:0];
}

- (void)updateNavBarButtonType:(unint64_t)a3 forButtonPosition:(unint64_t)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self navigationItem];
  uint64_t v10 = v9;
  if (a4) {
    [v9 rightBarButtonItem];
  }
  else {
  uint64_t v16 = [v9 leftBarButtonItem];
  }

  if (a3 - 1 < 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(DMCEnrollmentUIBarButtonItem *)v16 type] == a3)
    {
      uint64_t v11 = v16;
      int v12 = v16;
      goto LABEL_17;
    }
    double v13 = [[DMCEnrollmentUIBarButtonItem alloc] initWithType:a3 target:self action:[(DMCEnrollmentTemplateTableViewController *)self _actionSelectorForBarButtonPosition:a4]];
    goto LABEL_13;
  }
  if (a3)
  {
    double v13 = 0;
LABEL_13:
    int v12 = v16;
    goto LABEL_14;
  }
  int v12 = v16;
  if (!v16) {
    goto LABEL_21;
  }
  double v13 = 0;
LABEL_14:
  if (v13 != v12)
  {
    [(DMCEnrollmentUIBarButtonItem *)v13 setEnabled:v5];
    id v14 = [(DMCEnrollmentTemplateTableViewController *)self navigationItem];
    uint64_t v15 = v14;
    if (a4) {
      [v14 setRightBarButtonItem:v13];
    }
    else {
      [v14 setLeftBarButtonItem:v13];
    }

    goto LABEL_20;
  }
LABEL_17:
  uint64_t v16 = v12;
  [(DMCEnrollmentUIBarButtonItem *)v12 setEnabled:v5];
  double v13 = v16;
LABEL_20:

  int v12 = v16;
LABEL_21:
}

- (SEL)_actionSelectorForBarButtonPosition:(unint64_t)a3
{
  if (a3 == 1) {
    return sel_rightBarButtonTapped_;
  }
  if (!a3) {
    return sel_leftBarButtonTapped_;
  }
  return self;
}

- (void)_maskNavigationBar
{
  v13.width = 1.0;
  v13.height = 1.0;
  UIGraphicsBeginImageContext(v13);
  uint64_t v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v3 set];

  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  UIRectFill(v14);
  UIGraphicsGetImageFromCurrentImageContext();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  BOOL v4 = [(DMCEnrollmentTemplateTableViewController *)self navigationController];
  BOOL v5 = [v4 navigationBar];
  [v5 setBackgroundImage:v11 forBarMetrics:0];

  id v6 = [(DMCEnrollmentTemplateTableViewController *)self navigationController];
  double v7 = [v6 navigationBar];
  id v8 = objc_opt_new();
  [v7 setShadowImage:v8];

  uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self navigationController];
  uint64_t v10 = [v9 navigationBar];
  [v10 setTranslucent:1];
}

- (unint64_t)addCellData:(id)a3 animated:(BOOL)a4
{
  return [(DMCEnrollmentTemplateTableViewController *)self _addCellData:a3 createNewSection:0 animated:a4];
}

- (unint64_t)addSectionWithCellData:(id)a3 animated:(BOOL)a4
{
  return [(DMCEnrollmentTemplateTableViewController *)self _addCellData:a3 createNewSection:1 animated:a4];
}

- (void)addCellData:(id)a3 toSection:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v10 = [v9 count];

  id v11 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  int v12 = v11;
  if (v10 <= a4)
  {
    uint64_t v16 = (void *)[v8 mutableCopy];

    [v12 addObject:v16];
    if (!v5) {
      goto LABEL_7;
    }
    CGRect v14 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
    uint64_t v15 = [MEMORY[0x263F088D0] indexSetWithIndex:a4];
    [v14 insertSections:v15 withRowAnimation:0];
  }
  else
  {
    CGSize v13 = [v11 objectAtIndexedSubscript:a4];
    [v13 addObjectsFromArray:v8];

    if (!v5) {
      goto LABEL_7;
    }
    CGRect v14 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
    uint64_t v15 = [MEMORY[0x263F088D0] indexSetWithIndex:a4];
    [v14 reloadSections:v15 withRowAnimation:100];
  }

LABEL_7:
  id v17 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  [v17 reloadData];
}

- (unint64_t)_addCellData:(id)a3 createNewSection:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v10 = [v9 count] - !v6;

  [(DMCEnrollmentTemplateTableViewController *)self addCellData:v8 toSection:v10 animated:v5];
  return v10;
}

- (void)removeCellData:(id)a3 fromSection:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v10 = [v9 count];

  if (v10 > a4 && [v8 count])
  {
    id v11 = objc_opt_new();
    int v12 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    CGSize v13 = [v12 objectAtIndexedSubscript:a4];

    CGRect v14 = objc_opt_new();
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __80__DMCEnrollmentTemplateTableViewController_removeCellData_fromSection_animated___block_invoke;
    double v28 = &unk_2645E9690;
    id v29 = v8;
    id v15 = v11;
    id v30 = v15;
    id v16 = v14;
    id v31 = v16;
    unint64_t v32 = a4;
    [v13 enumerateObjectsUsingBlock:&v25];
    uint64_t v17 = objc_msgSend(v15, "count", v25, v26, v27, v28);
    long long v18 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    long long v19 = v18;
    if (v17)
    {
      [v18 setObject:v15 atIndexedSubscript:a4];

      long long v20 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
      long long v21 = v20;
      if (v5) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = 5;
      }
      [v20 deleteRowsAtIndexPaths:v16 withRowAnimation:v22];
    }
    else
    {
      [v18 removeObjectAtIndex:a4];

      long long v21 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
      long long v23 = [MEMORY[0x263F088D0] indexSetWithIndex:a4];
      if (v5) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = 5;
      }
      [v21 deleteSections:v23 withRowAnimation:v24];
    }
  }
}

void __80__DMCEnrollmentTemplateTableViewController_removeCellData_fromSection_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    BOOL v5 = *(void **)(a1 + 48);
    BOOL v6 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:*(void *)(a1 + 56)];
    [v5 addObject:v6];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return 0;
  }
  id v8 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a4];
  int64_t v10 = [v9 count];

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v5 row];

  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
  int64_t v10 = [v9 cell];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 section];
  unint64_t v7 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    double v13 = *MEMORY[0x263F1D600];
  }
  else
  {
    uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    int64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    [v11 cellHeight];
    double v13 = v12;
  }
  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 section];
  unint64_t v7 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    double v13 = *MEMORY[0x263F1D600];
  }
  else
  {
    uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    int64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    [v11 estimatedCellHeight];
    double v13 = v12;
  }
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F1CA68]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F1CA68]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  unint64_t v6 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return *MEMORY[0x263F1D600];
  }
  unint64_t v8 = [(DMCEnrollmentTemplateTableViewController *)self customTopMargin];

  if (v8)
  {
    uint64_t v9 = [(DMCEnrollmentTemplateTableViewController *)self customTopMargin];
    [v9 floatValue];
    double v11 = v10;

    return v11;
  }
  if (a4) {
    return 0.00100000005;
  }
  double v11 = 10.0;
  if ([(DMCEnrollmentTemplateTableViewController *)self layoutStyle]) {
    return v11;
  }
  return kDMCTopMarginForViewController(self);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  unint64_t v6 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  unint64_t v7 = [v6 count];

  if (v7 > a4)
  {
    unint64_t v8 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a4];
    float v10 = [v9 lastObject];

    double v11 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    if ([v11 count] - 1 == a4)
    {
    }
    else
    {
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        [v10 gapToNextSection];
        double v12 = v14;
LABEL_10:

        return v12;
      }
    }
    if ([(DMCEnrollmentTemplateTableViewController *)self layoutStyle]) {
      double v12 = 0.00100000005;
    }
    else {
      double v12 = *MEMORY[0x263F1D600];
    }
    goto LABEL_10;
  }
  return *MEMORY[0x263F1D600];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[DMCEnrollmentTemplateTableViewController _updateFloatyViewForKeyboardFrame:duration:](self, "_updateFloatyViewForKeyboardFrame:duration:", v7, v9, v11, v13, 0.25);
}

- (void)keyboardDidShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[DMCEnrollmentTemplateTableViewController _updateFloatyViewForKeyboardFrame:duration:](self, "_updateFloatyViewForKeyboardFrame:duration:", v7, v9, v11, v13, 0.100000001);
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];

  if (v4)
  {
    [(DMCEnrollmentTemplateTableViewController *)self setGapBetweenButtons:0.0];
    id v5 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
    [(DMCEnrollmentTemplateTableViewController *)self _touchViewFrame:v5];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__DMCEnrollmentTemplateTableViewController_keyboardWillHide___block_invoke;
    v6[3] = &unk_2645E90A0;
    v6[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:0.25];
  }
}

void __61__DMCEnrollmentTemplateTableViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_setUpBackdrops
{
  v32[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1CB98]);
  id v4 = [MEMORY[0x263F1C480] effectWithStyle:1100];
  id v5 = (void *)[v3 initWithEffect:v4];
  [(DMCEnrollmentTemplateTableViewController *)self setEffectView:v5];

  double v6 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v7 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  double v8 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  [v7 addSubview:v8];

  long long v23 = (void *)MEMORY[0x263F08938];
  id v31 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  id v29 = [v31 widthAnchor];
  id v30 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  double v28 = [v30 widthAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28 multiplier:1.0];
  v32[0] = v27;
  uint64_t v26 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  uint64_t v24 = [v26 heightAnchor];
  uint64_t v25 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  uint64_t v22 = [v25 heightAnchor];
  long long v21 = [v24 constraintEqualToAnchor:v22 multiplier:1.0];
  v32[1] = v21;
  long long v20 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  long long v19 = [v20 leadingAnchor];
  double v9 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  double v10 = [v9 leadingAnchor];
  double v11 = [v19 constraintEqualToAnchor:v10];
  v32[2] = v11;
  double v12 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  double v13 = [v12 bottomAnchor];
  double v14 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  id v15 = [v14 bottomAnchor];
  id v16 = [v13 constraintEqualToAnchor:v15];
  v32[3] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [v23 activateConstraints:v17];

  long long v18 = [(DMCEnrollmentTemplateTableViewController *)self effectView];
  [v18 setAlpha:0.0];
}

- (double)_lastCellBlockedHeight
{
  id v3 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  id v4 = [v3 visibleCells];
  id v5 = [v4 lastObject];

  double v6 = [(DMCEnrollmentTemplateTableViewController *)self tableView];
  double v7 = [v6 indexPathForCell:v5];

  double v8 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
  uint64_t v9 = [v8 count];
  if (v9 == [v7 section] + 1)
  {
    double v10 = [(DMCEnrollmentTemplateTableViewController *)self cellDataCollection];
    double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    uint64_t v12 = [v11 count];
    if (v12 == [v7 row] + 1) {
      double v13 = 0.0;
    }
    else {
      double v13 = 50.0;
    }
  }
  else
  {
    double v13 = 50.0;
  }

  double v14 = [v5 superview];
  [v5 frame];
  double v16 = v15;
  double v18 = v17;
  long long v19 = [(DMCEnrollmentTemplateTableViewController *)self view];
  long long v20 = [v19 window];
  objc_msgSend(v14, "convertPoint:toView:", v20, v16, v18);
  double v22 = v21;

  long long v23 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  uint64_t v24 = [v23 superview];
  uint64_t v25 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;
  id v30 = [(DMCEnrollmentTemplateTableViewController *)self view];
  id v31 = [v30 window];
  objc_msgSend(v24, "convertPoint:toView:", v31, v27, v29);
  double v33 = v32;

  [v5 bounds];
  double v35 = v13 + v22 + v34 - v33;

  return v35;
}

- (void)_updateEffectiveViewVisibility
{
  id v3 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];

  if (v3)
  {
    [(DMCEnrollmentTemplateTableViewController *)self _lastCellBlockedHeight];
    BOOL v5 = v4 <= 0.0;
    double v6 = 0.0;
    uint64_t v9 = 3221225472;
    uint64_t v8 = MEMORY[0x263EF8330];
    double v10 = __74__DMCEnrollmentTemplateTableViewController__updateEffectiveViewVisibility__block_invoke;
    double v11 = &unk_2645E96B8;
    if (!v5) {
      double v6 = 1.0;
    }
    uint64_t v12 = self;
    double v13 = v6;
    [MEMORY[0x263F1CB60] animateWithDuration:&v8 animations:0.100000001];
    double v7 = [(DMCEnrollmentTemplateTableViewController *)self view];
    [v7 setNeedsDisplay];
  }
}

void __74__DMCEnrollmentTemplateTableViewController__updateEffectiveViewVisibility__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) effectView];
  [v2 setAlpha:v1];
}

- (void)_adjustFloatyViewFrameWithKeyboardFrame:(CGRect)a3 animationDuration:(double)a4
{
  BOOL v5 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  double v6 = [v5 superview];
  double v7 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];
  [v7 frame];
  objc_msgSend(v6, "convertRect:toView:", 0);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  double v17 = [v16 superview];
  double v18 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
  [v18 frame];
  objc_msgSend(v17, "convertRect:toView:", 0);
  CGFloat v20 = v19;
  CGFloat rect = v21;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v43.origin.x = v9;
  v43.origin.y = v11;
  v43.size.width = v13;
  v43.size.height = v15;
  CGFloat v26 = v15;
  CGFloat v27 = CGRectGetMaxY(v43) + 24.0;
  double v41 = v27 - CGRectGetMinY(a3);
  v44.origin.x = v20;
  v44.origin.y = rect;
  v44.size.width = v23;
  v44.size.height = v25;
  double MaxY = CGRectGetMaxY(v44);
  v45.origin.x = v9;
  v45.origin.y = v11;
  v45.size.width = v13;
  v45.size.height = v26;
  double v29 = MaxY - CGRectGetMaxY(v45) + -8.0;
  id v30 = [(DMCEnrollmentTemplateTableViewController *)self view];
  [v30 safeAreaInsets];
  double v32 = v29 - v31;

  double v33 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];

  if (v33)
  {
    double v34 = [(DMCEnrollmentTemplateTableViewController *)self bottomView];
    [v34 frame];
    double v32 = v32 - CGRectGetHeight(v46);
  }
  double v35 = fmax(v41 + v32, 0.0);
  [(DMCEnrollmentTemplateTableViewController *)self gapBetweenButtons];
  if (v36 != v35)
  {
    [(DMCEnrollmentTemplateTableViewController *)self setGapBetweenButtons:v35];
    v37 = [(DMCEnrollmentTemplateTableViewController *)self bottomContainerView];
    [(DMCEnrollmentTemplateTableViewController *)self _touchViewFrame:v37];

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __102__DMCEnrollmentTemplateTableViewController__adjustFloatyViewFrameWithKeyboardFrame_animationDuration___block_invoke;
    v42[3] = &unk_2645E90A0;
    v42[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v42 animations:a4];
  }
}

void __102__DMCEnrollmentTemplateTableViewController__adjustFloatyViewFrameWithKeyboardFrame_animationDuration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)_updateFloatyViewForKeyboardFrame:(CGRect)a3 duration:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v10 = [(DMCEnrollmentTemplateTableViewController *)self floatyBottomView];

  if (v10)
  {
    uint64_t v11 = [(DMCEnrollmentTemplateTableViewController *)self navigationController];
    if (!v11) {
      goto LABEL_4;
    }
    double v12 = (void *)v11;
    CGFloat v13 = [(DMCEnrollmentTemplateTableViewController *)self navigationController];
    double v14 = [v13 topViewController];

    if (v14 == self)
    {
LABEL_4:
      CGFloat v15 = [(DMCEnrollmentTemplateTableViewController *)self presentedViewController];

      if (!v15)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __87__DMCEnrollmentTemplateTableViewController__updateFloatyViewForKeyboardFrame_duration___block_invoke;
        v16[3] = &unk_2645E96E0;
        v16[4] = self;
        *(CGFloat *)&v16[5] = x;
        *(CGFloat *)&v16[6] = y;
        *(CGFloat *)&v16[7] = width;
        *(CGFloat *)&v16[8] = height;
        *(double *)&v16[9] = a4;
        dispatch_async(MEMORY[0x263EF83A0], v16);
      }
    }
  }
}

void __87__DMCEnrollmentTemplateTableViewController__updateFloatyViewForKeyboardFrame_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_adjustFloatyViewFrameWithKeyboardFrame:animationDuration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) _lastCellBlockedHeight];
  [*(id *)(a1 + 32) _lastCellBlockedHeight];
  if (v2 > 0.0)
  {
    double v3 = v2;
    id v6 = [*(id *)(a1 + 32) tableView];
    double v4 = [*(id *)(a1 + 32) tableView];
    [v4 contentOffset];
    objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v3 + v5);
  }
}

- (void)_touchViewFrame:(id)a3
{
  id v3 = a3;
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSMutableArray)cellDataCollection
{
  return self->_cellDataCollection;
}

- (void)setCellDataCollection:(id)a3
{
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (NSArray)iconNames
{
  return self->_iconNames;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (NSNumber)customTopMargin
{
  return self->_customTopMargin;
}

- (void)setCustomTopMargin:(id)a3
{
}

- (UIView)floatyBottomView
{
  return self->_floatyBottomView;
}

- (void)setFloatyBottomView:(id)a3
{
}

- (UIView)bottomContainerView
{
  return self->_bottomContainerView;
}

- (void)setBottomContainerView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (DMCEnrollmentTableViewIconCell)iconCell
{
  return self->_iconCell;
}

- (void)setIconCell:(id)a3
{
}

- (DMCEnrollmentTableViewTitleCell)titleCell
{
  return self->_titleCell;
}

- (void)setTitleCell:(id)a3
{
}

- (DMCEnrollmentTableViewTextCell)subtitleCell
{
  return self->_subtitleCell;
}

- (void)setSubtitleCell:(id)a3
{
}

- (unint64_t)headerSection
{
  return self->_headerSection;
}

- (void)setHeaderSection:(unint64_t)a3
{
  self->_headerSection = a3;
}

- (double)gapBetweenButtons
{
  return self->_gapBetweenButtons;
}

- (void)setGapBetweenButtons:(double)a3
{
  self->_gapBetweenButtons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_iconCell, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_bottomContainerView, 0);
  objc_storeStrong((id *)&self->_floatyBottomView, 0);
  objc_storeStrong((id *)&self->_customTopMargin, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_iconNames, 0);
  objc_storeStrong((id *)&self->_cellDataCollection, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end