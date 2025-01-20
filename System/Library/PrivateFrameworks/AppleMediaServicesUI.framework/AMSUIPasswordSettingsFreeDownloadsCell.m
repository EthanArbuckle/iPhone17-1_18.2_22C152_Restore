@interface AMSUIPasswordSettingsFreeDownloadsCell
- (AMSUIPasswordSettingsFreeDownloadsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AMSUIPasswordSettingsFreeDownloadsCellDelegate)delegate;
- (UISwitch)toggle;
- (int64_t)selectionStyle;
- (void)_setup;
- (void)_toggleChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setToggle:(id)a3;
@end

@implementation AMSUIPasswordSettingsFreeDownloadsCell

- (AMSUIPasswordSettingsFreeDownloadsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUIPasswordSettingsFreeDownloadsCell;
  v4 = [(AMSUIPasswordSettingsFreeDownloadsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(AMSUIPasswordSettingsFreeDownloadsCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  v3 = (UISwitch *)objc_alloc_init(MEMORY[0x263F82C40]);
  toggle = self->_toggle;
  self->_toggle = v3;

  [(UISwitch *)self->_toggle addTarget:self action:sel__toggleChanged_ forControlEvents:4096];
  [(AMSUIPasswordSettingsFreeDownloadsCell *)self setAccessoryView:self->_toggle];
  id v5 = objc_alloc(MEMORY[0x263F82E00]);
  [(AMSUIPasswordSettingsFreeDownloadsCell *)self bounds];
  id v7 = (id)objc_msgSend(v5, "initWithFrame:");
  v6 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v6];

  [(AMSUIPasswordSettingsFreeDownloadsCell *)self setSelectedBackgroundView:v7];
}

- (int64_t)selectionStyle
{
  return 0;
}

- (void)_toggleChanged:(id)a3
{
  id v7 = a3;
  v4 = [(AMSUIPasswordSettingsFreeDownloadsCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(AMSUIPasswordSettingsFreeDownloadsCell *)self delegate];
    objc_msgSend(v6, "freeDownloadsToggle:changedValue:", v7, objc_msgSend(v7, "isOn"));
  }
}

- (AMSUIPasswordSettingsFreeDownloadsCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AMSUIPasswordSettingsFreeDownloadsCellDelegate *)a3;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end