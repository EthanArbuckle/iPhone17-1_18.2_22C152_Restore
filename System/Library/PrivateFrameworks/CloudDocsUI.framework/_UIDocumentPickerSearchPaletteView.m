@interface _UIDocumentPickerSearchPaletteView
- (NSLayoutConstraint)searchFieldLeftConstraint;
- (NSLayoutConstraint)searchFieldRightConstraint;
- (UISearchController)searchController;
- (_UIDocumentPickerSearchPaletteView)initWithCoder:(id)a3;
- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3;
- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3 resultsController:(id)a4;
- (_UIDocumentSearchListController)resultsController;
- (void)dealloc;
- (void)layoutSubviews;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchCanceled:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setResultsController:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchFieldLeftConstraint:(id)a3;
- (void)setSearchFieldRightConstraint:(id)a3;
@end

@implementation _UIDocumentPickerSearchPaletteView

- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3
{
  return -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](self, "initWithFrame:resultsController:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIDocumentPickerSearchPaletteView)initWithCoder:(id)a3
{
  return -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](self, "initWithFrame:resultsController:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3 resultsController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  v10 = -[_UIDocumentPickerSearchPaletteView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(_UIDocumentPickerSearchPaletteView *)v10 setResultsController:v9];
    id v12 = objc_alloc(MEMORY[0x263F1C958]);
    v13 = [(_UIDocumentPickerSearchPaletteView *)v11 resultsController];
    v14 = (void *)[v12 initWithSearchResultsController:v13];
    [(_UIDocumentPickerSearchPaletteView *)v11 setSearchController:v14];

    v15 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(_UIDocumentPickerSearchPaletteView *)v11 setBackgroundColor:v15];

    v16 = [(_UIDocumentPickerSearchPaletteView *)v11 searchController];
    v17 = [v16 searchBar];

    [v17 setDelegate:v11];
    [(_UIDocumentPickerSearchPaletteView *)v11 bounds];
    objc_msgSend(v17, "setFrame:");
    [v17 setAutoresizingMask:18];
    [(_UIDocumentPickerSearchPaletteView *)v11 addSubview:v17];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  [(_UIDocumentPickerSearchPaletteView *)&v4 dealloc];
}

- (void)setBounds:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  [(_UIDocumentPickerSearchPaletteView *)&v16 layoutSubviews];
  objc_super v3 = [(_UIDocumentPickerSearchPaletteView *)self searchController];
  objc_super v4 = [v3 searchBar];
  v5 = [v4 superview];

  if (v5 == self)
  {
    [(_UIDocumentPickerSearchPaletteView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(_UIDocumentPickerSearchPaletteView *)self searchController];
    v15 = [v14 searchBar];
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v5 = [a3 text];
  objc_super v4 = [(_UIDocumentPickerSearchPaletteView *)self resultsController];
  [v4 setQueryString:v5];
}

- (void)searchCanceled:(id)a3
{
  id v3 = [(_UIDocumentPickerSearchPaletteView *)self resultsController];
  [v3 setQueryString:&stru_26E0221C0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIDocumentPickerSearchPaletteView *)self resultsController];
  [v6 setQueryString:v5];
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (_UIDocumentSearchListController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
}

- (NSLayoutConstraint)searchFieldLeftConstraint
{
  return self->_searchFieldLeftConstraint;
}

- (void)setSearchFieldLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)searchFieldRightConstraint
{
  return self->_searchFieldRightConstraint;
}

- (void)setSearchFieldRightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchFieldRightConstraint, 0);
  objc_storeStrong((id *)&self->_searchFieldLeftConstraint, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end