@interface UNLocalizedString
+ (BOOL)supportsSecureCoding;
+ (id)localizedStringForKey:(id)a3 arguments:(id)a4 value:(id)a5;
- (BOOL)_allowsDirectEncoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)arguments;
- (NSString)key;
- (NSString)value;
- (UNLocalizedString)init;
- (UNLocalizedString)initWithCoder:(id)a3;
- (id)_initWithKey:(id)a3 arguments:(id)a4 value:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)un_localizedStringArguments;
- (id)un_localizedStringKey;
- (id)un_localizedStringValue;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation UNLocalizedString

+ (id)localizedStringForKey:(id)a3 arguments:(id)a4 value:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v12 = UNSafeCast(v11, v10);

  uint64_t v13 = objc_opt_class();
  v14 = UNSafeCast(v13, v9);

  if ([v12 length])
  {
    if (![v14 length])
    {
      id v15 = v12;

      v14 = v15;
    }
    uint64_t v16 = objc_opt_class();
    v17 = UNSafeCast(v16, v8);
    v18 = (void *)[objc_alloc((Class)a1) _initWithKey:v12 arguments:v17 value:v14];
  }
  else
  {
    v18 = (void *)[v14 copy];
  }

  return v18;
}

- (UNLocalizedString)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UNLocalizedString.m" lineNumber:33 description:@"use +_initWithValue: or +localizedStringWithKey:arguments:"];

  return 0;
}

- (id)_initWithKey:(id)a3 arguments:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNLocalizedString;
  uint64_t v11 = [(UNLocalizedString *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    key = v11->_key;
    v11->_key = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    arguments = v11->_arguments;
    v11->_arguments = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    value = v11->_value;
    v11->_value = (NSString *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(UNLocalizedString *)self arguments];
  uint64_t v4 = [v3 hash];
  v5 = [(UNLocalizedString *)self key];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UNLocalizedString *)self arguments];
    unint64_t v6 = [v4 arguments];
    if (UNEqualObjects(v5, v6))
    {
      v7 = [(UNLocalizedString *)self key];
      id v8 = [v4 key];
      char v9 = UNEqualObjects(v7, v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNLocalizedString *)self value];
  unint64_t v6 = [(UNLocalizedString *)self key];
  v7 = [(UNLocalizedString *)self arguments];
  id v8 = [v3 stringWithFormat:@"<%@: %p; value: %@, key: %@: arguments: %@>", v4, self, v5, v6, v7];

  return v8;
}

- (id)description
{
  v2 = (void *)[(NSString *)self->_value copy];

  return v2;
}

- (unint64_t)length
{
  return [(NSString *)self->_value length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_value characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UNLocalizedString;
  id v4 = a3;
  [(UNLocalizedString *)&v8 encodeWithCoder:v4];
  v5 = [(UNLocalizedString *)self arguments];
  [v4 encodeObject:v5 forKey:@"arguments"];

  unint64_t v6 = [(UNLocalizedString *)self key];
  [v4 encodeObject:v6 forKey:@"key"];

  v7 = [(UNLocalizedString *)self value];
  [v4 encodeObject:v7 forKey:@"value"];
}

- (UNLocalizedString)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_super v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  char v9 = [v5 decodeObjectOfClasses:v8 forKey:@"arguments"];

  id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  uint64_t v12 = [(UNLocalizedString *)self _initWithKey:v10 arguments:v9 value:v11];
  return v12;
}

- (id)un_localizedStringArguments
{
  v2 = (void *)[(NSArray *)self->_arguments copy];

  return v2;
}

- (id)un_localizedStringKey
{
  v2 = (void *)[(NSString *)self->_key copy];

  return v2;
}

- (id)un_localizedStringValue
{
  v2 = (void *)[(NSString *)self->_value copy];

  return v2;
}

- (NSString)key
{
  return self->_key;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end