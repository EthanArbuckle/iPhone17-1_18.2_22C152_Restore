@interface DIAttributePickerItem
+ (BOOL)supportsSecureCoding;
- (DIAttributePickerItem)initWithCoder:(id)a3;
- (DIAttributePickerItem)initWithName:(id)a3 value:(id)a4;
- (NSString)localizedDisplayName;
- (NSString)value;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIAttributePickerItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localizedDisplayName = self->_localizedDisplayName;
  id v5 = a3;
  [v5 encodeObject:localizedDisplayName forKey:@"localizedDisplayName"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (DIAttributePickerItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  v7 = [(DIAttributePickerItem *)self initWithName:v5 value:v6];
  return v7;
}

- (DIAttributePickerItem)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v14.receiver = self;
    v14.super_class = (Class)DIAttributePickerItem;
    v8 = [(DIAttributePickerItem *)&v14 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      localizedDisplayName = v8->_localizedDisplayName;
      v8->_localizedDisplayName = (NSString *)v9;

      uint64_t v11 = [v7 copy];
      value = v8->_value;
      v8->_value = (NSString *)v11;
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(DIAttributePickerItem *)self localizedDisplayName];
  [v3 appendFormat:@"localizedDisplayName: '%@'; ", v4];

  id v5 = [(DIAttributePickerItem *)self value];
  [v3 appendFormat:@"value: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end