@interface GKDashboardPickerPlayerGroupCell
+ (CGSize)defaultSize;
+ (id)reuseIdentifier;
+ (id)reuseIdentifierAX;
- (BOOL)canBecomeFocused;
- (BOOL)canExpand;
- (BOOL)lineVisible;
- (BOOL)usesClearBackground;
- (GKDashboardPickerPlayerGroupCellDelegate)groupCellDelegate;
- (NSString)originalSubtitle;
- (NSString)searchText;
- (UIImageView)checkmark;
- (UIImageView)messageIcon;
- (UILabel)subtitle;
- (UILabel)title;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UIView)bottomLine;
- (UIView)container;
- (UIView)iconContainer;
- (UIView)ringView;
- (_TtC12GameCenterUI17GKPlayerGroupView)playerGroupView;
- (id)cellBackgroundColor;
- (void)awakeFromNib;
- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8;
- (void)dealloc;
- (void)handleLongPress:(id)a3;
- (void)setBottomLine:(id)a3;
- (void)setCanExpand:(BOOL)a3;
- (void)setCheckmark:(id)a3;
- (void)setContainer:(id)a3;
- (void)setGroupCellDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconContainer:(id)a3;
- (void)setLineVisible:(BOOL)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setMessageIcon:(id)a3;
- (void)setOriginalSubtitle:(id)a3;
- (void)setPlayerGroupView:(id)a3;
- (void)setRingView:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsesClearBackground:(BOOL)a3;
- (void)updateCellBackground;
- (void)updateLayerMask:(id)a3;
- (void)updateTitleForSearchText;
@end

@implementation GKDashboardPickerPlayerGroupCell

+ (id)reuseIdentifier
{
  return @"GKDashboardPickerPlayerGroupCellIdentifier";
}

+ (id)reuseIdentifierAX
{
  return @"GKDashboardPickerPlayerGroupCellAXIdentifier";
}

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
  v38.receiver = self;
  v38.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  [(GKDashboardPickerPlayerGroupCell *)&v38 awakeFromNib];
  double v3 = [(GKDashboardPickerPlayerGroupCell *)self cellBackgroundColor];
  v4 = [(GKDashboardPickerPlayerGroupCell *)self contentView];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward.circle" withConfiguration:v5];
  v7 = [(GKDashboardPickerPlayerGroupCell *)self checkmark];
  [v7 setImage:v6];

  v8 = [MEMORY[0x1E4FB1618] whiteColor];
  v9 = [v8 colorWithAlphaComponent:0.1];
  v10 = [(GKDashboardPickerPlayerGroupCell *)self bottomLine];
  [v10 setBackgroundColor:v9];

  uint64_t v11 = *MEMORY[0x1E4F3A2E8];
  v12 = [(GKDashboardPickerPlayerGroupCell *)self checkmark];
  v13 = [v12 layer];
  [v13 setCompositingFilter:v11];

  v14 = [(GKDashboardPickerPlayerGroupCell *)self subtitle];
  v15 = [v14 layer];
  [v15 setCompositingFilter:v11];

  v16 = +[GKPlayerGroupView create];
  if (v16)
  {
    v17 = [(GKDashboardPickerPlayerGroupCell *)self iconContainer];
    [v17 addSubview:v16];

    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(GKDashboardPickerPlayerGroupCell *)self iconContainer];
    [v18 _gkInstallEdgeConstraintsForView:v16 containedWithinParentView:v19];

    [(GKDashboardPickerPlayerGroupCell *)self setPlayerGroupView:v16];
  }
  v20 = objc_opt_new();
  v21 = (void *)MEMORY[0x1E4FB14C0];
  v22 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  [v22 frame];
  double v24 = v23;
  v25 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  [v25 frame];
  objc_msgSend(v21, "bezierPathWithOvalInRect:", 0.0, 0.0, v24);
  id v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPath:", objc_msgSend(v26, "CGPath"));

  v27 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  v28 = [v27 layer];
  [v28 addSublayer:v20];

  v29 = [MEMORY[0x1E4FB1618] whiteColor];
  id v30 = [v29 colorWithAlphaComponent:0.6];
  objc_msgSend(v20, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

  id v31 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v20, "setFillColor:", objc_msgSend(v31, "CGColor"));

  [v20 setLineWidth:2.0];
  v32 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  v33 = [v32 layer];
  [v33 setCompositingFilter:v11];

  v34 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  [v34 setHidden:1];

  v35 = GKGameCenterUIFrameworkBundle();
  v36 = GKGetLocalizedStringFromTableInBundle();
  v37 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  [v37 setAccessibilityLabel:v36];
}

- (void)dealloc
{
  double v3 = [(GKDashboardPickerPlayerGroupCell *)self longPressRecognizer];

  if (v3)
  {
    v4 = [(GKDashboardPickerPlayerGroupCell *)self longPressRecognizer];
    [(GKDashboardPickerPlayerGroupCell *)self removeGestureRecognizer:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  [(GKDashboardPickerPlayerGroupCell *)&v5 dealloc];
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 subtitle:(id)a5 messagesGroupIdentifier:(id)a6 source:(int64_t)a7 playerSelectionProxy:(id)a8
{
  id v58 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  v19 = [(GKDashboardPickerPlayerGroupCell *)self title];
  [v19 setText:v18];

  v20 = [(GKDashboardPickerPlayerGroupCell *)self subtitle];
  [v20 setText:v15];

  if ([v15 length] || objc_msgSend(v58, "count") != 1) {
    goto LABEL_16;
  }
  v21 = [v58 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 lastPlayedGame];
  if (v22)
  {
    double v23 = (void *)v22;
    v8 = [v21 lastPlayedGame];
    double v24 = [v8 name];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      id v26 = NSString;
      uint64_t v56 = GKGameCenterUIFrameworkBundle();
      uint64_t v27 = GKGetLocalizedStringFromTableInBundle();
      v28 = [v21 lastPlayedGame];
      v29 = [v28 name];
      v8 = objc_msgSend(v26, "stringWithFormat:", v27, v29);

      id v30 = (void *)v56;
LABEL_8:
      id v15 = (id)v27;
LABEL_9:

      id v15 = v8;
      goto LABEL_10;
    }
  }
  id v31 = [v21 lastPlayedDate];

  if (v31)
  {
    v32 = NSString;
    uint64_t v33 = GKGameCenterUIFrameworkBundle();
    uint64_t v27 = GKGetLocalizedStringFromTableInBundle();
    [v21 lastPlayedDate];
    v34 = v57 = v21;
    v35 = [v34 _gkFormattedWhenStringWithOptions:0];
    v8 = objc_msgSend(v32, "stringWithFormat:", v27, v35);

    id v30 = (void *)v33;
    v21 = v57;
    goto LABEL_8;
  }
  if (a7 == 1
    || ([v21 contact], v55 = objc_claimAutoreleasedReturnValue(), v55, v55))
  {
    id v30 = GKGameCenterUIFrameworkBundle();
    v8 = GKGetLocalizedStringFromTableInBundle();
    goto LABEL_9;
  }
LABEL_10:
  [(GKDashboardPickerPlayerGroupCell *)self setOriginalSubtitle:v15];
  int v36 = [v16 playerIsSelectable:v21];
  char v37 = v36;
  if (v36)
  {
    [(GKDashboardPickerPlayerGroupCell *)self originalSubtitle];
  }
  else
  {
    v8 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
  objc_super v38 = };
  v39 = [(GKDashboardPickerPlayerGroupCell *)self subtitle];
  [v39 setText:v38];

  if ((v37 & 1) == 0)
  {

    objc_super v38 = v8;
  }

LABEL_16:
  v40 = [(GKDashboardPickerPlayerGroupCell *)self messageIcon];
  [v40 setHidden:a7 != 1];

  -[GKDashboardPickerPlayerGroupCell setCanExpand:](self, "setCanExpand:", (unint64_t)[v58 count] > 1);
  uint64_t v41 = [(GKDashboardPickerPlayerGroupCell *)self canExpand] ^ 1;
  v42 = [(GKDashboardPickerPlayerGroupCell *)self checkmark];
  [v42 setHidden:v41];

  v43 = [(GKDashboardPickerPlayerGroupCell *)self playerGroupView];
  [v43 configureWithPlayers:v58 messagesGroupIdentifier:v17 playerSelectionProxy:v16];

  if ([v58 count] == 1)
  {
    v44 = [v58 objectAtIndexedSubscript:0];
    char v45 = [v16 playerIsSelectable:v44];

    if ((v45 & 1) == 0)
    {
      v46 = GKGameCenterUIFrameworkBundle();
      v47 = GKGetLocalizedStringFromTableInBundle();
      v48 = [(GKDashboardPickerPlayerGroupCell *)self subtitle];
      [v48 setText:v47];
    }
  }
  unint64_t v49 = [v58 count];
  v50 = [(GKDashboardPickerPlayerGroupCell *)self longPressRecognizer];
  v51 = v50;
  if (v49 < 2)
  {

    if (v51)
    {
      v54 = [(GKDashboardPickerPlayerGroupCell *)self longPressRecognizer];
      [(GKDashboardPickerPlayerGroupCell *)self removeGestureRecognizer:v54];
    }
    [(GKDashboardPickerPlayerGroupCell *)self setLongPressRecognizer:0];
  }
  else
  {

    if (!v51)
    {
      v52 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_handleLongPress_];
      [(GKDashboardPickerPlayerGroupCell *)self setLongPressRecognizer:v52];

      v53 = [(GKDashboardPickerPlayerGroupCell *)self longPressRecognizer];
      [(GKDashboardPickerPlayerGroupCell *)self addGestureRecognizer:v53];
    }
  }
  [(GKDashboardPickerPlayerGroupCell *)self updateTitleForSearchText];
}

- (void)updateTitleForSearchText
{
  double v3 = [(GKDashboardPickerPlayerGroupCell *)self title];
  id v14 = [v3 text];

  v4 = [(GKDashboardPickerPlayerGroupCell *)self searchText];
  uint64_t v5 = [v14 localizedStandardRangeOfString:v4];
  uint64_t v7 = v6;

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    if (v5)
    {
      v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v10, 0, v5);
    }
    if (v5 + v7 < (unint64_t)[v14 length])
    {
      uint64_t v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      objc_msgSend(v8, "addAttribute:value:range:", v9, v11, v5 + v7, objc_msgSend(v14, "length") - (v5 + v7));
    }
    v12 = [MEMORY[0x1E4FB1618] labelColor];
    objc_msgSend(v8, "addAttribute:value:range:", v9, v12, v5, v7);

    v13 = [(GKDashboardPickerPlayerGroupCell *)self title];
    [v13 setAttributedText:v8];
  }
}

- (void)updateLayerMask:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB14C0];
  id v4 = a3;
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12);
  uint64_t v6 = [MEMORY[0x1E4F39C88] layer];
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
  id v4 = [(GKDashboardPickerPlayerGroupCell *)self bottomLine];
  [v4 setHidden:v3];
}

- (BOOL)lineVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomLine);
  char v3 = [WeakRetained isHidden] ^ 1;

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setUsesClearBackground:(BOOL)a3
{
  self->_usesClearBackground = a3;
  [(GKDashboardPickerPlayerGroupCell *)self updateCellBackground];
}

- (void)updateCellBackground
{
  if (self->_usesClearBackground) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v4 = [(GKDashboardPickerPlayerGroupCell *)self cellBackgroundColor];
  }
  char v3 = [(GKDashboardPickerPlayerGroupCell *)self contentView];
  [v3 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__GKDashboardPickerPlayerGroupCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E5F63D68;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0 completion:0.05];
}

void __51__GKDashboardPickerPlayerGroupCell_setHighlighted___block_invoke(uint64_t a1)
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
  v7.super_class = (Class)GKDashboardPickerPlayerGroupCell;
  -[GKDashboardPickerPlayerGroupCell setSelected:](&v7, sel_setSelected_);
  uint64_t v5 = [(GKDashboardPickerPlayerGroupCell *)self layer];
  [v5 setBackgroundColor:0];

  BOOL v6 = [(GKDashboardPickerPlayerGroupCell *)self ringView];
  [v6 setHidden:!v3];
}

- (void)handleLongPress:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 3)
  {
    id v4 = [(GKDashboardPickerPlayerGroupCell *)self groupCellDelegate];

    if (v4)
    {
      uint64_t v5 = [(GKDashboardPickerPlayerGroupCell *)self groupCellDelegate];
      [v5 handleLongPressGesture:v6];
    }
  }
}

- (BOOL)usesClearBackground
{
  return self->_usesClearBackground;
}

- (GKDashboardPickerPlayerGroupCellDelegate)groupCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupCellDelegate);

  return (GKDashboardPickerPlayerGroupCellDelegate *)WeakRetained;
}

- (void)setGroupCellDelegate:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
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

- (UIView)iconContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconContainer);

  return (UIView *)WeakRetained;
}

- (void)setIconContainer:(id)a3
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

- (UIImageView)checkmark
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_checkmark);

  return (UIImageView *)WeakRetained;
}

- (void)setCheckmark:(id)a3
{
}

- (UIImageView)messageIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setMessageIcon:(id)a3
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

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (NSString)originalSubtitle
{
  return self->_originalSubtitle;
}

- (void)setOriginalSubtitle:(id)a3
{
}

- (_TtC12GameCenterUI17GKPlayerGroupView)playerGroupView
{
  return self->_playerGroupView;
}

- (void)setPlayerGroupView:(id)a3
{
}

- (BOOL)canExpand
{
  return self->_canExpand;
}

- (void)setCanExpand:(BOOL)a3
{
  self->_canExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerGroupView, 0);
  objc_storeStrong((id *)&self->_originalSubtitle, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_destroyWeak((id *)&self->_ringView);
  objc_destroyWeak((id *)&self->_messageIcon);
  objc_destroyWeak((id *)&self->_checkmark);
  objc_destroyWeak((id *)&self->_bottomLine);
  objc_destroyWeak((id *)&self->_title);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_iconContainer);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_searchText, 0);

  objc_destroyWeak((id *)&self->_groupCellDelegate);
}

@end