@interface CKPinnedConversationCollectionViewCell
+ (id)_jitterRotationAnimation;
+ (id)_jitterXTranslationAnimation;
+ (id)_jitterYTranslationAnimation;
+ (id)checkmarkAccessoryView;
+ (id)reuseIdentifier;
+ (id)unpinAccessoryView;
- (BOOL)allowActivitySuppressionWhenSelected;
- (BOOL)isJittering;
- (BOOL)isPreparingForReuse;
- (BOOL)isShowingCheckboxAccessory;
- (BOOL)isShowingUnpinAccessory;
- (BOOL)showsBackgroundViewWhenSelected;
- (CGRect)cellFrameFromLayoutAttributes;
- (CGRect)checkboxFrame;
- (CGRect)unpinAccessoryViewFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKConversationListAccessoryView)checkboxAccessoryView;
- (CKConversationListAccessoryView)unpinAccessoryView;
- (CKPinnedConversationCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKPinnedConversationCollectionViewCellDelegate)delegate;
- (CKPinnedConversationView)pinnedConversationView;
- (NSArray)linkInteractions;
- (double)accessorySizeForLayoutStyle:(int64_t)a3;
- (id)configurationState;
- (unint64_t)editingMode;
- (void)_createCheckboxAccessoryIfNecessary;
- (void)_createUnpinAccessoryIfNecessary;
- (void)_updateActivityItemBoundingFrame;
- (void)_updateActivitySupressionForState:(id)a3;
- (void)_updateZPositionForState:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureAppEntityForConversation:(id)a3;
- (void)didMoveToSuperview;
- (void)dragStateDidChange:(int64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAllowActivitySuppressionWhenSelected:(BOOL)a3;
- (void)setCellFrameFromLayoutAttributes:(CGRect)a3;
- (void)setCheckboxAccessoryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setIsPreparingForReuse:(BOOL)a3;
- (void)setJittering:(BOOL)a3;
- (void)setLinkInteractions:(id)a3;
- (void)setPinnedConversationView:(id)a3;
- (void)setShowingCheckboxAccessory:(BOOL)a3;
- (void)setShowingUnpinAccessory:(BOOL)a3;
- (void)setShowsBackgroundViewWhenSelected:(BOOL)a3;
- (void)setUnpinAccessoryView:(id)a3;
- (void)unpinButtonTapped:(id)a3;
- (void)updateCheckboxAccessoryImageForCurrentLayoutStyle;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateUnpinAccessoryImageForCurrentLayoutStyle;
@end

@implementation CKPinnedConversationCollectionViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)configureAppEntityForConversation:(id)a3
{
  id v5 = a3;
  v6 = self;
  CKPinnedConversationCollectionViewCell.configureAppEntity(forConversation:)((CKConversation_optional *)a3);
}

- (CKPinnedConversationCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationCollectionViewCell;
  v3 = -[CKPinnedConversationCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKPinnedConversationView alloc];
    [(CKPinnedConversationCollectionViewCell *)v3 bounds];
    uint64_t v5 = -[CKPinnedConversationView initWithFrame:](v4, "initWithFrame:");
    pinnedConversationView = v3->_pinnedConversationView;
    v3->_pinnedConversationView = (CKPinnedConversationView *)v5;

    v7 = [(CKPinnedConversationCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_pinnedConversationView];

    v3->_editingMode = 0;
  }
  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKPinnedConversationCollectionViewCell;
  id v4 = a3;
  [(CKPinnedConversationCollectionViewCell *)&v13 applyLayoutAttributes:v4];
  objc_msgSend(v4, "frame", v13.receiver, v13.super_class);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  self->_cellFrameFromLayoutAttributes.origin.x = v6;
  self->_cellFrameFromLayoutAttributes.origin.y = v8;
  self->_cellFrameFromLayoutAttributes.size.width = v10;
  self->_cellFrameFromLayoutAttributes.size.height = v12;
  [(CKPinnedConversationCollectionViewCell *)self _updateActivityItemBoundingFrame];
}

- (void)_updateActivityItemBoundingFrame
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionViewBoundsForPinnedConversationCollectionViewCell:self];
  CGFloat v17 = v9;
  CGFloat v18 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  double x = self->_cellFrameFromLayoutAttributes.origin.x;
  double y = self->_cellFrameFromLayoutAttributes.origin.y;
  v20.size.width = self->_cellFrameFromLayoutAttributes.size.width;
  v20.size.height = self->_cellFrameFromLayoutAttributes.size.height;
  v20.origin.double x = x;
  v20.origin.double y = y;
  if (!CGRectIsEmpty(v20))
  {
    v21.origin.double y = v17;
    v21.origin.double x = v18;
    v21.size.width = v11;
    v21.size.height = v13;
    if (!CGRectIsEmpty(v21))
    {
      double v5 = v13;
      double v6 = v11;
      double v3 = -y;
      double v4 = -x;
    }
  }
  pinnedConversationView = self->_pinnedConversationView;

  -[CKPinnedConversationView setActivityItemBoundingFrame:](pinnedConversationView, "setActivityItemBoundingFrame:", v4, v3, v6, v5);
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CKPinnedConversationCollectionViewCell *)self _updateActivityItemBoundingFrame];
    double v5 = obj;
  }
}

- (id)configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)CKPinnedConversationCollectionViewCell;
  v2 = [(CKPinnedConversationCollectionViewCell *)&v5 configurationState];
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 modifyConversationCellStateForDrop:v2];

  return v2;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v32 = a3;
  double v4 = [MEMORY[0x1E4F427B0] listSidebarCellConfiguration];
  objc_super v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [(CKPinnedConversationCollectionViewCell *)self traitCollection];
  if ([v5 useSelectedAppearanceForConversationCellState:v32 traitCollection:v6])
  {
    if ([(CKPinnedConversationCollectionViewCell *)self editingMode]) {
      BOOL v7 = CKIsRunningInMacCatalyst() != 0;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  double v8 = [MEMORY[0x1E4F428B8] clearColor];
  double v9 = +[CKUIBehavior sharedBehaviors];
  [v9 modifyConversationCellStateForDrop:v32];

  double v10 = [v4 updatedConfigurationForState:v32];

  if (v7
    && [(CKPinnedConversationCollectionViewCell *)self showsBackgroundViewWhenSelected])
  {
    CGFloat v11 = +[CKUIBehavior sharedBehaviors];
    double v12 = [v11 theme];
    CGFloat v13 = [v12 conversationListPinnedCellSelectorViewColor];

    if (v13)
    {
      v14 = +[CKUIBehavior sharedBehaviors];
      v15 = [v14 theme];
      uint64_t v16 = [v15 conversationListPinnedCellSelectorViewColor];

      double v8 = v14;
    }
    else
    {
      uint64_t v16 = [v10 backgroundColor];
    }

    uint64_t v17 = 1;
    double v8 = (void *)v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  CGFloat v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v19 = [v18 conversationPinningTouchdownDimEnabled];

  if (v19)
  {
    int v20 = [v32 isHighlighted];
    uint64_t v21 = [v32 cellDropState];
    BOOL v22 = [(CKPinnedConversationCollectionViewCell *)self showsBackgroundViewWhenSelected];
    unsigned int v23 = v20 | v7;
    if (v21 == 2) {
      unsigned int v23 = 1;
    }
    if (v22) {
      uint64_t v24 = v21 == 2;
    }
    else {
      uint64_t v24 = v23;
    }
    v25 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v25 setDimmed:v24];
  }
  [v10 setBackgroundColor:v8];
  v26 = +[CKUIBehavior sharedBehaviors];
  [v26 conversationListPinnedCellSelectedBackgroundCornerRadius];
  objc_msgSend(v10, "setCornerRadius:");

  [v10 setEdgesAddingLayoutMarginsToBackgroundInsets:0];
  objc_msgSend(v10, "setBackgroundInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));
  [(CKPinnedConversationCollectionViewCell *)self _updateActivitySupressionForState:v32];
  [(CKPinnedConversationCollectionViewCell *)self _updateZPositionForState:v32];
  uint64_t v27 = [(CKPinnedConversationCollectionViewCell *)self isSelected];
  v28 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  [v28 setSelected:v27];

  BOOL v29 = [(CKPinnedConversationCollectionViewCell *)self showsBackgroundViewWhenSelected];
  v30 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [v30 setNeedsUnreadIndicatorLeadingEdgePadding:v29];

  v31 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [v31 setIsSelectedWithDarkAppearance:v17];

  [(CKPinnedConversationCollectionViewCell *)self setBackgroundConfiguration:v10];
}

+ (id)unpinAccessoryView
{
  v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"minus"];
  double v3 = [MEMORY[0x1E4F427D8] effectWithStyle:16];
  double v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_super v5 = [CKConversationListAccessoryView alloc];
  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 pinnedConversationDefaultAccessorySize];
  BOOL v7 = -[CKConversationListAccessoryView initWithDiameter:](v5, "initWithDiameter:");

  [(CKConversationListAccessoryView *)v7 setBlurEffect:v3 withVibrancyEffectStyle:2 forState:0];
  [(CKConversationListAccessoryView *)v7 setTintColor:v4 forState:0];
  [(CKConversationListAccessoryView *)v7 setImage:v2 forState:0];

  return v7;
}

+ (id)checkmarkAccessoryView
{
  v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark"];
  double v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  double v4 = [v3 colorWithAlphaComponent:0.100000001];

  objc_super v5 = [MEMORY[0x1E4F428B8] systemBlueColor];
  double v6 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  BOOL v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  double v8 = [CKConversationListAccessoryView alloc];
  double v9 = +[CKUIBehavior sharedBehaviors];
  [v9 pinnedConversationDefaultAccessorySize];
  double v10 = -[CKConversationListAccessoryView initWithDiameter:](v8, "initWithDiameter:");

  [(CKConversationListAccessoryView *)v10 setBlurEffect:v6 forState:0];
  [(CKConversationListAccessoryView *)v10 setBackgroundColor:v4 forState:0];
  [(CKConversationListAccessoryView *)v10 setBackgroundColor:v5 forState:4];
  [(CKConversationListAccessoryView *)v10 setTintColor:v7 forState:4];
  [(CKConversationListAccessoryView *)v10 setImage:v2 forState:4];
  [(CKConversationListAccessoryView *)v10 setUserInteractionEnabled:0];
  CGFloat v11 = +[CKUIBehavior sharedBehaviors];
  [v11 pinnedConversationCheckmarkStrokeRatio];
  double v13 = v12;
  [(CKConversationListAccessoryView *)v10 bounds];
  double v15 = v13 * v14;
  uint64_t v16 = [(CKConversationListAccessoryView *)v10 layer];
  [v16 setBorderWidth:v15];

  id v17 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  uint64_t v18 = [v17 CGColor];
  int v19 = [(CKConversationListAccessoryView *)v10 layer];
  [v19 setBorderColor:v18];

  int v20 = [(CKConversationListAccessoryView *)v10 layer];
  [v20 setMasksToBounds:0];

  id v21 = [MEMORY[0x1E4F428B8] blackColor];
  uint64_t v22 = [v21 CGColor];
  unsigned int v23 = [(CKConversationListAccessoryView *)v10 layer];
  [v23 setShadowColor:v22];

  uint64_t v24 = [(CKConversationListAccessoryView *)v10 layer];
  LODWORD(v25) = 1025758986;
  [v24 setShadowOpacity:v25];

  v26 = [(CKConversationListAccessoryView *)v10 layer];
  [v26 setShadowRadius:7.0];

  uint64_t v27 = [(CKConversationListAccessoryView *)v10 layer];
  objc_msgSend(v27, "setShadowOffset:", 0.0, 12.0);

  return v10;
}

- (double)accessorySizeForLayoutStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0.0;
  }
  if (((1 << a3) & 0x3C) != 0) {
    return 18.0;
  }
  double v4 = +[CKUIBehavior sharedBehaviors];
  [v4 pinnedConversationDefaultAccessorySize];
  double v6 = v5;

  return v6;
}

- (void)updateCheckboxAccessoryImageForCurrentLayoutStyle
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  unint64_t v4 = [v3 layoutStyle];

  if (v4 > 6)
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:**((void **)&unk_1E5629638 + v4) variant:1024];
    uint64_t v6 = 1;
  }
  id v11 = (id)v5;
  BOOL v7 = [MEMORY[0x1E4F42A98] configurationWithFont:v5 scale:v6];
  double v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark"];
  double v9 = [v8 imageWithConfiguration:v7];

  double v10 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  [v10 setImage:v9 forState:4];
}

- (void)updateUnpinAccessoryImageForCurrentLayoutStyle
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  unint64_t v4 = [v3 layoutStyle];

  if (v4 > 6)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = (void *)qword_1E5629670[v4];
    uint64_t v6 = qword_18F81D0C8[v4];
    uint64_t v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*v5 variant:1024];
  }
  id v12 = (id)v7;
  double v8 = [MEMORY[0x1E4F42A98] configurationWithFont:v7 scale:v6];
  double v9 = [MEMORY[0x1E4F42A80] systemImageNamed:@"minus"];
  double v10 = [v9 imageWithConfiguration:v8];

  id v11 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];
  [v11 setImage:v10 forState:0];
}

- (void)_createCheckboxAccessoryIfNecessary
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];

  if (!v3)
  {
    unint64_t v4 = +[CKPinnedConversationCollectionViewCell checkmarkAccessoryView];
    checkboxAccessoryView = self->_checkboxAccessoryView;
    self->_checkboxAccessoryView = v4;

    [(CKPinnedConversationCollectionViewCell *)self checkboxFrame];
    -[CKConversationListAccessoryView setFrame:](self->_checkboxAccessoryView, "setFrame:");
    [(CKPinnedConversationCollectionViewCell *)self updateCheckboxAccessoryImageForCurrentLayoutStyle];
  }
}

- (void)_createUnpinAccessoryIfNecessary
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];

  if (!v3)
  {
    unint64_t v4 = +[CKPinnedConversationCollectionViewCell unpinAccessoryView];
    unpinAccessoryView = self->_unpinAccessoryView;
    self->_unpinAccessoryView = v4;

    [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryViewFrame];
    -[CKConversationListAccessoryView setFrame:](self->_unpinAccessoryView, "setFrame:");
    [(CKConversationListAccessoryView *)self->_unpinAccessoryView setImageNeedsEdgeAntiAliasing:1];
    [(CKConversationListAccessoryView *)self->_unpinAccessoryView addTarget:self action:sel_unpinButtonTapped_ forEvents:64];
    [(CKPinnedConversationCollectionViewCell *)self updateUnpinAccessoryImageForCurrentLayoutStyle];
  }
}

- (void)setAllowActivitySuppressionWhenSelected:(BOOL)a3
{
  if (self->_allowActivitySuppressionWhenSelected != a3)
  {
    self->_allowActivitySuppressionWhenSelected = a3;
    id v4 = [(CKPinnedConversationCollectionViewCell *)self configurationState];
    [(CKPinnedConversationCollectionViewCell *)self _updateActivitySupressionForState:v4];
  }
}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_editingMode != a3) {
    self->_editingMode = a3;
  }
  if (a3
    && ([(CKPinnedConversationCollectionViewCell *)self pinnedConversationView],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 setDimmed:0],
        v7,
        a3 == 1)
    && !CKIsRunningInMacCatalyst())
  {
    if ([(CKPinnedConversationCollectionViewCell *)self isShowingCheckboxAccessory])
    {
      BOOL v14 = 0;
    }
    else
    {
      [(CKPinnedConversationCollectionViewCell *)self setShowingCheckboxAccessory:1];
      BOOL v14 = v4;
    }
    double v15 = [(CKPinnedConversationCollectionViewCell *)self contentView];
    uint64_t v16 = (void *)MEMORY[0x1E4F42FF0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke;
    v35[3] = &unk_1E5620AF8;
    v35[4] = self;
    id v17 = v15;
    id v36 = v17;
    [v16 performWithoutAnimation:v35];
    if (v14)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_2;
      v34[3] = &unk_1E5620C40;
      v34[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v34];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_3;
      v33[3] = &unk_1E5620C40;
      v33[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v33 animations:0.3];
    }

    [(CKPinnedConversationCollectionViewCell *)self setJittering:0];
  }
  else
  {
    double v8 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];

    if (v8)
    {
      [(CKPinnedConversationCollectionViewCell *)self setShowingCheckboxAccessory:0];
      if (v4)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_4;
        v32[3] = &unk_1E5620C40;
        v32[4] = self;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_5;
        v31[3] = &unk_1E5620BF0;
        v31[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v32 animations:v31 completion:0.3];
      }
      else
      {
        double v9 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
        [v9 removeFromSuperview];

        [(CKPinnedConversationCollectionViewCell *)self setCheckboxAccessoryView:0];
      }
    }
    [(CKPinnedConversationCollectionViewCell *)self setJittering:a3 == 2];
    if (a3 == 2)
    {
      if ([(CKPinnedConversationCollectionViewCell *)self isShowingUnpinAccessory])
      {
        BOOL v10 = 0;
      }
      else
      {
        [(CKPinnedConversationCollectionViewCell *)self setShowingUnpinAccessory:1];
        BOOL v10 = v4;
      }
      id v11 = [(CKPinnedConversationCollectionViewCell *)self contentView];
      id v12 = (void *)MEMORY[0x1E4F42FF0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_6;
      v29[3] = &unk_1E5620AF8;
      v29[4] = self;
      id v13 = v11;
      id v30 = v13;
      [v12 performWithoutAnimation:v29];
      if (v10)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_7;
        v28[3] = &unk_1E5620C40;
        v28[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v28];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_8;
        v27[3] = &unk_1E5620C40;
        v27[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v27 animations:0.3];
      }

      if (!CKIsRunningInMacCatalyst()) {
        goto LABEL_30;
      }
      goto LABEL_32;
    }
  }
  uint64_t v18 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];

  if (v18)
  {
    [(CKPinnedConversationCollectionViewCell *)self setShowingUnpinAccessory:0];
    if (v4)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_9;
      v26[3] = &unk_1E5620C40;
      v26[4] = self;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_10;
      v25[3] = &unk_1E5620BF0;
      v25[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v26 animations:v25 completion:0.3];
    }
    else
    {
      int v19 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];
      [v19 removeFromSuperview];

      [(CKPinnedConversationCollectionViewCell *)self setUnpinAccessoryView:0];
    }
  }
  if (!CKIsRunningInMacCatalyst())
  {
    if (!a3)
    {
      int v20 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
      [v20 endSuppressingActivityWithReason:@"EditMode" animated:v4 completion:0];
      goto LABEL_31;
    }
LABEL_30:
    int v20 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v20 beginSuppressingActivityWithReason:@"EditMode" animated:v4 completion:0];
LABEL_31:
  }
LABEL_32:
  id v21 = +[CKUIBehavior sharedBehaviors];
  unsigned int v22 = [v21 hidesUnreadIndicatorWhenEditing];
  if (a3) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }

  uint64_t v24 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [v24 setUnreadIndicatorHidden:v23 animated:v4];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createCheckboxAccessoryIfNecessary];
  v2 = *(void **)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v2 addSubview:v3];

  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v4 bringSubviewToFront:v5];

  uint64_t v6 = [*(id *)(a1 + 32) checkboxAccessoryView];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setTransform:v9];

  double v8 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v8 setAlpha:1.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkboxAccessoryView];
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];

  double v3 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v3 setAlpha:0.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkboxAccessoryView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  CGAffineTransform v4 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v4 setAlpha:1.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkboxAccessoryView];
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];

  long long v3 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v3 setAlpha:0.0];
}

uint64_t __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) checkboxAccessoryView];
  [v2 removeFromSuperview];

  long long v3 = *(void **)(a1 + 32);

  return [v3 setCheckboxAccessoryView:0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _createUnpinAccessoryIfNecessary];
  v2 = *(void **)(a1 + 40);
  long long v3 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v2 addSubview:v3];

  CGAffineTransform v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v4 bringSubviewToFront:v5];

  uint64_t v6 = [*(id *)(a1 + 32) unpinAccessoryView];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setTransform:v9];

  double v8 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v8 setAlpha:1.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unpinAccessoryView];
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];

  long long v3 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v3 setAlpha:0.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unpinAccessoryView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];

  CGAffineTransform v4 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v4 setAlpha:1.0];
}

void __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_9(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unpinAccessoryView];
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];

  long long v3 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v3 setAlpha:0.0];
}

uint64_t __66__CKPinnedConversationCollectionViewCell_setEditingMode_animated___block_invoke_10(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unpinAccessoryView];
  [v2 removeFromSuperview];

  long long v3 = *(void **)(a1 + 32);

  return [v3 setUnpinAccessoryView:0];
}

- (void)setJittering:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKPinnedConversationCollectionViewCell *)self isJittering] != a3)
  {
    id v8 = [(CKPinnedConversationCollectionViewCell *)self layer];
    if (v3)
    {
      uint64_t v5 = [(id)objc_opt_class() _jitterXTranslationAnimation];
      [v8 addAnimation:v5 forKey:@"CKJitterXTranslation"];

      uint64_t v6 = [(id)objc_opt_class() _jitterYTranslationAnimation];
      [v8 addAnimation:v6 forKey:@"CKJitterYTranslation"];

      long long v7 = [(id)objc_opt_class() _jitterRotationAnimation];
      [v8 addAnimation:v7 forKey:@"CKJitterRotation"];
    }
    else
    {
      [v8 removeAnimationForKey:@"CKJitterXTranslation"];
      [v8 removeAnimationForKey:@"CKJitterYTranslation"];
      [v8 removeAnimationForKey:@"CKJitterRotation"];
    }
  }
}

- (BOOL)isJittering
{
  v2 = [(CKPinnedConversationCollectionViewCell *)self layer];
  BOOL v3 = [v2 animationForKey:@"CKJitterXTranslation"];
  if (v3)
  {
    CGAffineTransform v4 = [v2 animationForKey:@"CKJitterYTranslation"];
    if (v4)
    {
      uint64_t v5 = [v2 animationForKey:@"CKJitterRotation"];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)_jitterXTranslationAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
  [v2 setDuration:0.134];
  [v2 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  [v2 setFromValue:&unk_1EDF172E8];
  [v2 setToValue:&unk_1EDF172F8];
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 1.0;
  BOOL v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :0.0 :v4 :v5];
  [v2 setTimingFunction:v6];

  LODWORD(v7) = 2139095040;
  [v2 setRepeatCount:v7];
  [v2 setAutoreverses:1];
  [v2 setRemovedOnCompletion:0];

  return v2;
}

+ (id)_jitterYTranslationAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
  [v2 setDuration:0.142];
  [v2 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  [v2 setFromValue:&unk_1EDF172E8];
  [v2 setToValue:&unk_1EDF172F8];
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 1.0;
  BOOL v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :0.0 :v4 :v5];
  [v2 setTimingFunction:v6];

  LODWORD(v7) = 2139095040;
  [v2 setRepeatCount:v7];
  [v2 setAutoreverses:1];
  [v2 setRemovedOnCompletion:0];

  return v2;
}

+ (id)_jitterRotationAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
  [v2 setDuration:0.128];
  [v2 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  [v2 setFromValue:&unk_1EDF17308];
  [v2 setToValue:&unk_1EDF17318];
  LODWORD(v3) = 1052266988;
  LODWORD(v4) = 1059145646;
  LODWORD(v5) = 1.0;
  BOOL v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :0.0 :v4 :v5];
  [v2 setTimingFunction:v6];

  LODWORD(v7) = 2139095040;
  [v2 setRepeatCount:v7];
  [v2 setAutoreverses:1];
  [v2 setRemovedOnCompletion:0];

  return v2;
}

- (void)setShowsBackgroundViewWhenSelected:(BOOL)a3
{
  if (self->_showsBackgroundViewWhenSelected != a3) {
    self->_showsBackgroundViewWhenSelected = a3;
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationCollectionViewCell;
  [(CKPinnedConversationCollectionViewCell *)&v4 didMoveToSuperview];
  double v3 = [(CKPinnedConversationCollectionViewCell *)self configurationState];
  [(CKPinnedConversationCollectionViewCell *)self _updateZPositionForState:v3];
}

- (void)_updateActivitySupressionForState:(id)a3
{
  id v7 = a3;
  if (self->_allowActivitySuppressionWhenSelected
    && (+[CKUIBehavior sharedBehaviors],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 suppressPinActivityForState:v7],
        v4,
        v5))
  {
    BOOL v6 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v6 beginSuppressingActivityWithReason:@"CellSelected" animated:1 completion:0];
  }
  else
  {
    BOOL v6 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v6 endSuppressingActivityWithReason:@"CellSelected" animated:1 completion:0];
  }
}

- (void)dragStateDidChange:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v6 = [(CKPinnedConversationCollectionViewCell *)self isPreparingForReuse] ^ 1;
    id v8 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v8 beginSuppressingActivityWithReason:@"CellDragState" animated:v6 completion:0];
  }
  else
  {
    if (a3 == 2)
    {
      uint64_t v4 = [(CKPinnedConversationCollectionViewCell *)self isPreparingForReuse] ^ 1;
      int v5 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
      [v5 beginSuppressingActivityWithReason:@"CellDragState" animated:v4 completion:0];

      [(CKPinnedConversationCollectionViewCell *)self setAlpha:0.0];
      return;
    }
    uint64_t v7 = [(CKPinnedConversationCollectionViewCell *)self isPreparingForReuse] ^ 1;
    id v8 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
    [v8 endSuppressingActivityWithReason:@"CellDragState" animated:v7 completion:0];
  }
}

- (void)_updateZPositionForState:(id)a3
{
  id v4 = a3;
  int v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 suppressPinActivityForState:v4];

  id v7 = [(CKPinnedConversationCollectionViewCell *)self layer];
  [v7 setZPosition:(double)(v6 ^ 1u)];
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)CKPinnedConversationCollectionViewCell;
  [(CKPinnedConversationCollectionViewCell *)&v41 layoutSubviews];
  double v3 = [(CKPinnedConversationCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryViewFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];
  objc_msgSend(v21, "setBounds:", 0.0, 0.0, v18, v20);

  unsigned int v22 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];
  objc_msgSend(v22, "setCenter:", v14 + v18 * 0.5, v16 + v20 * 0.5);

  [(CKPinnedConversationCollectionViewCell *)self checkboxFrame];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v28, v30);

  id v32 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  objc_msgSend(v32, "setCenter:", v24 + v28 * 0.5, v26 + v30 * 0.5);

  v33 = +[CKUIBehavior sharedBehaviors];
  [v33 pinnedConversationCheckmarkStrokeRatio];
  double v35 = v34;
  id v36 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  [v36 bounds];
  double v38 = v35 * v37;
  v39 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  v40 = [v39 layer];
  [v40 setBorderWidth:v38];

  [(CKPinnedConversationCollectionViewCell *)self updateCheckboxAccessoryImageForCurrentLayoutStyle];
  [(CKPinnedConversationCollectionViewCell *)self updateUnpinAccessoryImageForCurrentLayoutStyle];
}

- (CGRect)unpinAccessoryViewFrame
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  uint64_t v4 = [v3 layoutStyle];

  [(CKPinnedConversationCollectionViewCell *)self accessorySizeForLayoutStyle:v4];
  double v6 = v5;
  double v7 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [(CKPinnedConversationCollectionViewCell *)self bounds];
  objc_msgSend(v7, "avatarViewFrameForSize:layoutStyle:", v4, v8, v9);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v23.origin.double x = v11;
  v23.origin.double y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  CGFloat MinX = CGRectGetMinX(v23);
  v24.origin.double x = v11;
  v24.origin.double y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  double MinY = CGRectGetMinY(v24);
  double v20 = MinX;
  double v21 = v6;
  double v22 = v6;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.double y = MinY;
  result.origin.double x = v20;
  return result;
}

- (CGRect)checkboxFrame
{
  double v3 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  uint64_t v4 = [v3 layoutStyle];

  [(CKPinnedConversationCollectionViewCell *)self accessorySizeForLayoutStyle:v4];
  double v6 = v5;
  double v7 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [(CKPinnedConversationCollectionViewCell *)self bounds];
  objc_msgSend(v7, "avatarViewFrameForSize:layoutStyle:", v4, v8, v9);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v28.origin.double x = v11;
  v28.origin.double y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  CGFloat v18 = CGRectGetMaxX(v28) - v6;
  v29.origin.double x = v11;
  v29.origin.double y = v13;
  v29.size.width = v15;
  v29.size.height = v17;
  CGFloat v19 = CGRectGetMaxY(v29) - v6;
  double v20 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  double v21 = [v20 layer];
  [v21 borderWidth];
  double v23 = v18 + v22 * 0.5;

  double v24 = v23;
  double v25 = v19;
  double v26 = v6;
  double v27 = v6;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CKPinnedConversationView sizeThatFits:](self->_pinnedConversationView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  self->_isPreparingForReuse = 1;
  double v3 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [v3 prepareForReuse];

  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationCollectionViewCell;
  [(CKPinnedConversationCollectionViewCell *)&v9 prepareForReuse];
  unint64_t v4 = [(CKPinnedConversationCollectionViewCell *)self editingMode];
  if ((v4 == 2) != [(CKPinnedConversationCollectionViewCell *)self isJittering]) {
    [(CKPinnedConversationCollectionViewCell *)self setJittering:v4 == 2];
  }
  double v5 = [(CKPinnedConversationCollectionViewCell *)self unpinAccessoryView];
  [v5 setHidden:v4 != 2];

  BOOL v6 = [(CKPinnedConversationCollectionViewCell *)self editingMode] != 1;
  double v7 = [(CKPinnedConversationCollectionViewCell *)self checkboxAccessoryView];
  [v7 setHidden:v6];

  double v8 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  [v8 setDimmed:0];

  self->_isPreparingForReuse = 0;
}

- (void)unpinButtonTapped:(id)a3
{
  id v6 = [(CKPinnedConversationCollectionViewCell *)self delegate];
  unint64_t v4 = [(CKPinnedConversationCollectionViewCell *)self pinnedConversationView];
  double v5 = [v4 conversation];
  [v6 unpinButtonTappedForCell:self withConversation:v5];
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
    id v6 = linkInteractions;
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
          [(CKPinnedConversationCollectionViewCell *)self removeInteraction:*(void *)(*((void *)&v23 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  CGFloat v11 = (NSArray *)[v4 copy];
  double v12 = self->_linkInteractions;
  self->_linkInteractions = v11;

  CGFloat v13 = self->_linkInteractions;
  if (v13)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v14 = v13;
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
          -[CKPinnedConversationCollectionViewCell addInteraction:](self, "addInteraction:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (CKPinnedConversationCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKPinnedConversationCollectionViewCellDelegate *)WeakRetained;
}

- (CKPinnedConversationView)pinnedConversationView
{
  return self->_pinnedConversationView;
}

- (void)setPinnedConversationView:(id)a3
{
}

- (CKConversationListAccessoryView)unpinAccessoryView
{
  return self->_unpinAccessoryView;
}

- (void)setUnpinAccessoryView:(id)a3
{
}

- (BOOL)showsBackgroundViewWhenSelected
{
  return self->_showsBackgroundViewWhenSelected;
}

- (BOOL)allowActivitySuppressionWhenSelected
{
  return self->_allowActivitySuppressionWhenSelected;
}

- (NSArray)linkInteractions
{
  return self->_linkInteractions;
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (BOOL)isShowingUnpinAccessory
{
  return self->_isShowingUnpinAccessory;
}

- (void)setShowingUnpinAccessory:(BOOL)a3
{
  self->_isShowingUnpinAccessordouble y = a3;
}

- (BOOL)isShowingCheckboxAccessory
{
  return self->_isShowingCheckboxAccessory;
}

- (void)setShowingCheckboxAccessory:(BOOL)a3
{
  self->_isShowingCheckboxAccessordouble y = a3;
}

- (CKConversationListAccessoryView)checkboxAccessoryView
{
  return self->_checkboxAccessoryView;
}

- (void)setCheckboxAccessoryView:(id)a3
{
}

- (BOOL)isPreparingForReuse
{
  return self->_isPreparingForReuse;
}

- (void)setIsPreparingForReuse:(BOOL)a3
{
  self->_isPreparingForReuse = a3;
}

- (CGRect)cellFrameFromLayoutAttributes
{
  double x = self->_cellFrameFromLayoutAttributes.origin.x;
  double y = self->_cellFrameFromLayoutAttributes.origin.y;
  double width = self->_cellFrameFromLayoutAttributes.size.width;
  double height = self->_cellFrameFromLayoutAttributes.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCellFrameFromLayoutAttributes:(CGRect)a3
{
  self->_cellFrameFromLayoutAttributes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxAccessoryView, 0);
  objc_storeStrong((id *)&self->_linkInteractions, 0);
  objc_storeStrong((id *)&self->_unpinAccessoryView, 0);
  objc_storeStrong((id *)&self->_pinnedConversationView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end