@interface HKInfographicTextItem
- (HKInfographicTextItem)initWithDescription:(id)a3;
- (NSAttributedString)descriptionString;
- (NSString)baseIdentifier;
- (void)setBaseIdentifier:(id)a3;
- (void)setDescriptionString:(id)a3;
@end

@implementation HKInfographicTextItem

- (HKInfographicTextItem)initWithDescription:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKInfographicTextItem;
  v5 = [(HKInfographicTextItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HKInfographicTextItem *)v5 setDescriptionString:v4];
  }

  return v6;
}

- (NSAttributedString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
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
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end