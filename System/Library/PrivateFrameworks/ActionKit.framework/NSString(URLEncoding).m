@interface NSString(URLEncoding)
- (__CFString)en_stringByUrlDecoding;
- (__CFString)en_stringByUrlEncoding;
@end

@implementation NSString(URLEncoding)

- (__CFString)en_stringByUrlDecoding
{
  v1 = (__CFString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding((CFAllocatorRef)*MEMORY[0x263EFFB08], origString, &stru_26F008428, 0x8000100u);
  return v1;
}

- (__CFString)en_stringByUrlEncoding
{
  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, @"!*'\"();:@&=+$,/?%#[]% ",
                       0x8000100u);
  return v1;
}

@end