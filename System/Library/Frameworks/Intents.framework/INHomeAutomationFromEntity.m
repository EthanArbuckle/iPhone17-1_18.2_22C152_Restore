@interface INHomeAutomationFromEntity
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeAutomationFromEntity)initWithCoder:(id)a3;
- (INHomeAutomationFromEntity)initWithValue:(id)a3 type:(int64_t)a4;
- (NSString)description;
- (NSString)value;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeAutomationFromEntity

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
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
  v8[1] = @"type";
  v9[0] = v4;
  v5 = [NSNumber numberWithInteger:self->_type];
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
  v11.super_class = (Class)INHomeAutomationFromEntity;
  v6 = [(INHomeAutomationFromEntity *)&v11 description];
  v7 = [(INHomeAutomationFromEntity *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeAutomationFromEntity *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_value];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"value");
  unint64_t v9 = self->_type - 1;
  if (v9 > 2) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E5520E18[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"type");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (INHomeAutomationFromEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];

  v7 = [(INHomeAutomationFromEntity *)self initWithValue:v5 type:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeAutomationFromEntity *)a3;
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
      BOOL v7 = (value == v5->_value || -[NSString isEqual:](value, "isEqual:")) && self->_type == v5->_type;
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
  NSUInteger v3 = [(NSString *)self->_value hash];
  id v4 = [NSNumber numberWithInteger:self->_type];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (INHomeAutomationFromEntity)initWithValue:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAutomationFromEntity;
  BOOL v7 = [(INHomeAutomationFromEntity *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_type = a4;
  }

  return v7;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"value"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"type"];
    uint64_t v13 = INHomeAutomationEntityTypeWithString(v12);

    v14 = (void *)[objc_alloc((Class)a1) initWithValue:v11 type:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end