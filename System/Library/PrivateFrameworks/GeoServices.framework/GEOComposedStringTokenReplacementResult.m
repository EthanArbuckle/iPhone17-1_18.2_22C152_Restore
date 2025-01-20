@interface GEOComposedStringTokenReplacementResult
- (BOOL)success;
- (NSAttributedString)attributedString;
- (NSString)string;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
@end

@implementation GEOComposedStringTokenReplacementResult

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GEOComposedStringTokenReplacementResult allocWithZone:a3] init];
  v4->success = self->success;
  v4->type = self->type;
  uint64_t v5 = [(NSString *)self->string copy];
  string = v4->string;
  v4->string = (NSString *)v5;

  uint64_t v7 = [(NSAttributedString *)self->attributedString copy];
  attributedString = v4->attributedString;
  v4->attributedString = (NSAttributedString *)v7;

  v4->range = self->range;
  return v4;
}

- (BOOL)success
{
  return self->success;
}

- (int)type
{
  return self->type;
}

- (NSString)string
{
  return self->string;
}

- (NSAttributedString)attributedString
{
  return self->attributedString;
}

- (_NSRange)range
{
  NSUInteger length = self->range.length;
  NSUInteger location = self->range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributedString, 0);

  objc_storeStrong((id *)&self->string, 0);
}

@end