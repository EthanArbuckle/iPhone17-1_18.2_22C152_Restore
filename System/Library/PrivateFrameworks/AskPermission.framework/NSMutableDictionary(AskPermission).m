@interface NSMutableDictionary(AskPermission)
- (void)ap_setNullableObject:()AskPermission forKey:;
@end

@implementation NSMutableDictionary(AskPermission)

- (void)ap_setNullableObject:()AskPermission forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

@end