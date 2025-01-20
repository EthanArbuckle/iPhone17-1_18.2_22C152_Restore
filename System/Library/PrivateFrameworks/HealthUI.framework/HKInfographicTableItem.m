@interface HKInfographicTableItem
- (BOOL)separatorHidden;
- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4;
- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4 separatorHidden:(BOOL)a5;
- (NSAttributedString)titleString;
- (NSAttributedString)valueString;
- (NSString)baseIdentifier;
- (void)setBaseIdentifier:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setTitleString:(id)a3;
- (void)setValueString:(id)a3;
@end

@implementation HKInfographicTableItem

- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4
{
  return [(HKInfographicTableItem *)self initWithTitle:a3 value:a4 separatorHidden:0];
}

- (HKInfographicTableItem)initWithTitle:(id)a3 value:(id)a4 separatorHidden:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKInfographicTableItem;
  v10 = [(HKInfographicTableItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(HKInfographicTableItem *)v10 setTitleString:v8];
    [(HKInfographicTableItem *)v11 setValueString:v9];
    [(HKInfographicTableItem *)v11 setSeparatorHidden:v5];
  }

  return v11;
}

- (NSAttributedString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSAttributedString)valueString
{
  return self->_valueString;
}

- (void)setValueString:(id)a3
{
}

- (BOOL)separatorHidden
{
  return self->_separatorHidden;
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->_separatorHidden = a3;
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end