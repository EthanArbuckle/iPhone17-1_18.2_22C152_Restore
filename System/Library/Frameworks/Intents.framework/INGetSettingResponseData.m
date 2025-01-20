@interface INGetSettingResponseData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INGetSettingResponseData)initWithCoder:(id)a3;
- (INGetSettingResponseData)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 binaryValue:(int64_t)a6 labeledValue:(id)a7;
- (INNumericSettingValue)numericValue;
- (INSettingMetadata)settingMetadata;
- (NSString)description;
- (NSString)labeledValue;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)binaryValue;
- (int64_t)boundedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INGetSettingResponseData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);

  objc_storeStrong((id *)&self->_settingMetadata, 0);
}

- (NSString)labeledValue
{
  return self->_labeledValue;
}

- (int64_t)binaryValue
{
  return self->_binaryValue;
}

- (int64_t)boundedValue
{
  return self->_boundedValue;
}

- (INNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (INSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (id)_dictionaryRepresentation
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"settingMetadata";
  settingMetadata = self->_settingMetadata;
  v4 = settingMetadata;
  if (!settingMetadata)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"numericValue";
  numericValue = self->_numericValue;
  v6 = numericValue;
  if (!numericValue)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"boundedValue";
  v7 = [NSNumber numberWithInteger:self->_boundedValue];
  v14[2] = v7;
  v13[3] = @"binaryValue";
  v8 = [NSNumber numberWithInteger:self->_binaryValue];
  v14[3] = v8;
  v13[4] = @"labeledValue";
  labeledValue = self->_labeledValue;
  v10 = labeledValue;
  if (!labeledValue)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  if (!labeledValue) {

  }
  if (numericValue)
  {
    if (settingMetadata) {
      goto LABEL_11;
    }
  }
  else
  {

    if (settingMetadata) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INGetSettingResponseData;
  v6 = [(INGetSettingResponseData *)&v11 description];
  v7 = [(INGetSettingResponseData *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INGetSettingResponseData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_settingMetadata];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"settingMetadata");

  v9 = [v6 encodeObject:self->_numericValue];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"numericValue");

  unint64_t v10 = self->_boundedValue - 1;
  if (v10 > 2) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = off_1E5520478[v10];
  }
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"boundedValue");

  unint64_t v13 = self->_binaryValue - 1;
  if (v13 > 2) {
    v14 = @"unknown";
  }
  else {
    v14 = *(&off_1E5520240 + v13);
  }
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"binaryValue");

  v16 = [v6 encodeObject:self->_labeledValue];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"labeledValue");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  settingMetadata = self->_settingMetadata;
  id v5 = a3;
  [v5 encodeObject:settingMetadata forKey:@"settingMetadata"];
  [v5 encodeObject:self->_numericValue forKey:@"numericValue"];
  [v5 encodeInteger:self->_boundedValue forKey:@"boundedValue"];
  [v5 encodeInteger:self->_binaryValue forKey:@"binaryValue"];
  [v5 encodeObject:self->_labeledValue forKey:@"labeledValue"];
}

- (INGetSettingResponseData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingMetadata"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numericValue"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"boundedValue"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"binaryValue"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"labeledValue"];

  unint64_t v13 = [(INGetSettingResponseData *)self initWithSettingMetadata:v5 numericValue:v6 boundedValue:v7 binaryValue:v8 labeledValue:v12];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INGetSettingResponseData *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      settingMetadata = self->_settingMetadata;
      BOOL v9 = 0;
      if (settingMetadata == v5->_settingMetadata || -[INSettingMetadata isEqual:](settingMetadata, "isEqual:"))
      {
        numericValue = self->_numericValue;
        if ((numericValue == v5->_numericValue || -[INNumericSettingValue isEqual:](numericValue, "isEqual:"))
          && self->_boundedValue == v5->_boundedValue
          && self->_binaryValue == v5->_binaryValue)
        {
          labeledValue = self->_labeledValue;
          if (labeledValue == v5->_labeledValue || -[NSString isEqual:](labeledValue, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSettingMetadata *)self->_settingMetadata hash];
  unint64_t v4 = [(INNumericSettingValue *)self->_numericValue hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_boundedValue];
  uint64_t v6 = v4 ^ [v5 hash];
  uint64_t v7 = [NSNumber numberWithInteger:self->_binaryValue];
  uint64_t v8 = [v7 hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_labeledValue hash];

  return v9;
}

- (INGetSettingResponseData)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 binaryValue:(int64_t)a6 labeledValue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)INGetSettingResponseData;
  v15 = [(INGetSettingResponseData *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    settingMetadata = v15->_settingMetadata;
    v15->_settingMetadata = (INSettingMetadata *)v16;

    uint64_t v18 = [v13 copy];
    numericValue = v15->_numericValue;
    v15->_numericValue = (INNumericSettingValue *)v18;

    v15->_boundedValue = a5;
    v15->_binaryValue = a6;
    uint64_t v20 = [v14 copy];
    labeledValue = v15->_labeledValue;
    v15->_labeledValue = (NSString *)v20;
  }
  return v15;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"settingMetadata"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"numericValue"];
    id v14 = [v7 decodeObjectOfClass:v12 from:v13];

    v15 = [v8 objectForKeyedSubscript:@"boundedValue"];
    uint64_t v16 = INBoundedSettingValueWithString(v15);

    v17 = [v8 objectForKeyedSubscript:@"binaryValue"];
    uint64_t v18 = INBinarySettingValueWithString(v17);

    v19 = [v8 objectForKeyedSubscript:@"labeledValue"];
    uint64_t v20 = (void *)[objc_alloc((Class)a1) initWithSettingMetadata:v11 numericValue:v14 boundedValue:v16 binaryValue:v18 labeledValue:v19];
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end