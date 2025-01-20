@interface ACDataclassAction(AppleAccount)
- (BOOL)isSafeForAutoEnablement;
@end

@implementation ACDataclassAction(AppleAccount)

- (BOOL)isSafeForAutoEnablement
{
  return [a1 type] != 5 && objc_msgSend(a1, "type") != 6;
}

@end