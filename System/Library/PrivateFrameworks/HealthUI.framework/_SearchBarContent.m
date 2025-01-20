@interface _SearchBarContent
- (HKBarButtonItemControl)doneBarButton;
- (HKBarButtonItemControl)downBarButton;
- (HKBarButtonItemControl)upBarButton;
- (HKIncrementalSearchBar)searchBar;
- (HKIncrementalSearchBarDelegate)searchBarDelegate;
- (UIStackView)searchBarContainerView;
- (_SearchBarContent)initWithSearchBar:(id)a3;
- (_SearchEntryWithMatchDisplay)searchEntry;
- (id)inputField;
- (void)buildSearchBarContent;
- (void)downAction:(id)a3;
- (void)layoutSubviews;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setSearchBarDelegate:(id)a3;
- (void)upAction:(id)a3;
@end

@implementation _SearchBarContent

- (_SearchBarContent)initWithSearchBar:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SearchBarContent;
  v5 = -[_SearchBarContent initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_searchBar, v4);
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(_SearchBarContent *)v6 setBackgroundColor:v7];

    [(_SearchBarContent *)v6 buildSearchBarContent];
  }

  return v6;
}

- (void)buildSearchBarContent
{
  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  searchBarContainerView = self->_searchBarContainerView;
  self->_searchBarContainerView = v3;

  [(UIStackView *)self->_searchBarContainerView setAxis:0];
  v5 = [[HKBarButtonItemControl alloc] initWithSystemItem:103 preferredHeight:1 collapseHeight:36.0];
  upBarButton = self->_upBarButton;
  self->_upBarButton = v5;

  [(HKBarButtonItemControl *)self->_upBarButton addTarget:self action:sel_upAction_ forControlEvents:64];
  LODWORD(v7) = 1148846080;
  [(HKBarButtonItemControl *)self->_upBarButton setContentHuggingPriority:0 forAxis:v7];
  [(HKBarButtonItemControl *)self->_upBarButton setHorizontalMargin:4.0];
  v8 = [(HKBarButtonItemControl *)self->_upBarButton widthAnchor];
  objc_super v9 = [v8 constraintGreaterThanOrEqualToConstant:36.0];
  [v9 setActive:1];

  [(UIStackView *)self->_searchBarContainerView addArrangedSubview:self->_upBarButton];
  v10 = [[HKBarButtonItemControl alloc] initWithSystemItem:104 preferredHeight:1 collapseHeight:36.0];
  downBarButton = self->_downBarButton;
  self->_downBarButton = v10;

  [(HKBarButtonItemControl *)self->_downBarButton addTarget:self action:sel_downAction_ forControlEvents:64];
  LODWORD(v12) = 1148846080;
  [(HKBarButtonItemControl *)self->_downBarButton setContentHuggingPriority:0 forAxis:v12];
  [(HKBarButtonItemControl *)self->_downBarButton setHorizontalMargin:4.0];
  v13 = [(HKBarButtonItemControl *)self->_downBarButton widthAnchor];
  v14 = [v13 constraintGreaterThanOrEqualToConstant:36.0];
  [v14 setActive:1];

  [(UIStackView *)self->_searchBarContainerView addArrangedSubview:self->_downBarButton];
  v15 = [_SearchEntryWithMatchDisplay alloc];
  v16 = -[_SearchEntryWithMatchDisplay initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  searchEntry = self->_searchEntry;
  self->_searchEntry = v16;

  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setReturnKeyType:11];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setAutocapitalizationType:0];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setEnablesReturnKeyAutomatically:0];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setDelegate:self];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setSearchBarStyle:2];
  v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setBarTintColor:v18];

  v19 = [MEMORY[0x1E4FB1618] labelColor];
  [(_SearchEntryWithMatchDisplay *)self->_searchEntry setTintColor:v19];

  v20 = [(_SearchEntryWithMatchDisplay *)self->_searchEntry widthAnchor];
  v21 = [v20 constraintGreaterThanOrEqualToConstant:100.0];
  [v21 setActive:1];

  [(UIStackView *)self->_searchBarContainerView addArrangedSubview:self->_searchEntry];
  v22 = [[HKBarButtonItemControl alloc] initWithSystemItem:0 preferredHeight:0 collapseHeight:36.0];
  doneBarButton = self->_doneBarButton;
  self->_doneBarButton = v22;

  LODWORD(v24) = 1148846080;
  [(HKBarButtonItemControl *)self->_doneBarButton setContentHuggingPriority:0 forAxis:v24];
  v25 = self->_doneBarButton;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  [(HKBarButtonItemControl *)v25 addTarget:WeakRetained action:sel_doneAction_ forControlEvents:64];

  [(HKBarButtonItemControl *)self->_doneBarButton setHorizontalMargin:4.0];
  v27 = [(HKBarButtonItemControl *)self->_doneBarButton widthAnchor];
  v28 = [v27 constraintGreaterThanOrEqualToConstant:36.0];
  [v28 setActive:1];

  [(UIStackView *)self->_searchBarContainerView addArrangedSubview:self->_doneBarButton];
  -[UIStackView setFrame:](self->_searchBarContainerView, "setFrame:", 0.0, 0.0, 1.0, 36.0);
  [(_SearchBarContent *)self addSubview:self->_searchBarContainerView];
  -[_SearchBarContent setFrame:](self, "setFrame:", 0.0, 0.0, 1.0, 36.0);
  [(_SearchBarContent *)self setNeedsLayout];
  HKHealthTintColor();
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  [(_SearchBarContent *)self setTintColor:v29];
}

- (void)layoutSubviews
{
  v3 = [(_SearchBarContent *)self layoutMarginsGuide];
  [v3 layoutFrame];
  double v5 = v4;

  [(UIStackView *)self->_searchBarContainerView frame];
  searchBarContainerView = self->_searchBarContainerView;
  [(UIStackView *)searchBarContainerView setFrame:v5];
}

- (id)inputField
{
  return (id)[(_SearchEntryWithMatchDisplay *)self->_searchEntry searchField];
}

- (void)upAction:(id)a3
{
  p_searchBarDelegate = &self->_searchBarDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_searchBarDelegate);
    [v6 searchBarUpAction:self];
  }
}

- (void)downAction:(id)a3
{
  p_searchBarDelegate = &self->_searchBarDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_searchBarDelegate);
    [v6 searchBarDownAction:self];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_searchBarDelegate);
    [v6 searchBarChangeSearch:self searchString:v7];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  [WeakRetained _lowerKeyboard];
}

- (HKIncrementalSearchBarDelegate)searchBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);
  return (HKIncrementalSearchBarDelegate *)WeakRetained;
}

- (void)setSearchBarDelegate:(id)a3
{
}

- (HKIncrementalSearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  return (HKIncrementalSearchBar *)WeakRetained;
}

- (HKBarButtonItemControl)upBarButton
{
  return self->_upBarButton;
}

- (HKBarButtonItemControl)downBarButton
{
  return self->_downBarButton;
}

- (HKBarButtonItemControl)doneBarButton
{
  return self->_doneBarButton;
}

- (_SearchEntryWithMatchDisplay)searchEntry
{
  return self->_searchEntry;
}

- (UIStackView)searchBarContainerView
{
  return self->_searchBarContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarContainerView, 0);
  objc_storeStrong((id *)&self->_searchEntry, 0);
  objc_storeStrong((id *)&self->_doneBarButton, 0);
  objc_storeStrong((id *)&self->_downBarButton, 0);
  objc_storeStrong((id *)&self->_upBarButton, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchBarDelegate);
}

@end