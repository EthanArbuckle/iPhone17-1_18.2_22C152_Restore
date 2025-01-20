@interface CNContactActionCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)shouldPerformDefaultAction;
- (CNContactAction)action;
- (CNTransportButton)transportIcon;
- (UILabel)label;
- (double)minCellHeight;
- (id)labelView;
- (id)rightMostView;
- (id)variableConstraints;
- (void)setCardGroupItem:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setTransportIcon:(id)a3;
- (void)tintColorDidChange;
@end

@implementation CNContactActionCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIcon, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setTransportIcon:(id)a3
{
}

- (CNTransportButton)transportIcon
{
  return self->_transportIcon;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)tintColorDidChange
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CNContactActionCell;
  [(CNLabeledCell *)&v5 tintColorDidChange];
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v3 = [(UIView *)self tintColorOverride];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [self cn_updateDictionaryForKey:@"labelTextAttributes" withChanges:v4];
}

- (id)variableConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v16.receiver = self;
  v16.super_class = (Class)CNContactActionCell;
  v4 = [(CNLabeledCell *)&v16 variableConstraints];
  objc_super v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(CNContactActionCell *)self transportIcon];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = [(CNContactActionCell *)self transportIcon];
    v9 = [(CNContactActionCell *)self labelView];
    v10 = [v7 constraintWithItem:v8 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = [(CNContactActionCell *)self labelView];
    v13 = [(CNContactActionCell *)self transportIcon];
    v14 = [v11 constraintWithItem:v12 attribute:6 relatedBy:0 toItem:v13 attribute:5 multiplier:1.0 constant:-16.0];
    [v5 addObject:v14];
  }

  return v5;
}

- (CNContactAction)action
{
  v2 = [(CNContactActionCell *)self actionGroupItem];
  v3 = [v2 actions];
  v4 = [v3 objectAtIndexedSubscript:0];

  return (CNContactAction *)v4;
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactCell *)self cardGroupItem];

  if (v5 != v4)
  {
    v26.receiver = self;
    v26.super_class = (Class)CNContactActionCell;
    [(CNContactCell *)&v26 setCardGroupItem:v4];
    uint64_t v6 = [(CNContactActionCell *)self action];
    v7 = [v6 title];
    v8 = [(CNContactActionCell *)self label];
    [v8 setText:v7];

    v9 = [(CNContactActionCell *)self action];
    uint64_t v10 = [v9 transportType];

    v11 = [(CNContactActionCell *)self transportIcon];
    v12 = v11;
    if (v10)
    {

      if (!v12)
      {
        v13 = +[CNTransportButton transportButton];
        [(CNContactActionCell *)self setTransportIcon:v13];

        v14 = [(CNContactActionCell *)self transportIcon];
        [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

        v15 = [(CNContactActionCell *)self contentView];
        objc_super v16 = [(CNContactActionCell *)self transportIcon];
        [v15 addSubview:v16];

        [(CNContactActionCell *)self setNeedsUpdateConstraints];
      }
      v17 = [(CNContactActionCell *)self action];
      v18 = [v17 glyphColor];
      v19 = [(CNContactActionCell *)self transportIcon];
      [v19 setGlyphColor:v18];

      v20 = [(CNContactActionCell *)self action];
      uint64_t v21 = [v20 transportType];
      v22 = [(CNContactActionCell *)self transportIcon];
      [v22 setTransportType:v21];

      v23 = [(CNContactActionCell *)self action];
      uint64_t v24 = [v23 showBackgroundPlatter];
      v25 = [(CNContactActionCell *)self transportIcon];
      [v25 setShowBackgroundPlatter:v24];
    }
    else
    {
      [v11 removeFromSuperview];

      [(CNContactActionCell *)self setTransportIcon:0];
      [(CNContactActionCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setLabelTextAttributes:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) != 0
    || ([(CNContactActionCell *)self action],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 wrapTitle],
        v5,
        v6))
  {
    v7 = [(CNContactActionCell *)self label];
    [v7 setNumberOfLines:0];

    v8 = [(CNContactActionCell *)self label];
    v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    v11 = [(CNContactActionCell *)self label];
    [v11 setNumberOfLines:1];

    v8 = [(CNContactActionCell *)self label];
    v9 = v8;
    uint64_t v10 = 4;
  }
  [v8 setLineBreakMode:v10];

  v12 = [(CNContactActionCell *)self action];
  v13 = [v12 color];

  if (v13)
  {
    v14 = (void *)[v4 mutableCopy];
    v15 = [(CNContactActionCell *)self action];
    objc_super v16 = [v15 color];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    v22.receiver = self;
    v22.super_class = (Class)CNContactActionCell;
    [(CNLabeledCell *)&v22 setLabelTextAttributes:v14];
  }
  else
  {
    v17 = [(CNContactActionCell *)self action];
    int v18 = [v17 isDestructive];

    if (!v18)
    {
      v20.receiver = self;
      v20.super_class = (Class)CNContactActionCell;
      [(CNLabeledCell *)&v20 setLabelTextAttributes:v4];
      goto LABEL_11;
    }
    v14 = (void *)[v4 mutableCopy];
    v19 = +[CNUIColorRepository contactCardDestructiveActionTitleTextColor];
    [v14 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    v21.receiver = self;
    v21.super_class = (Class)CNContactActionCell;
    [(CNLabeledCell *)&v21 setLabelTextAttributes:v14];
  }

LABEL_11:
}

- (id)rightMostView
{
  v3 = [(CNContactActionCell *)self transportIcon];

  if (v3)
  {
    id v4 = [(CNContactActionCell *)self transportIcon];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNContactActionCell;
    id v4 = [(CNLabeledCell *)&v6 rightMostView];
  }

  return v4;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (double)minCellHeight
{
  return 44.0;
}

- (id)labelView
{
  label = self->_label;
  if (!label)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_label;
    self->_label = v4;

    label = self->_label;
  }

  return label;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end