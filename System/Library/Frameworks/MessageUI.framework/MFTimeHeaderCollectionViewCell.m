@interface MFTimeHeaderCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFTimeHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFTimeHeaderCollectionViewCellDelegate)delegate;
- (UISwitch)switchView;
- (void)setDelegate:(id)a3;
- (void)setSwitchView:(id)a3;
- (void)showTimeWheelCell:(id)a3;
- (void)updateSecondaryTextWithTime:(id)a3 timeSwitchEnabled:(BOOL)a4;
@end

@implementation MFTimeHeaderCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFTimeHeaderCollectionViewCellIdentifier";
}

- (MFTimeHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MFTimeHeaderCollectionViewCell;
  v3 = -[MFTimeHeaderCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MFTimeHeaderCollectionViewCell *)v3 defaultContentConfiguration];
    v6 = _EFLocalizedString();
    [v5 setText:v6];

    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock"];
    [v5 setImage:v7];

    v8 = [MEMORY[0x1E4FB1618] datePickerHeaderColor];
    v9 = [v5 secondaryTextProperties];
    [v9 setColor:v8];

    [(MFTimeHeaderCollectionViewCell *)v4 setContentConfiguration:v5];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v10 placement:1];
    v17[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(MFTimeHeaderCollectionViewCell *)v4 setAccessories:v12];

    [v10 addTarget:v4 action:sel_showTimeWheelCell_ forControlEvents:4096];
    objc_storeWeak((id *)&v4->_switchView, v10);
    v13 = [MEMORY[0x1E4FB1498] clearConfiguration];
    v14 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v13 setBackgroundColor:v14];

    [(MFTimeHeaderCollectionViewCell *)v4 setBackgroundConfiguration:v13];
  }
  return v4;
}

- (void)showTimeWheelCell:(id)a3
{
  id v5 = a3;
  v4 = [(MFTimeHeaderCollectionViewCell *)self delegate];
  objc_msgSend(v4, "datePickerTimeHeaderCollectionViewCell:showTime:", self, objc_msgSend(v5, "isOn"));
}

- (void)updateSecondaryTextWithTime:(id)a3 timeSwitchEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatDate:style:", a3, 4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(MFTimeHeaderCollectionViewCell *)self contentConfiguration];
  [v6 setSecondaryText:v8];
  [(MFTimeHeaderCollectionViewCell *)self setContentConfiguration:v6];
  v7 = [(MFTimeHeaderCollectionViewCell *)self switchView];
  if ([v7 isOn] != v4)
  {
    [v7 setOn:v4];
    [(MFTimeHeaderCollectionViewCell *)self showTimeWheelCell:v7];
  }
}

- (MFTimeHeaderCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTimeHeaderCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)switchView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switchView);

  return (UISwitch *)WeakRetained;
}

- (void)setSwitchView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_switchView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end