@interface GKLeaderboardCell
- (BOOL)canBecomeFocused;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardSet)leaderboardSet;
- (NSArray)customBackgroundBlur;
- (NSLayoutConstraint)iconContainerHeight;
- (NSLayoutConstraint)minimumIconHeight;
- (NSString)bundleIdentifier;
- (NSString)dataToken;
- (NSString)imageName;
- (UIColor)titleLabelColor;
- (UIImageView)iconView;
- (UILabel)countLabel;
- (UILabel)titleLabel;
- (UIStackView)containerStackView;
- (UIView)iconContainer;
- (UIView)overlayView;
- (UIView)popoverSourceView;
- (UIVisualEffectView)effectView;
- (void)addVisualEffect;
- (void)awakeFromNib;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setContainerStackView:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setCustomBackgroundBlur:(id)a3;
- (void)setDataToken:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconContainer:(id)a3;
- (void)setIconContainerHeight:(id)a3;
- (void)setIconView:(id)a3;
- (void)setImageName:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardSet:(id)a3;
- (void)setMinimumIconHeight:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelColor:(id)a3;
- (void)setupFallbackIcon;
- (void)updateImage;
- (void)updateLayout;
- (void)updateRank;
- (void)updateSummary;
@end

@implementation GKLeaderboardCell

- (void)awakeFromNib
{
  v16.receiver = self;
  v16.super_class = (Class)GKLeaderboardCell;
  [(GKLeaderboardCell *)&v16 awakeFromNib];
  v3 = [(UILabel *)self->_titleLabel textColor];
  [(GKLeaderboardCell *)self setTitleLabelColor:v3];

  [(GKLeaderboardCell *)self setClipsToBounds:0];
  v4 = [(GKLeaderboardCell *)self iconView];
  [v4 setContentMode:2];

  v5 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB28C8] symbolicTraits:2];
  v6 = [(GKLeaderboardCell *)self titleLabel];
  [v6 setFont:v5];

  uint64_t v7 = *MEMORY[0x1E4F3A2E8];
  v8 = [(GKLeaderboardCell *)self countLabel];
  v9 = [v8 layer];
  [v9 setCompositingFilter:v7];

  v10 = [(GKLeaderboardCell *)self contentView];
  v11 = [v10 layer];
  [v11 setCornerRadius:14.0];

  uint64_t v12 = *MEMORY[0x1E4F39EA8];
  v13 = [(GKLeaderboardCell *)self contentView];
  v14 = [v13 layer];
  [v14 setCornerCurve:v12];

  [(GKLeaderboardCell *)self addVisualEffect];
  v15 = [(GKLeaderboardCell *)self countLabel];
  [v15 setText:&stru_1F07B2408];

  [(GKLeaderboardCell *)self _gkDisableDefaultFocusEffect];
  [(GKLeaderboardCell *)self setupFallbackIcon];
}

- (void)addVisualEffect
{
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
  v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerModuleVisualEffect];
  [v8 setBackgroundEffects:v3];

  v4 = [v8 backgroundEffects];
  [(GKLeaderboardCell *)self setCustomBackgroundBlur:v4];

  [v8 _setGroupName:@"gameLayerGroup"];
  v5 = [(GKLeaderboardCell *)self contentView];
  [v5 insertSubview:v8 atIndex:0];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v7 = [(GKLeaderboardCell *)self contentView];
  [v6 _gkInstallEdgeConstraintsForView:v8 containedWithinParentView:v7];

  [(GKLeaderboardCell *)self setEffectView:v8];
}

- (void)setupFallbackIcon
{
  id v7 = [(GKLeaderboardCell *)self iconView];
  v2 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"list.bullet.below.star.filled"];
  v3 = [v2 imageWithRenderingMode:2];

  [v7 setImage:v3];
  v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [v7 setTintColor:v4];

  [v7 setContentMode:2];
  uint64_t v5 = *MEMORY[0x1E4F3A2E8];
  v6 = [v7 layer];
  [v6 setCompositingFilter:v5];
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_iconView;
}

- (void)setLeaderboardSet:(id)a3
{
  uint64_t v5 = (GKLeaderboardSet *)a3;
  p_leaderboardSet = &self->_leaderboardSet;
  if (self->_leaderboardSet != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)p_leaderboardSet, a3);
    id v7 = [(GKLeaderboardSet *)v14 title];
    [(UILabel *)self->_titleLabel setText:v7];

    id v8 = [(GKLeaderboardSet *)v14 leaderboardIdentifiers];
    [v8 count];
    v9 = NSString;
    v10 = GKGameCenterUIFrameworkBundle();
    v11 = GKGetLocalizedStringFromTableInBundle();

    uint64_t v12 = GKFormattedStringWithGroupingFromInteger();
    v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

    [(UILabel *)self->_countLabel setText:v13];
    [(GKLeaderboardCell *)self updateLayout];
    p_leaderboardSet = (GKLeaderboardSet **)[(GKLeaderboardCell *)self updateImage];
    uint64_t v5 = v14;
  }

  MEMORY[0x1F41817F8](p_leaderboardSet, v5);
}

- (void)setLeaderboard:(id)a3
{
  id v8 = (GKLeaderboard *)a3;
  if (self->_leaderboard != v8)
  {
    objc_storeStrong((id *)&self->_leaderboard, a3);
    if (_os_feature_enabled_impl() && [(GKLeaderboard *)v8 releaseState] == 2)
    {
      uint64_t v5 = [(GKLeaderboard *)v8 title];
      v6 = [(GKLeaderboard *)v8 description];
      id v7 = +[ItemWithReleaseState titleTextWithTitle:v5 accessibilityDescription:v6 systemSymbolName:@"clock.fill" tooltipText:0 paragraphStyle:0];
      [(UILabel *)self->_titleLabel setAttributedText:v7];
    }
    else
    {
      uint64_t v5 = [(GKLeaderboard *)v8 title];
      [(UILabel *)self->_titleLabel setText:v5];
    }

    [(GKLeaderboardCell *)self updateLayout];
    [(GKLeaderboardCell *)self updateSummary];
    [(GKLeaderboardCell *)self updateImage];
  }
}

- (void)updateLayout
{
  v3 = [(GKLeaderboardCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    v6 = [(GKLeaderboardCell *)self iconContainerHeight];
    [v6 setConstant:335.0];

    id v7 = [(GKLeaderboardCell *)self titleLabel];
    id v12 = v7;
    uint64_t v8 = 2;
  }
  else
  {
    double v9 = dbl_1AF7CAF90[self->_leaderboardSet == 0];
    v10 = [(GKLeaderboardCell *)self iconContainerHeight];
    [v10 setConstant:v9];

    if (self->_leaderboardSet) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    id v7 = [(GKLeaderboardCell *)self titleLabel];
    id v12 = v7;
    uint64_t v8 = v11;
  }
  [v7 setNumberOfLines:v8];
}

- (void)updateSummary
{
  v14 = self->_leaderboard;
  if ([(GKLeaderboard *)v14 type] == GKLeaderboardTypeRecurring)
  {
    v3 = [(GKLeaderboard *)v14 startDate];
    [(GKLeaderboard *)v14 duration];
    v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");

    id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v5 setLocale:v6];

    [v5 setLocalizedDateFormatFromTemplate:@"MMM d, jj:mm"];
    id v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v5 setTimeZone:v7];

    uint64_t v8 = [v5 stringFromDate:v4];
    double v9 = NSString;
    v10 = GKGameCenterUIFrameworkBundle();
    uint64_t v11 = GKGetLocalizedStringFromTableInBundle();
    id v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v13 = [(GKLeaderboardCell *)self countLabel];
    [v13 setText:v12];
  }
  else
  {
    [(GKLeaderboardCell *)self updateRank];
  }
}

- (void)updateRank
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  [(GKLeaderboardCell *)self setDataToken:v4];

  id v5 = [(GKLeaderboardCell *)self dataToken];
  v6 = self->_leaderboard;
  id v7 = [MEMORY[0x1E4F636F0] currentGame];
  uint64_t v8 = [v7 gameDescriptor];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__GKLeaderboardCell_updateRank__block_invoke;
  v11[3] = &unk_1E5F65F58;
  id v12 = v5;
  v13 = self;
  v14 = v6;
  double v9 = v6;
  id v10 = v5;
  -[GKLeaderboard loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:](v9, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v8, 1, 2, 1, 600, v11);
}

void __31__GKLeaderboardCell_updateRank__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) dataToken];
  LODWORD(v11) = [v11 isEqualToString:v12];

  if (!v11)
  {
    v14 = v9;
    goto LABEL_13;
  }
  if (!v9 || v10)
  {
    v14 = v9;
LABEL_10:
    v24 = *(void **)(a1 + 48);
    v25 = [MEMORY[0x1E4F636F0] currentGame];
    v26 = [v25 gameDescriptor];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __31__GKLeaderboardCell_updateRank__block_invoke_54;
    v30[3] = &unk_1E5F65F30;
    id v27 = *(id *)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 40);
    id v31 = v27;
    uint64_t v32 = v28;
    objc_msgSend(v24, "loadEntriesWithGameDescriptor:playerScope:timeScope:range:completionHandler:", v26, 0, 2, 1, 2, v30);

    goto LABEL_13;
  }
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 1;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __31__GKLeaderboardCell_updateRank__block_invoke_2;
  v33[3] = &unk_1E5F654B8;
  v35 = v36;
  id v13 = v8;
  id v34 = v13;
  v14 = [v9 _gkFilterWithBlock:v33];

  uint64_t v15 = [v14 count];
  if (v15 < 2)
  {

    _Block_object_dispose(v36, 8);
    goto LABEL_10;
  }
  objc_super v16 = [v13 internal];
  uint64_t v17 = [v16 rank];

  if (v17 < 1)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F63998], "LEADERBOARD_LIST_ITEM_SUBTITLE_FRIENDS_PLAYINGWithCOUNT:", v15);
    [*(id *)(*(void *)(a1 + 40) + 688) setText:v18];
  }
  else
  {
    v29 = NSString;
    v18 = GKGameCenterUIFrameworkBundle();
    v19 = GKGetLocalizedStringFromTableInBundle();
    v20 = [v13 internal];
    [v20 rank];
    v21 = GKFormattedStringWithGroupingFromInteger();
    v22 = GKFormattedStringWithGroupingFromInteger();
    v23 = objc_msgSend(v29, "stringWithFormat:", v19, v21, v22, v15);
    [*(id *)(*(void *)(a1 + 40) + 688) setText:v23];
  }
  _Block_object_dispose(v36, 8);
LABEL_13:
}

id __31__GKLeaderboardCell_updateRank__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 player];
  int v5 = [v4 isLocalPlayer];

  v6 = [v3 player];
  id v7 = [v6 friendBiDirectional];
  char v8 = [v7 isEqualToNumber:&unk_1F0812168];

  if ((v8 & 1) != 0 || v5)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v11 = [v3 internal];
    [v11 setRank:v10];

    if (v5)
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v13 = [*(id *)(a1 + 32) internal];
      [v13 setRank:v12];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v9 = v3;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __31__GKLeaderboardCell_updateRank__block_invoke_54(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) dataToken];
  LODWORD(v3) = [v3 isEqualToString:v4];

  if (v3)
  {
    if ([v10 rank] < 1)
    {
      v6 = GKGameCenterUIFrameworkBundle();
      id v7 = GKGetLocalizedStringFromTableInBundle();
      [*(id *)(*(void *)(a1 + 40) + 688) setText:v7];
    }
    else
    {
      int v5 = NSString;
      v6 = GKGameCenterUIFrameworkBundle();
      id v7 = GKGetLocalizedStringFromTableInBundle();
      [v10 rank];
      char v8 = GKFormattedStringWithGroupingFromInteger();
      id v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);
      [*(id *)(*(void *)(a1 + 40) + 688) setText:v9];
    }
  }
}

- (void)updateImage
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  id v24 = 0;
  id v3 = [(GKLeaderboardCell *)self iconView];
  v4 = [v3 layer];
  [v4 setCompositingFilter:0];

  if (self->_leaderboardSet)
  {
    int v5 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v5 iconLeaderboardSetListSource];
  }
  else
  {
    int v5 = [MEMORY[0x1E4F63A10] sharedTheme];
    [v5 iconLeaderboardListSource];
  v6 = };

  uint64_t v7 = v20[5];
  if (v7) {
    goto LABEL_9;
  }
  leaderboardSet = self->_leaderboardSet;
  if (leaderboardSet) {
    [(GKLeaderboardSet *)leaderboardSet identifier];
  }
  else {
  id v9 = [(GKLeaderboard *)self->_leaderboard identifier];
  }
  uint64_t v10 = [v6 cachedImageForIdentifier:v9];
  uint64_t v11 = (void *)v20[5];
  v20[5] = v10;

  uint64_t v7 = v20[5];
  if (v7)
  {
LABEL_9:
    uint64_t v12 = [(GKLeaderboardCell *)self iconView];
    [v12 setImage:v7];

    [(GKLeaderboardCell *)self updateOverlay];
    [(GKLeaderboardCell *)self setNeedsDisplay];
  }
  else
  {
    id v13 = self->_leaderboardSet;
    if (v13) {
      [(GKLeaderboardSet *)v13 imageURL];
    }
    else {
    v14 = [(GKLeaderboard *)self->_leaderboard imageURL];
    }
    leaderboard = self->_leaderboardSet;
    if (!leaderboard) {
      leaderboard = self->_leaderboard;
    }
    uint64_t v16 = MEMORY[0x1E4F14428];
    id v17 = MEMORY[0x1E4F14428];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __32__GKLeaderboardCell_updateImage__block_invoke;
    v18[3] = &unk_1E5F65F80;
    v18[4] = self;
    v18[5] = &v19;
    [v6 loadImageForURLString:v14 reference:leaderboard queue:v16 handler:v18];
  }
  _Block_object_dispose(&v19, 8);
}

void __32__GKLeaderboardCell_updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) leaderboardSet];
  if ([v7 isEqual:v6])
  {

LABEL_4:
    if (v12)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v11 = [*(id *)(a1 + 32) iconView];
      [v11 setImage:v10];
    }
    else
    {
      [*(id *)(a1 + 32) setupFallbackIcon];
    }
    [*(id *)(a1 + 32) updateOverlay];
    [*(id *)(a1 + 32) setNeedsDisplay];
    goto LABEL_8;
  }
  char v8 = [*(id *)(a1 + 32) leaderboard];
  int v9 = [v8 isEqual:v6];

  if (v9) {
    goto LABEL_4;
  }
LABEL_8:
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardCell;
  id v6 = a4;
  [(GKLeaderboardCell *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__GKLeaderboardCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E5F62EB0;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

uint64_t __70__GKLeaderboardCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isFocused];
  id v3 = [*(id *)(a1 + 32) customBackgroundBlur];
  v4 = v3;
  if (v2)
  {
    int v5 = (void *)[v3 mutableCopy];

    id v6 = (void *)MEMORY[0x1E4FB1EF8];
    uint64_t v7 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_super v8 = [v7 colorWithAlphaComponent:0.22];
    int v9 = [v6 effectCompositingColor:v8];
    [v5 addObject:v9];

    uint64_t v10 = [*(id *)(a1 + 32) effectView];
    [v10 setBackgroundEffects:v5];
    v4 = v5;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) effectView];
    [v10 setBackgroundEffects:v4];
  }

  uint64_t v11 = *(void **)(a1 + 32);

  return [v11 layoutIfNeeded];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardCell;
  -[GKLeaderboardCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__GKLeaderboardCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E5F63D68;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0 completion:0.05];
}

void __36__GKLeaderboardCell_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    float v1 = 0.5;
  }
  else {
    float v1 = 1.0;
  }
  id v3 = [*(id *)(a1 + 32) layer];
  *(float *)&double v2 = v1;
  [v3 setOpacity:v2];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardCell;
  -[GKLeaderboardCell setSelected:](&v8, sel_setSelected_);
  int v5 = [(GKLeaderboardCell *)self layer];
  [v5 setBackgroundColor:0];

  if (v3)
  {
    BOOL v6 = [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else
  {
    BOOL v6 = 0;
  }
  objc_super v7 = [(GKLeaderboardCell *)self contentView];
  [v7 setBackgroundColor:v6];

  if (v3) {
}
  }

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (NSLayoutConstraint)iconContainerHeight
{
  return self->_iconContainerHeight;
}

- (void)setIconContainerHeight:(id)a3
{
}

- (NSLayoutConstraint)minimumIconHeight
{
  return self->_minimumIconHeight;
}

- (void)setMinimumIconHeight:(id)a3
{
}

- (UIView)iconContainer
{
  return self->_iconContainer;
}

- (void)setIconContainer:(id)a3
{
}

- (UIStackView)containerStackView
{
  return self->_containerStackView;
}

- (void)setContainerStackView:(id)a3
{
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (NSArray)customBackgroundBlur
{
  return self->_customBackgroundBlur;
}

- (void)setCustomBackgroundBlur:(id)a3
{
}

- (NSString)dataToken
{
  return self->_dataToken;
}

- (void)setDataToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToken, 0);
  objc_storeStrong((id *)&self->_customBackgroundBlur, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_iconContainer, 0);
  objc_storeStrong((id *)&self->_minimumIconHeight, 0);
  objc_storeStrong((id *)&self->_iconContainerHeight, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end