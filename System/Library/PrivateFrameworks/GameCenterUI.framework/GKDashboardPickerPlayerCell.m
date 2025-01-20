@interface GKDashboardPickerPlayerCell
+ (CGSize)defaultSize;
- (BOOL)canBecomeFocused;
- (BOOL)lineVisible;
- (BOOL)selectable;
- (BOOL)usesClearBackground;
- (GKDashboardPlayerPhotoView)playerView;
- (NSLayoutConstraint)playerViewHeightConstraint;
- (NSString)originalSubtitle;
- (UILabel)subtitle;
- (UILabel)title;
- (UIView)backView;
- (UIView)bottomLine;
- (UIView)container;
- (UIView)monogramColorView;
- (UIView)ringView;
- (id)cellBackgroundColor;
- (id)subtitleForPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6;
- (void)awakeFromNib;
- (void)configureWithPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6;
- (void)setAccessibilityPrefix:(id)a3;
- (void)setBackView:(id)a3;
- (void)setBottomLine:(id)a3;
- (void)setContainer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLineVisible:(BOOL)a3;
- (void)setMonogramColorView:(id)a3;
- (void)setOriginalSubtitle:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewHeightConstraint:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsesClearBackground:(BOOL)a3;
- (void)updateCellBackground;
- (void)updateLayerMask:(id)a3;
@end

@implementation GKDashboardPickerPlayerCell

+ (CGSize)defaultSize
{
  double v2 = 60.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (id)cellBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.08];
}

- (void)awakeFromNib
{
  v32.receiver = self;
  v32.super_class = (Class)GKDashboardPickerPlayerCell;
  [(GKFocusHighlightingCollectionViewCell *)&v32 awakeFromNib];
  double v3 = [(GKDashboardPickerPlayerCell *)self playerView];
  [v3 setUseDarkerPlaceholder:1];

  v4 = [(GKDashboardPickerPlayerCell *)self playerView];
  [v4 setAvatarSize:0x10000];

  v5 = [(GKDashboardPickerPlayerCell *)self cellBackgroundColor];
  v6 = [(GKDashboardPickerPlayerCell *)self contentView];
  [v6 setBackgroundColor:v5];

  v7 = [(GKDashboardPickerPlayerCell *)self playerView];
  [v7 setUserInteractionEnabled:0];

  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  v9 = [v8 colorWithAlphaComponent:0.1];
  v10 = [(GKDashboardPickerPlayerCell *)self bottomLine];
  [v10 setBackgroundColor:v9];

  uint64_t v11 = *MEMORY[0x1E4F3A2E8];
  v12 = [(GKDashboardPickerPlayerCell *)self subtitle];
  v13 = [v12 layer];
  [v13 setCompositingFilter:v11];

  v14 = objc_opt_new();
  v15 = (void *)MEMORY[0x1E4FB14C0];
  v16 = [(GKDashboardPickerPlayerCell *)self ringView];
  [v16 frame];
  double v18 = v17;
  v19 = [(GKDashboardPickerPlayerCell *)self ringView];
  [v19 frame];
  objc_msgSend(v15, "bezierPathWithOvalInRect:", 0.0, 0.0, v18);
  id v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPath:", objc_msgSend(v20, "CGPath"));

  v21 = [(GKDashboardPickerPlayerCell *)self ringView];
  v22 = [v21 layer];
  [v22 addSublayer:v14];

  v23 = [MEMORY[0x1E4FB1618] whiteColor];
  id v24 = [v23 colorWithAlphaComponent:0.6];
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

  id v25 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v14, "setFillColor:", objc_msgSend(v25, "CGColor"));

  [v14 setLineWidth:2.0];
  v26 = [(GKDashboardPickerPlayerCell *)self ringView];
  v27 = [v26 layer];
  [v27 setCompositingFilter:v11];

  v28 = [(GKDashboardPickerPlayerCell *)self ringView];
  [v28 setHidden:1];

  v29 = GKGameCenterUIFrameworkBundle();
  v30 = GKGetLocalizedStringFromTableInBundle();
  v31 = [(GKDashboardPickerPlayerCell *)self ringView];
  [v31 setAccessibilityLabel:v30];
}

- (void)configureWithPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [(GKDashboardPickerPlayerCell *)self monogramColorView];
  [v12 setHidden:0];

  v13 = [(GKDashboardPickerPlayerCell *)self playerView];
  [v13 setPlayer:v11];

  id v22 = [v11 displayNameWithOptions:0];
  v14 = [(GKDashboardPickerPlayerCell *)self title];
  [v14 setText:v22];

  v15 = [(GKDashboardPickerPlayerCell *)self subtitleForPlayer:v11 isCoreRecent:v7 matchedContactName:v10 onlyShowContactName:v6];

  [(GKDashboardPickerPlayerCell *)self setOriginalSubtitle:v15];
  BOOL v16 = [(GKDashboardPickerPlayerCell *)self selectable];
  BOOL v17 = v16;
  if (v16)
  {
    [(GKDashboardPickerPlayerCell *)self originalSubtitle];
  }
  else
  {
    uint64_t v7 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
  double v18 = };
  v19 = [(GKDashboardPickerPlayerCell *)self subtitle];
  [v19 setText:v18];

  if (!v17)
  {

    double v18 = (void *)v7;
  }

  BOOL v20 = [v15 length] == 0;
  v21 = [(GKDashboardPickerPlayerCell *)self subtitle];
  [v21 setHidden:v20];
}

- (void)setAccessibilityPrefix:(id)a3
{
  id v12 = a3;
  v4 = [(GKDashboardPickerPlayerCell *)self title];
  v5 = [v4 text];

  if (v5)
  {
    BOOL v6 = [NSString stringWithFormat:@"%@.title-%@", v12, v5];
    uint64_t v7 = [(GKDashboardPickerPlayerCell *)self title];
    [v7 setAccessibilityIdentifier:v6];

    v8 = [NSString stringWithFormat:@"%@.subtitle-%@", v12, v5];
    v9 = [(GKDashboardPickerPlayerCell *)self subtitle];
    [v9 setAccessibilityIdentifier:v8];

    id v10 = [NSString stringWithFormat:@"%@.ring-%@", v12, v5];
    id v11 = [(GKDashboardPickerPlayerCell *)self ringView];
    [v11 setAccessibilityIdentifier:v10];
  }
}

- (id)subtitleForPlayer:(id)a3 isCoreRecent:(BOOL)a4 matchedContactName:(id)a5 onlyShowContactName:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v6)
  {
    if (v8)
    {
LABEL_6:
      v13 = GKGameCenterUIFrameworkBundle();
      GKGetLocalizedStringFromTableInBundle();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v14 = [v9 lastPlayedGame];
    if (!v14) {
      goto LABEL_10;
    }
    v15 = (void *)v14;
    BOOL v16 = [v9 lastPlayedGame];
    BOOL v17 = [v16 name];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      v19 = NSString;
      v13 = GKGameCenterUIFrameworkBundle();
      BOOL v20 = GKGetLocalizedStringFromTableInBundle();
      v21 = [v9 lastPlayedGame];
      uint64_t v22 = [v21 name];
    }
    else
    {
LABEL_10:
      v23 = [v9 lastPlayedDate];

      if (!v23)
      {
        id v12 = [v9 contact];

        if (!v12) {
          goto LABEL_14;
        }
        goto LABEL_6;
      }
      v19 = NSString;
      v13 = GKGameCenterUIFrameworkBundle();
      BOOL v20 = GKGetLocalizedStringFromTableInBundle();
      v21 = [v9 lastPlayedDate];
      uint64_t v22 = [v21 _gkFormattedWhenStringWithOptions:0];
    }
    id v24 = (void *)v22;
    objc_msgSend(v19, "stringWithFormat:", v20, v22);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  id v11 = [v9 contact];

  id v12 = 0;
  if (v10 && !v11) {
    id v12 = v10;
  }
LABEL_14:

  return v12;
}

- (void)updateLayerMask:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB14C0];
  id v4 = a3;
  [v4 bounds];
  v5 = objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12);
  BOOL v6 = [MEMORY[0x1E4F39C88] layer];
  [v4 bounds];
  objc_msgSend(v6, "setFrame:");
  id v8 = v5;
  objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));
  uint64_t v7 = [v4 layer];

  [v7 setMask:v6];
}

- (void)setLineVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(GKDashboardPickerPlayerCell *)self bottomLine];
  [v4 setHidden:v3];
}

- (BOOL)lineVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomLine);
  char v3 = [WeakRetained isHidden] ^ 1;

  return v3;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
  uint64_t v5 = !a3;
  BOOL v6 = [(GKDashboardPickerPlayerCell *)self playerView];
  [v6 setDimmed:v5];

  if (v5)
  {
    uint64_t v5 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    [(GKDashboardPickerPlayerCell *)self originalSubtitle];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(GKDashboardPickerPlayerCell *)self subtitle];
  [v7 setText:v8];

  if (!a3)
  {

    id v8 = (id)v5;
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setUsesClearBackground:(BOOL)a3
{
  self->_usesClearBackground = a3;
  [(GKDashboardPickerPlayerCell *)self updateCellBackground];
}

- (void)updateCellBackground
{
  if (self->_usesClearBackground) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v4 = [(GKDashboardPickerPlayerCell *)self cellBackgroundColor];
  }
  char v3 = [(GKDashboardPickerPlayerCell *)self contentView];
  [v3 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerCell;
  -[GKDashboardPickerPlayerCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__GKDashboardPickerPlayerCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E5F63D68;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0 completion:0.05];
}

void __46__GKDashboardPickerPlayerCell_setHighlighted___block_invoke(uint64_t a1)
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
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerCell;
  -[GKDashboardPickerPlayerCell setSelected:](&v7, sel_setSelected_);
  uint64_t v5 = [(GKDashboardPickerPlayerCell *)self layer];
  [v5 setBackgroundColor:0];

  BOOL v6 = [(GKDashboardPickerPlayerCell *)self ringView];
  [v6 setHidden:!v3];
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (BOOL)usesClearBackground
{
  return self->_usesClearBackground;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
}

- (UIView)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (UIView *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (UILabel)subtitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitle);

  return (UILabel *)WeakRetained;
}

- (void)setSubtitle:(id)a3
{
}

- (UILabel)title
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_title);

  return (UILabel *)WeakRetained;
}

- (void)setTitle:(id)a3
{
}

- (UIView)bottomLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomLine);

  return (UIView *)WeakRetained;
}

- (void)setBottomLine:(id)a3
{
}

- (UIView)monogramColorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monogramColorView);

  return (UIView *)WeakRetained;
}

- (void)setMonogramColorView:(id)a3
{
}

- (UIView)backView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backView);

  return (UIView *)WeakRetained;
}

- (void)setBackView:(id)a3
{
}

- (UIView)ringView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ringView);

  return (UIView *)WeakRetained;
}

- (void)setRingView:(id)a3
{
}

- (NSString)originalSubtitle
{
  return self->_originalSubtitle;
}

- (void)setOriginalSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSubtitle, 0);
  objc_destroyWeak((id *)&self->_ringView);
  objc_destroyWeak((id *)&self->_backView);
  objc_destroyWeak((id *)&self->_monogramColorView);
  objc_destroyWeak((id *)&self->_bottomLine);
  objc_destroyWeak((id *)&self->_title);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_playerView, 0);
}

@end