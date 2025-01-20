@interface NSMutableArray(AskPermission)
- (void)ap_addNullableObject:()AskPermission;
@end

@implementation NSMutableArray(AskPermission)

- (void)ap_addNullableObject:()AskPermission
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end