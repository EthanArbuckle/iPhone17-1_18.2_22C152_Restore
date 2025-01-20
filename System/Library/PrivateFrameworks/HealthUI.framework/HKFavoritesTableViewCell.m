@interface HKFavoritesTableViewCell
+ (id)reuseIdentifier;
- (BOOL)isFavorited;
- (HKFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setFavorited:(BOOL)a3;
@end

@implementation HKFavoritesTableViewCell

- (HKFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)HKFavoritesTableViewCell;
  v4 = [(HKFavoritesTableViewCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    pin = v4->_pin;
    v4->_pin = v5;

    v7 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v8 = *MEMORY[0x1E4FB28C8];
    v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    v10 = [v7 configurationWithFont:v9];
    [(UIImageView *)v4->_pin setPreferredSymbolConfiguration:v10];

    v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pin.fill"];
    [(UIImageView *)v4->_pin setImage:v11];

    [(UIImageView *)v4->_pin setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v12 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(UIImageView *)v4->_pin setTintColor:v12];

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    slashPin = v4->_slashPin;
    v4->_slashPin = v13;

    v15 = (void *)MEMORY[0x1E4FB1830];
    v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v8);
    v17 = [v15 configurationWithFont:v16];
    [(UIImageView *)v4->_slashPin setPreferredSymbolConfiguration:v17];

    v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pin.slash.fill"];
    [(UIImageView *)v4->_slashPin setImage:v18];

    [(UIImageView *)v4->_slashPin setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    v19 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(UIImageView *)v4->_slashPin setTintColor:v19];

    [(HKFavoritesTableViewCell *)v4 setSelectionStyle:0];
    v20 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v8);
    v21 = [(HKFavoritesTableViewCell *)v4 textLabel];
    [v21 setFont:v20];

    [(HKFavoritesTableViewCell *)v4 setAccessoryView:v4->_pin];
  }
  return v4;
}

- (BOOL)isFavorited
{
  v2 = self;
  v3 = [(HKFavoritesTableViewCell *)self accessoryView];
  LOBYTE(v2) = v3 == v2->_slashPin;

  return (char)v2;
}

- (void)setFavorited:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = &OBJC_IVAR___HKFavoritesTableViewCell__pin;
  if (a3) {
    v5 = &OBJC_IVAR___HKFavoritesTableViewCell__slashPin;
  }
  [(HKFavoritesTableViewCell *)self setAccessoryView:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v10 = v6;
  if (v3) {
    v7 = @"UNPIN_FROM_SUMMARY";
  }
  else {
    v7 = @"PIN_TO_SUMMARY";
  }
  uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v9 = [(HKFavoritesTableViewCell *)self textLabel];
  [v9 setText:v8];
}

+ (id)reuseIdentifier
{
  return @"HKFavoritesTableViewCellIdentifier";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashPin, 0);
  objc_storeStrong((id *)&self->_pin, 0);
}

@end