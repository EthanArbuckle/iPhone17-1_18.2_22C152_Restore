@interface NSMutableSet(ContactsFoundation)
- (void)_cn_addNonNilObject:()ContactsFoundation;
@end

@implementation NSMutableSet(ContactsFoundation)

- (void)_cn_addNonNilObject:()ContactsFoundation
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end