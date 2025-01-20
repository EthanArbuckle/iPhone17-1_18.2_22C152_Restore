@interface SFSwitchTableViewCell
- (BOOL)isSwitchOn;
- (SFSwitchTableViewCell)initWithReuseIdentifier:(id)a3;
- (SFSwitchTableViewCellDelegate)delegate;
- (void)_switchViewStateDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSwitchOn:(BOOL)a3;
@end

@implementation SFSwitchTableViewCell

- (SFSwitchTableViewCell)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFSwitchTableViewCell;
  v3 = [(SFSwitchTableViewCell *)&v8 initWithStyle:0 reuseIdentifier:a3];
  if (v3)
  {
    v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    switchView = v3->_switchView;
    v3->_switchView = v4;

    [(UISwitch *)v3->_switchView addTarget:v3 action:sel__switchViewStateDidChange_ forControlEvents:4096];
    [(SFSwitchTableViewCell *)v3 setAccessoryView:v3->_switchView];
    v6 = v3;
  }

  return v3;
}

- (void)setSwitchOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISwitch *)self->_switchView isOn] != a3)
  {
    switchView = self->_switchView;
    [(UISwitch *)switchView setOn:v3];
  }
}

- (BOOL)isSwitchOn
{
  return [(UISwitch *)self->_switchView isOn];
}

- (void)_switchViewStateDidChange:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "switchTableViewCell:didChangeSwitchState:", self, objc_msgSend(v5, "isOn"));
  }
}

- (SFSwitchTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFSwitchTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_switchView, 0);
}

@end