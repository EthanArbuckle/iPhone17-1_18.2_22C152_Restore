@interface CalXMLAttributeRedactionRule
- (int)attributeName;
- (int)attributeValue;
- (void)setAttributeName:(int)a3;
- (void)setAttributeValue:(int)a3;
@end

@implementation CalXMLAttributeRedactionRule

- (int)attributeName
{
  return self->_attributeName;
}

- (void)setAttributeName:(int)a3
{
  self->_attributeName = a3;
}

- (int)attributeValue
{
  return self->_attributeValue;
}

- (void)setAttributeValue:(int)a3
{
  self->_attributeValue = a3;
}

@end