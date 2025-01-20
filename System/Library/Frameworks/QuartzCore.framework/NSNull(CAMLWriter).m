@interface NSNull(CAMLWriter)
- (__CFString)CAMLType;
@end

@implementation NSNull(CAMLWriter)

- (__CFString)CAMLType
{
  return @"null";
}

@end