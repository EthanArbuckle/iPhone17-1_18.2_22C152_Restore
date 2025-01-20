@interface CHHandle
+ (BOOL)supportsSecureCoding;
+ (id)normalizedEmailAddressHandleForValue:(id)a3;
+ (id)normalizedGenericHandleForValue:(id)a3;
+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4;
+ (int64_t)handleTypeForValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandle:(id)a3;
- (BOOL)isPseudonym;
- (BOOL)isTemporary;
- (CHHandle)initWithCoder:(id)a3;
- (CHHandle)initWithHandle:(id)a3;
- (CHHandle)initWithType:(int64_t)a3 value:(id)a4;
- (CHHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5;
- (NSString)normalizedValue;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (CHHandle)initWithHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  v6 = [v4 value];
  v7 = [v4 normalizedValue];

  v8 = [(CHHandle *)self initWithType:v5 value:v6 normalizedValue:v7];
  return v8;
}

- (CHHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5
{
  id v8 = a5;
  v9 = [(CHHandle *)self initWithType:a3 value:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    normalizedValue = v9->_normalizedValue;
    v9->_normalizedValue = (NSString *)v10;
  }
  return v9;
}

- (CHHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHHandle;
  v7 = [(CHHandle *)&v11 init];
  if (v7)
  {
    if (a3)
    {
      if (v6)
      {
LABEL_4:
        v7->_type = a3;
        uint64_t v8 = [v6 copy];
        value = v7->_value;
        v7->_value = (NSString *)v8;

        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CHHandle initWithType:value:]", @"type" format];
      if (v6) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CHHandle initWithType:value:]", @"value" format];
    goto LABEL_4;
  }
LABEL_5:

  return v7;
}

- (BOOL)isPseudonym
{
  v2 = [(CHHandle *)self value];
  char v3 = [v2 hasPrefix:@"pseud:"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CHHandle *)self type];
  id v4 = [(CHHandle *)self value];
  uint64_t v5 = [v4 hash];
  id v6 = [(CHHandle *)self normalizedValue];
  [v6 hash];
  unint64_t v14 = CHHash(3uLL, v7, v8, v9, v10, v11, v12, v13, v3, v5);

  return v14;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isTemporary
{
  v2 = [(CHHandle *)self value];
  char v3 = [v2 hasPrefix:@"temp:"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CHHandle allocWithZone:a3];
  return [(CHHandle *)v4 initWithHandle:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_type);
  [v5 encodeInteger:type forKey:v6];

  value = self->_value;
  uint64_t v8 = NSStringFromSelector(sel_value);
  [v5 encodeObject:value forKey:v8];

  normalizedValue = self->_normalizedValue;
  NSStringFromSelector(sel_normalizedValue);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:normalizedValue forKey:v10];
}

- (CHHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHHandle;
  id v5 = [(CHHandle *)&v16 init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_type);
    v5->_int64_t type = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(sel_value);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    value = v5->_value;
    v5->_value = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_normalizedValue);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    normalizedValue = v5->_normalizedValue;
    v5->_normalizedValue = (NSString *)v13;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_type);
  [v3 appendFormat:@"%@=%ld", v4, -[CHHandle type](self, "type")];

  [v3 appendFormat:@", "];
  id v5 = NSStringFromSelector(sel_value);
  id v6 = [(CHHandle *)self value];
  [v3 appendFormat:@"%@=%@", v5, v6];

  [v3 appendFormat:@", "];
  uint64_t v7 = NSStringFromSelector(sel_normalizedValue);
  uint64_t v8 = [(CHHandle *)self normalizedValue];
  [v3 appendFormat:@"%@=%@", v7, v8];

  [v3 appendFormat:@">"];
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHHandle *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CHHandle *)self isEqualToHandle:v4];
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CHHandle *)self type];
  if (v5 == [v4 type])
  {
    id v6 = [(CHHandle *)self value];
    uint64_t v7 = [v4 value];
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    id v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v9)
      {
        char v14 = 0;
        uint64_t v12 = v8;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      int v11 = [(id)v8 isEqualToString:v9];

      if (!v11)
      {
        char v14 = 0;
        goto LABEL_11;
      }
    }
    uint64_t v12 = [(CHHandle *)self normalizedValue];
    uint64_t v13 = [v4 normalizedValue];
    char v14 = (v12 | v13) == 0;
    if (v13) {
      char v14 = [(id)v12 isEqualToString:v13];
    }

    goto LABEL_10;
  }
  char v14 = 0;
LABEL_12:

  return v14;
}

+ (id)normalizedEmailAddressHandleForValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [CHHandle alloc];
    int64_t v5 = [v3 lowercaseString];
    id v6 = [(CHHandle *)v4 initWithType:3 value:v3 normalizedValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)normalizedGenericHandleForValue:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [CHHandle alloc];
    int64_t v5 = [v3 lowercaseString];
    id v6 = [(CHHandle *)v4 initWithType:1 value:v3 normalizedValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = v6;
    if (![v7 length])
    {
      uint64_t v8 = PNCopyBestGuessCountryCodeForNumber();

      id v7 = (id)v8;
    }
    if ([v7 length])
    {
      unint64_t v9 = CHPhoneNumberNormalizedPhoneNumberString((uint64_t)v5, v7);
      id v10 = [[CHHandle alloc] initWithType:2 value:v5 normalizedValue:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (int64_t)handleTypeForValue:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 containsString:@"@"]) {
    return 3;
  }
  return 2;
}

@end