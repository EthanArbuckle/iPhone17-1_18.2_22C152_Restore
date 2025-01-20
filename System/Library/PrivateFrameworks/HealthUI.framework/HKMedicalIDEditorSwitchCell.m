@interface HKMedicalIDEditorSwitchCell
- (HKMedicalIDEditorSwitchCell)initWithTitle:(id)a3 defaultState:(BOOL)a4;
- (HKMedicalIDEditorSwitchDelegate)delegate;
- (void)_switchSwitched:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUIDisabled;
@end

@implementation HKMedicalIDEditorSwitchCell

- (HKMedicalIDEditorSwitchCell)initWithTitle:(id)a3 defaultState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMedicalIDEditorSwitchCell;
  v7 = [(HKMedicalIDEditorSwitchCell *)&v16 initWithStyle:0 reuseIdentifier:@"HKMedicalIDEditorSwitchCellIdentifier"];
  v8 = v7;
  if (v7)
  {
    -[HKMedicalIDEditorSwitchCell setSeparatorInset:](v7, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v9 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    v10 = v8->_switch;
    v8->_switch = v9;

    [(UISwitch *)v8->_switch addTarget:v8 action:sel__switchSwitched_ forControlEvents:4096];
    [(HKMedicalIDEditorSwitchCell *)v8 setAccessoryView:v8->_switch];
    v11 = [(HKMedicalIDEditorSwitchCell *)v8 textLabel];
    [v11 setText:v6];

    v12 = [(HKMedicalIDEditorSwitchCell *)v8 textLabel];
    [v12 setNumberOfLines:0];

    v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    v14 = [(HKMedicalIDEditorSwitchCell *)v8 textLabel];
    [v14 setFont:v13];

    [(UISwitch *)v8->_switch setOn:v4];
  }

  return v8;
}

- (void)_switchSwitched:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v5 = [v4 isOn];

  [WeakRetained switchWasChanged:v5];
}

- (void)setUIDisabled
{
  [(HKMedicalIDEditorSwitchCell *)self setUserInteractionEnabled:0];
  v3 = [(HKMedicalIDEditorSwitchCell *)self textLabel];
  [v3 setEnabled:0];

  id v4 = self->_switch;
  [(UISwitch *)v4 setEnabled:0];
}

- (HKMedicalIDEditorSwitchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMedicalIDEditorSwitchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);
}

@end