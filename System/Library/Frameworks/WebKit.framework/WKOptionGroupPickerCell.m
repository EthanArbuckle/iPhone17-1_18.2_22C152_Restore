@interface WKOptionGroupPickerCell
- (WKOptionGroupPickerCell)initWithOptionItem:(const void *)a3;
- (double)labelWidthForBounds:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WKOptionGroupPickerCell

- (WKOptionGroupPickerCell)initWithOptionItem:(const void *)a3
{
  v4 = [(WKOptionPickerCell *)self init];
  if (v4)
  {
    if (*(void *)a3) {
      v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v5 = &stru_1EEA10550;
    }
    v6 = (__CFString *)[(__CFString *)v5 mutableCopy];
    CFStringTrimWhitespace(v6);
    [(UILabel *)[(UIPickerContentView *)v4 titleLabel] setText:v6];
    [(UIPickerContentView *)v4 setChecked:0];
    v7 = [(UIPickerContentView *)v4 titleLabel];
    -[UILabel setTextColor:](v7, "setTextColor:", [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5]);
    [(WKOptionPickerCell *)v4 setDisabled:1];
    if (v6) {
      CFRelease(v6);
    }
  }
  return v4;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);
  [MEMORY[0x1E4F42C70] _checkmarkOffset];
  return Width - v4;
}

- (void)layoutSubviews
{
  if ([(UIPickerContentView *)self titleLabel])
  {
    [(WKOptionGroupPickerCell *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [MEMORY[0x1E4F42C70] _checkmarkOffset];
    double v12 = v11;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    double MaxX = CGRectGetMaxX(v19);
    [MEMORY[0x1E4F42C70] _checkmarkOffset];
    double v15 = MaxX - v14;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    double Height = CGRectGetHeight(v20);
    v17 = [(UIPickerContentView *)self titleLabel];
    -[UILabel setFrame:](v17, "setFrame:", v12, 0.0, v15, Height);
  }
}

@end