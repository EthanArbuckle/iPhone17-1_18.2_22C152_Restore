@interface CKConversationSearchResultCell
+ (Class)conversationListCellClass;
+ (id)reuseIdentifier;
- (BOOL)_ck_isEditing;
- (BOOL)shouldInsetResults;
- (CALayer)bottomHairline;
- (CALayer)topHairline;
- (CKConversationListCellLayout)cellLayout;
- (CKConversationSearchCellProtocol)searchCell;
- (CKConversationSearchResultCell)initWithFrame:(CGRect)a3;
- (CKConversationSearchResultCellDelegate)delegate;
- (CKSpotlightQueryResult)result;
- (NSString)resultIdentifier;
- (NSString)searchText;
- (UIEdgeInsets)marginInsets;
- (double)widthForDeterminingAvatarVisibility;
- (id)configurationState;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_ck_setEditing:(BOOL)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)forwardStateToEmbeddedCell:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshForSearchTextIfNeeded:(id)a3;
- (void)setCellLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setResult:(id)a3;
- (void)setSearchCell:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setShouldInsetResults:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation CKConversationSearchResultCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (Class)conversationListCellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];

  v3 = objc_opt_class();

  return (Class)v3;
}

- (NSString)resultIdentifier
{
  v2 = [(CKConversationSearchResultCell *)self result];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [(CKConversationSearchResultCell *)self setSearchText:v7];
  [(CKConversationSearchResultCell *)self setResult:v8];
  id v9 = [(CKConversationSearchResultCell *)self searchCell];
  [v9 configureWithQueryResult:v8 searchText:v7];
}

- (void)refreshForSearchTextIfNeeded:(id)a3
{
  id v11 = a3;
  v4 = [(CKConversationSearchResultCell *)self searchText];
  char v5 = [v4 isEqualToString:v11];

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    [(CKConversationSearchResultCell *)self setSearchText:v11];
    id v7 = [(CKConversationSearchResultCell *)self searchText];
    if ([v7 length])
    {
      id v8 = [(CKConversationSearchResultCell *)self result];

      v6 = v11;
      if (!v8) {
        goto LABEL_6;
      }
      id v7 = [(CKConversationSearchResultCell *)self searchCell];
      id v9 = [(CKConversationSearchResultCell *)self result];
      v10 = [(CKConversationSearchResultCell *)self searchText];
      [v7 configureWithQueryResult:v9 searchText:v10];
    }
    v6 = v11;
  }
LABEL_6:
}

- (void)setCellLayout:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_cellLayout, a3);
  v6 = [(CKConversationSearchResultCell *)self searchCell];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKConversationSearchResultCell *)self cellLayout];

    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v11 handleFailureInMethod:a2, self, @"CKConversationSearchResultCell.m", 73, @"%@ needs a cell layout.", v13 object file lineNumber description];
    }
    id v9 = [(CKConversationSearchResultCell *)self cellLayout];
    v10 = [(CKConversationSearchResultCell *)self searchCell];
    [v10 setCellLayout:v9];
  }
}

- (double)widthForDeterminingAvatarVisibility
{
  v2 = [(CKConversationSearchResultCell *)self delegate];
  [v2 widthForDeterminingAvatarVisibility];
  double v4 = v3;

  return v4;
}

- (CKConversationSearchResultCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKConversationSearchResultCell;
  char v7 = -[CKConversationSearchResultCell initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "conversationListCellClass")), "initWithFrame:", x, y, width, height);
    [v8 setDelegate:v7];
    [(CKConversationSearchResultCell *)v7 setSearchCell:v8];
    id v9 = [(CKConversationSearchResultCell *)v7 contentView];
    [v9 addSubview:v8];
  }
  return v7;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultCell;
  [(CKConversationSearchResultCell *)&v4 prepareForReuse];
  double v3 = [(CKConversationSearchResultCell *)self searchCell];
  [v3 prepareForReuse];

  [(CKConversationSearchResultCell *)self setSearchText:0];
  [(CKConversationSearchResultCell *)self setResult:0];
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CKConversationSearchResultCell *)self marginInsets];
  if (left != v11 || top != v8 || right != v10 || bottom != v9)
  {
    self->_marginInsets.double top = top;
    self->_marginInsets.double left = left;
    self->_marginInsets.double bottom = bottom;
    self->_marginInsets.double right = right;
    [(CKConversationSearchResultCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CKConversationSearchResultCell;
  [(CKConversationSearchResultCell *)&v15 layoutSubviews];
  double v3 = [(CKConversationSearchResultCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CKConversationSearchResultCell *)self searchCell];
  [(CKConversationSearchResultCell *)self marginInsets];
  objc_msgSend(v12, "setMarginInsets:");

  v13 = [(CKConversationSearchResultCell *)self searchCell];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  id v14 = [(CKConversationSearchResultCell *)self searchCell];
  [v14 layoutIfNeeded];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = +[CKUIBehavior sharedBehaviors];
  int v12 = [v11 isAccessibilityPreferredContentSizeCategory];

  if (v12)
  {
    v13 = [(CKConversationSearchResultCell *)self searchCell];
    [v13 layoutIfNeeded];

    id v14 = [(CKConversationSearchResultCell *)self searchCell];
    objc_msgSend(v14, "sizeThatFits:", v10, 1.79769313e308);
    double v16 = v15;
  }
  else
  {
    v17 = +[CKUIBehavior sharedBehaviors];
    v18 = [(CKConversationSearchResultCell *)self traitCollection];
    [v18 displayScale];
    objc_msgSend(v17, "searchMessageCellHeightForDisplayScale:");
    double v16 = v19;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v16);

  return v4;
}

- (void)forwardStateToEmbeddedCell:(id)a3
{
  id v7 = a3;
  id v4 = [(CKConversationSearchResultCell *)self searchCell];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CKConversationSearchResultCell *)self searchCell];
    [v6 updateWithForwardedConfigurationState:v7];
  }
}

- (id)configurationState
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationSearchResultCell;
  v2 = [(CKConversationSearchResultCell *)&v4 configurationState];
  if (CKIsRunningInMacCatalyst() && [v2 isSelected]) {
    [v2 setFocused:1];
  }

  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v15 = a3;
  -[CKConversationSearchResultCell forwardStateToEmbeddedCell:](self, "forwardStateToEmbeddedCell:");
  if ([(CKConversationSearchResultCell *)self shouldInsetResults]) {
    [MEMORY[0x1E4F427B0] listPlainCellConfiguration];
  }
  else {
  objc_super v4 = [MEMORY[0x1E4F427B0] listSidebarCellConfiguration];
  }
  char v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [(CKConversationSearchResultCell *)self traitCollection];
  int v7 = [v5 useSelectedAppearanceForConversationCellState:v15 traitCollection:v6];

  if (CKIsRunningInMacCatalyst() && [v15 isSelected]) {
    [v15 setFocused:1];
  }
  double v8 = [v4 updatedConfigurationForState:v15];

  if (v7)
  {
    double v9 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v9 theme];
    double v11 = [v10 conversationListSelectedCellColor];

    if (v11)
    {
      int v12 = +[CKUIBehavior sharedBehaviors];
      v13 = [v12 theme];
      id v14 = [v13 conversationListSelectedCellColor];
      [v8 setBackgroundColor:v14];
    }
  }
  [(CKConversationSearchResultCell *)self setBackgroundConfiguration:v8];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (CKConversationSearchCellProtocol)searchCell
{
  return self->_searchCell;
}

- (void)setSearchCell:(id)a3
{
}

- (CKSpotlightQueryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (BOOL)shouldInsetResults
{
  return self->_shouldInsetResults;
}

- (void)setShouldInsetResults:(BOOL)a3
{
  self->_shouldInsetResults = a3;
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (CKConversationSearchResultCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKConversationSearchResultCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_searchCell, 0);

  objc_storeStrong((id *)&self->_cellLayout, 0);
}

@end