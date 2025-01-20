@interface BURestrictionsProvider
+ (BURestrictionsProviding)sharedInstance;
@end

@implementation BURestrictionsProvider

+ (BURestrictionsProviding)sharedInstance
{
  if (qword_26AB405B0 != -1) {
    dispatch_once(&qword_26AB405B0, &unk_26CF10958);
  }
  v2 = (void *)qword_26AB405B8;

  return (BURestrictionsProviding *)v2;
}

@end