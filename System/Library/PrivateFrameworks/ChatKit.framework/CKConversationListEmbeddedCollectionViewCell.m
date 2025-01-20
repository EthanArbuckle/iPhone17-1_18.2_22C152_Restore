@interface CKConversationListEmbeddedCollectionViewCell
+ (Class)embeddedTableViewCellClass;
- (BOOL)shouldUseSidebarBackgroundConfiguration;
- (CKConversationListCellLayout)cellLayout;
- (CKConversationListEmbeddedCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKConversationListEmbeddedCollectionViewCellDelegate)embeddedCellDelegate;
- (NSArray)linkInteractions;
- (UITableViewCell)embeddedTableViewCell;
- (id)_leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3 usingState:(id)a4;
- (id)_multiselectCellAccessoryConfigurationUsingState:(id)a3;
- (id)configurationState;
- (id)insertCellAccessoryConfiguration;
- (id)leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3;
- (id)multiselectCellAccessoryConfiguration;
- (id)pinButton;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (id)trailingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3;
- (unint64_t)editingMode;
- (void)forwardStateToEmbeddedCell:(id)a3;
- (void)pinButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)setCellLayout:(id)a3;
- (void)setEditingMode:(unint64_t)a3;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setEmbeddedCellDelegate:(id)a3;
- (void)setEmbeddedTableViewCell:(id)a3;
- (void)setLinkInteractions:(id)a3;
- (void)setShouldUseSidebarBackgroundConfiguration:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation CKConversationListEmbeddedCollectionViewCell

- (CKConversationListEmbeddedCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  v4 = -[CKConversationListEmbeddedCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v6 = [(CKConversationListEmbeddedCollectionViewCell *)v4 contentView];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v5, @"CKConversationListEmbeddedCollectionViewCell.m", 46, @"The content view must be a UITableViewCell: %@", v6 object file lineNumber description];
    }
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [v6 setBackgroundColor:v7];

    [v6 setSelectionStyle:0];
    [(CKConversationListEmbeddedCollectionViewCell *)v5 setFocusEffect:0];
    [(CKConversationListEmbeddedCollectionViewCell *)v5 setEmbeddedTableViewCell:v6];
  }
  return v5;
}

- (void)setEmbeddedTableViewCell:(id)a3
{
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v20 = a3;
  if ([(CKConversationListEmbeddedCollectionViewCell *)self shouldUseSidebarBackgroundConfiguration])
  {
    [MEMORY[0x1E4F427B0] listSidebarCellConfiguration];
  }
  else
  {
    [MEMORY[0x1E4F427B0] listPlainCellConfiguration];
  v4 = };
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [(CKConversationListEmbeddedCollectionViewCell *)self traitCollection];
  if ([v5 useSelectedAppearanceForConversationCellState:v20 traitCollection:v6]) {
    BOOL v7 = [(CKConversationListEmbeddedCollectionViewCell *)self editingMode] != 2;
  }
  else {
    BOOL v7 = 0;
  }

  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 modifyConversationCellStateForDrop:v20];

  [(CKConversationListEmbeddedCollectionViewCell *)self forwardStateToEmbeddedCell:v20];
  v9 = [v4 updatedConfigurationForState:v20];

  if (v7)
  {
    objc_super v10 = +[CKUIBehavior sharedBehaviors];
    v11 = [v10 theme];
    v12 = [v11 conversationListSelectedCellColor];

    if (v12)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      v14 = [v13 theme];
      v15 = [v14 conversationListSelectedCellColor];
      [v9 setBackgroundColor:v15];
    }
    if ([v20 isHighlighted])
    {
      v16 = [(CKConversationListEmbeddedCollectionViewCell *)self configurationState];
      int v17 = [v16 isSelected];

      if (v17) {
        [v9 setBackgroundColorTransformer:0];
      }
    }
  }
  else if ([(CKConversationListEmbeddedCollectionViewCell *)self editingMode])
  {
    v18 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v18];
  }
  v19 = [(CKConversationListEmbeddedCollectionViewCell *)self _leadingEditingAccessoryConfigurationsForEditingMode:self->_editingMode usingState:v20];
  [(CKConversationListEmbeddedCollectionViewCell *)self setLeadingEditingAccessoryConfigurations:v19];

  [(CKConversationListEmbeddedCollectionViewCell *)self setBackgroundConfiguration:v9];
}

- (BOOL)shouldUseSidebarBackgroundConfiguration
{
  return self->_shouldUseSidebarBackgroundConfiguration;
}

- (void)forwardStateToEmbeddedCell:(id)a3
{
  id v7 = a3;
  v4 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
    [v6 updateWithForwardedConfigurationState:v7];
  }
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (id)trailingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    char v5 = [(CKConversationListEmbeddedCollectionViewCell *)self insertCellAccessoryConfiguration];
    v7[0] = v5;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
    if (a3) {
      v3 = 0;
    }
    if (a3 == 1) {
      v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else {
      v4 = v3;
    }
  }

  return v4;
}

- (id)leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3
{
  char v5 = [(CKConversationListEmbeddedCollectionViewCell *)self configurationState];
  v6 = [(CKConversationListEmbeddedCollectionViewCell *)self _leadingEditingAccessoryConfigurationsForEditingMode:a3 usingState:v5];

  return v6;
}

- (id)_leadingEditingAccessoryConfigurationsForEditingMode:(unint64_t)a3 usingState:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 2)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else if (a3 == 1)
  {
    v8 = [(CKConversationListEmbeddedCollectionViewCell *)self _multiselectCellAccessoryConfigurationUsingState:v6];
    v10[0] = v8;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else if (a3)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)setShouldUseSidebarBackgroundConfiguration:(BOOL)a3
{
  self->_shouldUseSidebarBackgroundConfiguration = a3;
}

- (void)setEmbeddedCellDelegate:(id)a3
{
}

- (void)setEditingMode:(unint64_t)a3
{
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_editingMode = a3;
  [(CKConversationListEmbeddedCollectionViewCell *)self directionalLayoutMargins];
  double v9 = v8;
  double v11 = v10;
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      +[CKConversationListStandardCell leadingLayoutMargin];
      double v7 = v12;
    }
  }
  else
  {
    double v7 = 16.0;
  }
  -[CKConversationListEmbeddedCollectionViewCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v9, v7, v11);
  v13 = [(CKConversationListEmbeddedCollectionViewCell *)self leadingEditingAccessoryConfigurationsForEditingMode:a3];
  [(CKConversationListEmbeddedCollectionViewCell *)self setLeadingEditingAccessoryConfigurations:v13];

  v14 = [(CKConversationListEmbeddedCollectionViewCell *)self trailingEditingAccessoryConfigurationsForEditingMode:a3];
  [(CKConversationListEmbeddedCollectionViewCell *)self setTrailingEditingAccessoryConfigurations:v14];

  id v15 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
  [v15 setEditing:a3 != 0 animated:v4];
}

- (id)configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  v2 = [(CKConversationListEmbeddedCollectionViewCell *)&v5 configurationState];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 modifyConversationCellStateForDrop:v2];

  return v2;
}

- (void)setCellLayout:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_cellLayout, a3);
  id v6 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(CKConversationListEmbeddedCollectionViewCell *)self cellLayout];

    if (!v8)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v11 handleFailureInMethod:a2, self, @"CKConversationListEmbeddedCollectionViewCell.m", 61, @"%@ needs a cell layout.", v13 object file lineNumber description];
    }
    double v9 = [(CKConversationListEmbeddedCollectionViewCell *)self cellLayout];
    double v10 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
    [v10 setCellLayout:v9];

    [(CKConversationListEmbeddedCollectionViewCell *)self setNeedsLayout];
  }
}

- (UITableViewCell)embeddedTableViewCell
{
  return self->_embeddedTableViewCell;
}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v5 = a3;
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = +[CKUIBehavior sharedBehaviors];
  int v13 = [v12 conversationListCellUsesLargeTextLayout];

  if (v13)
  {
    id v14 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
    [v14 layoutIfNeeded];

    id v15 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
    objc_msgSend(v15, "systemLayoutSizeFittingSize:", v11, 1.79769313e308);
    double v17 = v16;
  }
  else
  {
    v18 = [(CKConversationListEmbeddedCollectionViewCell *)self cellLayout];

    if (!v18)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      [v23 handleFailureInMethod:a2, self, @"CKConversationListEmbeddedCollectionViewCell.m", 129, @"%@ needs a cell layout.", v25 object file lineNumber description];
    }
    v19 = [(CKConversationListEmbeddedCollectionViewCell *)self cellLayout];
    id v20 = [(CKConversationListEmbeddedCollectionViewCell *)self traitCollection];
    [v20 displayScale];
    objc_msgSend(v19, "cellHeightForDisplayScale:");
    double v17 = v21;
  }
  objc_msgSend(v5, "setFrame:", v7, v9, v11, v17);

  return v5;
}

+ (Class)embeddedTableViewCellClass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = NSStringFromSelector(a2);
  double v9 = [v5 stringWithFormat:@"Subclasses of %@ must override %@.", v7, v8];
  id v10 = [v3 exceptionWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListEmbeddedCollectionViewCell;
  [(CKConversationListEmbeddedCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedTableViewCell];
  [v3 prepareForReuse];
}

- (id)_multiselectCellAccessoryConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [(CKConversationListEmbeddedCollectionViewCell *)self traitCollection];
  int v7 = [v5 useSelectedAppearanceForConversationCellState:v4 traitCollection:v6];

  if (v7) {
    BOOL v8 = [(CKConversationListEmbeddedCollectionViewCell *)self editingMode] != 2;
  }
  else {
    BOOL v8 = 0;
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F430D0]);
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v9 setBackgroundColor:v10];

    double v11 = [MEMORY[0x1E4F428B8] whiteColor];
    [v9 setTintColor:v11];
  }

  return v9;
}

- (id)multiselectCellAccessoryConfiguration
{
  v3 = [(CKConversationListEmbeddedCollectionViewCell *)self configurationState];
  id v4 = [(CKConversationListEmbeddedCollectionViewCell *)self _multiselectCellAccessoryConfigurationUsingState:v3];

  return v4;
}

- (id)insertCellAccessoryConfiguration
{
  v2 = [(CKConversationListEmbeddedCollectionViewCell *)self pinButton];
  [v2 layoutIfNeeded];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F430C8]) initWithCustomView:v2];
  [v3 setMaintainsFixedSize:1];

  return v3;
}

- (id)pinButton
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F42A98];
  id v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  v18[0] = v4;
  id v5 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v18[1] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  int v7 = [v3 configurationWithPaletteColors:v6];

  BOOL v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"pin.circle.fill" withConfiguration:v7];
  id v9 = [v8 imageWithRenderingMode:2];

  id v10 = [MEMORY[0x1E4F427B0] clearConfiguration];
  [v10 setImage:v9];
  [v10 setImageContentMode:2];
  double v11 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  [v11 setBackground:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__CKConversationListEmbeddedCollectionViewCell_pinButton__block_invoke;
  v17[3] = &unk_1E56211C8;
  v17[4] = self;
  double v12 = [MEMORY[0x1E4F426E8] actionWithHandler:v17];
  int v13 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v11 primaryAction:v12];
  id v14 = +[CKUIBehavior sharedBehaviors];
  if ([v14 isAccessibilityPreferredContentSizeCategory]) {
    double v15 = 60.0;
  }
  else {
    double v15 = 36.0;
  }

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v15, v15);

  return v13;
}

uint64_t __57__CKConversationListEmbeddedCollectionViewCell_pinButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pinButtonTapped:*(void *)(a1 + 32)];
}

- (void)pinButtonTapped:(id)a3
{
  id v4 = [(CKConversationListEmbeddedCollectionViewCell *)self embeddedCellDelegate];
  [v4 pinButtonTappedForCell:self];
}

- (void)setLinkInteractions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  linkInteractions = self->_linkInteractions;
  if (linkInteractions)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v6 = linkInteractions;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [(CKConversationListEmbeddedCollectionViewCell *)self removeInteraction:*(void *)(*((void *)&v23 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  double v11 = (NSArray *)[v4 copy];
  double v12 = self->_linkInteractions;
  self->_linkInteractions = v11;

  int v13 = self->_linkInteractions;
  if (v13)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v13;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          -[CKConversationListEmbeddedCollectionViewCell addInteraction:](self, "addInteraction:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (CKConversationListEmbeddedCollectionViewCellDelegate)embeddedCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedCellDelegate);

  return (CKConversationListEmbeddedCollectionViewCellDelegate *)WeakRetained;
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkInteractions, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_destroyWeak((id *)&self->_embeddedCellDelegate);

  objc_storeStrong((id *)&self->_embeddedTableViewCell, 0);
}

@end