@interface CNContactView
+ (BOOL)isFixedValueProperty:(id)a3;
+ (BOOL)isMultiValueProperty:(id)a3;
+ (Class)classForCellIdentifier:(id)a3;
+ (id)addFieldCardProperties;
+ (id)allCardProperties;
+ (id)allImageProperties;
+ (id)cellIdentifierForActions;
+ (id)cellIdentifierForCardNamePickingGroup;
+ (id)cellIdentifierForClass:(Class)a3;
+ (id)cellIdentifierForContactContainerEditingGroup;
+ (id)cellIdentifierForDefaultAppGroup;
+ (id)cellIdentifierForDropdownMenuActions;
+ (id)cellIdentifierForEditingProperty:(id)a3;
+ (id)cellIdentifierForEditingPropertyItem:(id)a3;
+ (id)cellIdentifierForFaceTimeGroup;
+ (id)cellIdentifierForGameCenterGroup;
+ (id)cellIdentifierForGroupMembershipEditingGroup;
+ (id)cellIdentifierForGroupMembershipGroup;
+ (id)cellIdentifierForGroupMembershipPlaceholderGroup;
+ (id)cellIdentifierForLinkedCardsEditingGroup;
+ (id)cellIdentifierForLinkedCardsGroup;
+ (id)cellIdentifierForLinkedCardsPlaceholderGroup;
+ (id)cellIdentifierForMeCardSharedProfileGroup;
+ (id)cellIdentifierForProperty:(id)a3;
+ (id)cellIdentifierForPropertyPlaceholder;
+ (id)cellIdentifierForSNaPGroup;
+ (id)cellIdentifierForSharedProfileBanner;
+ (id)cellIdentifierForSplitActions;
+ (id)cellIdentifierForStaticIdentityEditingGroup;
+ (id)cellIdentifierForStaticIdentityGroup;
+ (id)cellIdentifierForStaticIdentityPlaceholderGroup;
+ (id)defaultCardProperties;
+ (id)nameProperties;
+ (id)namePropertiesForContact:(id)a3;
+ (id)optionalCardProperties;
+ (id)requiredNameProperties;
- (BOOL)isCellsLayoutCachingEnabled;
- (BOOL)isSiri;
- (BOOL)needsUpdateVisibleCells;
- (BOOL)shouldUseMapTiles;
- (CGSize)oldSize;
- (CNContact)contact;
- (CNContactHeaderView)defaultHeaderView;
- (CNContactView)initWithFrame:(CGRect)a3 contact:(id)a4;
- (CNContactView)initWithFrame:(CGRect)a3 style:(int64_t)a4 contact:(id)a5;
- (NSDictionary)actionTextAttributes;
- (NSDictionary)labelTextAttributes;
- (NSDictionary)valueTextAttributes;
- (UIColor)sectionBackgroundColor;
- (UIColor)selectedCellBackgroundColor;
- (UIEdgeInsets)separatorInsetForCell:(id)a3;
- (UIView)customHeaderView;
- (void)_cnui_applyContactStyle;
- (void)applyCellAppearance:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)registerContactCellClass:(Class)a3;
- (void)setActionTextAttributes:(id)a3;
- (void)setAttributesFromContactView:(id)a3 runningInContactsAppOniPad:(BOOL)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setCellsLayoutCachingEnabled:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setCustomHeaderView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIsSiri:(BOOL)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setNeedsUpdateVisibleCells;
- (void)setNeedsUpdateVisibleCells:(BOOL)a3;
- (void)setOldSize:(CGSize)a3;
- (void)setSectionBackgroundColor:(id)a3;
- (void)setSelectedCellBackgroundColor:(id)a3;
- (void)setShouldUseMapTiles:(BOOL)a3;
- (void)setValueTextAttributes:(id)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontColors;
- (void)updateFontSizes;
- (void)updateTableViewMetrics;
- (void)updateVisibleCellsIfNeeded;
@end

@implementation CNContactView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTextAttributes, 0);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);
  objc_storeStrong((id *)&self->_labelTextAttributes, 0);
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_customHeaderView, 0);
}

- (void)setNeedsUpdateVisibleCells:(BOOL)a3
{
  self->_needsUpdateVisibleCells = a3;
}

- (BOOL)needsUpdateVisibleCells
{
  return self->_needsUpdateVisibleCells;
}

- (void)setOldSize:(CGSize)a3
{
  self->_oldSize = a3;
}

- (CGSize)oldSize
{
  double width = self->_oldSize.width;
  double height = self->_oldSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (BOOL)isSiri
{
  return self->_isSiri;
}

- (void)setActionTextAttributes:(id)a3
{
}

- (NSDictionary)actionTextAttributes
{
  return self->_actionTextAttributes;
}

- (void)setValueTextAttributes:(id)a3
{
}

- (NSDictionary)valueTextAttributes
{
  return self->_valueTextAttributes;
}

- (void)setLabelTextAttributes:(id)a3
{
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (void)setSelectedCellBackgroundColor:(id)a3
{
}

- (UIColor)selectedCellBackgroundColor
{
  return self->_selectedCellBackgroundColor;
}

- (void)setSectionBackgroundColor:(id)a3
{
}

- (UIColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

- (void)setShouldUseMapTiles:(BOOL)a3
{
  self->_shouldUseMapTiles = a3;
}

- (BOOL)shouldUseMapTiles
{
  return self->_shouldUseMapTiles;
}

- (void)setCellsLayoutCachingEnabled:(BOOL)a3
{
  self->_cellsLayoutCachingEnabled = a3;
}

- (BOOL)isCellsLayoutCachingEnabled
{
  return self->_cellsLayoutCachingEnabled;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setCustomHeaderView:(id)a3
{
}

- (UIView)customHeaderView
{
  return self->_customHeaderView;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNContactView;
  [(CNContactView *)&v11 touchesBegan:v6 withEvent:v7];
  v8 = [(CNContactView *)self firstResponder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [(CNContactView *)self superview];
    [v10 touchesBegan:v6 withEvent:v7];
  }
}

- (UIEdgeInsets)separatorInsetForCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 contentView];
  id v6 = [v4 contentView];
  id v7 = [v6 layoutMarginsGuide];
  [v7 layoutFrame];
  objc_msgSend(v5, "convertRect:toView:", v4);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.double width = v13;
  v31.size.double height = v15;
  double MinX = CGRectGetMinX(v31);
  [v4 frame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.double width = v21;
  v32.size.double height = v23;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.double width = v13;
  v33.size.double height = v15;
  double v25 = MaxX - CGRectGetMaxX(v33);
  if ([(CNContactView *)self effectiveUserInterfaceLayoutDirection] == 1) {
    double v26 = v25;
  }
  else {
    double v26 = MinX;
  }
  double v27 = 0.0;
  double v28 = 0.0;
  double v29 = 0.0;
  result.right = v29;
  result.bottom = v28;
  result.left = v26;
  result.top = v27;
  return result;
}

- (void)applyCellAppearance:(id)a3
{
  id v24 = a3;
  objc_msgSend(v24, "_cnui_applyContactStyle");
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v24;
    id v6 = [(CNContactView *)self actionTextAttributes];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    [v5 setActionsColor:v7];

    double v8 = [v5 labelLabel];
    [v8 setNumberOfLines:v4 ^ 1];

    CGFloat v9 = [v5 valueLabel];

    [v9 setNumberOfLines:v4 ^ 1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    CGFloat v9 = [(CNContactView *)self separatorColor];
    [v24 setEditorSeparatorColor:v9];
  }

LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v24;
    CGFloat v11 = [v10 labelButton];
    double v12 = [v11 titleLabel];
    [v12 setNumberOfLines:v4 ^ 1];

    if (v4) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 4;
    }
    double v14 = [v10 labelButton];
    CGFloat v15 = [v14 titleLabel];
    [v15 setLineBreakMode:v13];

    [v10 setVseparatorHidden:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v24;
    CGFloat v17 = [v16 valueLabel];
    [v17 setNumberOfLines:0];

    objc_msgSend(v16, "setShouldUseMapTiles:", -[CNContactView shouldUseMapTiles](self, "shouldUseMapTiles"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v18 = [v24 label];
    [v18 setNumberOfLines:v4 ^ 1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v19 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v20 = *MEMORY[0x1E4FB28C8];
    id v21 = v24;
    double v22 = objc_msgSend(v19, "ab_preferredFontForTextStyle:", v20);
    CGFloat v23 = [v21 textField];

    [v23 setFont:v22];
  }
  if ([v24 isSelected])
  {
    [v24 setSelected:0 animated:0];
    [v24 setSelected:1 animated:0];
  }
  if ([(CNContactView *)self isEditing])
  {
    [(CNContactView *)self separatorInsetForCell:v24];
    objc_msgSend(v24, "setSeparatorInset:");
  }
  [v24 setNeedsUpdateConstraints];
}

- (void)updateFontSizes
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactView *)self defaultHeaderView];
  [v3 updateFontSizes];

  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v5 _scaledValueForValue:44.0];
  -[CNContactView setEstimatedRowHeight:](self, "setEstimatedRowHeight:");

  CGFloat v11 = @"ABTextStyleAttributeName";
  int v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  uint64_t v7 = *MEMORY[0x1E4FB2950];
  if (v6) {
    uint64_t v7 = v4;
  }
  v12[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [self cn_updateDictionaryForKey:@"labelTextAttributes" withChanges:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__CNContactView_updateFontSizes__block_invoke;
  v10[3] = &unk_1E549B460;
  v10[4] = self;
  CGFloat v9 = (void (**)(void *, __CFString *))_Block_copy(v10);
  v9[2](v9, @"labelTextAttributes");
  v9[2](v9, @"valueTextAttributes");
  v9[2](v9, @"actionTextAttributes");
}

void __32__CNContactView_updateFontSizes__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) valueForKey:v3];
  id v5 = [v4 objectForKeyedSubscript:@"ABTextStyleAttributeName"];
  if (v5)
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", v5);
    v10[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    objc_msgSend(v6, "cn_updateDictionaryForKey:withChanges:", v3, v8);
  }
}

- (void)updateVisibleCellsIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactView *)self superview];

  if (v3 && self->_needsUpdateVisibleCells)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(CNContactView *)self visibleCells];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(CNContactView *)self applyCellAppearance:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    self->_needsUpdateVisibleCells = 0;
  }
}

- (void)setNeedsUpdateVisibleCells
{
  if (!self->_needsUpdateVisibleCells)
  {
    self->_needsUpdateVisibleCells = 1;
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CNContactView_setNeedsUpdateVisibleCells__block_invoke;
    block[3] = &unk_1E54978F0;
    block[4] = self;
    CFRunLoopObserverRef v3 = CFRunLoopObserverCreateWithHandler(v2, 0x20uLL, 0, 0, block);
    if (v3)
    {
      uint64_t v4 = v3;
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      CFRelease(v4);
    }
  }
}

uint64_t __43__CNContactView_setNeedsUpdateVisibleCells__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleCellsIfNeeded];
}

- (void)updateFontColors
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  uint64_t v3 = v11;
  uint64_t v4 = +[CNContactStyle currentStyle];
  uint64_t v5 = [v4 textColor];
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [self cn_updateDictionaryForKey:@"labelTextAttributes" withChanges:v6];

  uint64_t v9 = v3;
  uint64_t v7 = [(UIView *)self tintColorOverride];
  long long v10 = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [self cn_updateDictionaryForKey:@"actionTextAttributes" withChanges:v8];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactView;
  [(CNContactView *)&v3 layoutMarginsDidChange];
  [(CNContactView *)self setNeedsUpdateVisibleCells];
}

- (void)layoutSubviews
{
  kdebug_trace();
  v41.receiver = self;
  v41.super_class = (Class)CNContactView;
  [(CNContactView *)&v41 layoutSubviews];
  [(CNContactView *)self oldSize];
  double v4 = v3;
  double v6 = v5;
  [(CNContactView *)self frame];
  if (v4 != v8 || v6 != v7)
  {
    [(CNContactView *)self setNeedsUpdateVisibleCells];
    [(CNContactView *)self frame];
    -[CNContactView setOldSize:](self, "setOldSize:", v10, v11);
  }
  long long v12 = [(UIView *)self _cnui_contactStyle];
  int v13 = [v12 usesInsetPlatterStyle];

  if (v13)
  {
    double v14 = [(UIView *)self _cnui_contactStyle];
    [v14 sectionMaximumPlatterWidth];
    double v16 = v15;

    [(CNContactView *)self bounds];
    double v18 = (v17 - v16) * 0.5;
    if (v18 >= 0.0)
    {
      [(CNContactView *)self safeAreaInsets];
      double v21 = v18 - v25;
      [(CNContactView *)self safeAreaInsets];
      double v24 = v18 - v26;
    }
    else
    {
      CGFloat v19 = [(UIView *)self _cnui_contactStyle];
      [v19 sectionContentInset];
      double v21 = v20 * 0.5;
      double v22 = [(UIView *)self _cnui_contactStyle];
      [v22 sectionContentInset];
      double v24 = v23 * 0.5;
    }
    [(CNContactView *)self _sectionContentInset];
    if ((v21 != v30 || v27 != 0.0 || v24 != v29 || v28 != 0.0)
      && ([(CNContactView *)self isEditing] & 1) == 0)
    {
      CGRect v31 = +[CNUIContactsEnvironment currentEnvironment];
      int v32 = [v31 runningInContactsAppOniPad];

      if (v32)
      {
        -[CNContactView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v21, 0.0, v24);
        [(CNContactView *)self separatorInset];
        double v34 = v33;
        [(CNContactView *)self separatorInset];
        -[CNContactView setSeparatorInset:](self, "setSeparatorInset:", v34, v21);
      }
      else
      {
        if ([(CNContactView *)self isSiri])
        {
          double v35 = *MEMORY[0x1E4FB2848];
          double v36 = *(double *)(MEMORY[0x1E4FB2848] + 8);
          double v37 = *(double *)(MEMORY[0x1E4FB2848] + 16);
          double v38 = *(double *)(MEMORY[0x1E4FB2848] + 24);
          v39 = self;
        }
        else
        {
          double v35 = 0.0;
          double v37 = 0.0;
          v39 = self;
          double v36 = v21;
          double v38 = v24;
        }
        -[CNContactView _setSectionContentInset:](v39, "_setSectionContentInset:", v35, v36, v37, v38);
      }
      v40 = [(UIView *)self _cnui_contactStyle];
      [v40 sectionCornerRadius];
      -[CNContactView _setSectionCornerRadius:](self, "_setSectionCornerRadius:");
    }
  }
  kdebug_trace();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactView;
  [(CNContactView *)&v3 tintColorDidChange];
  [(CNContactView *)self updateFontColors];
  [(CNContactView *)self setNeedsUpdateVisibleCells];
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactView;
  id v4 = a3;
  [(CNContactView *)&v6 setBackgroundColor:v4];
  -[CNContactView setTableHeaderBackgroundColor:](self, "setTableHeaderBackgroundColor:", v4, v6.receiver, v6.super_class);
  double v5 = [(CNContactView *)self defaultHeaderView];
  [v5 setBackgroundColor:v4];
}

- (void)setAttributesFromContactView:(id)a3 runningInContactsAppOniPad:(BOOL)a4
{
  id v14 = a3;
  if (!a4)
  {
    objc_super v6 = [v14 backgroundColor];
    [(CNContactView *)self setBackgroundColor:v6];
  }
  double v7 = [v14 separatorColor];

  if (v7)
  {
    double v8 = [v14 separatorColor];
    [(CNContactView *)self setSeparatorColor:v8];
  }
  uint64_t v9 = [v14 sectionBackgroundColor];
  [(CNContactView *)self setSectionBackgroundColor:v9];

  double v10 = [v14 selectedCellBackgroundColor];
  [(CNContactView *)self setSelectedCellBackgroundColor:v10];

  double v11 = [v14 labelTextAttributes];
  [(CNContactView *)self setLabelTextAttributes:v11];

  long long v12 = [v14 valueTextAttributes];
  [(CNContactView *)self setValueTextAttributes:v12];

  int v13 = [v14 actionTextAttributes];
  [(CNContactView *)self setActionTextAttributes:v13];
}

- (void)registerContactCellClass:(Class)a3
{
  id v5 = [(id)objc_opt_class() cellIdentifierForClass:a3];
  [(CNContactView *)self registerClass:a3 forCellReuseIdentifier:v5];
}

- (CNContactHeaderView)defaultHeaderView
{
  uint64_t v3 = [(CNContactView *)self customHeaderView];
  if (v3)
  {
    id v4 = (void *)v3;
    goto LABEL_3;
  }
  double v7 = [(CNContactView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CNContactView *)self delegate];
    id v4 = [v9 viewForHeaderInTableView:self];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      goto LABEL_4;
    }
LABEL_3:
    id v5 = 0;
LABEL_4:

    goto LABEL_5;
  }
  id v5 = 0;
LABEL_5:

  return (CNContactHeaderView *)v5;
}

- (void)updateTableViewMetrics
{
  id v6 = [(UIView *)self _cnui_contactStyle];
  int v3 = [v6 usesInsetPlatterStyle];
  double v4 = 0.0;
  if (v3)
  {
    int v5 = [(CNContactView *)self isEditing];
    double v4 = 16.0;
    if (v5) {
      double v4 = 0.0;
    }
  }
  [(CNContactView *)self setSectionHeaderHeight:v4];
}

- (void)setEditing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactView;
  [(CNContactView *)&v4 setEditing:a3];
  [(CNContactView *)self updateTableViewMetrics];
}

- (void)_cnui_applyContactStyle
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactView;
  [(UITableView *)&v7 _cnui_applyContactStyle];
  int v3 = [(UIView *)self _cnui_contactStyle];
  objc_super v4 = [v3 backgroundColor];

  if (v4)
  {
    int v5 = [(UIView *)self _cnui_contactStyle];
    id v6 = [v5 backgroundColor];
    [(CNContactView *)self setBackgroundColor:v6];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactView;
  [(CNMaskingTableView *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(CNContactView *)self traitCollection];
  -[CNContactView setCellLayoutMarginsFollowReadableWidth:](self, "setCellLayoutMarginsFollowReadableWidth:", [v4 userInterfaceIdiom] == 1);
}

- (CNContactView)initWithFrame:(CGRect)a3 contact:(id)a4
{
  return -[CNContactView initWithFrame:style:contact:](self, "initWithFrame:style:contact:", 1, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CNContactView)initWithFrame:(CGRect)a3 style:(int64_t)a4 contact:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CNContactView;
  int v13 = -[CNContactView initWithFrame:style:](&v31, sel_initWithFrame_style_, a4, x, y, width, height);
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contact, a5);
    [(CNContactView *)v14 _setCellsSelfSize:1];
    [(CNContactView *)v14 setKeyboardDismissMode:2];
    [(CNContactView *)v14 setAllowsSelectionDuringEditing:1];
    [(CNContactView *)v14 setSectionFooterHeight:0.0];
    [(CNContactView *)v14 _setTopPadding:0.0];
    [(CNContactView *)v14 _setBottomPadding:0.0];
    [(CNContactView *)v14 setRestorationIdentifier:@"ContactTableView"];
    [(CNContactView *)v14 _setIgnoreCopyFilterForTableAnimations:1];
    [(CNContactView *)v14 setShouldUseMapTiles:1];
    [(CNContactView *)v14 setRowHeight:*MEMORY[0x1E4FB2F28]];
    [(CNContactView *)v14 updateTableViewMetrics];
    uint64_t v15 = *MEMORY[0x1E4FB28C8];
    double v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v16 _scaledValueForValue:44.0];
    -[CNContactView setEstimatedRowHeight:](v14, "setEstimatedRowHeight:");

    double v17 = [(CNContactView *)v14 traitCollection];
    -[CNContactView setCellLayoutMarginsFollowReadableWidth:](v14, "setCellLayoutMarginsFollowReadableWidth:", [v17 userInterfaceIdiom] == 1);

    double v36 = @"ABTextStyleAttributeName";
    int v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    uint64_t v19 = *MEMORY[0x1E4FB2950];
    if (v18) {
      uint64_t v19 = v15;
    }
    v37[0] = v19;
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [(CNContactView *)v14 setLabelTextAttributes:v20];

    double v34 = @"ABTextStyleAttributeName";
    uint64_t v35 = v15;
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    [(CNContactView *)v14 setValueTextAttributes:v21];

    int v32 = @"ABTextStyleAttributeName";
    uint64_t v33 = v15;
    double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [(CNContactView *)v14 setActionTextAttributes:v22];

    [(CNContactView *)v14 updateFontSizes];
    [(CNContactView *)v14 updateFontColors];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    [(CNContactView *)v14 registerContactCellClass:objc_opt_class()];
    uint64_t v23 = objc_opt_class();
    double v24 = (objc_class *)objc_opt_class();
    double v25 = NSStringFromClass(v24);
    [(CNContactView *)v14 registerClass:v23 forHeaderFooterViewReuseIdentifier:v25];

    uint64_t v26 = objc_opt_class();
    double v27 = (objc_class *)objc_opt_class();
    double v28 = NSStringFromClass(v27);
    [(CNContactView *)v14 registerClass:v26 forHeaderFooterViewReuseIdentifier:v28];

    double v29 = v14;
  }

  return v14;
}

+ (BOOL)isFixedValueProperty:(id)a3
{
  uint64_t v3 = isFixedValueProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isFixedValueProperty__onceToken, &__block_literal_global_140);
  }
  char v5 = [(id)isFixedValueProperty__fixedValueProperties containsObject:v4];

  return v5;
}

void __38__CNContactView_isFixedValueProperty___block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AF90];
  v9[0] = *MEMORY[0x1E4F1ADA0];
  v9[1] = v0;
  v9[2] = *MEMORY[0x1E4F1AED0];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  CFAllocatorRef v2 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v1;

  uint64_t v3 = (void *)isFixedValueProperty__fixedValueProperties;
  id v4 = +[CNContactView nameProperties];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  id v6 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v5;

  uint64_t v7 = [(id)isFixedValueProperty__fixedValueProperties arrayByAddingObject:*MEMORY[0x1E4F1AF18]];
  char v8 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v7;
}

+ (BOOL)isMultiValueProperty:(id)a3
{
  uint64_t v3 = isMultiValueProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isMultiValueProperty__onceToken, &__block_literal_global_138);
  }
  char v5 = [(id)isMultiValueProperty__singleValueProperties containsObject:v4];

  return v5 ^ 1;
}

void __38__CNContactView_isMultiValueProperty___block_invoke()
{
  void v10[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AF90];
  v10[0] = *MEMORY[0x1E4F1ADA0];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1ADC0];
  void v10[2] = *MEMORY[0x1E4F1AED0];
  v10[3] = v1;
  v10[4] = *MEMORY[0x1E4F1AF70];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  uint64_t v3 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v2;

  id v4 = (void *)isMultiValueProperty__singleValueProperties;
  char v5 = +[CNContactView nameProperties];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v7 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v6;

  uint64_t v8 = [(id)isMultiValueProperty__singleValueProperties arrayByAddingObject:*MEMORY[0x1E4F1AF18]];
  uint64_t v9 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v8;
}

+ (id)allImageProperties
{
  if (allImageProperties_onceToken != -1) {
    dispatch_once(&allImageProperties_onceToken, &__block_literal_global_136);
  }
  uint64_t v2 = (void *)allImageProperties_properties;

  return v2;
}

void __35__CNContactView_allImageProperties__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AF98];
  v5[0] = *MEMORY[0x1E4F1AE28];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AE30];
  v5[2] = *MEMORY[0x1E4F1ADE8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADA8];
  v5[4] = *MEMORY[0x1E4F1AE48];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F1AE98];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  id v4 = (void *)allImageProperties_properties;
  allImageProperties_properties = v3;
}

+ (id)optionalCardProperties
{
  if (optionalCardProperties_onceToken != -1) {
    dispatch_once(&optionalCardProperties_onceToken, &__block_literal_global_134);
  }
  uint64_t v2 = (void *)optionalCardProperties_properties;

  return v2;
}

void __39__CNContactView_optionalCardProperties__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADB0];
  v5[0] = @"birthdays";
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF78];
  v5[2] = *MEMORY[0x1E4F1AF50];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AED0];
  v5[4] = *MEMORY[0x1E4F1AE60];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  id v4 = (void *)optionalCardProperties_properties;
  optionalCardProperties_properties = v3;
}

+ (id)defaultCardProperties
{
  if (defaultCardProperties_onceToken != -1) {
    dispatch_once(&defaultCardProperties_onceToken, &__block_literal_global_132);
  }
  uint64_t v2 = (void *)defaultCardProperties_properties;

  return v2;
}

void __38__CNContactView_defaultCardProperties__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADC8];
  v4[0] = *MEMORY[0x1E4F1AEE0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF10];
  v4[2] = *MEMORY[0x1E4F1AFB0];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v3 = (void *)defaultCardProperties_properties;
  defaultCardProperties_properties = v2;
}

+ (id)addFieldCardProperties
{
  if (addFieldCardProperties_onceToken != -1) {
    dispatch_once(&addFieldCardProperties_onceToken, &__block_literal_global_130_13801);
  }
  uint64_t v2 = (void *)addFieldCardProperties_properties;

  return v2;
}

void __39__CNContactView_addFieldCardProperties__block_invoke()
{
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([getIPPronounPickerViewControllerClass() canDisplayPronounPicker]) {
    int v0 = [getIPPronounPickerViewControllerClass() shouldDisplayPronounPickerByDefault] ^ 1;
  }
  else {
    int v0 = 0;
  }
  uint64_t v1 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v2 = [v1 featureFlags];
  int v3 = [v2 isFeatureEnabled:12];

  if (v3) {
    BOOL v4 = v0 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    [v7 addObject:*MEMORY[0x1E4F1AD88]];
  }
  uint64_t v5 = [v7 copy];
  uint64_t v6 = (void *)addFieldCardProperties_properties;
  addFieldCardProperties_properties = v5;
}

+ (id)allCardProperties
{
  if (allCardProperties_onceToken != -1) {
    dispatch_once(&allCardProperties_onceToken, &__block_literal_global_121);
  }
  uint64_t v2 = (void *)allCardProperties_properties;

  return v2;
}

void __34__CNContactView_allCardProperties__block_invoke()
{
  v17[13] = *MEMORY[0x1E4F143B8];
  int v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = *MEMORY[0x1E4F1AEE0];
  v17[0] = *MEMORY[0x1E4F1ADC0];
  v17[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADA0];
  v17[2] = *MEMORY[0x1E4F1ADC8];
  v17[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AFB0];
  v17[4] = *MEMORY[0x1E4F1AF90];
  v17[5] = v3;
  v17[6] = *MEMORY[0x1E4F1AF10];
  v17[7] = @"birthdays";
  uint64_t v4 = *MEMORY[0x1E4F1AF50];
  v17[8] = *MEMORY[0x1E4F1ADB0];
  v17[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AE60];
  v17[10] = *MEMORY[0x1E4F1AF78];
  v17[11] = v5;
  v17[12] = *MEMORY[0x1E4F1AED0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];
  [v0 addObjectsFromArray:v6];

  id v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v8 = [v7 featureFlags];
  int v9 = [v8 isFeatureEnabled:12];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v0, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_126);
    objc_msgSend(v0, "_cn_insertNonNilObject:atIndex:", *MEMORY[0x1E4F1AD88], v10 + 1);
  }
  double v11 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v12 = [v11 featureFlags];
  int v13 = [v12 isFeatureEnabled:15];

  if (v13)
  {
    uint64_t v14 = objc_msgSend(v0, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_128);
    objc_msgSend(v0, "_cn_insertNonNilObject:atIndex:", *MEMORY[0x1E4F1AF70], v14);
  }
  uint64_t v15 = [v0 copy];
  double v16 = (void *)allCardProperties_properties;
  allCardProperties_properties = v15;
}

uint64_t __34__CNContactView_allCardProperties__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4F1ADC0]];
}

uint64_t __34__CNContactView_allCardProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4F1ADC8]];
}

+ (id)requiredNameProperties
{
  if (requiredNameProperties_onceToken != -1) {
    dispatch_once(&requiredNameProperties_onceToken, &__block_literal_global_107);
  }
  uint64_t v2 = (void *)requiredNameProperties_properties;

  return v2;
}

void __39__CNContactView_requiredNameProperties__block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v1 = CNContactsUIBundle();
  uint64_t v2 = [v1 pathForResource:@"ABCardDisplay" ofType:@"plist"];
  uint64_t v3 = [v0 dictionaryWithContentsOfFile:v2];

  uint64_t v4 = [v3 objectForKey:@"_LOCALIZABLE_"];
  uint64_t v5 = [v4 objectForKey:@"ShouldShowPhoneticNamesByDefault"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F1AEF8];
    uint64_t v19 = *MEMORY[0x1E4F1ADF0];
    uint64_t v20 = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AEF0];
    uint64_t v21 = *MEMORY[0x1E4F1ADE0];
    uint64_t v22 = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AF08];
    uint64_t v23 = *MEMORY[0x1E4F1AED8];
    uint64_t v24 = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    double v11 = &v19;
    uint64_t v12 = 6;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F1ADE0];
    uint64_t v16 = *MEMORY[0x1E4F1ADF0];
    uint64_t v17 = v13;
    uint64_t v18 = *MEMORY[0x1E4F1AED8];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    double v11 = &v16;
    uint64_t v12 = 3;
  }
  uint64_t v14 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v15 = (void *)requiredNameProperties_properties;
  requiredNameProperties_properties = v14;
}

+ (id)namePropertiesForContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1B910];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1B910] nameOrderForContact:v3];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    uint64_t v5 = [v4 nameOrderForContact:v6];
  }
  if (v5 == 1)
  {
    if (namePropertiesForContact__onceToken != -1) {
      dispatch_once(&namePropertiesForContact__onceToken, &__block_literal_global_13824);
    }
    uint64_t v7 = &namePropertiesForContact__firstProperties;
  }
  else
  {
    if (namePropertiesForContact__onceToken_103 != -1) {
      dispatch_once(&namePropertiesForContact__onceToken_103, &__block_literal_global_105);
    }
    uint64_t v7 = &namePropertiesForContact__lastProperties;
  }
  id v8 = (id)*v7;

  return v8;
}

void __42__CNContactView_namePropertiesForContact___block_invoke_2()
{
  v10[16] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADE0];
  v10[0] = *MEMORY[0x1E4F1AEB0];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF38];
  void v10[2] = *MEMORY[0x1E4F1AEF0];
  v10[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADF0];
  v10[4] = *MEMORY[0x1E4F1AF30];
  void v10[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF40];
  void v10[6] = *MEMORY[0x1E4F1AEF8];
  v10[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AF00];
  v10[8] = *MEMORY[0x1E4F1AEA0];
  v10[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEC0];
  v10[10] = *MEMORY[0x1E4F1AEB8];
  v10[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADB8];
  v10[12] = *MEMORY[0x1E4F1AE78];
  v10[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AF08];
  v10[14] = *MEMORY[0x1E4F1AED8];
  v10[15] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:16];
  uint64_t v9 = (void *)namePropertiesForContact__lastProperties;
  namePropertiesForContact__lastProperties = v8;
}

void __42__CNContactView_namePropertiesForContact___block_invoke()
{
  v10[16] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADF0];
  v10[0] = *MEMORY[0x1E4F1AEB0];
  v10[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AF40];
  void v10[2] = *MEMORY[0x1E4F1AEF8];
  v10[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AF00];
  v10[4] = *MEMORY[0x1E4F1AEA0];
  void v10[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEF0];
  void v10[6] = *MEMORY[0x1E4F1ADE0];
  v10[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AF30];
  v10[8] = *MEMORY[0x1E4F1AF38];
  v10[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEC0];
  v10[10] = *MEMORY[0x1E4F1AEB8];
  v10[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1ADB8];
  v10[12] = *MEMORY[0x1E4F1AE78];
  v10[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AF08];
  v10[14] = *MEMORY[0x1E4F1AED8];
  v10[15] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:16];
  uint64_t v9 = (void *)namePropertiesForContact__firstProperties;
  namePropertiesForContact__firstProperties = v8;
}

+ (id)nameProperties
{
  return +[CNContactView namePropertiesForContact:0];
}

+ (Class)classForCellIdentifier:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

+ (id)cellIdentifierForClass:(Class)a3
{
  uint64_t v3 = NSString;
  Name = class_getName(a3);

  return (id)[v3 stringWithCString:Name encoding:1];
}

+ (id)cellIdentifierForEditingProperty:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4F1AEE0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AFB0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AF10]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AED0]] & 1) == 0
    && ([v4 isEqualToString:@"birthdays"] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1ADB0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AF78]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AE60]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AF90]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AF50]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1AF18]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F1ADC0]] & 1) == 0)
  {
    uint64_t v8 = [a1 nameProperties];
    char v9 = [v8 containsObject:v4];

    if ((v9 & 1) == 0) {
      [v4 isEqualToString:*MEMORY[0x1E4F1AF70]];
    }
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(id)objc_opt_class() cellIdentifierForClass:v5];

  return v6;
}

+ (id)cellIdentifierForEditingPropertyItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 property];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F1AD88]];

  if (v5)
  {
    objc_opt_class();
    id v6 = v3;
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    [v8 shouldShowLanguageLabel];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [(id)objc_opt_class() cellIdentifierForClass:v9];
  }
  else
  {
    double v11 = objc_opt_class();
    id v8 = [v3 property];
    uint64_t v10 = [v11 cellIdentifierForEditingProperty:v8];
  }
  uint64_t v12 = (void *)v10;

  return v12;
}

+ (id)cellIdentifierForProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1AEE0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF10]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF78]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AE60]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AED0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADA0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF90]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1ADC0]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x1E4F1AF50]] & 1) == 0)
  {
    [v3 isEqualToString:*MEMORY[0x1E4F1AF70]];
  }
  uint64_t v4 = objc_opt_class();
  int v5 = [(id)objc_opt_class() cellIdentifierForClass:v4];

  return v5;
}

+ (id)cellIdentifierForSharedProfileBanner
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForMeCardSharedProfileGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForSNaPGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForCardNamePickingGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForGameCenterGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForContactContainerEditingGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForStaticIdentityPlaceholderGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForStaticIdentityEditingGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForStaticIdentityGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForGroupMembershipPlaceholderGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForGroupMembershipEditingGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForGroupMembershipGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForLinkedCardsPlaceholderGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForLinkedCardsEditingGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForLinkedCardsGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForDefaultAppGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForFaceTimeGroup
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForPropertyPlaceholder
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForDropdownMenuActions
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForSplitActions
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

+ (id)cellIdentifierForActions
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cellIdentifierForClass:v3];
}

@end