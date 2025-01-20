@interface GKSectionHeaderView
+ (id)padMetrics;
+ (id)phoneMetrics;
- (BOOL)allSectionItemsVisible;
- (BOOL)manualItemCount;
- (CGRect)rightButtonFrame;
- (GKButton)rightButton;
- (GKLabel)leftLabel;
- (GKSectionHeaderView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)backgroundViewHeightConstraint;
- (NSString)leftText;
- (NSString)rightText;
- (SEL)rightAction;
- (SEL)showAllAction;
- (UIView)backgroundView;
- (id)rightTarget;
- (int64_t)itemCount;
- (int64_t)maxItemCount;
- (int64_t)maxRange;
- (unint64_t)sectionIndex;
- (void)applyLayoutAttributes:(id)a3;
- (void)establishConstraints;
- (void)itemCountFormatter;
- (void)prepareForReuse;
- (void)rightButtonTouched:(id)a3;
- (void)setAllSectionItemsVisible:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewHeightConstraint:(id)a3;
- (void)setItemCount:(int64_t)a3;
- (void)setItemCountFormatter:(void *)a3;
- (void)setLeftLabel:(id)a3;
- (void)setLeftText:(id)a3;
- (void)setManualItemCount:(BOOL)a3;
- (void)setMaxItemCount:(int64_t)a3;
- (void)setMaxRange:(int64_t)a3;
- (void)setRightAction:(SEL)a3;
- (void)setRightButton:(id)a3;
- (void)setRightTarget:(id)a3;
- (void)setRightText:(id)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setShowAllAction:(SEL)a3;
- (void)updateGutterConstraints;
- (void)updateLabel;
@end

@implementation GKSectionHeaderView

+ (id)padMetrics
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GKSectionHeaderView;
  v2 = objc_msgSendSuper2(&v5, sel_padMetrics);
  v3 = (void *)[v2 mutableCopy];

  [v3 addEntriesFromDictionary:&unk_1F0812798];

  return v3;
}

+ (id)phoneMetrics
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GKSectionHeaderView;
  v2 = objc_msgSendSuper2(&v5, sel_phoneMetrics);
  v3 = (void *)[v2 mutableCopy];

  [v3 addEntriesFromDictionary:&unk_1F08127C0];

  return v3;
}

- (GKSectionHeaderView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)GKSectionHeaderView;
  v3 = -[GKHeaderWithUnderlineView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKLabel alloc];
    [(GKSectionHeaderView *)v3 bounds];
    uint64_t v5 = -[GKLabel initWithFrame:](v4, "initWithFrame:");
    leftLabel = v3->_leftLabel;
    v3->_leftLabel = (GKLabel *)v5;

    uint64_t v7 = 1;
    uint64_t v8 = +[GKButton buttonWithType:1];
    rightButton = v3->_rightButton;
    v3->_rightButton = (GKButton *)v8;

    [(GKLabel *)v3->_leftLabel setBackgroundColor:0];
    [(GKLabel *)v3->_leftLabel setOpaque:0];
    v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 == 1)
    {
      if (*MEMORY[0x1E4F63830]) {
        BOOL v12 = *MEMORY[0x1E4F63A38] == 0;
      }
      else {
        BOOL v12 = 0;
      }
      uint64_t v7 = v12;
    }
    [(GKLabel *)v3->_leftLabel setShouldInhibitReplay:v7];
    v13 = [MEMORY[0x1E4F639F8] textStyle];
    v14 = [v13 sectionHeader];

    [(GKLabel *)v3->_leftLabel applyTextStyle:v14];
    [(GKLabel *)v3->_leftLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(GKButton *)v3->_rightButton setContentHuggingPriority:1 forAxis:v15];
    LODWORD(v16) = 1132068864;
    [(GKButton *)v3->_rightButton setContentCompressionResistancePriority:1 forAxis:v16];
    [(GKButton *)v3->_rightButton setBackgroundColor:0];
    [(GKButton *)v3->_rightButton setOpaque:0];
    [(GKButton *)v3->_rightButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKButton *)v3->_rightButton setEnabled:0];
    [(GKButton *)v3->_rightButton applyTextStyle:v14];
    [(GKButton *)v3->_rightButton addTarget:v3 action:sel_rightButtonTouched_ forControlEvents:64];
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v17;

    v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.200000003];
    [(UIView *)v3->_backgroundView setBackgroundColor:v19];

    [(UIView *)v3->_backgroundView setClipsToBounds:1];
    [(UIView *)v3->_backgroundView setHidden:1];
    v20 = [(UIView *)v3->_backgroundView layer];
    [v20 setMaskedCorners:3];

    v21 = [(UIView *)v3->_backgroundView layer];
    [v21 setCornerRadius:10.0];

    uint64_t v22 = *MEMORY[0x1E4F39EA8];
    v23 = [(UIView *)v3->_backgroundView layer];
    [v23 setCornerCurve:v22];

    [(UIView *)v3->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKSectionHeaderView *)v3 addSubview:v3->_backgroundView];
    v24 = [(UIView *)v3->_backgroundView bottomAnchor];
    v25 = [(UIView *)v3->_backgroundView superview];
    v26 = [v25 bottomAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(UIView *)v3->_backgroundView leftAnchor];
    v29 = [(UIView *)v3->_backgroundView superview];
    v30 = [v29 leftAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(UIView *)v3->_backgroundView rightAnchor];
    v33 = [(UIView *)v3->_backgroundView superview];
    v34 = [v33 rightAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UIView *)v3->_backgroundView heightAnchor];
    v37 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v37 scaledValueForValue:30.0];
    v38 = objc_msgSend(v36, "constraintEqualToConstant:");
    [(GKSectionHeaderView *)v3 setBackgroundViewHeightConstraint:v38];

    v39 = [(GKSectionHeaderView *)v3 backgroundViewHeightConstraint];
    [v39 setActive:1];

    [(GKSectionHeaderView *)v3 addSubview:v3->_leftLabel];
    [(GKSectionHeaderView *)v3 addSubview:v3->_rightButton];
  }
  return v3;
}

- (void)updateGutterConstraints
{
  v22.receiver = self;
  v22.super_class = (Class)GKSectionHeaderView;
  [(GKHeaderWithUnderlineView *)&v22 updateGutterConstraints];
  v3 = [(GKHeaderWithUnderlineView *)self metrics];
  v4 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v5 = _NSDictionaryOfVariableBindings(&cfstr_LeftlabelRight.isa, self->_leftLabel, self->_rightButton, 0);
  v6 = [v4 constraintsWithVisualFormat:@"|-(gutter)-[_leftLabel]-(>=labelSpacing)-[_rightButton]-(rightGutter)-|" options:0 metrics:v3 views:v5];

  uint64_t v7 = [(GKSectionHeaderView *)self leftLabel];
  uint64_t v8 = [v7 leftAnchor];
  v9 = [(GKSectionHeaderView *)self leftLabel];
  v10 = [v9 superview];
  uint64_t v11 = [v10 leftAnchor];
  BOOL v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  double v14 = 15.0;
  if (v13 == 1 && (*MEMORY[0x1E4F63A38] || *MEMORY[0x1E4F63830] == 0)) {
    double v14 = 25.0;
  }
  double v16 = [v8 constraintEqualToAnchor:v11 constant:v14];
  [v16 setActive:1];

  [(GKHeaderWithUnderlineView *)self leadingMargin];
  double v18 = v17;
  [(GKHeaderWithUnderlineView *)self trailingMargin];
  if (v18 > 0.0 || v19 > 0.0) {
    [MEMORY[0x1E4FB1560] _gkAdjustConstraintMargins:v6 leading:v18 trailing:v19];
  }
  [(GKSectionHeaderView *)self addConstraints:v6];
  v20 = [(GKHeaderWithUnderlineView *)self gutterConstraints];
  v21 = [v20 arrayByAddingObjectsFromArray:v6];
  [(GKHeaderWithUnderlineView *)self setGutterConstraints:v21];
}

- (void)establishConstraints
{
  v8.receiver = self;
  v8.super_class = (Class)GKSectionHeaderView;
  [(GKHeaderWithUnderlineView *)&v8 establishConstraints];
  v3 = [(GKHeaderWithUnderlineView *)self underlineView];
  v4 = [(GKSectionHeaderView *)self leftLabel];
  uint64_t v5 = [(GKSectionHeaderView *)self rightButton];
  v6 = [MEMORY[0x1E4F28DC8] _gkConstraintWithItem:v3 attribute:3 relatedBy:0 toItem:v4 attribute:11 multiplier:*MEMORY[0x1E4FB2950] leading:1.0 fontTextStyle:8.0];
  uint64_t v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:11 relatedBy:0 toItem:v4 attribute:11 multiplier:1.0 constant:0.0];
  [(GKSectionHeaderView *)self addConstraint:v6];
  [(GKSectionHeaderView *)self addConstraint:v7];
}

- (void)setLeftText:(id)a3
{
  [(GKLabel *)self->_leftLabel setText:a3];
  v4 = [(GKSectionHeaderView *)self backgroundViewHeightConstraint];
  [v4 setActive:0];

  uint64_t v5 = [(UIView *)self->_backgroundView heightAnchor];
  v6 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v6 scaledValueForValue:30.0];
  uint64_t v7 = objc_msgSend(v5, "constraintEqualToConstant:");
  [(GKSectionHeaderView *)self setBackgroundViewHeightConstraint:v7];

  objc_super v8 = [(GKSectionHeaderView *)self backgroundViewHeightConstraint];
  [v8 setActive:1];

  id v9 = [(GKSectionHeaderView *)self backgroundView];
  [v9 setNeedsLayout];
}

- (NSString)leftText
{
  return (NSString *)[(GKLabel *)self->_leftLabel text];
}

- (void)setRightText:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F639F8];
  id v5 = a3;
  v6 = [v4 textStyle];
  id v10 = [v6 sectionHeader];

  [(GKButton *)self->_rightButton applyTextStyle:v10];
  rightButton = self->_rightButton;
  objc_super v8 = [MEMORY[0x1E4F639B0] sharedPalette];
  id v9 = [v8 emphasizedTextColor];
  [(GKButton *)rightButton setTitleColor:v9 forState:0];

  [(GKButton *)self->_rightButton setTitle:v5 forState:0];
  [(GKSectionHeaderView *)self updateLabel];
}

- (NSString)rightText
{
  rightButton = self->_rightButton;
  uint64_t v3 = [(GKButton *)rightButton state];

  return (NSString *)[(GKButton *)rightButton titleForState:v3];
}

- (CGRect)rightButtonFrame
{
  [(GKButton *)self->_rightButton frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKSectionHeaderView;
  [(GKHeaderWithUnderlineView *)&v12 applyLayoutAttributes:v4];
  double v5 = [v4 indexPath];
  -[GKSectionHeaderView setSectionIndex:](self, "setSectionIndex:", [v5 section]);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    uint64_t v7 = v6;
    if (self->_manualItemCount)
    {
      if (self->_maxRange
        && (unint64_t v8 = [v6 currentTotalItemCount], v8 >= objc_msgSend(v7, "maxTotalItemCount")))
      {
        int64_t maxRange = self->_maxRange;
      }
      else
      {
        unint64_t v9 = [v7 currentVisibleItemCount];
        unint64_t v10 = [v7 currentTotalItemCount];
        if (v9 >= v10) {
          int64_t maxRange = v10;
        }
        else {
          int64_t maxRange = v9;
        }
      }
      [(GKSectionHeaderView *)self setItemCount:maxRange];
    }
    else
    {
      self->_itemCount = [v6 currentTotalItemCount];
    }
    self->_maxItemCount = [v7 maxTotalItemCount];
    self->_allSectionItemsVisible = [v7 allSectionItemsVisible];
    [(GKSectionHeaderView *)self updateLabel];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKSectionHeaderView;
  [(GKSectionHeaderView *)&v3 prepareForReuse];
  self->_manualItemCount = 0;
  self->_itemCountFormatter = 0;
  self->_int64_t maxRange = 0;
  [(GKSectionHeaderView *)self setRightText:0];
}

- (void)setItemCount:(int64_t)a3
{
  self->_itemCount = a3;
  [(GKSectionHeaderView *)self updateLabel];
}

- (void)setMaxItemCount:(int64_t)a3
{
  self->_maxItemCount = a3;
  [(GKSectionHeaderView *)self updateLabel];
}

- (void)updateLabel
{
  itemCountFormatter = (void (*)(int64_t, SEL))self->_itemCountFormatter;
  if (itemCountFormatter)
  {
    id v4 = itemCountFormatter(self->_itemCount, a2);
    [(GKSectionHeaderView *)self setLeftText:v4];
  }
  if (self->_showAllAction && (!self->_allSectionItemsVisible || self->_itemCount < self->_maxItemCount))
  {
    double v5 = NSString;
    id v6 = GKGameCenterUIFrameworkBundle();
    uint64_t v7 = GKGetLocalizedStringFromTableInBundle();
    [(GKSectionHeaderView *)self maxItemCount];
    unint64_t v8 = GKFormattedStringWithGroupingFromInteger();
    unint64_t v9 = objc_msgSend(v5, "stringWithFormat:", v7, v8);

    [(GKSectionHeaderView *)self setRightText:v9];
    unint64_t v10 = [(GKSectionHeaderView *)self rightButton];
    [v10 setTitleColor:0 forState:0];

    uint64_t v11 = [(GKSectionHeaderView *)self rightButton];
    objc_super v12 = [MEMORY[0x1E4F639F8] textStyle];
    uint64_t v13 = [v12 sectionHeader];
    double v14 = [v13 buttonTitle];
    [v11 applyTextStyle:v14];

LABEL_10:
    goto LABEL_11;
  }
  if (self->_rightTarget && self->_rightAction)
  {
    unint64_t v9 = [(GKSectionHeaderView *)self rightButton];
    uint64_t v11 = [MEMORY[0x1E4F639B0] sharedPalette];
    objc_super v12 = [v11 systemInteractionColor];
    [v9 setTitleColor:v12 forState:0];
    goto LABEL_10;
  }
LABEL_11:
  double v15 = [(GKSectionHeaderView *)self rightText];
  uint64_t v16 = [v15 length];
  BOOL v17 = v16 == 0;
  BOOL v18 = v16 != 0;

  double v19 = [(GKSectionHeaderView *)self rightButton];
  [v19 setEnabled:v18];

  id v20 = [(GKSectionHeaderView *)self rightButton];
  [v20 setHidden:v17];
}

- (void)setItemCountFormatter:(void *)a3
{
  if (self->_itemCountFormatter != a3)
  {
    self->_itemCountFormatter = a3;
    [(GKSectionHeaderView *)self updateLabel];
  }
}

- (void)setShowAllAction:(SEL)a3
{
  if (self->_showAllAction != a3)
  {
    if (a3) {
      objc_super v3 = a3;
    }
    else {
      objc_super v3 = 0;
    }
    self->_showAllAction = v3;
    [(GKSectionHeaderView *)self updateLabel];
  }
}

- (void)rightButtonTouched:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  p_showAllAction = &self->_showAllAction;
  if (self->_showAllAction)
  {
    id v13 = v4;
    uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    unint64_t v8 = v7;
    if (*p_showAllAction) {
      SEL v9 = *p_showAllAction;
    }
    else {
      SEL v9 = 0;
    }
    objc_super v12 = [v7 _gkTargetForAction:v9 viaResponder:self];

    if (*p_showAllAction) {
      objc_msgSend(v12, *p_showAllAction, self->_sectionIndex);
    }
    else {
      objc_msgSend(v12, 0, self->_sectionIndex);
    }

    goto LABEL_12;
  }
  id rightTarget = self->_rightTarget;
  if (rightTarget)
  {
    SEL rightAction = self->_rightAction;
    if (rightAction)
    {
      id v13 = v5;
      id rightTarget = (id)[rightTarget _gkPerformSelector:rightAction withObject:self];
LABEL_12:
      id v5 = v13;
    }
  }

  MEMORY[0x1F41817F8](rightTarget, v5);
}

- (GKLabel)leftLabel
{
  return self->_leftLabel;
}

- (void)setLeftLabel:(id)a3
{
}

- (SEL)showAllAction
{
  if (self->_showAllAction) {
    return self->_showAllAction;
  }
  else {
    return 0;
  }
}

- (id)rightTarget
{
  return self->_rightTarget;
}

- (void)setRightTarget:(id)a3
{
  self->_id rightTarget = a3;
}

- (SEL)rightAction
{
  if (self->_rightAction) {
    return self->_rightAction;
  }
  else {
    return 0;
  }
}

- (void)setRightAction:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_SEL rightAction = v3;
}

- (void)itemCountFormatter
{
  return self->_itemCountFormatter;
}

- (BOOL)manualItemCount
{
  return self->_manualItemCount;
}

- (void)setManualItemCount:(BOOL)a3
{
  self->_manualItemCount = a3;
}

- (int64_t)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(int64_t)a3
{
  self->_int64_t maxRange = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (GKButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (int64_t)maxItemCount
{
  return self->_maxItemCount;
}

- (BOOL)allSectionItemsVisible
{
  return self->_allSectionItemsVisible;
}

- (void)setAllSectionItemsVisible:(BOOL)a3
{
  self->_allSectionItemsVisible = a3;
}

- (NSLayoutConstraint)backgroundViewHeightConstraint
{
  return self->_backgroundViewHeightConstraint;
}

- (void)setBackgroundViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end