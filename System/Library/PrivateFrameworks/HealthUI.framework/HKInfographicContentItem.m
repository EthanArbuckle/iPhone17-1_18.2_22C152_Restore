@interface HKInfographicContentItem
- (HKInfographicContentItem)initWithTitle:(id)a3 description:(id)a4;
- (NSAttributedString)descriptionString;
- (NSAttributedString)titleString;
- (NSString)baseIdentifier;
- (void)setBaseIdentifier:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setTitleString:(id)a3;
@end

@implementation HKInfographicContentItem

- (HKInfographicContentItem)initWithTitle:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKInfographicContentItem;
  v8 = [(HKInfographicContentItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HKInfographicContentItem *)v8 setTitleString:v6];
    [(HKInfographicContentItem *)v9 setDescriptionString:v7];
  }

  return v9;
}

- (NSAttributedString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
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
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end