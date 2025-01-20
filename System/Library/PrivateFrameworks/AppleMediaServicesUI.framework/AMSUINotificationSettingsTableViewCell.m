@interface AMSUINotificationSettingsTableViewCell
- (AMSNotificationSettingsItem)item;
- (AMSUINotificationInAppSettingsTableViewCellDelegate)delegate;
- (AMSUINotificationSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UISwitch)itemSwitch;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setItemSwitch:(id)a3;
- (void)switchToggled:(id)a3;
@end

@implementation AMSUINotificationSettingsTableViewCell

- (AMSUINotificationSettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AMSUINotificationSettingsTableViewCell;
  v4 = [(AMSUINotificationSettingsTableViewCell *)&v11 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F82C40]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    itemSwitch = v4->_itemSwitch;
    v4->_itemSwitch = (UISwitch *)v6;

    [(UISwitch *)v4->_itemSwitch addTarget:v4 action:sel_switchToggled_ forControlEvents:4096];
    [(AMSUINotificationSettingsTableViewCell *)v4 setAccessoryView:v4->_itemSwitch];
    v8 = [(AMSUINotificationSettingsTableViewCell *)v4 textLabel];
    [v8 setNumberOfLines:0];

    v9 = [(AMSUINotificationSettingsTableViewCell *)v4 textLabel];
    [v9 setLineBreakMode:0];

    [(AMSUINotificationSettingsTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  id v5 = a3;
  uint64_t v6 = [v5 title];
  v7 = [(AMSUINotificationSettingsTableViewCell *)self textLabel];
  [v7 setText:v6];

  v8 = [v5 desc];
  v9 = [(AMSUINotificationSettingsTableViewCell *)self detailTextLabel];
  [v9 setText:v8];

  uint64_t v10 = [v5 isEnabled];
  id v11 = [(AMSUINotificationSettingsTableViewCell *)self itemSwitch];
  [v11 setOn:v10];
}

- (void)switchToggled:(id)a3
{
  uint64_t v4 = [a3 isOn];
  uint64_t v5 = [(AMSUINotificationSettingsTableViewCell *)self item];
  [(id)v5 setEnabled:v4];

  uint64_t v6 = [(AMSUINotificationSettingsTableViewCell *)self delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = [(AMSUINotificationSettingsTableViewCell *)self delegate];
    v7 = [(AMSUINotificationSettingsTableViewCell *)self itemSwitch];
    v8 = [(AMSUINotificationSettingsTableViewCell *)self item];
    [v9 notificationInAppSettingsTableViewCellDidToggleValue:v7 forItem:v8];
  }
}

- (AMSUINotificationInAppSettingsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUINotificationInAppSettingsTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSNotificationSettingsItem)item
{
  return self->_item;
}

- (UISwitch)itemSwitch
{
  return self->_itemSwitch;
}

- (void)setItemSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSwitch, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end