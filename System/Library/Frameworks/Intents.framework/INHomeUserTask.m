@interface INHomeUserTask
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INHomeAttributeValue)value;
- (INHomeUserTask)initWithCoder:(id)a3;
- (INHomeUserTask)initWithTaskType:(int64_t)a3 attribute:(int64_t)a4 value:(id)a5;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)attribute;
- (int64_t)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHomeUserTask

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_taskType - 1;
  if (v8 > 5) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E551F3A0[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"taskType");

  unint64_t v11 = self->_attribute - 1;
  if (v11 > 0x41) {
    v12 = @"unknown";
  }
  else {
    v12 = off_1E55176D0[v11];
  }
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"attribute");

  v14 = [v6 encodeObject:self->_value];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"value");

  return v7;
}

- (void).cxx_destruct
{
}

- (INHomeAttributeValue)value
{
  return self->_value;
}

- (int64_t)attribute
{
  return self->_attribute;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (id)_dictionaryRepresentation
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"taskType";
  v3 = [NSNumber numberWithInteger:self->_taskType];
  v10[0] = v3;
  v9[1] = @"attribute";
  v4 = [NSNumber numberWithInteger:self->_attribute];
  v10[1] = v4;
  v9[2] = @"value";
  value = self->_value;
  id v6 = value;
  if (!value)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  if (!value) {

  }
  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INHomeUserTask;
  id v6 = [(INHomeUserTask *)&v11 description];
  v7 = [(INHomeUserTask *)self _dictionaryRepresentation];
  unint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INHomeUserTask *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t taskType = self->_taskType;
  id v5 = a3;
  [v5 encodeInteger:taskType forKey:@"taskType"];
  [v5 encodeInteger:self->_attribute forKey:@"attribute"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (INHomeUserTask)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"taskType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"attribute"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  unint64_t v8 = [(INHomeUserTask *)self initWithTaskType:v5 attribute:v6 value:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INHomeUserTask *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = v5;
      BOOL v8 = 0;
      if (self->_taskType == v5->_taskType && self->_attribute == v5->_attribute)
      {
        value = self->_value;
        if (value == v6->_value || -[INHomeAttributeValue isEqual:](value, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_taskType];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [NSNumber numberWithInteger:self->_attribute];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(INHomeAttributeValue *)self->_value hash];

  return v7;
}

- (INHomeUserTask)initWithTaskType:(int64_t)a3 attribute:(int64_t)a4 value:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INHomeUserTask;
  v9 = [(INHomeUserTask *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_int64_t taskType = a3;
    v9->_attribute = a4;
    uint64_t v11 = [v8 copy];
    value = v10->_value;
    v10->_value = (INHomeAttributeValue *)v11;
  }
  return v10;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:@"taskType"];
    uint64_t v10 = INHomeUserTaskTypeWithString(v9);

    uint64_t v11 = [v8 objectForKeyedSubscript:@"attribute"];
    uint64_t v12 = INHomeAttributeTypeWithString(v11);

    uint64_t v13 = objc_opt_class();
    objc_super v14 = [v8 objectForKeyedSubscript:@"value"];
    v15 = [v7 decodeObjectOfClass:v13 from:v14];

    v16 = (void *)[objc_alloc((Class)a1) initWithTaskType:v10 attribute:v12 value:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end