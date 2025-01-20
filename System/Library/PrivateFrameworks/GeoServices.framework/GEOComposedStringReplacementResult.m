@interface GEOComposedStringReplacementResult
- (BOOL)success;
- (NSArray)attributedComponentStrings;
- (NSArray)attributedSeparatorStrings;
- (NSArray)styleReplacementResults;
- (NSArray)tokenReplacementResults;
- (NSAttributedString)attributedString;
- (NSString)string;
- (void)setStyleReplacementResults:(uint64_t)a1;
- (void)setTokenReplacementResults:(uint64_t)a1;
@end

@implementation GEOComposedStringReplacementResult

- (void)setTokenReplacementResults:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setStyleReplacementResults:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (BOOL)success
{
  return self->success;
}

- (NSString)string
{
  return self->string;
}

- (NSAttributedString)attributedString
{
  return self->attributedString;
}

- (NSArray)attributedComponentStrings
{
  return self->attributedComponentStrings;
}

- (NSArray)attributedSeparatorStrings
{
  return self->attributedSeparatorStrings;
}

- (NSArray)tokenReplacementResults
{
  return self->tokenReplacementResults;
}

- (NSArray)styleReplacementResults
{
  return self->styleReplacementResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->styleReplacementResults, 0);
  objc_storeStrong((id *)&self->tokenReplacementResults, 0);
  objc_storeStrong((id *)&self->attributedSeparatorStrings, 0);
  objc_storeStrong((id *)&self->attributedComponentStrings, 0);
  objc_storeStrong((id *)&self->attributedString, 0);

  objc_storeStrong((id *)&self->string, 0);
}

@end