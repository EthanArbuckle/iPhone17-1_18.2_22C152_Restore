@interface CNDonationExtensionRequestHandler
- (unint64_t)donationVersioningNumber;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)redonateAllValuesWithReason:(unint64_t)a3;
- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4;
- (void)userDidRejectDonatedValue:(id)a3;
@end

@implementation CNDonationExtensionRequestHandler

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setRequestHandler:self];
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();

    NSStringFromClass(v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(&cfstr_RemoteContextW.isa, v5);
  }
}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)userDidRejectDonatedValue:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (unint64_t)donationVersioningNumber
{
  return 1;
}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  v3 = self;
  CNAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end