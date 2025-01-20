@interface SGLabeledValue
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledValue:(id)a3;
- (NSString)label;
- (NSString)value;
- (SGLabeledValue)initWithLabel:(id)a3 value:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation SGLabeledValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGLabeledValue: %@: %@>", self->_label, self->_value];
  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  return [(NSString *)self->_value hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  v4 = (id *)a3;
  label = self->_label;
  v6 = (NSString *)v4[1];
  if (label == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = label;
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
  v4 = (SGLabeledValue *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGLabeledValue *)self isEqualToLabeledValue:v5];

  return v6;
}

- (SGLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGLabeledValue;
  v8 = [(SGLabeledValue *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

@end