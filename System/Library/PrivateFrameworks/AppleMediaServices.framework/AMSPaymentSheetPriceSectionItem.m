@interface AMSPaymentSheetPriceSectionItem
- (NSString)label;
- (NSString)price;
- (void)setLabel:(id)a3;
- (void)setPrice:(id)a3;
@end

@implementation AMSPaymentSheetPriceSectionItem

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end