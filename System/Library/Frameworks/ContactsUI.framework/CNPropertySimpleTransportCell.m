@interface CNPropertySimpleTransportCell
+ (id)standardStarView;
+ (void)_updateStarImageForView:(id)a3;
- (BOOL)allowsActions;
- (BOOL)needsUpdateTouchAreas;
- (BOOL)shouldPerformDefaultAction;
- (BOOL)shouldShowBadge;
- (BOOL)shouldShowStar;
- (BOOL)shouldShowTransportButtons;
- (CNPropertySimpleTransportCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNTransportButton)standardTransportIcon;
- (CNTransportButton)transportIcon1;
- (CNTransportButton)transportIcon2;
- (CNTransportButton)transportIcon3;
- (UIColor)actionsColor;
- (UIImageView)standardStarView;
- (UIView)badgeView;
- (UIView)standardBadgeView;
- (id)rightMostView;
- (id)variableConstraints;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setActionsColor:(id)a3;
- (void)setAllowsActions:(BOOL)a3;
- (void)setBadgeView:(id)a3;
- (void)setCardGroupItem:(id)a3;
- (void)setNeedsUpdateTouchAreas:(BOOL)a3;
- (void)setShouldShowBadge:(BOOL)a3;
- (void)setShouldShowTransportButtons:(BOOL)a3;
- (void)transportButtonClicked:(id)a3;
- (void)updateLabelNeedingHuggingContent;
- (void)updateStarIcon;
- (void)updateTransportButtons;
- (void)updateWithPropertyItem:(id)a3;
@end

@implementation CNPropertySimpleTransportCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_actionsColor, 0);
  objc_storeStrong((id *)&self->_standardStarView, 0);
  objc_storeStrong((id *)&self->_starView, 0);
  objc_storeStrong((id *)&self->_transportIcon3, 0);
  objc_storeStrong((id *)&self->_transportIcon2, 0);

  objc_storeStrong((id *)&self->_transportIcon1, 0);
}

- (void)setNeedsUpdateTouchAreas:(BOOL)a3
{
  self->_needsUpdateTouchAreas = a3;
}

- (BOOL)needsUpdateTouchAreas
{
  return self->_needsUpdateTouchAreas;
}

- (void)setBadgeView:(id)a3
{
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (UIColor)actionsColor
{
  return self->_actionsColor;
}

- (UIImageView)standardStarView
{
  return self->_standardStarView;
}

- (void)setShouldShowTransportButtons:(BOOL)a3
{
  self->_shouldShowTransportButtons = a3;
}

- (BOOL)shouldShowTransportButtons
{
  return self->_shouldShowTransportButtons;
}

- (BOOL)shouldShowBadge
{
  return self->_shouldShowBadge;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setActionsColor:(id)a3
{
  v7 = (UIColor *)a3;
  if (self->_actionsColor != v7)
  {
    objc_storeStrong((id *)&self->_actionsColor, a3);
    v5 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    [v5 setGlyphColor:v7];

    v6 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    [v6 setGlyphColor:v7];
  }
}

- (void)setAllowsActions:(BOOL)a3
{
  self->_allowsActions = a3;
  [(CNPropertySimpleTransportCell *)self updateTransportButtons];
}

- (void)transportButtonClicked:(id)a3
{
  id v4 = a3;
  id v7 = [(CNPropertyCell *)self delegate];
  v5 = [(CNPropertyCell *)self propertyItem];
  uint64_t v6 = [v4 transportType];

  [v7 propertyCell:self performActionForItem:v5 withTransportType:v6];
}

- (BOOL)shouldPerformDefaultAction
{
  v5.receiver = self;
  v5.super_class = (Class)CNPropertySimpleTransportCell;
  BOOL v3 = [(CNContactCell *)&v5 shouldPerformDefaultAction];
  if (v3) {
    LOBYTE(v3) = [(CNPropertySimpleTransportCell *)self allowsActions];
  }
  return v3;
}

- (id)variableConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  v67.receiver = self;
  v67.super_class = (Class)CNPropertySimpleTransportCell;
  id v4 = [(CNLabeledCell *)&v67 variableConstraints];
  objc_super v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(UIImageView *)self->_starView superview];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28DC8];
    starView = self->_starView;
    v9 = [(CNPropertySimpleCell *)self labelLabel];
    v10 = [v7 constraintWithItem:starView attribute:5 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:3.0];
    [v5 addObject:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = self->_starView;
    v13 = [(CNPropertySimpleCell *)self labelLabel];
    v14 = [v11 constraintWithItem:v12 attribute:11 relatedBy:0 toItem:v13 attribute:11 multiplier:1.0 constant:0.0];
    [v5 addObject:v14];

    v15 = (void *)MEMORY[0x1E4F28DC8];
    v16 = [(CNPropertySimpleCell *)self labelLabel];
    v17 = [(CNPropertySimpleCell *)self valueLabel];
    [(UIImageView *)self->_starView bounds];
    v19 = [v15 constraintWithItem:v16 attribute:6 relatedBy:-1 toItem:v17 attribute:6 multiplier:1.0 constant:-(v18 + 3.0)];
    [v5 addObject:v19];
  }
  v20 = [(CNPropertySimpleTransportCell *)self badgeView];
  v21 = [v20 superview];

  if (v21)
  {
    v22 = [(UIImageView *)self->_starView superview];
    if (v22)
    {
      v23 = self->_starView;
    }
    else
    {
      v23 = [(CNPropertySimpleCell *)self labelLabel];
    }
    v24 = v23;

    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(CNPropertySimpleTransportCell *)self badgeView];
    v27 = [v25 constraintWithItem:v26 attribute:5 relatedBy:0 toItem:v24 attribute:6 multiplier:1.0 constant:3.0];
    [v5 addObject:v27];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(CNPropertySimpleTransportCell *)self badgeView];
    v30 = [(CNPropertySimpleCell *)self labelLabel];
    v31 = [v28 constraintWithItem:v29 attribute:11 relatedBy:0 toItem:v30 attribute:11 multiplier:1.0 constant:0.0];
    [v5 addObject:v31];
  }
  v32 = [(CNPropertySimpleTransportCell *)self transportIcon1];
  v33 = [v32 superview];

  if (v33)
  {
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    v36 = [(CNPropertySimpleTransportCell *)self contentView];
    v37 = [v34 constraintWithItem:v35 attribute:10 relatedBy:0 toItem:v36 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v37];

    v38 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    v39 = [v38 trailingAnchor];
    v40 = [(CNPropertySimpleTransportCell *)self contentView];
    v41 = [v40 trailingAnchor];
    v42 = [v39 constraintEqualToAnchor:v41 constant:-16.0];
    [v5 addObject:v42];

    v43 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    v44 = [v43 superview];

    v45 = (void *)MEMORY[0x1E4F28DC8];
    if (v44)
    {
      v46 = [(CNPropertySimpleTransportCell *)self transportIcon2];
      v47 = [(CNPropertySimpleTransportCell *)self contentView];
      v48 = [v45 constraintWithItem:v46 attribute:10 relatedBy:0 toItem:v47 attribute:10 multiplier:1.0 constant:0.0];
      [v5 addObject:v48];

      v49 = (void *)MEMORY[0x1E4F28DC8];
      v50 = [(CNPropertySimpleTransportCell *)self transportIcon2];
      v51 = [(CNPropertySimpleTransportCell *)self transportIcon1];
      v52 = [v49 constraintWithItem:v50 attribute:6 relatedBy:0 toItem:v51 attribute:5 multiplier:1.0 constant:-16.0];
      [v5 addObject:v52];

      v53 = [(CNPropertySimpleTransportCell *)self transportIcon3];
      v54 = [v53 superview];

      v45 = (void *)MEMORY[0x1E4F28DC8];
      if (v54)
      {
        v55 = [(CNPropertySimpleTransportCell *)self transportIcon3];
        v56 = [(CNPropertySimpleTransportCell *)self contentView];
        v57 = [v45 constraintWithItem:v55 attribute:10 relatedBy:0 toItem:v56 attribute:10 multiplier:1.0 constant:0.0];
        [v5 addObject:v57];

        v58 = (void *)MEMORY[0x1E4F28DC8];
        v59 = [(CNPropertySimpleCell *)self valueView];
        v60 = [(CNPropertySimpleTransportCell *)self transportIcon3];
        v61 = [v58 constraintWithItem:v59 attribute:6 relatedBy:0 toItem:v60 attribute:5 multiplier:1.0 constant:-16.0];
        [v5 addObject:v61];

        v45 = (void *)MEMORY[0x1E4F28DC8];
        [(CNPropertySimpleTransportCell *)self transportIcon3];
      }
      else
      {
        [(CNPropertySimpleCell *)self valueView];
      v62 = };
      uint64_t v63 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    }
    else
    {
      v62 = [(CNPropertySimpleCell *)self valueView];
      uint64_t v63 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    }
    v64 = (void *)v63;
    v65 = [v45 constraintWithItem:v62 attribute:6 relatedBy:0 toItem:v63 attribute:5 multiplier:1.0 constant:-16.0];
    [v5 addObject:v65];
  }

  return v5;
}

- (id)rightMostView
{
  BOOL v3 = [(CNPropertySimpleTransportCell *)self transportIcon1];
  id v4 = [v3 superview];

  if (v4)
  {
    objc_super v5 = [(CNPropertySimpleTransportCell *)self transportIcon1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNPropertySimpleTransportCell;
    objc_super v5 = [(CNLabeledCell *)&v7 rightMostView];
  }

  return v5;
}

- (void)updateStarIcon
{
  if ([(CNPropertySimpleTransportCell *)self shouldShowStar]
    && ([(UIImageView *)self->_starView superview],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    if (self->_starView
      || ([(id)objc_opt_class() standardStarView],
          objc_super v5 = (UIImageView *)objc_claimAutoreleasedReturnValue(),
          starView = self->_starView,
          self->_starView = v5,
          starView,
          self->_starView))
    {
      objc_super v7 = [(CNPropertySimpleTransportCell *)self contentView];
      [v7 addSubview:self->_starView];
    }
  }
  else
  {
    if ([(CNPropertySimpleTransportCell *)self shouldShowStar]) {
      return;
    }
    id v4 = [(UIImageView *)self->_starView superview];

    if (!v4) {
      return;
    }
    [(UIImageView *)self->_starView removeFromSuperview];
  }

  [(CNPropertySimpleTransportCell *)self setNeedsUpdateConstraints];
}

- (void)updateTransportButtons
{
  if ([(CNPropertySimpleTransportCell *)self shouldShowTransportButtons])
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__CNPropertySimpleTransportCell_updateTransportButtons__block_invoke;
    v7[3] = &unk_1E5499B00;
    v7[4] = self;
    v7[5] = &v8;
    BOOL v3 = (void (**)(void *, void *))_Block_copy(v7);
    id v4 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    v3[2](v3, v4);

    objc_super v5 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    v3[2](v3, v5);

    uint64_t v6 = [(CNPropertySimpleTransportCell *)self transportIcon3];
    v3[2](v3, v6);

    if (*((unsigned char *)v9 + 24))
    {
      [(CNPropertySimpleTransportCell *)self setNeedsUpdateTouchAreas:1];
      [(CNPropertySimpleTransportCell *)self setNeedsUpdateConstraints];
    }

    _Block_object_dispose(&v8, 8);
  }
}

void __55__CNPropertySimpleTransportCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 transportType])
  {
    BOOL v3 = [v6 superview];

    if (!v3)
    {
      objc_super v5 = [*(id *)(a1 + 32) contentView];
      [v5 addSubview:v6];

      goto LABEL_7;
    }
  }
  if (![v6 transportType])
  {
    id v4 = [v6 superview];

    if (v4)
    {
      [v6 removeFromSuperview];
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v10 isEqualToString:@"allowsIMessage"] & 1) != 0
    || ([v10 isEqualToString:@"allowsPhone"] & 1) != 0
    || ([v10 isEqualToString:@"allowsEmail"] & 1) != 0
    || [v10 isEqualToString:@"allowsTTY"])
  {
    [(CNPropertySimpleTransportCell *)self updateTransportButtons];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNPropertySimpleTransportCell;
    [(CNPropertySimpleTransportCell *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateWithPropertyItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleTransportCell;
  [(CNPropertyCell *)&v4 updateWithPropertyItem:a3];
  [(CNPropertySimpleTransportCell *)self updateTransportButtons];
  [(CNPropertySimpleTransportCell *)self updateStarIcon];
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CNPropertyCell *)self propertyItem];
  id v6 = v5;
  if (v5)
  {
    [v5 removeObserver:self forKeyPath:@"allowsIMessage"];
    [v6 removeObserver:self forKeyPath:@"allowsPhone"];
    [v6 removeObserver:self forKeyPath:@"allowsEmail"];
    [v6 removeObserver:self forKeyPath:@"allowsTTY"];
  }
  v7.receiver = self;
  v7.super_class = (Class)CNPropertySimpleTransportCell;
  [(CNPropertyCell *)&v7 setCardGroupItem:v4];
  [v4 addObserver:self forKeyPath:@"allowsIMessage" options:0 context:0];
  [v4 addObserver:self forKeyPath:@"allowsPhone" options:0 context:0];
  [v4 addObserver:self forKeyPath:@"allowsEmail" options:0 context:0];
  [v4 addObserver:self forKeyPath:@"allowsTTY" options:0 context:0];

  [(CNPropertySimpleTransportCell *)self updateLabelNeedingHuggingContent];
}

- (void)updateLabelNeedingHuggingContent
{
  BOOL v3 = [(CNPropertySimpleTransportCell *)self shouldShowBadge]
    || [(CNPropertySimpleTransportCell *)self shouldShowStar];

  [(CNLabeledCell *)self setLabelViewNeedsHuggingContent:v3];
}

- (void)setShouldShowBadge:(BOOL)a3
{
  if (self->_shouldShowBadge == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_shouldShowBadge = a3;
  objc_super v5 = [(CNPropertySimpleTransportCell *)self badgeView];
  id v6 = [v5 superview];

  objc_super v7 = [(CNPropertySimpleTransportCell *)self badgeView];
  uint64_t v8 = v7;
  if (v6 && !v3)
  {
    [v7 removeFromSuperview];

    [(CNPropertySimpleTransportCell *)self setBadgeView:0];
LABEL_10:
    [(CNPropertySimpleTransportCell *)self setNeedsUpdateConstraints];
    goto LABEL_11;
  }
  v9 = [v7 superview];

  if (!v9 && v3)
  {
    id v10 = [(CNPropertySimpleTransportCell *)self badgeView];

    if (!v10)
    {
      id v11 = [(CNPropertySimpleTransportCell *)self standardBadgeView];
      [(CNPropertySimpleTransportCell *)self setBadgeView:v11];

      id v12 = [(CNPropertySimpleTransportCell *)self badgeView];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    objc_super v13 = [(CNPropertySimpleTransportCell *)self badgeView];
    [(CNPropertySimpleTransportCell *)self addSubview:v13];

    goto LABEL_10;
  }
LABEL_11:

  [(CNPropertySimpleTransportCell *)self updateLabelNeedingHuggingContent];
}

- (BOOL)shouldShowStar
{
  v2 = [(CNPropertyCell *)self propertyItem];
  char v3 = [v2 isFavorite];

  return v3;
}

- (UIView)standardBadgeView
{
  v2 = CNContactsUIBundle();
  char v3 = [v2 localizedStringForKey:@"RECENT_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  id v4 = +[CNLabeledBadge labeledBadgeWithText:v3];

  return (UIView *)v4;
}

- (CNTransportButton)transportIcon3
{
  transportIcon3 = self->_transportIcon3;
  if (!transportIcon3)
  {
    id v4 = [(CNPropertySimpleTransportCell *)self standardTransportIcon];
    objc_super v5 = self->_transportIcon3;
    self->_transportIcon3 = v4;

    transportIcon3 = self->_transportIcon3;
  }

  return transportIcon3;
}

- (CNTransportButton)transportIcon2
{
  transportIcon2 = self->_transportIcon2;
  if (!transportIcon2)
  {
    id v4 = [(CNPropertySimpleTransportCell *)self standardTransportIcon];
    objc_super v5 = self->_transportIcon2;
    self->_transportIcon2 = v4;

    transportIcon2 = self->_transportIcon2;
  }

  return transportIcon2;
}

- (CNTransportButton)transportIcon1
{
  transportIcon1 = self->_transportIcon1;
  if (!transportIcon1)
  {
    id v4 = [(CNPropertySimpleTransportCell *)self standardTransportIcon];
    objc_super v5 = self->_transportIcon1;
    self->_transportIcon1 = v4;

    transportIcon1 = self->_transportIcon1;
  }

  return transportIcon1;
}

- (CNTransportButton)standardTransportIcon
{
  char v3 = +[CNTransportButton transportButton];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setTransportType:0];
  [v3 addTarget:self action:sel_transportButtonClicked_ forControlEvents:64];

  return (CNTransportButton *)v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CNPropertySimpleTransportCell;
  [(CNPropertySimpleTransportCell *)&v11 layoutSubviews];
  if ([(CNPropertySimpleTransportCell *)self needsUpdateTouchAreas])
  {
    char v3 = [(CNPropertySimpleTransportCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    uint64_t v8 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    objc_msgSend(v8, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    v9 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    objc_msgSend(v9, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    id v10 = [(CNPropertySimpleTransportCell *)self transportIcon3];
    objc_msgSend(v10, "_updateTouchInsetsToFillContainerWithSize:", v5, v7);

    [(CNPropertySimpleTransportCell *)self setNeedsUpdateTouchAreas:0];
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v7 = a3;
  if (self->_starView) {
    [(id)objc_opt_class() _updateStarImageForView:self->_starView];
  }
  if (self->_shouldShowBadge)
  {
    double v4 = [(CNPropertySimpleTransportCell *)self badgeView];
    [v4 removeFromSuperview];

    double v5 = [(CNPropertySimpleTransportCell *)self standardBadgeView];
    [(CNPropertySimpleTransportCell *)self setBadgeView:v5];

    double v6 = [(CNPropertySimpleTransportCell *)self badgeView];
    [(CNPropertySimpleTransportCell *)self addSubview:v6];
  }
  [(CNPropertySimpleTransportCell *)self updateLabelNeedingHuggingContent];
}

- (void)prepareForReuse
{
  [(CNPropertySimpleTransportCell *)self setShouldShowBadge:0];
  v3.receiver = self;
  v3.super_class = (Class)CNPropertySimpleTransportCell;
  [(CNContactCell *)&v3 prepareForReuse];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleTransportCell;
  [(CNContactCell *)&v4 dealloc];
}

- (CNPropertySimpleTransportCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNPropertySimpleTransportCell;
  objc_super v4 = [(CNPropertyCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v4->_shouldShowTransportButtons = 0;
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:v4 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  return v4;
}

+ (id)standardStarView
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
  [a1 _updateStarImageForView:v3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 setContentHuggingPriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v3 setContentCompressionResistancePriority:1 forAxis:v7];

  return v3;
}

+ (void)_updateStarImageForView:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  double v5 = +[CNUIColorRepository contactCardStarImageColor];
  objc_msgSend(v3, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"star.fill", 1, v5, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setImage:v6];
}

@end