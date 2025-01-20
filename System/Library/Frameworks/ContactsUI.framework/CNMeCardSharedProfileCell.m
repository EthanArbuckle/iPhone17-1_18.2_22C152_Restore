@interface CNMeCardSharedProfileCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)shouldPerformDefaultAction;
- (CNMeCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNMeCardSharedProfileCellContentView)meCardSharedProfileContentView;
- (id)constantConstraintsForHorizontalLayout;
- (id)constantConstraintsForVerticalLayout;
- (id)variableConstraints;
- (id)variableConstraintsForHorizontalLayout;
- (void)performDefaultAction;
- (void)setLabelTextAttributes:(id)a3;
- (void)setMeCardSharedProfileContentView:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setUpView;
- (void)updateConstraints;
- (void)updateViews;
@end

@implementation CNMeCardSharedProfileCell

- (void).cxx_destruct
{
}

- (void)setMeCardSharedProfileContentView:(id)a3
{
}

- (void)performDefaultAction
{
  objc_opt_class();
  v3 = [(CNContactCell *)self cardGroupItem];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 sharedProfileSettingsAction];
  [v6 setSharedProfileSettingsActionDelegate:self];

  id v7 = [v5 sharedProfileSettingsAction];

  [v7 performActionWithSender:self];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)setLabelTextAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
  [v5 setLabelTextAttributes:v4];
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
  v3 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];

  if (v3)
  {
    v28 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
    v26 = [v28 leadingAnchor];
    v27 = [(CNMeCardSharedProfileCell *)self contentView];
    v25 = [v27 layoutMarginsGuide];
    v24 = [v25 leadingAnchor];
    v23 = [v26 constraintEqualToAnchor:v24];
    v30[0] = v23;
    v22 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
    v20 = [v22 trailingAnchor];
    v21 = [(CNMeCardSharedProfileCell *)self contentView];
    v19 = [v21 layoutMarginsGuide];
    v18 = [v19 trailingAnchor];
    v17 = [v20 constraintEqualToAnchor:v18];
    v30[1] = v17;
    v16 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
    v15 = [v16 topAnchor];
    id v4 = [(CNMeCardSharedProfileCell *)self contentView];
    id v5 = [v4 layoutMarginsGuide];
    v6 = [v5 topAnchor];
    id v7 = [v15 constraintEqualToAnchor:v6];
    v30[2] = v7;
    v8 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
    v9 = [v8 bottomAnchor];
    v10 = [(CNMeCardSharedProfileCell *)self contentView];
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

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharedProfileCell;
  [(CNContactCell *)&v4 updateConstraints];
  v3 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
  [v3 updateConstraints];
}

- (void)setMeContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
  [v5 setMeContact:v4];
}

- (CNMeCardSharedProfileCellContentView)meCardSharedProfileContentView
{
  meCardSharedProfileContentView = self->_meCardSharedProfileContentView;
  if (!meCardSharedProfileContentView)
  {
    id v4 = objc_alloc_init(CNMeCardSharedProfileCellContentView);
    id v5 = self->_meCardSharedProfileContentView;
    self->_meCardSharedProfileContentView = v4;

    [(CNMeCardSharedProfileCellContentView *)self->_meCardSharedProfileContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    meCardSharedProfileContentView = self->_meCardSharedProfileContentView;
  }

  return meCardSharedProfileContentView;
}

- (void)updateViews
{
  id v2 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
  [v2 updateView];
}

- (void)setUpView
{
  v3 = [(CNMeCardSharedProfileCell *)self contentView];
  id v4 = [(CNMeCardSharedProfileCell *)self meCardSharedProfileContentView];
  [v3 addSubview:v4];

  [(CNMeCardSharedProfileCell *)self setAccessoryType:1];
  id v5 = +[CNUIColorRepository contactCardDisclosureAccessoryTintColor];
  [(CNMeCardSharedProfileCell *)self _setAccessoryTintColor:v5];
}

- (CNMeCardSharedProfileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharedProfileCell;
  id v4 = [(CNLabeledCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(CNMeCardSharedProfileCell *)v4 setUpView];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_nicknameStoreDidChange name:*MEMORY[0x1E4F1B780] object:0];

    id v7 = v5;
  }

  return v5;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end