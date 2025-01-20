@interface GEOComposedStringStyleReplacementResult
- (NSDictionary)attributes;
- (NSString)string;
- (NSString)token;
- (_NSRange)range;
- (int)type;
@end

@implementation GEOComposedStringStyleReplacementResult

- (NSString)string
{
  return self->string;
}

- (_NSRange)range
{
  NSUInteger length = self->range.length;
  NSUInteger location = self->range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)token
{
  return self->token;
}

- (int)type
{
  return self->type;
}

- (NSDictionary)attributes
{
  return self->attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributes, 0);
  objc_storeStrong((id *)&self->token, 0);

  objc_storeStrong((id *)&self->string, 0);
}

@end