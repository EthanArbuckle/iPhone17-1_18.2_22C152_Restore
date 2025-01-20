@interface NSMutableURLRequest(AskPermission)
- (void)ap_setNullableValue:()AskPermission forHTTPHeaderField:;
@end

@implementation NSMutableURLRequest(AskPermission)

- (void)ap_setNullableValue:()AskPermission forHTTPHeaderField:
{
  if (a3) {
    return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
  }
  return a1;
}

@end