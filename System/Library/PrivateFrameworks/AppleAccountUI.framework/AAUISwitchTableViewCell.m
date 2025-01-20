@interface AAUISwitchTableViewCell
- (AAUISwitchTableViewCell)initWithCoder:(id)a3;
- (AAUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AAUISwitchTableViewCellDelegate)delegate;
- (NSString)dataclass;
- (UISwitch)control;
- (void)_delegate_switchTableViewCellDidUpdateValue;
- (void)setDataclass:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AAUISwitchTableViewCell

- (AAUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISwitchTableViewCell;
  v4 = [(AAUISwitchTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    _AAUISwitchTableViewCellInit(v4);
  }
  return v5;
}

- (AAUISwitchTableViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUISwitchTableViewCell;
  v3 = [(AAUISwitchTableViewCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _AAUISwitchTableViewCellInit(v3);
  }
  return v4;
}

- (void)_delegate_switchTableViewCellDidUpdateValue
{
  id v3 = [(AAUISwitchTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 switchTableViewCellDidUpdateValue:self];
  }
}

- (UISwitch)control
{
  return self->_control;
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
}

- (AAUISwitchTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISwitchTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_control, 0);
}

@end