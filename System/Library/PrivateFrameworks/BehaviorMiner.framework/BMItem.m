@interface BMItem
+ (BOOL)supportsSecureCoding;
+ (id)itemWithType:(id)a3 UUIDValue:(id)a4;
+ (id)itemWithType:(id)a3 numberValue:(id)a4;
+ (id)itemWithType:(id)a3 stringValue:(id)a4;
- (BMItem)initWithCoder:(id)a3;
- (BMItem)initWithType:(id)a3 normalizedValue:(id)a4;
- (BMItem)initWithType:(id)a3 value:(id)a4;
- (BMItem)initWithType:(id)a3 value:(id)a4 absoluteSupport:(unint64_t)a5;
- (BMItemType)type;
- (BOOL)isEqual:(id)a3;
- (NSString)normalizedValue;
- (NSString)uniformIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)value;
- (unint64_t)absoluteSupport;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteSupport:(unint64_t)a3;
@end

@implementation BMItem

+ (id)itemWithType:(id)a3 stringValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BMItem alloc] initWithType:v6 value:v5];

  return v7;
}

+ (id)itemWithType:(id)a3 numberValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BMItem alloc] initWithType:v6 value:v5];

  return v7;
}

+ (id)itemWithType:(id)a3 UUIDValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BMItem alloc] initWithType:v6 value:v5];

  return v7;
}

- (BMItem)initWithType:(id)a3 value:(id)a4
{
  return [(BMItem *)self initWithType:a3 value:a4 absoluteSupport:0];
}

- (BMItem)initWithType:(id)a3 value:(id)a4 absoluteSupport:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMItem;
  v11 = [(BMItem *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a3);
    v12->_absoluteSupport = a5;
    uint64_t v13 = BMItemNormalizedValueFromValue(v10);
    normalizedValue = v12->_normalizedValue;
    v12->_normalizedValue = (NSString *)v13;
  }
  return v12;
}

- (BMItem)initWithType:(id)a3 normalizedValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = BMItemValueFromNormalizedValue(v6, (void *)[v7 valueClass]);

  id v9 = [(BMItem *)self initWithType:v7 value:v8];
  return v9;
}

- (id)value
{
  v3 = [(BMItem *)self normalizedValue];
  v4 = [(BMItem *)self type];
  id v5 = BMItemValueFromNormalizedValue(v3, (void *)[v4 valueClass]);

  return v5;
}

- (NSString)uniformIdentifier
{
  v3 = NSString;
  v4 = [(BMItem *)self type];
  id v5 = [v4 identifier];
  id v6 = [(BMItem *)self normalizedValue];
  id v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMItem *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(BMItem *)self type];
      id v7 = [(BMItem *)v5 type];
      if ([v6 isEqual:v7])
      {
        v8 = [(BMItem *)self normalizedValue];
        id v9 = [(BMItem *)v5 normalizedValue];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(BMItem *)self type];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMItem *)self normalizedValue];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(BMItem *)self type];
  id v5 = [v4 identifier];
  unint64_t v6 = [(BMItem *)self value];
  id v7 = [v3 stringWithFormat:@"{%@: \"%@\"}", v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(BMItem *)self type];
  unint64_t v6 = [(BMItem *)self value];
  id v7 = (void *)[v4 initWithType:v5 value:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  if (objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    uint64_t v7 = [(id)objc_opt_class() itemWithType:v5 stringValue:v6];
  }
  else if (objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    uint64_t v7 = [(id)objc_opt_class() itemWithType:v5 numberValue:v6];
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend(v5, "valueClass"), "isEqual:", objc_opt_class()))
    {
      v8 = 0;
      goto LABEL_8;
    }
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    uint64_t v7 = [(id)objc_opt_class() itemWithType:v5 UUIDValue:v6];
  }
  v8 = (BMItem *)v7;

LABEL_8:
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  id v6 = [(BMItem *)self value];
  [v5 encodeObject:v6 forKey:@"value"];
}

- (BMItemType)type
{
  return self->_type;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (void)setAbsoluteSupport:(unint64_t)a3
{
  self->_absoluteSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end