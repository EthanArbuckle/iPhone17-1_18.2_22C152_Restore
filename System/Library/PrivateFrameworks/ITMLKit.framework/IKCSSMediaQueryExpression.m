@interface IKCSSMediaQueryExpression
- (BOOL)evaluate;
- (NSString)dimension;
- (NSString)key;
- (NSString)mediaType;
- (NSString)stringValue;
- (double)doubleValue;
- (id)description;
- (id)expressionAsString;
- (id)valueAsString;
- (int64_t)type;
- (void)setDimension:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setKey:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IKCSSMediaQueryExpression

- (void)setKey:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  self->_key = v4;
  MEMORY[0x1F41817F8](v4, key);
}

- (void)setStringValue:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  stringValue = self->_stringValue;
  self->_stringValue = v4;
  MEMORY[0x1F41817F8](v4, stringValue);
}

- (BOOL)evaluate
{
  return 0;
}

- (id)expressionAsString
{
  if (self->_type == 4)
  {
    v2 = self->_key;
  }
  else
  {
    v3 = NSString;
    key = self->_key;
    v5 = [(IKCSSMediaQueryExpression *)self valueAsString];
    v2 = [v3 stringWithFormat:@"%@:%@", key, v5];
  }
  return v2;
}

- (id)valueAsString
{
  int64_t type = self->_type;
  switch(type)
  {
    case 3:
      [NSString stringWithFormat:@"%.3f%@", *(void *)&self->_doubleValue, self->_dimension];
LABEL_7:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(NSString, "stringWithFormat:", @"%.3f", *(void *)&self->_doubleValue, v5);
      goto LABEL_7;
    case 1:
      v3 = self->_stringValue;
      break;
    default:
      v3 = &stru_1F3E09950;
      break;
  }
  return v3;
}

- (id)description
{
  switch(self->_type)
  {
    case 1:
      [NSString stringWithFormat:@"(type=string, key=%@, value=%@)", self->_key, self->_stringValue, v5];
      goto LABEL_7;
    case 2:
      [NSString stringWithFormat:@"(type=double, key=%@, value=%.3f)", self->_key, *(void *)&self->_doubleValue, v5];
      goto LABEL_7;
    case 3:
      [NSString stringWithFormat:@"(type=dimension, key=%@, value=%.3f%@)", self->_key, *(void *)&self->_doubleValue, self->_dimension];
      goto LABEL_7;
    case 4:
      [NSString stringWithFormat:@"(type=feature, key=%@)", self->_key, v4, v5];
LABEL_7:
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v2 = @"(UNKNOWN EXPRESSION TYPE)";
      break;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)dimension
{
  return self->_dimension;
}

- (void)setDimension:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end