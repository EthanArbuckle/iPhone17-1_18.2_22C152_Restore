@interface CNCardSharedProfileCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)allowsCellSelection;
- (CNCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNCardSharedProfileCellActionDelegate)actionDelegate;
- (CNCardSharedProfileCellView)snapView;
- (CNContact)contact;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (id)constantConstraintsForHorizontalLayout;
- (id)constantConstraintsForVerticalLayout;
- (id)variableConstraints;
- (id)variableConstraintsForHorizontalLayout;
- (void)setActionDelegate:(id)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setCardGroupItem:(id)a3;
- (void)setContact:(id)a3;
- (void)setLabelTextAttributes:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setSnapView:(id)a3;
- (void)updateConstraints;
- (void)updateViewsWithCardGroupItem:(id)a3;
- (void)viewDidSelectDisplayPreference:(int64_t)a3;
- (void)viewDidSelectFallbackAction;
@end

@implementation CNCardSharedProfileCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_snapView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);

  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setSnapView:(id)a3
{
}

- (void)setActionDelegate:(id)a3
{
}

- (CNCardSharedProfileCellActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CNCardSharedProfileCellActionDelegate *)WeakRetained;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)viewDidSelectFallbackAction
{
  id v2 = [(CNCardSharedProfileCell *)self actionDelegate];
  [v2 presentAvatarPosterEditor];
}

- (void)viewDidSelectDisplayPreference:(int64_t)a3
{
  id v7 = [(CNPropertyCell *)self delegate];
  v5 = [(CNPropertyCell *)self propertyItem];
  v6 = [NSNumber numberWithInteger:a3];
  [v7 propertyCell:self didUpdateItem:v5 withNewValue:v6];
}

- (void)setSharedProfileStateOracle:(id)a3
{
  v6 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v6)
  {
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    v5 = [(CNCardSharedProfileCell *)self snapView];
    [v5 setSharedProfileStateOracle:v6];
  }
}

- (void)setLabelTextAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(CNCardSharedProfileCell *)self snapView];
  [v5 setLabelTextAttributes:v4];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CNCardSharedProfileCell;
  [(CNContactCell *)&v4 updateConstraints];
  v3 = [(CNCardSharedProfileCell *)self snapView];
  [v3 updateConstraints];
}

- (id)variableConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)constantConstraintsForHorizontalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)constantConstraintsForVerticalLayout
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)variableConstraints
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CNCardSharedProfileCell *)self snapView];

  if (v3)
  {
    v28 = [(CNCardSharedProfileCell *)self snapView];
    v26 = [v28 leadingAnchor];
    v27 = [(CNCardSharedProfileCell *)self contentView];
    v25 = [v27 layoutMarginsGuide];
    v24 = [v25 leadingAnchor];
    v23 = [v26 constraintEqualToAnchor:v24];
    v30[0] = v23;
    v22 = [(CNCardSharedProfileCell *)self snapView];
    v20 = [v22 trailingAnchor];
    v21 = [(CNCardSharedProfileCell *)self contentView];
    v19 = [v21 layoutMarginsGuide];
    v18 = [v19 trailingAnchor];
    v17 = [v20 constraintEqualToAnchor:v18];
    v30[1] = v17;
    v16 = [(CNCardSharedProfileCell *)self snapView];
    v15 = [v16 topAnchor];
    objc_super v4 = [(CNCardSharedProfileCell *)self contentView];
    id v5 = [v4 layoutMarginsGuide];
    v6 = [v5 topAnchor];
    id v7 = [v15 constraintEqualToAnchor:v6];
    v30[2] = v7;
    v8 = [(CNCardSharedProfileCell *)self snapView];
    v9 = [v8 bottomAnchor];
    v10 = [(CNCardSharedProfileCell *)self contentView];
    v11 = [v10 layoutMarginsGuide];
    v12 = [v11 bottomAnchor];
    v13 = [v9 constraintEqualToAnchor:v12];
    v30[3] = v13;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  }
  else
  {
    id v29 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

- (CNCardSharedProfileCellView)snapView
{
  snapView = self->_snapView;
  if (!snapView)
  {
    objc_super v4 = objc_alloc_init(CNCardSharedProfileCellView);
    id v5 = self->_snapView;
    self->_snapView = v4;

    [(CNCardSharedProfileCellView *)self->_snapView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(CNCardSharedProfileCell *)self sharedProfileStateOracle];
    [(CNCardSharedProfileCellView *)self->_snapView setSharedProfileStateOracle:v6];

    [(CNCardSharedProfileCellView *)self->_snapView setAllowsEditing:[(CNPropertyCell *)self allowsEditing]];
    snapView = self->_snapView;
  }

  return snapView;
}

- (void)updateViewsWithCardGroupItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contact];
  v6 = [(CNCardSharedProfileCell *)self snapView];
  [v6 setContact:v5];

  id v7 = [(CNCardSharedProfileCell *)self snapView];
  [v7 setPropertyItem:v4];

  v8 = [(CNCardSharedProfileCell *)self snapView];
  [v8 setDelegate:self];

  id v10 = [(CNCardSharedProfileCell *)self contentView];
  v9 = [(CNCardSharedProfileCell *)self snapView];
  [v10 addSubview:v9];
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNCardSharedProfileCell;
  [(CNPropertyCell *)&v11 setCardGroupItem:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(CNCardSharedProfileCell *)self updateViewsWithCardGroupItem:v7];
    v8 = [v7 contact];
    contact = self->_contact;
    self->_contact = v8;
  }
  else
  {
    id v10 = [(CNCardSharedProfileCell *)self snapView];
    [v10 removeFromSuperview];

    [(CNCardSharedProfileCell *)self setSnapView:0];
  }
}

- (void)setAllowsEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNCardSharedProfileCell *)self snapView];
  [v5 setAllowsEditing:v3];

  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCell;
  [(CNPropertyCell *)&v6 setAllowsEditing:v3];
}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (CNCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNCardSharedProfileCell;
  id v4 = [(CNPropertyCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4) {
    objc_super v6 = v4;
  }

  return v5;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end