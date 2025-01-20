@interface DIAttributePicker
+ (BOOL)supportsSecureCoding;
- (DIAttributePicker)init;
- (DIAttributePicker)initWithCoder:(id)a3;
- (DIAttributePickerItem)defaultValue;
- (DIAttributePickerItem)getCurrentValue;
- (NSArray)pickerItems;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setPickerItems:(id)a3;
@end

@implementation DIAttributePicker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributePicker;
  id v4 = a3;
  [(DIAttribute *)&v5 encodeWithCoder:v4];
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pickerItems, @"pickerItems", v5.receiver, v5.super_class);

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributePicker)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIAttributePicker;
  objc_super v5 = [(DIAttribute *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"pickerItems"];
    pickerItems = v5->_pickerItems;
    v5->_pickerItems = (NSArray *)v9;
  }
  return v5;
}

- (DIAttributePicker)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIAttributePicker;
  v2 = [(DIAttribute *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DIAttribute *)v2 setAttributeType:5];
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  [(DIAttribute *)&v3 setCurrentValue:a3];
}

- (void)setDefaultValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DIAttributePicker;
  [(DIAttribute *)&v3 setDefaultValue:a3];
}

- (void)setPickerItems:(id)a3
{
  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_pickerItems != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    pickerItems = self->_pickerItems;
    self->_pickerItems = v4;
  }
  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributePickerItem)getCurrentValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributePicker;
  v2 = [(DIAttribute *)&v4 getCurrentValue];
  return (DIAttributePickerItem *)v2;
}

- (DIAttributePickerItem)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)DIAttributePicker;
  v2 = [(DIAttribute *)&v4 defaultValue];
  return (DIAttributePickerItem *)v2;
}

- (NSArray)pickerItems
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  objc_super v4 = self->_pickerItems;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v21.receiver = self;
  v21.super_class = (Class)DIAttributePicker;
  objc_super v4 = [(DIAttribute *)&v21 description];
  [v3 appendFormat:@"%@", v4];

  objc_super v5 = [(DIAttributePicker *)self defaultValue];
  v6 = [v5 description];
  [v3 appendFormat:@"defaultValue: '%@'; ", v6];

  uint64_t v7 = [(DIAttributePicker *)self getCurrentValue];
  v8 = [v7 description];
  [v3 appendFormat:@"currentValue: '%@'; ", v8];

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_pickerItems;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) description];
        [v3 appendFormat:@"    picker item: '%@'\n", v15];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  os_unfair_lock_unlock(p_lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end