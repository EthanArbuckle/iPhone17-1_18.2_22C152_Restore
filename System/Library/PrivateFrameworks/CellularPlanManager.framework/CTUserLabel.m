@interface CTUserLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTUserLabel)initWithCoder:(id)a3;
- (CTUserLabel)initWithKey:(id)a3 label:(id)a4 labelId:(id)a5;
- (CTUserLabel)initWithLabel:(id)a3;
- (NSString)key;
- (NSString)label;
- (NSString)labelId;
- (id)_labelKeyDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)indexInPredefinedLabels:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTUserLabel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTUserLabel)initWithLabel:(id)a3
{
  return [(CTUserLabel *)self initWithKey:&stru_1F35F00E8 label:a3 labelId:0];
}

- (CTUserLabel)initWithKey:(id)a3 label:(id)a4 labelId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CTUserLabel;
  v11 = [(CTUserLabel *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    label = v11->_label;
    v11->_label = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    key = v11->_key;
    v11->_key = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    labelId = v11->_labelId;
    v11->_labelId = (NSString *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(NSString *)self->_key copy];
  v6 = (void *)[(NSString *)self->_label copy];
  v7 = (void *)[(NSString *)self->_labelId copy];
  id v8 = (void *)[v4 initWithKey:v5 label:v6 labelId:v7];

  return v8;
}

- (CTUserLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTUserLabel;
  v5 = [(CTUserLabel *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelKey"];
    key = v5->_key;
    v5->_key = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelIdKey"];
    labelId = v5->_labelId;
    v5->_labelId = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeObject:self->_key forKey:@"labelKey"];
  [v5 encodeObject:self->_labelId forKey:@"labelIdKey"];
}

- (int64_t)indexInPredefinedLabels:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5 < 1)
  {
LABEL_5:
    int64_t v7 = -1;
  }
  else
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:v7];
      id v9 = [v8 key];
      uint64_t v10 = [(CTUserLabel *)self key];
      char v11 = [v9 isEqualToString:v10];

      if (v11) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    label = self->_label;
    int64_t v7 = [v5 label];
    if ([(NSString *)label isEqualToString:v7])
    {
      key = self->_key;
      id v9 = [v5 key];
      if ([(NSString *)key isEqualToString:v9])
      {
        labelId = self->_labelId;
        char v11 = [v5 labelId];
        char v12 = [(NSString *)labelId isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_label hash] ^ v3;
  return v4 ^ [(NSString *)self->_labelId hash];
}

- (id)_labelKeyDescription
{
  if ([(NSString *)self->_key isEqualToString:&stru_1F35F00E8]) {
    NSUInteger v3 = @"Customized";
  }
  else {
    NSUInteger v3 = self->_key;
  }
  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  NSUInteger v4 = [(CTUserLabel *)self _labelKeyDescription];
  id v5 = [v3 stringWithFormat:@"<userLabel: key:%@ label:%@ labelId:%@>", v4, self->_label, self->_labelId];

  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)labelId
{
  return self->_labelId;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_labelId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end