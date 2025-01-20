@interface NSString(ImageCaptureAdditions)
- (uint64_t)baseImageFileDigits;
- (uint64_t)baseImageFilePrefix;
@end

@implementation NSString(ImageCaptureAdditions)

- (uint64_t)baseImageFilePrefix
{
  if ((unint64_t)[a1 length] < 4) {
    return 0;
  }
  int v2 = [a1 characterAtIndex:0];
  unsigned int v3 = ([a1 characterAtIndex:1] << 16) + (v2 << 24);
  unsigned int v4 = v3 + ([a1 characterAtIndex:2] << 8);
  return (int)(v4 + [a1 characterAtIndex:3]);
}

- (uint64_t)baseImageFileDigits
{
  v1 = [a1 stringByDeletingPathExtension];
  unint64_t v2 = [v1 length];
  if (v2 < 4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    unsigned int v3 = [v1 substringFromIndex:v2 - 4];
    uint64_t v4 = [v3 integerValue];
  }
  return v4;
}

@end