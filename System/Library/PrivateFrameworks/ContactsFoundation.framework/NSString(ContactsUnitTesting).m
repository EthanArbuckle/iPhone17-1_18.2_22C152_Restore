@interface NSString(ContactsUnitTesting)
+ (id)_cn_stringByRepeatingCharacter:()ContactsUnitTesting length:;
@end

@implementation NSString(ContactsUnitTesting)

+ (id)_cn_stringByRepeatingCharacter:()ContactsUnitTesting length:
{
  v6 = malloc_type_malloc(size, 0x6C84F7F4uLL);
  memset(v6, a3, size);
  v7 = (void *)[[NSString alloc] initWithBytesNoCopy:v6 length:size encoding:1 freeWhenDone:1];

  return v7;
}

@end