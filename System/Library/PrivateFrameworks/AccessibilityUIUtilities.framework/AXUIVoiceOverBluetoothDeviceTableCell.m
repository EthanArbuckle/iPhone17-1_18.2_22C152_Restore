@interface AXUIVoiceOverBluetoothDeviceTableCell
+ (id)checkedImage;
+ (id)selectedCheckedImage;
+ (id)spacerImage;
+ (id)textForBTPairedState:(int)a3;
- (AXUIVoiceOverBluetoothDeviceTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_updateCheckMarkIcon;
- (void)dealloc;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setDeviceState:(int)a3;
- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4;
@end

@implementation AXUIVoiceOverBluetoothDeviceTableCell

- (AXUIVoiceOverBluetoothDeviceTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  v5 = [(PSTableCell *)&v10 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    uint64_t v6 = [objc_allocWithZone(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    [(UIActivityIndicatorView *)v5->_spinner setHidesWhenStopped:1];
    v8 = [(AXUIVoiceOverBluetoothDeviceTableCell *)v5 contentView];
    [v8 addSubview:v5->_spinner];

    [(AXUIVoiceOverBluetoothDeviceTableCell *)v5 _updateCheckMarkIcon];
  }
  return v5;
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)setChecked:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F60]) = a3;
  [(AXUIVoiceOverBluetoothDeviceTableCell *)self _updateCheckMarkIcon];
}

- (void)setDeviceState:(int)a3
{
  self->_state = a3;
  if ((a3 - 2) < 3)
  {
    uint64_t v4 = 4;
    goto LABEL_5;
  }
  if (a3 < 2)
  {
    uint64_t v4 = 0;
LABEL_5:
    [(AXUIVoiceOverBluetoothDeviceTableCell *)self setAccessoryType:v4];
    id v6 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self detailTextLabel];
    [v6 setText:0];
    goto LABEL_6;
  }
  if (a3 != 5) {
    return;
  }
  [(AXUIVoiceOverBluetoothDeviceTableCell *)self setAccessoryType:4];
  AXUILocalizedStringForKey(@"PAIRED_AND_CONNECTED");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self detailTextLabel];
  [v5 setText:v6];

LABEL_6:
}

- (void)setDeviceStatePaired:(BOOL)a3 andConnected:(BOOL)a4
{
  if (a4) {
    unsigned int v4 = 5;
  }
  else {
    unsigned int v4 = 2;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  [(AXUIVoiceOverBluetoothDeviceTableCell *)self setDeviceState:v5];
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  [(PSTableCell *)&v39 layoutSubviews];
  v38.receiver = self;
  v38.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  objc_super v3 = [(PSTableCell *)&v38 titleLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = [(PSTableCell *)self iconImageView];
  v11 = v10;
  if (v10)
  {
    [v10 frame];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[AXUIVoiceOverBluetoothDeviceTableCell semanticContentAttribute](self, "semanticContentAttribute"));
  unsigned int state = self->_state;
  BOOL v16 = state > 4;
  int v17 = (1 << state) & 0x1A;
  if (v16 || v17 == 0)
  {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    v30 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self contentView];
    [v30 frame];
    double v32 = v33;
  }
  else
  {
    [(UIActivityIndicatorView *)self->_spinner frame];
    double v20 = v19;
    double v22 = v21;
    if (v14)
    {
      v23 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self contentView];
      [v23 frame];
      double v25 = v24 - v20 + -10.0;
    }
    else
    {
      double v25 = 10.0;
    }
    v26 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self contentView];
    [v26 frame];
    float v28 = (v27 - v22) * 0.5;
    double v29 = floorf(v28);

    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v25, v29, v20, v22);
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
    v30 = [(AXUIVoiceOverBluetoothDeviceTableCell *)self contentView];
    [v30 frame];
    double v32 = v31 - v20;
  }

  double v34 = v32 + -20.0 + -12.0 - v13;
  [(AXUIVoiceOverBluetoothDeviceTableCell *)self _updateCheckMarkIcon];
  if (v14)
  {
    [v11 frame];
    double v5 = CGRectGetMinX(v40) + 10.0;
  }
  objc_msgSend(v3, "setFrame:", v5, v7, v34, v9);
  [v3 setNeedsDisplay];
  if ((self->_state & 0xFFFFFFFE) == 4) {
    [MEMORY[0x1E4FB1618] tableCellValue1BlueColor];
  }
  else {
  v35 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v37.receiver = self;
  v37.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  v36 = [(PSTableCell *)&v37 titleLabel];
  [v36 setTextColor:v35];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverBluetoothDeviceTableCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(AXUIVoiceOverBluetoothDeviceTableCell *)self _updateCheckMarkIcon];
}

- (void)_updateCheckMarkIcon
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F60]);
  objc_super v4 = [(PSTableCell *)self iconImageView];
  if (v3)
  {
    double v5 = +[AXUIVoiceOverBluetoothDeviceTableCell checkedImage];
    [v4 setImage:v5];

    id v8 = [(PSTableCell *)self iconImageView];
    double v6 = +[AXUIVoiceOverBluetoothDeviceTableCell selectedCheckedImage];
    [v8 setHighlightedImage:v6];
  }
  else
  {
    double v7 = +[AXUIVoiceOverBluetoothDeviceTableCell spacerImage];
    [v4 setImage:v7];

    id v8 = [(PSTableCell *)self iconImageView];
    [v8 setHighlightedImage:0];
  }
}

+ (id)spacerImage
{
  v2 = (void *)spacerImage__spacer;
  if (!spacerImage__spacer)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1818] imageNamed:@"SearchResultsCheckmarkClear.png"];
    objc_super v4 = (void *)spacerImage__spacer;
    spacerImage__spacer = v3;

    v2 = (void *)spacerImage__spacer;
  }
  return v2;
}

+ (id)checkedImage
{
  v2 = (void *)checkedImage__checkedImage;
  if (!checkedImage__checkedImage)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    objc_super v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v5 = [v3 imageWithTintColor:v4 renderingMode:1];
    double v6 = (void *)checkedImage__checkedImage;
    checkedImage__checkedImage = v5;

    v2 = (void *)checkedImage__checkedImage;
  }
  return v2;
}

+ (id)selectedCheckedImage
{
  v2 = (void *)selectedCheckedImage__selectedChecked;
  if (!selectedCheckedImage__selectedChecked)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UIPreferencesWhiteCheck.png"];
    objc_super v4 = (void *)selectedCheckedImage__selectedChecked;
    selectedCheckedImage__selectedChecked = v3;

    v2 = (void *)selectedCheckedImage__selectedChecked;
  }
  return v2;
}

+ (id)textForBTPairedState:(int)a3
{
  objc_super v4 = [MEMORY[0x1E4F28E78] string];
  if (a3 > 5)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = AXUILocalizedStringForKey(off_1E649C6D8[a3]);
  }
  if ([v5 length]) {
    [v4 appendString:v5];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end