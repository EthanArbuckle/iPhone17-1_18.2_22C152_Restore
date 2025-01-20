@interface HUSetupCodeFieldItem
- (BOOL)isActive;
- (HUSetupCodeFieldItem)init;
- (NSNumber)value;
- (UILabel)digitLabel;
- (unint64_t)itemNumber;
- (void)activate;
- (void)clear;
- (void)deactivate;
- (void)setActive:(BOOL)a3;
- (void)setDigitLabel:(id)a3;
- (void)setItemNumber:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation HUSetupCodeFieldItem

- (HUSetupCodeFieldItem)init
{
  v14.receiver = self;
  v14.super_class = (Class)HUSetupCodeFieldItem;
  v2 = [(HUSetupCodeFieldItem *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_active = 0;
    v2->_itemNumber = 0;
    value = v2->_value;
    v2->_value = 0;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    digitLabel = v3->_digitLabel;
    v3->_digitLabel = v5;

    [(UILabel *)v3->_digitLabel setAutoresizingMask:18];
    [(UILabel *)v3->_digitLabel setTextAlignment:1];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
    [(UILabel *)v3->_digitLabel setFont:v7];

    [(HUSetupCodeFieldItem *)v3 addSubview:v3->_digitLabel];
    [(UILabel *)v3->_digitLabel setClipsToBounds:0];
    [(HUSetupCodeFieldItem *)v3 setClipsToBounds:0];
    id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
    uint64_t v9 = [v8 CGColor];
    v10 = [(HUSetupCodeFieldItem *)v3 layer];
    [v10 setBorderColor:v9];

    v11 = [(HUSetupCodeFieldItem *)v3 layer];
    [v11 setBorderWidth:2.0];

    v12 = [(HUSetupCodeFieldItem *)v3 layer];
    [v12 setCornerRadius:6.0];
  }
  return v3;
}

- (void)setValue:(id)a3
{
  id v9 = a3;
  id v5 = [(HUSetupCodeFieldItem *)self value];

  if (v5 != v9)
  {
    objc_storeStrong((id *)&self->_value, a3);
    v6 = [(HUSetupCodeFieldItem *)self value];
    v7 = [v6 stringValue];
    id v8 = [(HUSetupCodeFieldItem *)self digitLabel];
    [v8 setText:v7];
  }
}

- (void)activate
{
}

- (void)deactivate
{
}

- (void)clear
{
}

- (unint64_t)itemNumber
{
  return self->_itemNumber;
}

- (void)setItemNumber:(unint64_t)a3
{
  self->_itemNumber = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (UILabel)digitLabel
{
  return self->_digitLabel;
}

- (void)setDigitLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitLabel, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end