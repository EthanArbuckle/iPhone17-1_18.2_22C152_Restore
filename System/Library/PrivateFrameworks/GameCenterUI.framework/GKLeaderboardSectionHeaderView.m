@interface GKLeaderboardSectionHeaderView
- (BOOL)dataUpdated;
- (GKGameRecord)gameRecord;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardMetadataView)personalView;
- (GKLeaderboardMetadataView)socialView;
- (NSLayoutConstraint)contentInsetBottom;
- (NSLayoutConstraint)contentInsetLeading;
- (NSLayoutConstraint)contentInsetTop;
- (NSLayoutConstraint)contentInsetTrailing;
- (UIStackView)container;
- (id)attributedStringWithSymbol:(id)a3;
- (id)formattedNumber:(id)a3;
- (void)awakeFromNib;
- (void)setContainer:(id)a3;
- (void)setContentInsetBottom:(id)a3;
- (void)setContentInsetLeading:(id)a3;
- (void)setContentInsetTop:(id)a3;
- (void)setContentInsetTrailing:(id)a3;
- (void)setDataUpdated:(BOOL)a3;
- (void)setGameRecord:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setPersonalView:(id)a3;
- (void)setSocialView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateHighlightsWithGameRecord:(id)a3 leaderboardCount:(int64_t)a4 setCount:(int64_t)a5;
- (void)updateLayout;
@end

@implementation GKLeaderboardSectionHeaderView

- (void)awakeFromNib
{
  v26.receiver = self;
  v26.super_class = (Class)GKLeaderboardSectionHeaderView;
  [(GKLeaderboardSectionHeaderView *)&v26 awakeFromNib];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(GKLeaderboardSectionHeaderView *)self traitCollection];
  v5 = [v4 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
  {
    v6 = @"GKLeaderboardMetadataViewAX_iOS";
  }
  else if (GKIsXRUIIdiomShouldUsePadUI())
  {
    v6 = @"GKLeaderboardMetadataView_xrOS";
  }
  else
  {
    v6 = @"GKLeaderboardMetadataView_iOS";
  }
  v7 = [v3 loadNibNamed:v6 owner:self options:0];
  v8 = [v7 firstObject];
  [(GKLeaderboardSectionHeaderView *)self setPersonalView:v8];

  v9 = [v3 loadNibNamed:v6 owner:self options:0];
  v10 = [v9 firstObject];
  [(GKLeaderboardSectionHeaderView *)self setSocialView:v10];

  v11 = [(GKLeaderboardSectionHeaderView *)self container];
  v12 = [(GKLeaderboardSectionHeaderView *)self personalView];
  [v11 addArrangedSubview:v12];

  v13 = [(GKLeaderboardSectionHeaderView *)self container];
  v14 = [(GKLeaderboardSectionHeaderView *)self socialView];
  [v13 addArrangedSubview:v14];

  v15 = [(GKLeaderboardSectionHeaderView *)self personalView];
  v16 = GKGameCenterUIFrameworkBundle();
  v17 = GKGetLocalizedStringFromTableInBundle();
  v18 = GKGameCenterUIFrameworkBundle();
  v19 = GKGetLocalizedStringFromTableInBundle();
  [v15 configureWithRank:@"👏" title:v17 footnote:v19 vibrant:0];

  v20 = [(GKLeaderboardSectionHeaderView *)self socialView];
  v21 = [(GKLeaderboardSectionHeaderView *)self formattedNumber:&unk_1F0811BC8];
  v22 = GKGameCenterUIFrameworkBundle();
  v23 = GKGetLocalizedStringFromTableInBundle();
  v24 = GKGameCenterUIFrameworkBundle();
  v25 = GKGetLocalizedStringFromTableInBundle();
  [v20 configureWithRank:v21 title:v23 footnote:v25 vibrant:1];

  [(GKLeaderboardSectionHeaderView *)self updateLayout];
}

- (id)formattedNumber:(id)a3
{
  return (id)[MEMORY[0x1E4F28EE0] localizedStringFromNumber:a3 numberStyle:1];
}

- (void)updateLayout
{
  v3 = [(GKLeaderboardSectionHeaderView *)self traitCollection];
  category = [v3 preferredContentSizeCategory];

  if (!UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    v7 = [(GKLeaderboardSectionHeaderView *)self traitCollection];
    BOOL v8 = [v7 verticalSizeClass] == 1;

    v9 = [(GKLeaderboardSectionHeaderView *)self container];
    v10 = v9;
    uint64_t v11 = v8;
    goto LABEL_11;
  }
  v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  if ([v4 horizontalSizeClass] == 1)
  {
    v5 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    BOOL v6 = [v5 verticalSizeClass] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  if ([(NSString *)category isEqualToString:*MEMORY[0x1E4FB2790]])
  {
    if (!v6)
    {
LABEL_8:
      v9 = [(GKLeaderboardSectionHeaderView *)self container];
      v10 = v9;
      uint64_t v11 = 0;
      goto LABEL_11;
    }
  }
  else if ([(NSString *)category isEqualToString:*MEMORY[0x1E4FB2798]] && !v6)
  {
    goto LABEL_8;
  }
  v9 = [(GKLeaderboardSectionHeaderView *)self container];
  v10 = v9;
  uint64_t v11 = 1;
LABEL_11:
  [v9 setAxis:v11];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardSectionHeaderView;
  [(GKLeaderboardSectionHeaderView *)&v4 traitCollectionDidChange:a3];
  [(GKLeaderboardSectionHeaderView *)self updateLayout];
}

- (id)attributedStringWithSymbol:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = (void *)MEMORY[0x1E4FB0870];
  v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];

  BOOL v8 = [v6 textAttachmentWithImage:v7];

  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  v10 = (void *)MEMORY[0x1E4FB2988];
  if (!ShouldUsePadUI) {
    v10 = (void *)MEMORY[0x1E4FB2928];
  }
  uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v10];
  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
  [v5 appendAttributedString:v12];

  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v13;
  v18[0] = v11;
  v14 = [MEMORY[0x1E4FB1618] labelColor];
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  objc_msgSend(v5, "addAttributes:range:", v15, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (void)updateHighlightsWithGameRecord:(id)a3 leaderboardCount:(int64_t)a4 setCount:(int64_t)a5
{
  id v25 = a3;
  BOOL v8 = GKGameCenterUIFrameworkBundle();
  v9 = GKGetLocalizedStringFromTableInBundle();

  v10 = GKGameCenterUIFrameworkBundle();
  uint64_t v11 = GKGetLocalizedStringFromTableInBundle();

  v12 = [(GKLeaderboardSectionHeaderView *)self personalView];
  if (a5 < 1)
  {
    uint64_t v13 = [NSNumber numberWithInteger:a4];
    v14 = [(GKLeaderboardSectionHeaderView *)self formattedNumber:v13];
    v18 = NSString;
    v16 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v18, "localizedStringWithFormat:", v17, a4);
  }
  else
  {
    uint64_t v13 = [NSNumber numberWithInteger:a5];
    v14 = [(GKLeaderboardSectionHeaderView *)self formattedNumber:v13];
    v15 = NSString;
    v16 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v15, "localizedStringWithFormat:", v17, a5);
  v19 = };
  [v12 configureWithRank:v14 title:v19 footnote:v9 altFootnote:v11 vibrant:1];

  if (![(GKLeaderboardSectionHeaderView *)self dataUpdated])
  {
    v20 = (void *)MEMORY[0x1E4F636D8];
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardSectionHeaderView.m", 166, "-[GKLeaderboardSectionHeaderView updateHighlightsWithGameRecord:leaderboardCount:setCount:]");
    v22 = [v20 dispatchGroupWithName:v21];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke;
    v28[3] = &unk_1E5F62F28;
    id v29 = v25;
    id v23 = v22;
    id v30 = v23;
    [v23 perform:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_3;
    v26[3] = &unk_1E5F63350;
    v26[4] = self;
    id v27 = v23;
    id v24 = v23;
    [v24 notifyOnMainQueueWithBlock:v26];
  }
}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  id v5 = [v4 gameStatServicePrivate];
  BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [*(id *)(a1 + 32) bundleIdentifier];
  BOOL v8 = [v6 setWithObject:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_2;
  v10[3] = &unk_1E5F63300;
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v9 = v3;
  [v5 getGamesFriendsPlayed:0 type:@"all" withinSecs:864000000 matchingBundleIDs:v8 handler:v10];
}

uint64_t __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setResult:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDataUpdated:1];
  v2 = [*(id *)(a1 + 40) result];

  if (!v2) {
    goto LABEL_13;
  }
  id v3 = [*(id *)(a1 + 40) result];
  if (![v3 count])
  {

LABEL_13:
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_4;
    v21[3] = &unk_1E5F63328;
    v21[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4F63738] loadHighlightsWithPlayerScope:0 timeScope:2 handler:v21];
    return;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithInternalRepresentation:*(void *)(*((void *)&v22 + 1) + 8 * v9)];
      [v4 addObject:v10];
      unint64_t v11 = [v4 count];

      if (v11 > 2) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  id v12 = [*(id *)(a1 + 32) socialView];
  uint64_t v13 = NSString;
  v14 = GKGameCenterUIFrameworkBundle();
  v15 = GKGetLocalizedStringFromTableInBundle();
  v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v5, "count"));
  v17 = NSString;
  v18 = GKGameCenterUIFrameworkBundle();
  v19 = GKGetLocalizedStringFromTableInBundle();
  v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, objc_msgSend(v5, "count"));
  [v12 configureWithPlayers:v4 title:v16 footnote:v20];
}

void __91__GKLeaderboardSectionHeaderView_updateHighlightsWithGameRecord_leaderboardCount_setCount___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v28 = [v9 socialView];
  unint64_t v11 = *(void **)(a1 + 32);
  id v12 = [NSNumber numberWithInteger:a7];
  uint64_t v13 = [v11 formattedNumber:v12];
  v14 = NSString;
  v15 = GKGameCenterUIFrameworkBundle();
  GKGetLocalizedStringFromTableInBundle();
  if (a7 > 99) {
    long long v23 = {;
  }
    long long v24 = [v10 localizedTitle];

    long long v25 = objc_msgSend(v14, "localizedStringWithFormat:", v23, a7, v24);
    [v28 configureWithRank:&stru_1F07B2408 title:v13 footnote:v25 vibrant:1];

    id v28 = [*(id *)(a1 + 32) attributedStringWithSymbol:@"globe"];
    objc_super v26 = [*(id *)(a1 + 32) socialView];
    uint64_t v27 = [v26 rank];
    [v27 setAttributedText:v28];

    id v12 = [*(id *)(a1 + 32) socialView];
    [v12 configureVibrancy:1];
  }
  else {
    v16 = {;
  }
    v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, a7);
    v18 = NSString;
    v19 = GKGameCenterUIFrameworkBundle();
    v20 = GKGetLocalizedStringFromTableInBundle();
    v21 = [v10 localizedTitle];

    long long v22 = objc_msgSend(v18, "stringWithFormat:", v20, v21);
    [v28 configureWithRank:v13 title:v17 footnote:v22 vibrant:1];
  }
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (GKGameRecord)gameRecord
{
  return self->_gameRecord;
}

- (void)setGameRecord:(id)a3
{
}

- (GKLeaderboardMetadataView)personalView
{
  return self->_personalView;
}

- (void)setPersonalView:(id)a3
{
}

- (GKLeaderboardMetadataView)socialView
{
  return self->_socialView;
}

- (void)setSocialView:(id)a3
{
}

- (UIStackView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSLayoutConstraint)contentInsetTop
{
  return self->_contentInsetTop;
}

- (void)setContentInsetTop:(id)a3
{
}

- (NSLayoutConstraint)contentInsetBottom
{
  return self->_contentInsetBottom;
}

- (void)setContentInsetBottom:(id)a3
{
}

- (NSLayoutConstraint)contentInsetTrailing
{
  return self->_contentInsetTrailing;
}

- (void)setContentInsetTrailing:(id)a3
{
}

- (NSLayoutConstraint)contentInsetLeading
{
  return self->_contentInsetLeading;
}

- (void)setContentInsetLeading:(id)a3
{
}

- (BOOL)dataUpdated
{
  return self->_dataUpdated;
}

- (void)setDataUpdated:(BOOL)a3
{
  self->_dataUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentInsetLeading, 0);
  objc_storeStrong((id *)&self->_contentInsetTrailing, 0);
  objc_storeStrong((id *)&self->_contentInsetBottom, 0);
  objc_storeStrong((id *)&self->_contentInsetTop, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_socialView, 0);
  objc_storeStrong((id *)&self->_personalView, 0);
  objc_storeStrong((id *)&self->_gameRecord, 0);

  objc_storeStrong((id *)&self->_leaderboard, 0);
}

@end