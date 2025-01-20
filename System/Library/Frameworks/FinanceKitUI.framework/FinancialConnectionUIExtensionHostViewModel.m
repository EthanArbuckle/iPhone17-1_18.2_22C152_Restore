@interface FinancialConnectionUIExtensionHostViewModel
- (void)completeWithAuthorizationResult:(id)a3;
- (void)completeWithError:(id)a3;
@end

@implementation FinancialConnectionUIExtensionHostViewModel

- (void)completeWithAuthorizationResult:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_243A6EF08(v3);

  swift_release();
}

- (void)completeWithError:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_243A6F1E0(v3);
  swift_release();
}

@end