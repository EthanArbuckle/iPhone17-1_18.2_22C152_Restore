@interface UIFont(LPExtras)
- (uint64_t)_lp_CSSFontWeight;
- (uint64_t)_lp_symbolWeight;
@end

@implementation UIFont(LPExtras)

- (uint64_t)_lp_CSSFontWeight
{
  v1 = [a1 fontDescriptor];
  v2 = (void *)CTFontDescriptorCopyAttribute(v1, (CFStringRef)*MEMORY[0x1E4F24400]);
  [v2 floatValue];
  double v4 = v3;

  double v5 = round(v4 / 100.0) * 100.0;
  v6 = NSNumber;

  return [v6 numberWithDouble:v5];
}

- (uint64_t)_lp_symbolWeight
{
  if (([a1 traits] & 2) != 0) {
    return 7;
  }
  if (([a1 traits] & 4) != 0) {
    return 2;
  }
  if (([a1 traits] & 8) != 0) {
    return 3;
  }
  if (([a1 traits] & 0x10) != 0) {
    return 1;
  }
  return 4;
}

@end