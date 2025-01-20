@interface IKCSSToken
- (IKCSSToken)initWithType:(int64_t)a3;
- (NSDictionary)properties;
- (NSString)stringValue;
- (_NSRange)range;
- (double)doubleValue;
- (id)description;
- (int64_t)type;
- (unsigned)charValue;
- (void)setCharValue:(unsigned __int16)a3;
- (void)setDoubleValue:(double)a3;
- (void)setProperties:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IKCSSToken

- (IKCSSToken)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IKCSSToken;
  v4 = [(IKCSSToken *)&v7 init];
  v5 = v4;
  if (v4) {
    [(IKCSSToken *)v4 setType:a3];
  }
  return v5;
}

- (id)description
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(IKCSSToken *)self type];
  if (v3 > 0x20) {
    v4 = @"DEFAULT_TYPE";
  }
  else {
    v4 = off_1E6DE5BA0[v3];
  }
  v5 = [(IKCSSToken *)self properties];

  if (v5)
  {
    v31 = v5;
    v32 = v4;
    v6 = [(IKCSSToken *)self properties];
    objc_super v7 = [v6 allKeys];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      v12 = @", \"properties\": {";
      do
      {
        uint64_t v13 = 0;
        v14 = v12;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v13);
          v16 = [(IKCSSToken *)self properties];
          v17 = [v16 valueForKey:v15];
          v12 = [(__CFString *)v14 stringByAppendingFormat:@"\"%@\": \"%@\", ", v15, v17];

          ++v13;
          v14 = v12;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }
    else
    {
      v12 = @", \"properties\": {";
    }

    if ([v8 count])
    {
      uint64_t v19 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, [(__CFString *)v12 length] - 2);

      v12 = (__CFString *)v19;
    }
    v5 = v31;
    v4 = v32;
    v18 = [(__CFString *)v12 stringByAppendingString:@"}"];
  }
  else
  {
    v18 = @", \"properties\": {";
  }
  if ([(IKCSSToken *)self type] == 5)
  {
    [NSString stringWithFormat:@", \"value\": \"%i (%C)\", -[IKCSSToken charValue](self, "charValue"), -[IKCSSToken charValue](self, "charValue"")];
    v23 = LABEL_22:;
    goto LABEL_24;
  }
  int64_t v20 = [(IKCSSToken *)self type];
  v21 = NSString;
  if (v20 == 13)
  {
    [(IKCSSToken *)self doubleValue];
    [v21 stringWithFormat:@", \"value\": \"%.2f\"", v22, v30];
    goto LABEL_22;
  }
  v24 = [(IKCSSToken *)self stringValue];
  v23 = [v21 stringWithFormat:@", \"value\": \"%@\"", v24];

LABEL_24:
  v25 = [NSString stringWithFormat:@"\"token\": {\"type\": \"%@\"%@", v4, v23];
  v26 = v25;
  if (v5)
  {
    uint64_t v27 = [v25 stringByAppendingString:v18];

    v26 = (void *)v27;
  }
  v28 = [v26 stringByAppendingString:@"}"];

  return v28;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unsigned)charValue
{
  return self->_charValue;
}

- (void)setCharValue:(unsigned __int16)a3
{
  self->_charValue = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end