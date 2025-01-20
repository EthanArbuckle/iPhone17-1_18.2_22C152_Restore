@interface LUILogViewerView
- (LUILogViewerView)initWithFrame:(CGRect)a3;
- (LUILogViewerViewDelegate)delegate;
- (UIButton)clearButton;
- (UIButton)closeButton;
- (UIButton)filterButton;
- (UIButton)leftCaretButton;
- (UIButton)logButton;
- (UIButton)rightCaretButton;
- (UILabel)searchResultLabel;
- (UISearchBar)searchBar;
- (UIStackView)buttonStack;
- (UIView)contentHolderView;
- (UIView)filterView;
- (id)_createButtonWithTitle:(id)a3 action:(SEL)a4;
- (id)_createClearButton;
- (id)_createCloseButton;
- (id)_createFilterButton;
- (id)_createLeftCaretButton;
- (id)_createLogButton;
- (id)_createRightCaretButton;
- (id)_createSearchBar;
- (id)_createSearchResultLabel;
- (void)_highlightButton:(id)a3 highlight:(BOOL)a4;
- (void)_setup;
- (void)clearButtonTapped:(id)a3;
- (void)closeButtonTapped:(id)a3;
- (void)filterButtonTapped:(id)a3;
- (void)highlightFilterButton:(BOOL)a3;
- (void)highlightLogButton:(BOOL)a3;
- (void)layoutSubviews;
- (void)leftCaretButtonTapped:(id)a3;
- (void)logButtonTapped:(id)a3;
- (void)resetSearchResultLabel;
- (void)rightCaretButtonTapped:(id)a3;
- (void)setButtonStack:(id)a3;
- (void)setClearButton:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContentHolderView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterButton:(id)a3;
- (void)setFilterView:(id)a3;
- (void)setLeftCaretButton:(id)a3;
- (void)setLogButton:(id)a3;
- (void)setRightCaretButton:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchResultLabel:(id)a3;
- (void)switchClearButtonTitle:(BOOL)a3;
- (void)updateSearchResultLabelWithTotalResult:(unint64_t)a3 currentIndex:(unint64_t)a4;
@end

@implementation LUILogViewerView

- (LUILogViewerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogViewerView;
  v3 = -[LUILogViewerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogViewerView *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v30[7] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C550] blackColor];
  v4 = [v3 colorWithAlphaComponent:0.8];
  [(LUILogViewerView *)self setBackgroundColor:v4];

  v5 = [(LUILogViewerView *)self _createCloseButton];
  closeButton = self->_closeButton;
  self->_closeButton = v5;

  [(LUILogViewerView *)self addSubview:self->_closeButton];
  v7 = (UIView *)objc_opt_new();
  contentHolderView = self->_contentHolderView;
  self->_contentHolderView = v7;

  [(LUILogViewerView *)self addSubview:self->_contentHolderView];
  v9 = [(LUILogViewerView *)self _createLogButton];
  logButton = self->_logButton;
  self->_logButton = v9;

  v11 = [(LUILogViewerView *)self _createClearButton];
  clearButton = self->_clearButton;
  self->_clearButton = v11;

  v13 = [(LUILogViewerView *)self _createFilterButton];
  filterButton = self->_filterButton;
  self->_filterButton = v13;

  v15 = [(LUILogViewerView *)self _createSearchBar];
  searchBar = self->_searchBar;
  self->_searchBar = v15;

  v17 = [(LUILogViewerView *)self _createSearchResultLabel];
  searchResultLabel = self->_searchResultLabel;
  self->_searchResultLabel = v17;

  v19 = [(LUILogViewerView *)self _createLeftCaretButton];
  leftCaretButton = self->_leftCaretButton;
  self->_leftCaretButton = v19;

  v21 = [(LUILogViewerView *)self _createRightCaretButton];
  rightCaretButton = self->_rightCaretButton;
  self->_rightCaretButton = v21;

  id v23 = objc_alloc(MEMORY[0x263F1C9B8]);
  v24 = self->_clearButton;
  v30[0] = self->_logButton;
  v30[1] = v24;
  v25 = self->_searchBar;
  v30[2] = self->_filterButton;
  v30[3] = v25;
  v26 = self->_leftCaretButton;
  v30[4] = self->_searchResultLabel;
  v30[5] = v26;
  v30[6] = self->_rightCaretButton;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:7];
  v28 = (UIStackView *)[v23 initWithArrangedSubviews:v27];
  buttonStack = self->_buttonStack;
  self->_buttonStack = v28;

  [(UIStackView *)self->_buttonStack setAlignment:3];
  [(UIStackView *)self->_buttonStack setAxis:0];
  [(UIStackView *)self->_buttonStack setSpacing:20.0];
  [(LUILogViewerView *)self addSubview:self->_buttonStack];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)LUILogViewerView;
  [(LUILogViewerView *)&v10 layoutSubviews];
  [(LUILogViewerView *)self frame];
  CGFloat v3 = CGRectGetWidth(v11) + -80.0;
  v4 = [(LUILogViewerView *)self closeButton];
  objc_msgSend(v4, "setFrame:", v3, 10.0, 80.0, 30.0);

  [(LUILogViewerView *)self frame];
  CGFloat v5 = CGRectGetWidth(v12) + -20.0;
  [(LUILogViewerView *)self frame];
  CGFloat v6 = CGRectGetHeight(v13) + -60.0;
  v7 = [(LUILogViewerView *)self contentHolderView];
  objc_msgSend(v7, "setFrame:", 10.0, 50.0, v5, v6);

  [(LUILogViewerView *)self frame];
  CGFloat v8 = CGRectGetWidth(v14) + -110.0;
  v9 = [(LUILogViewerView *)self buttonStack];
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v8, 30.0);
}

- (void)switchClearButtonTitle:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(LUILogViewerView *)self clearButton];
  id v6 = v4;
  if (v3) {
    CGFloat v5 = @"Clear";
  }
  else {
    CGFloat v5 = @"Stop";
  }
  [v4 setTitle:v5 forState:0];
}

- (void)highlightFilterButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(LUILogViewerView *)self filterButton];
  [(LUILogViewerView *)self _highlightButton:v5 highlight:v3];
}

- (void)highlightLogButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(LUILogViewerView *)self logButton];
  [(LUILogViewerView *)self _highlightButton:v5 highlight:v3];
}

- (void)_highlightButton:(id)a3 highlight:(BOOL)a4
{
  if (a4)
  {
    v4 = (void *)MEMORY[0x263F1C550];
    id v5 = a3;
    id v6 = [v4 whiteColor];
    uint64_t v7 = [v6 CGColor];
    CGFloat v8 = [v5 layer];
    [v8 setBorderColor:v7];

    id v11 = [v5 layer];

    double v9 = 1.0;
  }
  else
  {
    id v10 = a3;
    id v11 = [v10 layer];

    double v9 = 0.0;
  }
  [v11 setBorderWidth:v9];
}

- (void)resetSearchResultLabel
{
  id v2 = [(LUILogViewerView *)self searchResultLabel];
  [v2 setText:@"0 / 0"];
}

- (void)updateSearchResultLabelWithTotalResult:(unint64_t)a3 currentIndex:(unint64_t)a4
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu / %lu", a4, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(LUILogViewerView *)self searchResultLabel];
  [v5 setText:v6];
}

- (id)_createCloseButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@"Close" action:sel_closeButtonTapped_];
}

- (id)_createLogButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@"Log" action:sel_logButtonTapped_];
}

- (id)_createClearButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@"Clear" action:sel_clearButtonTapped_];
}

- (id)_createFilterButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@"Filter" action:sel_filterButtonTapped_];
}

- (id)_createLeftCaretButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@"<" action:sel_leftCaretButtonTapped_];
}

- (id)_createRightCaretButton
{
  return [(LUILogViewerView *)self _createButtonWithTitle:@">" action:sel_rightCaretButtonTapped_];
}

- (id)_createButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v6 = (objc_class *)MEMORY[0x263F1C488];
  id v7 = a3;
  CGFloat v8 = objc_msgSend([v6 alloc], "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  [v8 setTitle:v7 forState:0];

  double v9 = [MEMORY[0x263F1C550] whiteColor];
  [v8 setTitleColor:v9 forState:0];

  [v8 addTarget:self action:a4 forControlEvents:64];
  LODWORD(v10) = 1148846080;
  [v8 setContentHuggingPriority:0 forAxis:v10];

  return v8;
}

- (id)_createSearchBar
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C950]), "initWithFrame:", 0.0, 0.0, 200.0, 30.0);
  BOOL v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setBarTintColor:v3];

  [v2 setPlaceholder:@"Search..."];
  [v2 setAutocapitalizationType:0];
  [v2 setAutocorrectionType:1];
  LODWORD(v4) = 1132068864;
  [v2 setContentHuggingPriority:0 forAxis:v4];

  return v2;
}

- (id)_createSearchResultLabel
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  [v2 setTextAlignment:1];
  BOOL v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setTextColor:v3];

  [v2 setText:@"0 / 0"];

  return v2;
}

- (void)closeButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerViewCloseButtonTapped:self];
}

- (void)logButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerViewLogButtonTapped:self];
}

- (void)clearButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerViewClearButtontapped:self];
}

- (void)filterButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerFilterButtonTapped:self];
}

- (void)leftCaretButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerLeftCaretButtonTapped:self];
}

- (void)rightCaretButtonTapped:(id)a3
{
  id v4 = [(LUILogViewerView *)self delegate];
  [v4 logViewerRightCaretButtonTapped:self];
}

- (LUILogViewerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LUILogViewerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentHolderView
{
  return self->_contentHolderView;
}

- (void)setContentHolderView:(id)a3
{
}

- (UIButton)filterButton
{
  return self->_filterButton;
}

- (void)setFilterButton:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UIView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
}

- (UIButton)logButton
{
  return self->_logButton;
}

- (void)setLogButton:(id)a3
{
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
}

- (UILabel)searchResultLabel
{
  return self->_searchResultLabel;
}

- (void)setSearchResultLabel:(id)a3
{
}

- (UIButton)leftCaretButton
{
  return self->_leftCaretButton;
}

- (void)setLeftCaretButton:(id)a3
{
}

- (UIButton)rightCaretButton
{
  return self->_rightCaretButton;
}

- (void)setRightCaretButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCaretButton, 0);
  objc_storeStrong((id *)&self->_leftCaretButton, 0);
  objc_storeStrong((id *)&self->_searchResultLabel, 0);
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_logButton, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_contentHolderView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end