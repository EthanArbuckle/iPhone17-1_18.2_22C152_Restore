@interface HUGridServiceCellTextConfiguration
- (HFServiceNameComponents)nameComponents;
- (HFStringGenerator)descriptionText;
- (UIColor)descriptionTextColor;
- (UIColor)nameTextColor;
- (UIVisualEffect)descriptionTextEffect;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextColor:(id)a3;
- (void)setDescriptionTextEffect:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setNameTextColor:(id)a3;
@end

@implementation HUGridServiceCellTextConfiguration

- (UIColor)nameTextColor
{
  nameTextColor = self->_nameTextColor;
  if (nameTextColor)
  {
    v3 = nameTextColor;
  }
  else
  {
    v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  }

  return v3;
}

- (HFServiceNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (HFStringGenerator)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (void)setNameTextColor:(id)a3
{
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (void)setDescriptionTextColor:(id)a3
{
}

- (UIVisualEffect)descriptionTextEffect
{
  return self->_descriptionTextEffect;
}

- (void)setDescriptionTextEffect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionTextEffect, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_nameTextColor, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end