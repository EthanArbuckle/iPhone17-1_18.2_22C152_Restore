@interface AALocalContactInfo(AppleAccountSettings)
- (BOOL)shouldGrayOutContactRow;
@end

@implementation AALocalContactInfo(AppleAccountSettings)

- (BOOL)shouldGrayOutContactRow
{
  return ([a1 contactType] & 1) != 0
      && (([a1 trustedContactStatus] - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

@end