@interface CNLabelValuePair
+ (id)labeledValueWithLabel:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CNLabelValuePair)initWithLabel:(id)a3 value:(id)a4;
- (NSString)label;
- (id)description;
- (id)value;
- (unint64_t)hash;
@end

@implementation CNLabelValuePair

- (CNLabelValuePair)initWithLabel:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNLabelValuePair;
  v9 = [(CNLabelValuePair *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CNLabelValuePair alloc] initWithLabel:v6 value:v5];

  return v7;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      label = self->_label;
      if (!((unint64_t)label | *((void *)a3 + 1)) || (int v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
      {
        unint64_t value = (unint64_t)self->_value;
        if (!(value | *((void *)a3 + 2)) || (int v6 = objc_msgSend((id)value, "isEqual:")) != 0) {
          LOBYTE(v6) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"label", self->_label, @"value", self->_value, 0);
  id v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_label];
  return [MEMORY[0x1E4F5A418] objectHash:self->_value] - v3 + 32 * v3 + 16337;
}

@end