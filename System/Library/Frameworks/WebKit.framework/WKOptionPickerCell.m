@interface WKOptionPickerCell
- (BOOL)_isSelectable;
- (BOOL)disabled;
- (WKOptionPickerCell)init;
- (WKOptionPickerCell)initWithOptionItem:(const void *)a3;
- (void)setDisabled:(BOOL)a3;
@end

@implementation WKOptionPickerCell

- (BOOL)_isSelectable
{
  return ![(WKOptionPickerCell *)self disabled];
}

- (WKOptionPickerCell)init
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9.receiver = self;
  v9.super_class = (Class)WKOptionPickerCell;
  v6 = -[WKOptionPickerCell initWithFrame:](&v9, sel_initWithFrame_, v2, v3, v4, v5);
  v7 = v6;
  if (v6) {
    [(UILabel *)[(UIPickerContentView *)v6 titleLabel] setLineBreakMode:5];
  }
  return v7;
}

- (WKOptionPickerCell)initWithOptionItem:(const void *)a3
{
  double v4 = [(WKOptionPickerCell *)self init];
  if (v4)
  {
    if (*(void *)a3) {
      double v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      double v5 = &stru_1EEA10550;
    }
    v6 = (__CFString *)[(__CFString *)v5 mutableCopy];
    CFStringTrimWhitespace(v6);
    [(UILabel *)[(UIPickerContentView *)v4 titleLabel] setText:v6];
    [(UIPickerContentView *)v4 setChecked:*((unsigned __int8 *)a3 + 9)];
    [(WKOptionPickerCell *)v4 setDisabled:*((unsigned __int8 *)a3 + 10)];
    if (*((unsigned char *)&v4->super._pickerContentViewFlags + 4))
    {
      v7 = [(UIPickerContentView *)v4 titleLabel];
      -[UILabel setTextColor:](v7, "setTextColor:", [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.300000012]);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  return v4;
}

- (BOOL)disabled
{
  return *((unsigned char *)&self->super._pickerContentViewFlags + 4);
}

- (void)setDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super._pickerContentViewFlags + 4) = a3;
}

@end