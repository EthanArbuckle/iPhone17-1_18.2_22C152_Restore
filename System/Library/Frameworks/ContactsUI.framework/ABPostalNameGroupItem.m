@interface ABPostalNameGroupItem
- (CNMutableContact)contact;
- (NSString)placeholder;
- (NSString)property;
- (NSString)value;
- (SEL)setter;
- (void)setContact:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setProperty:(id)a3;
- (void)setSetter:(SEL)a3;
- (void)setValue:(id)a3;
@end

@implementation ABPostalNameGroupItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setProperty:(id)a3
{
}

- (NSString)property
{
  return self->_property;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setSetter:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_setter = v3;
}

- (SEL)setter
{
  if (self->_setter) {
    return self->_setter;
  }
  else {
    return 0;
  }
}

- (void)setContact:(id)a3
{
}

- (CNMutableContact)contact
{
  return self->_contact;
}

@end