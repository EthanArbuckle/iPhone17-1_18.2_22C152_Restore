@interface INNumericSettingValue
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INNumericSettingValue)initWithCoder:(id)a3;
- (INNumericSettingValue)initWithValue:(id)a3 unit:(int64_t)a4;
- (NSNumber)value;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)unit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INNumericSettingValue

- (void).cxx_destruct
{
}

- (int64_t)unit
{
  return self->_unit;
}

- (NSNumber)value
{
  return self->_value;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"value";
  value = self->_value;
  v4 = value;
  if (!value)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[1] = @"unit";
  v9[0] = v4;
  v5 = [NSNumber numberWithInteger:self->_unit];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  if (!value) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INNumericSettingValue;
  v6 = [(INNumericSettingValue *)&v11 description];
  v7 = [(INNumericSettingValue *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INNumericSettingValue *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_value];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"value");
  if (self->_unit == 1) {
    v9 = @"percentage";
  }
  else {
    v9 = @"unknown";
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"unit");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeInteger:self->_unit forKey:@"unit"];
}

- (INNumericSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"unit"];

  v7 = [(INNumericSettingValue *)self initWithValue:v5 unit:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INNumericSettingValue *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      value = self->_value;
      BOOL v7 = (value == v5->_value || -[NSNumber isEqual:](value, "isEqual:")) && self->_unit == v5->_unit;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_value hash];
  id v4 = [NSNumber numberWithInteger:self->_unit];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INNumericSettingValue)initWithValue:(id)a3 unit:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INNumericSettingValue;
  BOOL v7 = [(INNumericSettingValue *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSNumber *)v8;

    v7->_unit = a4;
  }

  return v7;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v6 objectForKeyedSubscript:@"value"];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"unit"];
    uint64_t v9 = [v8 isEqualToString:@"percentage"];

    v10 = (void *)[objc_alloc((Class)a1) initWithValue:v7 unit:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end