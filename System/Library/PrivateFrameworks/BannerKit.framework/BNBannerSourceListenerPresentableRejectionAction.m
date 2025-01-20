@interface BNBannerSourceListenerPresentableRejectionAction
- (BNBannerSourceListenerPresentableRejectionAction)initWithReason:(id)a3;
- (BOOL)_expectsResponse;
- (NSString)rejectionReason;
- (id)keyDescriptionForSetting:(unint64_t)a3;
@end

@implementation BNBannerSourceListenerPresentableRejectionAction

- (BNBannerSourceListenerPresentableRejectionAction)initWithReason:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableRejectionAction.m", 20, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v6 setObject:v5 forSetting:1];

  v10.receiver = self;
  v10.super_class = (Class)BNBannerSourceListenerPresentableRejectionAction;
  v7 = [(BNBannerSourceListenerPresentableRejectionAction *)&v10 initWithInfo:v6 responder:0];

  return v7;
}

- (NSString)rejectionReason
{
  v2 = [(BNBannerSourceListenerPresentableRejectionAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (BOOL)_expectsResponse
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"rejectionReason";
  }
  else {
    return 0;
  }
}

@end