@interface DNDMutableContactHandle
- (void)setContactIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation DNDMutableContactHandle

- (void)setContactIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  contactIdentifier = self->super._contactIdentifier;
  self->super._contactIdentifier = v4;
  MEMORY[0x1F41817F8](v4, contactIdentifier);
}

- (void)setType:(unint64_t)a3
{
  if (self->super._type != a3)
  {
    self->super._type = a3;
    self->super._normalizedValue = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)setValue:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  v5 = (void *)v4;
  value = self->super._value;
  if (value != (NSString *)v4)
  {
    v10 = (void *)v4;
    if (!v4 || !value || (uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:"), v5 = v10, (v4 & 1) == 0))
    {
      v7 = (NSString *)[v5 copy];
      v8 = self->super._value;
      self->super._value = v7;

      normalizedValue = self->super._normalizedValue;
      self->super._normalizedValue = 0;

      v5 = v10;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

@end