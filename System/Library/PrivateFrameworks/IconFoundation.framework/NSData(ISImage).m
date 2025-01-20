@interface NSData(ISImage)
- (uint64_t)__IS_copyCGImageBlockSetWithProvider:()ISImage;
- (uint64_t)__IS_imageHeader;
- (unint64_t)__IS_getImageBuffer:()ISImage size:;
@end

@implementation NSData(ISImage)

- (uint64_t)__IS_imageHeader
{
  unint64_t v2 = [a1 length];
  uint64_t result = [a1 bytes];
  if (v2 <= 0x30) {
    return 0;
  }
  return result;
}

- (unint64_t)__IS_getImageBuffer:()ISImage size:
{
  unint64_t result = objc_msgSend(a1, "__IS_imageHeader");
  if (*(_DWORD *)(result + 4))
  {
    unint64_t v6 = result;
    unint64_t result = [a1 length];
    if (result >= (unint64_t)*(unsigned int *)(v6 + 4) + 48)
    {
      unint64_t result = [a1 bytes];
      if (a3)
      {
        if (result != -48) {
          *a3 = result + 48;
        }
      }
    }
  }
  return result;
}

- (uint64_t)__IS_copyCGImageBlockSetWithProvider:()ISImage
{
  long long v5 = xmmword_1F37B9278;
  objc_msgSend(a1, "__IS_imageHeader");
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  objc_msgSend(a1, "__IS_getImageBuffer:size:", &v3, &v4);
  uint64_t result = v3;
  if (v3)
  {
    CGImageBlockCreate();
    return CGImageBlockSetCreate();
  }
  return result;
}

@end