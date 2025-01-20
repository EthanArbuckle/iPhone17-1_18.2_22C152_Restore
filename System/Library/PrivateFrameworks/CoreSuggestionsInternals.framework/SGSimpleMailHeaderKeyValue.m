@interface SGSimpleMailHeaderKeyValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSimpleMailHeaderKeyValue:(id)a3;
- (NSString)key;
- (NSString)value;
- (SGSimpleMailHeaderKeyValue)initWithCoder:(id)a3;
- (SGSimpleMailHeaderKeyValue)initWithKey:(id)a3 value:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGSimpleMailHeaderKeyValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGSimpleMailHeaderKeyValue: %@: %@>", self->_key, self->_value];
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (SGSimpleMailHeaderKeyValue)initWithCoder:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGSimpleMailHeaderKeyValue;
  v6 = [(SGSimpleMailHeaderKeyValue *)&v16 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"key"];

    if (v8)
    {
      v9 = v8;
      key = v6->_key;
      v6->_key = v9;
    }
    else
    {
      key = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(key, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGSimpleMailMessage.m", 112, @"nonnull property %s *%s was null when decoded", "NSString", "key");
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"value"];

    if (v12)
    {
      v13 = v12;
      value = v6->_value;
      v6->_value = v13;
    }
    else
    {
      value = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(value, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGSimpleMailMessage.m", 113, @"nonnull property %s *%s was null when decoded", "NSString", "value");
    }
  }
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSString *)self->_value hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToSimpleMailHeaderKeyValue:(id)a3
{
  v4 = (id *)a3;
  key = self->_key;
  v6 = (NSString *)v4[1];
  if (key == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = key;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_value;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGSimpleMailHeaderKeyValue *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSimpleMailHeaderKeyValue *)self isEqualToSimpleMailHeaderKeyValue:v5];

  return v6;
}

- (SGSimpleMailHeaderKeyValue)initWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGSimpleMailHeaderKeyValue;
  char v9 = [(SGSimpleMailHeaderKeyValue *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end