@interface HKInfographicLinkedTextItem
- (HKInfographicLinkedTextItem)initWithDescription:(id)a3 didTapLinkedText:(id)a4;
- (NSAttributedString)descriptionString;
- (NSString)baseIdentifier;
- (id)didTapLinkedText;
- (void)setBaseIdentifier:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setDidTapLinkedText:(id)a3;
@end

@implementation HKInfographicLinkedTextItem

- (HKInfographicLinkedTextItem)initWithDescription:(id)a3 didTapLinkedText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKInfographicLinkedTextItem;
  v8 = [(HKInfographicLinkedTextItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HKInfographicLinkedTextItem *)v8 setDescriptionString:v6];
    [(HKInfographicLinkedTextItem *)v9 setDidTapLinkedText:v7];
  }

  return v9;
}

- (NSAttributedString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
}

- (id)didTapLinkedText
{
  return self->_didTapLinkedText;
}

- (void)setDidTapLinkedText:(id)a3
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
  objc_storeStrong(&self->_didTapLinkedText, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end