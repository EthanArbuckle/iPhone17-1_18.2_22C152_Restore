@interface CNStarkFaceTimeCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)shouldShowStar;
- (BOOL)supportsTintColorValue;
- (CNPropertyCellDelegate)delegate;
- (CNStarkActionView)actionView;
- (CNStarkFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSDictionary)labelTextAttributes;
- (UILabel)faceTimeLabel;
- (id)constantConstraints;
- (id)variableConstraints;
- (void)_cnui_applyContactStyle;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)performDefaultAction;
- (void)setDelegate:(id)a3;
- (void)setFaceTimeLabel:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation CNStarkFaceTimeCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_faceTimeLabel, 0);
  objc_storeStrong((id *)&self->_labelTextAttributes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (CNStarkActionView)actionView
{
  return self->_actionView;
}

- (void)setFaceTimeLabel:(id)a3
{
}

- (UILabel)faceTimeLabel
{
  return self->_faceTimeLabel;
}

- (void)setLabelTextAttributes:(id)a3
{
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyCellDelegate *)WeakRetained;
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)performDefaultAction
{
  id v4 = [(CNStarkFaceTimeCell *)self delegate];
  v3 = [(CNContactCell *)self cardGroupItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:1];
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkFaceTimeCell;
  [(CNStarkFaceTimeCell *)&v3 setSeparatorStyle:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNStarkFaceTimeCell;
  [(CNStarkFaceTimeCell *)&v13 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 nextFocusedView];
  if (v7 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    v8 = [v6 previouslyFocusedView];
    BOOL v9 = v8 == self;
  }
  v10 = [v6 nextFocusedView];

  if (v9)
  {
    BOOL v11 = v10 == self;
    v12 = [(CNStarkFaceTimeCell *)self actionView];
    [v12 updateForFocusedState:v11];
  }
}

- (id)constantConstraints
{
  v27[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v26[0] = @"label";
  id v4 = [(CNStarkFaceTimeCell *)self faceTimeLabel];
  v26[1] = @"actionView";
  v27[0] = v4;
  v5 = [(CNStarkFaceTimeCell *)self actionView];
  v27[1] = v5;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  v23 = [(CNStarkFaceTimeCell *)self faceTimeLabel];
  v22 = [v23 centerYAnchor];
  id v6 = [(CNStarkFaceTimeCell *)self contentView];
  v7 = [v6 safeAreaLayoutGuide];
  v8 = [v7 centerYAnchor];
  BOOL v9 = [v22 constraintEqualToAnchor:v8];
  v25[0] = v9;
  v10 = [(CNStarkFaceTimeCell *)self contentView];
  BOOL v11 = [v10 heightAnchor];
  +[CNStarkContactPropertyCell minimumContentHeight];
  v12 = objc_msgSend(v11, "constraintEqualToConstant:");
  v25[1] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v3 addObjectsFromArray:v13];

  v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(64)-[actionView(==36)]-(12)-[label]-(>=12)-|" options:1024 metrics:0 views:v24];
  [v3 addObjectsFromArray:v14];

  v15 = [(CNStarkFaceTimeCell *)self actionView];
  v16 = [v15 centerYAnchor];
  v17 = [(CNStarkFaceTimeCell *)self contentView];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 centerYAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  return v3;
}

- (id)variableConstraints
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_cnui_applyContactStyle
{
  objc_super v3 = +[CNUIColorRepository carPlayTableViewCellBackgroundColor];
  [(CNStarkFaceTimeCell *)self setBackgroundColor:v3];

  id v4 = +[CNUIColorRepository carPlayTableViewCellTitleTextColor];
  v5 = [(CNStarkFaceTimeCell *)self faceTimeLabel];
  [v5 setTextColor:v4];

  id v7 = +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor];
  id v6 = [(CNStarkFaceTimeCell *)self faceTimeLabel];
  [v6 setHighlightedTextColor:v7];
}

- (CNStarkFaceTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CNStarkFaceTimeCell;
  id v4 = [(CNContactCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    faceTimeLabel = v4->_faceTimeLabel;
    v4->_faceTimeLabel = (UILabel *)v6;

    [(UILabel *)v4->_faceTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_faceTimeLabel setTextAlignment:4];
    v8 = CNContactsUIBundle();
    BOOL v9 = [v8 localizedStringForKey:@"PHONE_ACTION_VIDEO_CONFERENCE" value:&stru_1ED8AC728 table:@"Localized"];
    [(UILabel *)v4->_faceTimeLabel setText:v9];

    v10 = [(CNStarkFaceTimeCell *)v4 contentView];
    [v10 addSubview:v4->_faceTimeLabel];

    uint64_t v11 = +[CNStarkActionView propertyTransportButtonWithDelegate:v4];
    actionView = v4->_actionView;
    v4->_actionView = (CNStarkActionView *)v11;

    [(CNStarkActionView *)v4->_actionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNStarkActionView *)v4->_actionView setActionType:*MEMORY[0x1E4F1AD20]];
    [(CNStarkActionView *)v4->_actionView setEnabled:0];
    objc_super v13 = [(CNStarkFaceTimeCell *)v4 contentView];
    [v13 addSubview:v4->_actionView];

    v14 = v4;
  }

  return v4;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end