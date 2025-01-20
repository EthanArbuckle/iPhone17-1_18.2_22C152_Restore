@interface FIUIHealthSettingsTableViewCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)resignFirstResponder;
- (FIUIHealthSettingsForceUpdatable)forceUpdatable;
- (FIUIHealthSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)inputView;
- (void)setForceUpdatable:(id)a3;
- (void)setInputView:(id)a3;
@end

@implementation FIUIHealthSettingsTableViewCell

- (FIUIHealthSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)FIUIHealthSettingsTableViewCell;
  v4 = [(FIUIHealthSettingsTableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(FIUIHealthSettingsTableViewCell *)v4 setAccessoryType:0];
    [(FIUIHealthSettingsTableViewCell *)v5 setEditingAccessoryType:0];
    [(FIUIHealthSettingsTableViewCell *)v5 setSelectionStyle:0];
    v6 = [MEMORY[0x263F825C8] whiteColor];
    v7 = [(FIUIHealthSettingsTableViewCell *)v5 textLabel];
    [v7 setTextColor:v6];

    v8 = [MEMORY[0x263F825C8] grayColor];
    v9 = [(FIUIHealthSettingsTableViewCell *)v5 detailTextLabel];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83468]];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570] compatibleWithTraitCollection:v10];
    v12 = [(FIUIHealthSettingsTableViewCell *)v5 textLabel];
    [v12 setFont:v11];

    v13 = [(FIUIHealthSettingsTableViewCell *)v5 detailTextLabel];
    [v13 setFont:v11];
  }
  return v5;
}

- (void)setInputView:(id)a3
{
}

- (id)inputView
{
  return self->_inputView;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIHealthSettingsTableViewCell;
  [(FIUIHealthSettingsTableViewCell *)&v6 becomeFirstResponder];
  v3 = [(FIUIHealthSettingsTableViewCell *)self tintColor];
  v4 = [(FIUIHealthSettingsTableViewCell *)self detailTextLabel];
  [v4 setTextColor:v3];

  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIHealthSettingsTableViewCell;
  [(FIUIHealthSettingsTableViewCell *)&v6 resignFirstResponder];
  v3 = [MEMORY[0x263F825C8] grayColor];
  v4 = [(FIUIHealthSettingsTableViewCell *)self detailTextLabel];
  [v4 setTextColor:v3];

  return 1;
}

- (FIUIHealthSettingsForceUpdatable)forceUpdatable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forceUpdatable);
  return (FIUIHealthSettingsForceUpdatable *)WeakRetained;
}

- (void)setForceUpdatable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forceUpdatable);
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end