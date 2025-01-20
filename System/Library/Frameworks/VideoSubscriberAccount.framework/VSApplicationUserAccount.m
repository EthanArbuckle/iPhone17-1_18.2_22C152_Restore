@interface VSApplicationUserAccount
+ (id)applicationUserAccountsFromUserAccounts:(id)a3;
+ (id)userAccountsFromApplicationUserAccounts:(id)a3 ForProviderID:(id)a4 allowedBundleIDs:(id)a5;
- (BOOL)isSignedOut;
- (BOOL)requiresSystemTrust;
- (NSArray)tierIdentifiers;
- (NSDate)subscriptionBillingCycleEndDate;
- (NSString)authenticationData;
- (NSString)billingIdentifier;
- (NSString)bundleId;
- (NSString)identifier;
- (NSString)updateURL;
- (VSApplicationAppleSubscription)appleSubscription;
- (VSApplicationUserAccount)init;
- (VSApplicationUserAccount)initWithUserAccount:(id)a3;
- (VSUserAccount)originatingUserAccount;
- (id)userAccountForProviderID:(id)a3 allowedBundleIDs:(id)a4;
- (int64_t)accountType;
- (int64_t)deviceCategory;
- (void)setAccountType:(int64_t)a3;
- (void)setAppleSubscription:(id)a3;
- (void)setAuthenticationData:(id)a3;
- (void)setBillingIdentifier:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDeviceCategory:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginatingUserAccount:(id)a3;
- (void)setRequiresSystemTrust:(BOOL)a3;
- (void)setSignedOut:(BOOL)a3;
- (void)setSubscriptionBillingCycleEndDate:(id)a3;
- (void)setTierIdentifiers:(id)a3;
- (void)setUpdateURL:(id)a3;
@end

@implementation VSApplicationUserAccount

- (VSApplicationUserAccount)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSApplicationUserAccount;
  return [(VSApplicationUserAccount *)&v3 init];
}

- (VSApplicationUserAccount)initWithUserAccount:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VSApplicationUserAccount;
  v6 = [(VSApplicationUserAccount *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originatingUserAccount, a3);
    v8 = [v5 updateURL];
    v9 = [v8 absoluteString];
    uint64_t v10 = [v9 copy];
    updateURL = v7->_updateURL;
    v7->_updateURL = (NSString *)v10;

    v7->_requiresSystemTrust = [v5 requiresSystemTrust];
    if (![v5 sourceType])
    {
      v12 = [v5 sourceIdentifier];
      uint64_t v13 = [v12 copy];
      bundleId = v7->_bundleId;
      v7->_bundleId = (NSString *)v13;
    }
    v15 = [v5 identifier];
    uint64_t v16 = [v15 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v16;

    v7->_accountType = [v5 accountType];
    v7->_signedOut = [v5 isSignedOut];
    v18 = [v5 subscriptionBillingCycleEndDate];
    uint64_t v19 = [v18 copy];
    subscriptionBillingCycleEndDate = v7->_subscriptionBillingCycleEndDate;
    v7->_subscriptionBillingCycleEndDate = (NSDate *)v19;

    v21 = [v5 tierIdentifiers];
    uint64_t v22 = [v21 copy];
    tierIdentifiers = v7->_tierIdentifiers;
    v7->_tierIdentifiers = (NSArray *)v22;

    v24 = [v5 billingIdentifier];
    uint64_t v25 = [v24 copy];
    billingIdentifier = v7->_billingIdentifier;
    v7->_billingIdentifier = (NSString *)v25;

    v27 = [v5 authenticationData];
    uint64_t v28 = [v27 copy];
    authenticationData = v7->_authenticationData;
    v7->_authenticationData = (NSString *)v28;

    v7->_deviceCategory = [v5 deviceCategory];
    v30 = [v5 appleSubscription];

    if (v30)
    {
      v31 = [VSApplicationAppleSubscription alloc];
      v32 = [v5 appleSubscription];

      if (!v32) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [userAccount appleSubscription] parameter must not be nil."];
      }
      v33 = [v5 appleSubscription];
      v34 = (void *)[v33 copy];
      uint64_t v35 = [(VSApplicationAppleSubscription *)v31 initWithAppleSubscription:v34];
      appleSubscription = v7->_appleSubscription;
      v7->_appleSubscription = (VSApplicationAppleSubscription *)v35;
    }
  }

  return v7;
}

- (id)userAccountForProviderID:(id)a3 allowedBundleIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VSApplicationUserAccount *)self bundleId];
  uint64_t v9 = [(VSApplicationUserAccount *)self bundleId];
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = (void *)v9;
  v11 = [(VSApplicationUserAccount *)self bundleId];

  if (!v11) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self bundleId] parameter must not be nil."];
  }
  v12 = [(VSApplicationUserAccount *)self bundleId];
  char v13 = [v7 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
LABEL_6:
    v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, "JS User Account with no bundle ID, setting source type to VSUserAccountSourceTypeProvider", v36, 2u);
    }

    id v16 = v6;
    uint64_t v14 = 2;
    v8 = v16;
  }
  v17 = [(VSApplicationUserAccount *)self updateURL];

  if (!v17) {
    goto LABEL_13;
  }
  v18 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v19 = [(VSApplicationUserAccount *)self updateURL];

  if (!v19) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self updateURL] parameter must not be nil."];
  }
  v20 = [(VSApplicationUserAccount *)self updateURL];
  v17 = [v18 URLWithString:v20];

  if (!v17)
  {
    v17 = VSErrorLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[VSApplicationUserAccount userAccountForProviderID:allowedBundleIDs:](v17);
    }
    v21 = 0;
  }
  else
  {
LABEL_13:
    v21 = [[VSUserAccount alloc] initWithAccountType:[(VSApplicationUserAccount *)self accountType] updateURL:v17 sourceType:v14 sourceIdentifier:v8];
    uint64_t v22 = [(VSApplicationUserAccount *)self identifier];
    v23 = (void *)[v22 copy];
    [(VSUserAccount *)v21 setIdentifier:v23];

    [(VSUserAccount *)v21 setSignedOut:[(VSApplicationUserAccount *)self isSignedOut]];
    v24 = [(VSApplicationUserAccount *)self subscriptionBillingCycleEndDate];
    uint64_t v25 = (void *)[v24 copy];
    [(VSUserAccount *)v21 setSubscriptionBillingCycleEndDate:v25];

    v26 = [(VSApplicationUserAccount *)self tierIdentifiers];
    v27 = (void *)[v26 copy];
    [(VSUserAccount *)v21 setTierIdentifiers:v27];

    uint64_t v28 = [(VSApplicationUserAccount *)self billingIdentifier];
    v29 = (void *)[v28 copy];
    [(VSUserAccount *)v21 setBillingIdentifier:v29];

    v30 = [(VSApplicationUserAccount *)self authenticationData];
    v31 = (void *)[v30 copy];
    [(VSUserAccount *)v21 setAuthenticationData:v31];

    v32 = [(VSApplicationUserAccount *)self appleSubscription];
    v33 = [v32 appleSubscription];
    v34 = (void *)[v33 copy];
    [(VSUserAccount *)v21 setAppleSubscription:v34];
  }

  return v21;
}

+ (id)userAccountsFromApplicationUserAccounts:(id)a3 ForProviderID:(id)a4 allowedBundleIDs:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "userAccountForProviderID:allowedBundleIDs:", v8, v9, (void)v18);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)applicationUserAccountsFromUserAccounts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc((Class)objc_opt_class());
        id v10 = objc_msgSend(v9, "initWithUserAccount:", v8, (void)v12);
        [v3 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)authenticationData
{
  return self->_authenticationData;
}

- (void)setAuthenticationData:(id)a3
{
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isSignedOut
{
  return self->_signedOut;
}

- (void)setSignedOut:(BOOL)a3
{
  self->_signedOut = a3;
}

- (int64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(int64_t)a3
{
  self->_deviceCategory = a3;
}

- (BOOL)requiresSystemTrust
{
  return self->_requiresSystemTrust;
}

- (void)setRequiresSystemTrust:(BOOL)a3
{
  self->_requiresSystemTrust = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)subscriptionBillingCycleEndDate
{
  return self->_subscriptionBillingCycleEndDate;
}

- (void)setSubscriptionBillingCycleEndDate:(id)a3
{
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (void)setTierIdentifiers:(id)a3
{
}

- (NSString)updateURL
{
  return self->_updateURL;
}

- (void)setUpdateURL:(id)a3
{
}

- (VSApplicationAppleSubscription)appleSubscription
{
  return self->_appleSubscription;
}

- (void)setAppleSubscription:(id)a3
{
}

- (VSUserAccount)originatingUserAccount
{
  return self->_originatingUserAccount;
}

- (void)setOriginatingUserAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingUserAccount, 0);
  objc_storeStrong((id *)&self->_appleSubscription, 0);
  objc_storeStrong((id *)&self->_updateURL, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionBillingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);

  objc_storeStrong((id *)&self->_authenticationData, 0);
}

- (void)userAccountForProviderID:(os_log_t)log allowedBundleIDs:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "JS User Account with invalid URL, it will be skipped.", v1, 2u);
}

@end