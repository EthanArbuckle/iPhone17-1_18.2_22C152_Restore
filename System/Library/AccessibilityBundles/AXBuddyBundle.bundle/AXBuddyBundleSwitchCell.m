@interface AXBuddyBundleSwitchCell
- (AXBuddyBundleSwitchCell)initWithCoder:(id)a3;
- (AXBuddyBundleSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AXBuddyBundleSwitchCellDelegate)delegate;
- (id)_commonSwitchCellInit;
- (void)setDelegate:(id)a3;
- (void)setSwitchValue:(BOOL)a3;
- (void)switchChanged:(id)a3;
@end

@implementation AXBuddyBundleSwitchCell

- (id)_commonSwitchCellInit
{
  v3 = (UISwitch *)objc_opt_new();
  theSwitch = self->_theSwitch;
  self->_theSwitch = v3;

  [(AXBuddyBundleSwitchCell *)self setAccessoryView:self->_theSwitch];
  [(UISwitch *)self->_theSwitch addTarget:self action:"switchChanged:" forControlEvents:4096];
  return self;
}

- (AXBuddyBundleSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXBuddyBundleSwitchCell;
  v4 = [(AXBuddyBundleTableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = [(AXBuddyBundleSwitchCell *)v4 _commonSwitchCellInit];

  return v5;
}

- (AXBuddyBundleSwitchCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXBuddyBundleSwitchCell;
  v3 = [(AXBuddyBundleTableCell *)&v6 initWithCoder:a3];
  v4 = [(AXBuddyBundleSwitchCell *)v3 _commonSwitchCellInit];

  return v4;
}

- (void)switchChanged:(id)a3
{
  id v4 = [(AXBuddyBundleSwitchCell *)self delegate];
  objc_msgSend(v4, "buddyBundleSwitchCell:switchChangedTo:", self, -[UISwitch isOn](self->_theSwitch, "isOn"));
}

- (void)setSwitchValue:(BOOL)a3
{
}

- (AXBuddyBundleSwitchCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXBuddyBundleSwitchCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_theSwitch, 0);
}

@end