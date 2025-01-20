@interface NSString(AccessibilitySharedSupport)
- (id)axss_stringByTrimmingToLength:()AccessibilitySharedSupport encoding:;
@end

@implementation NSString(AccessibilitySharedSupport)

- (id)axss_stringByTrimmingToLength:()AccessibilitySharedSupport encoding:
{
  id v6 = a1;
  if ([v6 lengthOfBytesUsingEncoding:a4] > a3)
  {
    v7 = malloc_type_malloc(a3, 0x4AE746DEuLL);
    uint64_t v11 = 0;
    objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, a3, &v11, a4, 0, 0, objc_msgSend(v6, "length"), 0);
    id v8 = [NSString alloc];
    uint64_t v9 = [v8 initWithBytes:v7 length:v11 encoding:a4];

    free(v7);
    id v6 = (id)v9;
  }

  return v6;
}

@end