@interface NSString(SLAdditions)
- (BOOL)hasCaseInsensitiveSuffix:()SLAdditions;
- (__CFString)urlEncodedString;
@end

@implementation NSString(SLAdditions)

- (__CFString)urlEncodedString
{
  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], originalString, 0, @":/?#[]@!$&‚Äö√Ñ√¥()*+,;='",
                       0x8000100u);

  return v1;
}

- (BOOL)hasCaseInsensitiveSuffix:()SLAdditions
{
  uint64_t v4 = [a1 rangeOfString:a3 options:5];
  return v5 && [a1 length] == v4 + v5;
}

@end