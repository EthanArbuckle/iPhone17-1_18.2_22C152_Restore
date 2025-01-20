@interface MFUserProfileProvider_iOS
+ (id)defaultProvider;
- (BOOL)hasAccountsConfigured;
- (MFUserProfileProvider_iOS)init;
- (id)_accountsEmailAddresses;
@end

@implementation MFUserProfileProvider_iOS

+ (id)defaultProvider
{
  if (qword_10016BD90 != -1) {
    dispatch_once(&qword_10016BD90, &stru_10013DCA8);
  }
  v2 = (void *)qword_10016BD98;

  return v2;
}

- (MFUserProfileProvider_iOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFUserProfileProvider_iOS;
  v2 = [(MFUserProfileProvider_iOS *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFUserProfileProvider_iOS *)v2 refreshCachedValues];
  }
  return v3;
}

- (BOOL)hasAccountsConfigured
{
  v2 = +[MailAccount activeNonLocalAccounts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_accountsEmailAddresses
{
  return +[MailAccount activeAccountEmailAddresses];
}

@end