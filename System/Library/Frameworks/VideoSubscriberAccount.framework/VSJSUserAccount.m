@interface VSJSUserAccount
+ (id)jsUserAccountsFromUserAccounts:(id)a3;
+ (id)userAccountsFromJSUserAccounts:(id)a3;
- (BOOL)isSignedOut;
- (BOOL)requiresSystemTrust;
- (NSArray)tierIdentifiers;
- (NSDate)subscriptionBillingCycleEndDate;
- (NSString)authenticationData;
- (NSString)billingIdentifier;
- (NSString)bundleId;
- (NSString)identifier;
- (NSString)updateURL;
- (VSJSAppleSubscription)appleSubscription;
- (VSJSUserAccount)initWithUserAccount:(id)a3;
- (VSUserAccount)originatingUserAccount;
- (id)userAccount;
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
- (void)userAccount;
@end

@implementation VSJSUserAccount

- (VSJSUserAccount)initWithUserAccount:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VSJSUserAccount;
  v6 = [(VSJSObject *)&v36 init];
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
      v31 = [VSJSAppleSubscription alloc];
      v32 = (void *)[v30 copy];
      uint64_t v33 = [(VSJSAppleSubscription *)v31 initWithAppleSubscription:v32];
      appleSubscription = v7->_appleSubscription;
      v7->_appleSubscription = (VSJSAppleSubscription *)v33;
    }
  }

  return v7;
}

- (id)userAccount
{
  v3 = [(VSJSUserAccount *)self bundleId];
  if (v3)
  {
    v4 = [(VSJSUserAccount *)self updateURL];
    if (v4)
    {
      id v5 = (void *)MEMORY[0x1E4F1CB10];
      v6 = [(VSJSUserAccount *)self updateURL];

      if (!v6) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self updateURL] parameter must not be nil."];
      }
      v7 = [(VSJSUserAccount *)self updateURL];
      v8 = [v5 URLWithString:v7];

      if (!v8)
      {
        v8 = VSErrorLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(VSJSUserAccount *)v8 userAccount];
        }
        uint64_t v16 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v8 = 0;
    }
    uint64_t v16 = [[VSUserAccount alloc] initWithAccountType:[(VSJSUserAccount *)self accountType] updateURL:v8 sourceType:0 sourceIdentifier:v3];
    v24 = [(VSJSUserAccount *)self identifier];
    uint64_t v25 = (void *)[v24 copy];
    [(VSUserAccount *)v16 setIdentifier:v25];

    [(VSUserAccount *)v16 setSignedOut:[(VSJSUserAccount *)self isSignedOut]];
    v26 = [(VSJSUserAccount *)self subscriptionBillingCycleEndDate];
    v27 = (void *)[v26 copy];
    [(VSUserAccount *)v16 setSubscriptionBillingCycleEndDate:v27];

    uint64_t v28 = [(VSJSUserAccount *)self tierIdentifiers];
    v29 = (void *)[v28 copy];
    [(VSUserAccount *)v16 setTierIdentifiers:v29];

    v30 = [(VSJSUserAccount *)self billingIdentifier];
    v31 = (void *)[v30 copy];
    [(VSUserAccount *)v16 setBillingIdentifier:v31];

    v32 = [(VSJSUserAccount *)self authenticationData];
    uint64_t v33 = (void *)[v32 copy];
    [(VSUserAccount *)v16 setAuthenticationData:v33];

    v34 = [(VSJSUserAccount *)self appleSubscription];
    v35 = [v34 appleSubscription];
    objc_super v36 = (void *)[v35 copy];
    [(VSUserAccount *)v16 setAppleSubscription:v36];

LABEL_14:
    goto LABEL_15;
  }
  v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(VSJSUserAccount *)v4 userAccount];
  }
  uint64_t v16 = 0;
LABEL_15:

  return v16;
}

- (id)userAccountForProviderID:(id)a3 allowedBundleIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VSJSUserAccount *)self bundleId];
  uint64_t v9 = [(VSJSUserAccount *)self bundleId];
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = [(VSJSUserAccount *)self bundleId];

  if (!v11) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self bundleId] parameter must not be nil."];
  }
  uint64_t v12 = [(VSJSUserAccount *)self bundleId];
  char v13 = [v7 containsObject:v12];

  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, "JS User Account with no bundle ID, setting source type to VSUserAccountSourceTypeProvider", v43, 2u);
    }

    id v16 = v6;
    uint64_t v14 = 2;
    v8 = v16;
  }
  uint64_t v17 = [(VSJSUserAccount *)self updateURL];

  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v19 = [(VSJSUserAccount *)self updateURL];

  if (!v19) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self updateURL] parameter must not be nil."];
  }
  uint64_t v20 = [(VSJSUserAccount *)self updateURL];
  uint64_t v17 = [v18 URLWithString:v20];

  if (!v17)
  {
    uint64_t v17 = VSErrorLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(VSJSUserAccount *)v17 userAccount];
    }
    uint64_t v21 = 0;
  }
  else
  {
LABEL_13:
    uint64_t v21 = [[VSUserAccount alloc] initWithAccountType:[(VSJSUserAccount *)self accountType] updateURL:v17 sourceType:v14 sourceIdentifier:v8];
    uint64_t v22 = [(VSJSUserAccount *)self identifier];
    uint64_t v23 = (void *)[v22 copy];
    [(VSUserAccount *)v21 setIdentifier:v23];

    [(VSUserAccount *)v21 setSignedOut:[(VSJSUserAccount *)self isSignedOut]];
    v24 = [(VSJSUserAccount *)self subscriptionBillingCycleEndDate];
    uint64_t v25 = (void *)[v24 copy];
    [(VSUserAccount *)v21 setSubscriptionBillingCycleEndDate:v25];

    v26 = [(VSJSUserAccount *)self tierIdentifiers];
    v27 = (void *)[v26 copy];
    [(VSUserAccount *)v21 setTierIdentifiers:v27];

    uint64_t v28 = [(VSJSUserAccount *)self billingIdentifier];
    v29 = (void *)[v28 copy];
    [(VSUserAccount *)v21 setBillingIdentifier:v29];

    v30 = [(VSJSUserAccount *)self authenticationData];
    v31 = (void *)[v30 copy];
    [(VSUserAccount *)v21 setAuthenticationData:v31];

    v32 = [(VSJSUserAccount *)self appleSubscription];
    uint64_t v33 = [v32 appleSubscription];
    v34 = (void *)[v33 copy];
    [(VSUserAccount *)v21 setAppleSubscription:v34];
  }

  return v21;
}

+ (id)userAccountsFromJSUserAccounts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "userAccount", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)jsUserAccountsFromUserAccounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_alloc((Class)objc_opt_class());
        long long v12 = objc_msgSend(v11, "initWithUserAccount:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
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

- (VSJSAppleSubscription)appleSubscription
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

- (void)userAccount
{
}

@end