@interface NSMutableDictionary(ContactsFoundation)
- (uint64_t)_cn_setObject:()ContactsFoundation orPlaceholder:forKey:;
- (void)_cn_setNonNilObject:()ContactsFoundation forKey:;
@end

@implementation NSMutableDictionary(ContactsFoundation)

- (void)_cn_setNonNilObject:()ContactsFoundation forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (uint64_t)_cn_setObject:()ContactsFoundation orPlaceholder:forKey:
{
  if (!a3) {
    a3 = a4;
  }
  return [a1 setObject:a3 forKeyedSubscript:a5];
}

@end