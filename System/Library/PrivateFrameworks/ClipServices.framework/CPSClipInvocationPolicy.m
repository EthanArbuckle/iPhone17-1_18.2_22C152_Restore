@interface CPSClipInvocationPolicy
+ (BOOL)supportsSecureCoding;
+ (id)eligiblePolicy;
+ (id)ineligiblePolicyWithReason:(int64_t)a3;
+ (id)invocationPolicyWithAMSDict:(id)a3;
+ (void)requestAccountPolicyWithCompletion:(id)a3;
- (BOOL)canShowHeroImage;
- (BOOL)isEligible;
- (BOOL)isIneligibleDueToContentRestriction;
- (BOOL)isRecoverable;
- (CPSClipInvocationPolicy)initWithCoder:(id)a3;
- (CPSClipInvocationPolicy)initWithEligible:(BOOL)a3 reason:(int64_t)a4;
- (NSString)localizedTitle;
- (id)description;
- (id)localizedMessageForClipMetadata:(id)a3;
- (int64_t)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSClipInvocationPolicy

- (CPSClipInvocationPolicy)initWithEligible:(BOOL)a3 reason:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CPSClipInvocationPolicy;
  v6 = [(CPSClipInvocationPolicy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_eligible = a3;
    v6->_reason = a4;
    v8 = v6;
  }

  return v7;
}

+ (id)eligiblePolicy
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEligible:1 reason:0];

  return v2;
}

+ (id)ineligiblePolicyWithReason:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithEligible:0 reason:a3];

  return v3;
}

+ (void)requestAccountPolicyWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  if (CPSBypassAccountEligibilityCheck())
  {
    v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "%{public}@ (%p): Bypassing account policy check.", buf, 0x16u);
    }
    v7 = +[CPSClipInvocationPolicy eligiblePolicy];
    v4[2](v4, v7);
  }
  else
  {
    uint64_t v8 = CPSAccountPolicyOverride();
    v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        v11 = v9;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a1;
        *(_WORD *)&buf[22] = 2048;
        v24 = (void *)v8;
        _os_log_impl(&dword_21559C000, v11, OS_LOG_TYPE_INFO, "%{public}@ (%p): Use policy override from user defaults: value = %ld ", buf, 0x20u);
      }
      v7 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:v8];
      v4[2](v4, v7);
    }
    else
    {
      if (v10)
      {
        v12 = v9;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a1;
        _os_log_impl(&dword_21559C000, v12, OS_LOG_TYPE_INFO, "%{public}@ (%p): Determining account policy.", buf, 0x16u);
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2050000000;
      v13 = (void *)getMCProfileConnectionClass_softClass_0;
      uint64_t v22 = getMCProfileConnectionClass_softClass_0;
      if (!getMCProfileConnectionClass_softClass_0)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getMCProfileConnectionClass_block_invoke_0;
        v24 = &unk_26424E580;
        v25 = &v19;
        __getMCProfileConnectionClass_block_invoke_0((uint64_t)buf);
        v13 = (void *)v20[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v19, 8);
      v7 = [v14 sharedConnection];
      if ([v7 isAppClipsAllowed])
      {
        id v15 = objc_alloc_init(MEMORY[0x263F253D0]);
        [v15 setLookupFamilyInfoIfNecessary:1];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke;
        v16[3] = &unk_26424F2A8;
        id v18 = a1;
        v17 = v4;
        [v15 statusWithCompletion:v16];
      }
      else
      {
        id v15 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:6];
        v4[2](v4, v15);
      }
    }
  }
}

void __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = v7;
    int v20 = 138543874;
    uint64_t v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = objc_opt_class();
    __int16 v24 = 2048;
    uint64_t v25 = [v5 accountStatus];
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): Obtained ASDAccountStatusCode: %ld", (uint8_t *)&v20, 0x20u);
  }
  if (!v5 || v6)
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke_cold_1(a1, v12, v6);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = 12;
  }
  else
  {
    if (([v5 hasErrorStatus] & 1) == 0)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v13 = +[CPSClipInvocationPolicy eligiblePolicy];
      goto LABEL_13;
    }
    if ([v5 hasResponseFlag:1])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 1;
    }
    else if ([v5 hasResponseFlag:32])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 4;
    }
    else if ([v5 hasResponseFlag:16])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 9;
    }
    else if ([v5 hasResponseFlag:64])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 10;
    }
    else if ([v5 hasResponseFlag:4])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 11;
    }
    else if ([v5 hasResponseFlag:256])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 3;
    }
    else if ([v5 hasResponseFlag:128])
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 2;
    }
    else
    {
      id v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        v17 = v15;
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = [v5 accountStatus];
        int v20 = 138543874;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        uint64_t v23 = v18;
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        _os_log_impl(&dword_21559C000, v17, OS_LOG_TYPE_INFO, "%{public}@ (%p): Unhandled ASDAccountStatusCode encountered while determining account policy. Account status: %ld", (uint8_t *)&v20, 0x20u);
      }
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = 15;
    }
  }
  uint64_t v13 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:v11];
LABEL_13:
  id v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v13);
}

+ (id)invocationPolicyWithAMSDict:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v16 = 138543618;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2048;
    uint64_t v19 = (uint64_t)a1;
    _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "%{public}@ (%p): Determining clip policy.", (uint8_t *)&v16, 0x16u);
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263F25428]) initWithDictionary:v4];

  uint64_t v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v7 responseCode];
    int v16 = 138543874;
    uint64_t v17 = (uint64_t)a1;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): Obtained ASDClipRestrictionsTask response code: %ld", (uint8_t *)&v16, 0x20u);
  }
  if (CPSAMSRestrictionsCodeOverride() == 14) {
    goto LABEL_6;
  }
  if ([v7 hasErrorStatus])
  {
    if ([v7 hasResponseFlag:1])
    {
      uint64_t v12 = 9;
      goto LABEL_7;
    }
    if ([v7 hasResponseFlag:2])
    {
      uint64_t v12 = 5;
      goto LABEL_7;
    }
    if (![v7 hasResponseFlag:4])
    {
      uint64_t v12 = 15;
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = 14;
LABEL_7:
    uint64_t v13 = +[CPSClipInvocationPolicy ineligiblePolicyWithReason:v12];
    goto LABEL_12;
  }
  uint64_t v13 = +[CPSClipInvocationPolicy eligiblePolicy];
LABEL_12:
  id v14 = (void *)v13;

  return v14;
}

- (NSString)localizedTitle
{
  unint64_t v2 = self->_reason - 1;
  if (v2 > 4)
  {
    v3 = 0;
  }
  else
  {
    v3 = _CPSLocalizedString(off_26424F2E0[v2], &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
  }

  return (NSString *)v3;
}

- (id)localizedMessageForClipMetadata:(id)a3
{
  id v4 = a3;
  switch(self->_reason)
  {
    case 1:
      id v5 = @"To use this app clip, you need to sign in with your Apple Account first.";
      goto LABEL_15;
    case 2:
      id v5 = @"Before you can proceed, you must read and accept the new Terms and Conditions in the App Store.";
      goto LABEL_15;
    case 3:
      id v5 = @"View and correct the problem in your Billing Info. If you cancel you may not be able to buy until this billing issue has been resolved.";
      goto LABEL_15;
    case 4:
      id v5 = @"To ask permission to buy the app for this app clip, open the App Store";
      goto LABEL_15;
    case 5:
      id v5 = @"To use this app clip, you first need to verify your age in the App Store";
      goto LABEL_15;
    case 6:
      id v5 = @"Due to restrictions set for this device, app clips cannot be used";
      goto LABEL_15;
    case 7:
      id v5 = @"App clips are not available with a managed Apple Account";
      goto LABEL_15;
    case 8:
      id v5 = @"This app clip is not currently available in your country or region";
      goto LABEL_15;
    case 9:
      id v5 = @"Due to restrictions set for this device, this app clip cannot be used";
      goto LABEL_15;
    case 0xALL:
      id v5 = @"App clips are not available in your region";
      goto LABEL_15;
    case 0xBLL:
      id v5 = @"App clips are not available with a restricted Apple Account";
      goto LABEL_15;
    case 0xCLL:
    case 0xDLL:
    case 0xFLL:
      id v5 = @"App Clip Unavailable";
LABEL_15:
      id v6 = _CPSLocalizedString(v5, &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
      break;
    case 0xELL:
      uint64_t v8 = NSString;
      v9 = _CPSLocalizedString(@"This app clip requires iOS %@ or later", &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
      uint64_t v10 = [v4 clipMinimumOSVersion];
      id v6 = objc_msgSend(v8, "stringWithFormat:", v9, v10);

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)isRecoverable
{
  return (self->_reason > 0xFuLL) | (0x3Eu >> self->_reason) & 1;
}

- (BOOL)isIneligibleDueToContentRestriction
{
  return (self->_reason > 0xFuLL) | (0x240u >> self->_reason) & 1;
}

- (BOOL)canShowHeroImage
{
  return (self->_reason & 0xFFFFFFFFFFFFFFFDLL) != 8;
}

- (CPSClipInvocationPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSClipInvocationPolicy;
  id v5 = [(CPSClipInvocationPolicy *)&v8 init];
  if (v5)
  {
    v5->_reason = [v4 decodeIntegerForKey:@"CPSClipInvocationPolicyKeyReason"];
    v5->_eligible = [v4 decodeBoolForKey:@"CPSClipInvocationPolicyKeyEligible"];
    id v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t reason = self->_reason;
  id v5 = a3;
  [v5 encodeInteger:reason forKey:@"CPSClipInvocationPolicyKeyReason"];
  [v5 encodeBool:self->_eligible forKey:@"CPSClipInvocationPolicyKeyEligible"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Eligible: %d Recoverable: %d Reason: %ld", -[CPSClipInvocationPolicy isEligible](self, "isEligible"), -[CPSClipInvocationPolicy isRecoverable](self, "isRecoverable"), self->_reason);
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (int64_t)reason
{
  return self->_reason;
}

void __62__CPSClipInvocationPolicy_requestAccountPolicyWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v8 = 138543874;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_21559C000, v5, OS_LOG_TYPE_ERROR, "%{public}@ (%p): Error determining account policy: %@", (uint8_t *)&v8, 0x20u);
}

@end