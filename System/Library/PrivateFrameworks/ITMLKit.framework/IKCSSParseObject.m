@interface IKCSSParseObject
+ (id)stringifyList:(id)a3;
- (IKArray)cssValue;
- (IKCSSParseObject)init;
- (_NSRange)range;
- (id)description;
- (int64_t)type;
- (void)setCssValue:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setType:(int64_t)a3;
@end

@implementation IKCSSParseObject

- (IKCSSParseObject)init
{
  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseObject;
  v2 = [(IKCSSParseObject *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IKCSSParseObject *)v2 setType:0];
  }
  return v3;
}

- (id)description
{
  return @"\"BASE_CLASS_PARSE_OBJECT\"";
}

+ (id)stringifyList:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    v7 = @"[";
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) description];
        v7 = [(__CFString *)v9 stringByAppendingFormat:@"{%@}, ", v10];

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = @"[";
  }
  if ((unint64_t)[(__CFString *)v7 length] >= 2)
  {
    uint64_t v11 = -[__CFString substringWithRange:](v7, "substringWithRange:", 0, [(__CFString *)v7 length] - 2);

    v7 = (__CFString *)v11;
  }
  v12 = [(__CFString *)v7 stringByAppendingString:@"]"];

  return v12;
}

- (IKArray)cssValue
{
  return self->_cssValue;
}

- (void)setCssValue:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
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

- (void).cxx_destruct
{
}

@end