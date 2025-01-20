@interface INWellnessMetadataPair
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INWellnessMetadataPair)initWithCoder:(id)a3;
- (INWellnessMetadataPair)initWithNumber:(id)a3 key:(id)a4;
- (INWellnessMetadataPair)initWithString:(id)a3 key:(id)a4;
- (NSNumber)numberValue;
- (NSString)key;
- (NSString)stringValue;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INWellnessMetadataPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)key
{
  return self->_key;
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  stringValue = self->_stringValue;
  if (stringValue)
  {
    key = self->_key;
    v10[0] = @"key";
    v10[1] = @"value";
    v11[0] = key;
    v11[1] = stringValue;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = v11;
    v6 = v10;
  }
  else
  {
    v12[0] = @"key";
    v12[1] = @"value";
    numberValue = self->_numberValue;
    v13[0] = self->_key;
    v13[1] = numberValue;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = v13;
    v6 = v12;
  }
  v8 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:2];

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INWellnessMetadataPair;
  v6 = [(INWellnessMetadataPair *)&v11 description];
  v7 = [(INWellnessMetadataPair *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INWellnessMetadataPair *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_stringValue forKey:@"stringValue"];
  [v5 encodeObject:self->_numberValue forKey:@"numberValue"];
}

- (INWellnessMetadataPair)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];

  id v8 = objc_alloc((Class)objc_opt_class());
  if (v7) {
    uint64_t v9 = [v8 initWithString:v7 key:v5];
  }
  else {
    uint64_t v9 = [v8 initWithNumber:v6 key:v5];
  }
  v10 = (INWellnessMetadataPair *)v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v8 = 0;
    if ([(NSString *)self->_key isEqualToString:v5[1]])
    {
      numberValue = self->_numberValue;
      if (!numberValue || [(NSNumber *)numberValue isEqualToNumber:v5[2]])
      {
        stringValue = self->_stringValue;
        if (!stringValue || [(NSString *)stringValue isEqualToString:v5[3]]) {
          BOOL v8 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_key hash];
}

- (INWellnessMetadataPair)initWithString:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INWellnessMetadataPair;
  uint64_t v9 = [(INWellnessMetadataPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    objc_storeStrong((id *)&v10->_stringValue, a3);
  }

  return v10;
}

- (INWellnessMetadataPair)initWithNumber:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INWellnessMetadataPair;
  uint64_t v9 = [(INWellnessMetadataPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    objc_storeStrong((id *)&v10->_numberValue, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end