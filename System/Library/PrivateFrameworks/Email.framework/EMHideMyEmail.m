@interface EMHideMyEmail
+ (EMHideMyEmail)sharedInstance;
+ (OS_os_log)log;
- (ACAccount)primaryAccount;
- (AKPrivateEmailController)controller;
- (BOOL)_isConfiguredForAccount:(uint64_t *)a3 error:;
- (BOOL)hasCheckedIfFeatureIsAvailable;
- (BOOL)isConfigured:(id *)a3;
- (BOOL)isConfiguredForAccountWithAltDSID:(id)a3 error:(id *)a4;
- (EFAssertableScheduler)scheduler;
- (EFLocked)isAvailableLocked;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (EMHideMyEmail)init;
- (NSNumber)isAvailable;
- (NSString)forwardingEmailForPrimaryAccount;
- (NSString)primaryAccountAltDSID;
- (id)_emailAddressFromAddress:(uint64_t)a1;
- (id)addLocalizedDisplayNameForAddress:(id)a3;
- (id)forwardingEmailForAccount:(id)a3;
- (void)_hasCloudPlusSubscription:(void *)a1;
- (void)_lookUpHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:;
- (void)_registerHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:;
- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 completion:(id)a4;
- (void)generateReplyToEmailForRecipient:(id)a3 hmeAddress:(id)a4 account:(id)a5 completion:(id)a6;
- (void)hideMyEmailAddressForRecipientAddress:(id)a3 altDSID:(id)a4 completion:(id)a5;
- (void)hideMyEmailAddressForRecipientAddress:(id)a3 completion:(id)a4;
- (void)hideMyEmailAddresses:(id)a3;
- (void)hideMyEmailAddressesInAccountWithAltDSID:(id)a3 completion:(id)a4;
- (void)isAvailable:(id)a3;
- (void)isHideMyEmailAddressValid:(id)a3 senderAddress:(id)a4 completion:(id)a5;
- (void)resetIsAvailable;
- (void)setController:(id)a3;
- (void)setIsAvailableLocked:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation EMHideMyEmail

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EMHideMyEmail_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1) {
    dispatch_once(&log_onceToken_16, block);
  }
  v2 = (void *)log_log_16;
  return (OS_os_log *)v2;
}

void __20__EMHideMyEmail_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;
}

+ (EMHideMyEmail)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_instance;
  return (EMHideMyEmail *)v2;
}

void __31__EMHideMyEmail_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(EMHideMyEmail);
  os_log_t v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

- (EMHideMyEmail)init
{
  v14.receiver = self;
  v14.super_class = (Class)EMHideMyEmail;
  v2 = [(EMHideMyEmail *)&v14 init];
  if (v2)
  {
    id v3 = (AKPrivateEmailController *)objc_alloc_init(MEMORY[0x1E4F4F080]);
    controller = v2->_controller;
    v2->_controller = v3;

    uint64_t v5 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMHideMyEmail"];
    scheduler = v2->_scheduler;
    v2->_scheduler = (EFAssertableScheduler *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v8 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v9 = [v7 initWithObject:v8];
    isAvailableLocked = v2->_isAvailableLocked;
    v2->_isAvailableLocked = (EFLocked *)v9;

    v11 = objc_alloc_init(EMCoreAnalyticsCollector);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v11;
  }
  return v2;
}

- (NSNumber)isAvailable
{
  v2 = [(EMHideMyEmail *)self isAvailableLocked];
  id v3 = [v2 getObject];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))()) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)isAvailable:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EMHideMyEmail *)self isAvailable];
  if (v5)
  {
    v6 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v5 BOOLValue];
      v8 = @"not ";
      if (v7) {
        v8 = &stru_1F1A3DFB0;
      }
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "Hide My Email subscription is %{public}@available.", buf, 0xCu);
    }

    if (v4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __29__EMHideMyEmail_isAvailable___block_invoke_73;
      v14[3] = &unk_1E63E36B0;
      id v16 = v4;
      id v15 = v5;
      uint64_t v9 = v14;
      v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      [v10 performBlock:v9];
    }
  }
  else
  {
    v11 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEFDB000, v11, OS_LOG_TYPE_DEFAULT, "Hide My Email feature not available for account. Checking current subscription status.", buf, 2u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __29__EMHideMyEmail_isAvailable___block_invoke;
    v19[3] = &unk_1E63E3638;
    v19[4] = self;
    id v20 = v4;
    v12 = (void *)MEMORY[0x1C18A2160](v19);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __29__EMHideMyEmail_isAvailable___block_invoke_61;
    v17[3] = &unk_1E63E3688;
    id v18 = v12;
    id v13 = v12;
    -[EMHideMyEmail _hasCloudPlusSubscription:](self, v17);
  }
}

void __29__EMHideMyEmail_isAvailable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) isAvailableLocked];
  int v7 = [NSNumber numberWithBool:a2];
  [v6 setObject:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__EMHideMyEmail_isAvailable___block_invoke_2;
  v10[3] = &unk_1E63E3610;
  char v13 = a2;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  uint64_t v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];
}

uint64_t __29__EMHideMyEmail_isAvailable___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[EMHideMyEmail log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromBOOL();
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1BEFDB000, v2, OS_LOG_TYPE_DEFAULT, "Hide My Email subscription availablity check returned: %@.", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __29__EMHideMyEmail_isAvailable___block_invoke_61(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (a2
    && !+[EMHMERecipientCreationRequest canCreateHMEReplyToAddress:v7])
  {
    id v8 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 identifier];
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "AppleAccount<%@> missing PremimumMailSettings Dataclass. Renewing Credentials...", buf, 0xCu);
    }
    v10 = [MEMORY[0x1E4F179C8] defaultStore];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__EMHideMyEmail_isAvailable___block_invoke_64;
    v11[3] = &unk_1E63E3660;
    id v12 = v7;
    id v13 = *(id *)(a1 + 32);
    [v10 renewCredentialsForAccount:v12 completion:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __29__EMHideMyEmail_isAvailable___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      __29__EMHideMyEmail_isAvailable___block_invoke_64_cold_1(v7, (uint64_t)v5, (uint64_t)&v12);
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) reload];
  if (+[EMHMERecipientCreationRequest canCreateHMEReplyToAddress:*(void *)(a1 + 32)])
  {
    v6 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) identifier];
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "AppleAccount<%@> renewed credentials and updated Premium Mail Settings.", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMHideMyEmailErrorDomain" code:1 userInfo:0];
  v10 = +[EMHideMyEmail log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = [*(id *)(a1 + 32) identifier];
    __29__EMHideMyEmail_isAvailable___block_invoke_64_cold_1(v11, (uint64_t)v9, (uint64_t)&v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_9:
}

- (void)_hasCloudPlusSubscription:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 scheduler];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke;
    v5[3] = &unk_1E63E3728;
    id v6 = v3;
    [v4 performBlock:v5];
  }
}

uint64_t __29__EMHideMyEmail_isAvailable___block_invoke_73(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);
  return v3(v1, v2, 0);
}

- (void)resetIsAvailable
{
  id v3 = [(EMHideMyEmail *)self isAvailableLocked];
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v2];
}

- (BOOL)isConfigured:(id *)a3
{
  id v5 = [(EMHideMyEmail *)self primaryAccount];
  LOBYTE(a3) = -[EMHideMyEmail _isConfiguredForAccount:error:]((BOOL)self, v5, (uint64_t *)a3);

  return (char)a3;
}

- (BOOL)_isConfiguredForAccount:(uint64_t *)a3 error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!a1) {
    goto LABEL_18;
  }
  if (v5)
  {
    uint64_t v7 = [(id)a1 forwardingEmailForAccount:v5];
    a1 = v7 != 0;

    if (a3 && !v7)
    {
      id v8 = @"Forwarding email address is not configured";
LABEL_8:
      objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", v8);
      a1 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      uint64_t v9 = +[EMHideMyEmail log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[EMHideMyEmail _isConfiguredForAccount:error:](a3, v9);
      }

      goto LABEL_13;
    }
    if (a3) {
      goto LABEL_10;
    }
  }
  else
  {
    if (a3)
    {
      id v8 = @"Requires account to check for forwarding email";
      goto LABEL_8;
    }
    a1 = 0;
  }
LABEL_13:
  v10 = +[EMHideMyEmail log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (a1) {
      id v11 = @"YES";
    }
    int v13 = 138412290;
    uint64_t v14 = v11;
    _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, "Hide My Email configured for account:%@.", (uint8_t *)&v13, 0xCu);
  }

LABEL_18:
  return a1;
}

- (BOOL)isConfiguredForAccountWithAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v8 = [v7 authKitAccountWithAltDSID:v6];

  LOBYTE(a4) = -[EMHideMyEmail _isConfiguredForAccount:error:]((BOOL)self, v8, (uint64_t *)a4);
  return (char)a4;
}

- (id)addLocalizedDisplayNameForAddress:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 localizedStringForKey:@"MAIL_HIDE_MY_EMAIL_FRIENDLY_NAME" value:&stru_1F1A3DFB0 table:0];

  if (v3)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v3];
    [v6 setDisplayName:v5];
    id v7 = [v6 stringValue];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (NSString)forwardingEmailForPrimaryAccount
{
  id v3 = [(EMHideMyEmail *)self primaryAccount];
  if (v3)
  {
    id v4 = [(EMHideMyEmail *)self forwardingEmailForAccount:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)forwardingEmailForAccount:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"EMHideMyEmail.m", 190, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v7 = [v6 forwardingEmailForAccount:v5];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F4EF40] sharedInstance];
    v10 = [(EMHideMyEmail *)self primaryAccountAltDSID];
    id v11 = [v9 authKitAccountWithAltDSID:v10];

    int v12 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v11 username];
      *(_DWORD *)buf = 67109376;
      int v26 = 0;
      __int16 v27 = 1024;
      BOOL v28 = v13 != 0;
      _os_log_impl(&dword_1BEFDB000, v12, OS_LOG_TYPE_DEFAULT, "Attempt to fetch forwardingEmail address from AKAccountManager.sharedInstance forwardingEmailForAccount is %{BOOL}d whereas with altDSID address is %{BOOL}d", buf, 0xEu);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:&unk_1F1A61D70 forKeyedSubscript:@"forwardingEmailForHideMyEmail"];
    uint64_t v15 = [NSNumber numberWithInt:1];
    [v14 setObject:v15 forKeyedSubscript:@"forwardingEmailForAccountIsNil"];

    uint64_t v16 = NSNumber;
    v17 = [v11 username];
    id v18 = [v16 numberWithInt:v17 == 0];
    [v14 setObject:v18 forKeyedSubscript:@"forwardingEmailWithAltDSIDIsNil"];

    v19 = [EMCoreAnalyticsEvent alloc];
    id v20 = (void *)[v14 copy];
    v21 = [(EMCoreAnalyticsEvent *)v19 initWithEventName:@"com.apple.mail.forwardingEmailForHideMyEmail" collectionData:v20];

    v22 = [(EMHideMyEmail *)self analyticsCollector];
    [v22 logOneTimeEvent:v21];

    id v8 = [v11 username];
  }
  return v8;
}

- (void)hideMyEmailAddressForRecipientAddress:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(EMHideMyEmail *)self primaryAccountAltDSID];
  [(EMHideMyEmail *)self hideMyEmailAddressForRecipientAddress:v8 altDSID:v7 completion:v6];
}

- (void)hideMyEmailAddressForRecipientAddress:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, a3);
  if (v8)
  {
    id v11 = [(EMHideMyEmail *)self controller];
    int v12 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke;
    v14[3] = &unk_1E63E3700;
    void v14[4] = v9;
    [v11 lookupPrivateEmailForAltDSID:v8 withKey:v10 completion:v14];
  }
  else
  {
    int v12 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_115;
    v13[3] = &unk_1E63E3728;
    v13[4] = v9;
    id v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v11 performBlock:v13];
  }
}

- (id)_emailAddressFromAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v3];
    id v5 = [v4 simpleAddress];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E63E36D8;
  id v7 = v5;
  id v11 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [v2 privateEmailAddress];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      id v5 = +[EMHideMyEmail log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2_cold_1();
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_115(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"DSID required to check is address is HME");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

- (void)hideMyEmailAddresses:(id)a3
{
  id v5 = a3;
  id v4 = [(EMHideMyEmail *)self primaryAccountAltDSID];
  [(EMHideMyEmail *)self hideMyEmailAddressesInAccountWithAltDSID:v4 completion:v5];
}

- (void)hideMyEmailAddressesInAccountWithAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(EMHideMyEmail *)self controller];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(EMHideMyEmail *)self controller];
      id v12 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke;
      v15[3] = &unk_1E63E2E80;
      v15[4] = v8;
      [v11 listAllPrivateEmailsForAltDSID:v6 completion:v15];
    }
    else
    {
      id v12 = v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_124;
      v14[3] = &unk_1E63E3728;
      void v14[4] = v8;
      id v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      [v11 performBlock:v14];
    }
  }
  else
  {
    id v12 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_128;
    v13[3] = &unk_1E63E3728;
    v13[4] = v7;
    id v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v11 performBlock:v13];
  }
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2;
  v10[3] = &unk_1E63E36D8;
  id v7 = v5;
  id v11 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    objc_msgSend(v2, "ef_mapSelector:", sel_privateEmailAddress);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v5 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_124(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Missing SPI");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_128(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"DSID required to fetch all HME addresses");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

- (void)isHideMyEmailAddressValid:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(EMHideMyEmail *)self controller];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2;
    v13[3] = &unk_1E63E3750;
    v14[0] = v7;
    v14[1] = self;
    id v15 = v8;
    [(EMHideMyEmail *)self hideMyEmailAddresses:v13];
    id v11 = (id *)v14;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke;
    v16[3] = &unk_1E63E3728;
    id v17 = v8;
    id v12 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v12 performBlock:v16];
    id v11 = &v17;
  }
}

uint64_t __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v5 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v7 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2_cold_1();
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "containsObject:", *(void *)(a1 + 32)));
  [v8 setObject:v9 forKeyedSubscript:@"isHideMyEmailAddressValid"];

  char v10 = [v6 domain];
  [v8 setObject:v10 forKeyedSubscript:@"errorDomain"];

  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  [v8 setObject:v11 forKeyedSubscript:@"errorCode"];

  id v12 = [EMCoreAnalyticsEvent alloc];
  id v13 = (void *)[v8 copy];
  id v14 = [(EMCoreAnalyticsEvent *)v12 initWithEventName:@"com.apple.mail.hideMyEmailAddressValid" collectionData:v13];

  id v15 = [*(id *)(a1 + 40) analyticsCollector];
  [v15 logOneTimeEvent:v14];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, a3);
  id v7 = [(EMHideMyEmail *)self primaryAccountAltDSID];
  [(EMHideMyEmail *)self generateHideMyEmailAddressForEmailAddress:v6 altDSID:v7 completion:v8];
}

- (void)generateHideMyEmailAddressForEmailAddress:(id)a3 altDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EMHideMyEmail *)self controller];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    id v14 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_4;
    v16[3] = &unk_1E63E3728;
    void v16[4] = v10;
    id v15 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v15 performBlock:v16];
LABEL_6:
    id v13 = (id *)(v14 + 4);

    goto LABEL_7;
  }
  if (!v9)
  {
    id v14 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_3;
    v17[3] = &unk_1E63E3728;
    void v17[4] = v10;
    id v15 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v15 performBlock:v17];
    goto LABEL_6;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke;
  v18[3] = &unk_1E63E37A0;
  id v21 = v10;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  -[EMHideMyEmail _lookUpHideMyEmailAddress:altDSID:completion:](self, v19, v20, v18);
  id v13 = &v21;

LABEL_7:
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_2;
  v9[3] = &unk_1E63E3778;
  id v4 = v3;
  id v10 = v4;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v8 performBlock:v9];
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    -[EMHideMyEmail _registerHideMyEmailAddress:altDSID:completion:](*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
  }
}

- (void)_registerHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [a1 controller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke;
    v11[3] = &unk_1E63E3700;
    id v12 = v9;
    [v10 registerPrivateEmailForAltDSID:v8 withKey:v7 completion:v11];
  }
}

- (void)_lookUpHideMyEmailAddress:(void *)a3 altDSID:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [a1 controller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke;
    v11[3] = &unk_1E63E3700;
    id v12 = v9;
    [v10 lookupPrivateEmailForAltDSID:v8 withKey:v7 completion:v11];
  }
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"DSID required to generate new HME address");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __78__EMHideMyEmail_generateHideMyEmailAddressForEmailAddress_altDSID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"SPI is missing");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E63E36D8;
  id v7 = v5;
  id v11 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];
}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [v2 privateEmailAddress];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      id v5 = +[EMHideMyEmail log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1();
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2;
  v10[3] = &unk_1E63E36D8;
  id v7 = v5;
  id v11 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v12 = v8;
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];
}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v5 = [v2 privateEmailAddress];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v4 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1(a1, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)generateReplyToEmailForRecipient:(id)a3 hmeAddress:(id)a4 account:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [EMHMERecipientCreationRequest alloc];
  id v15 = -[EMHideMyEmail _emailAddressFromAddress:]((uint64_t)self, v11);
  uint64_t v16 = [(EMHMERecipientCreationRequest *)v14 initWithAccount:v12 recipient:v10 hmeAddress:v15];

  id v17 = +[EMHideMyEmail log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v19 = [(EMHMERecipientCreationRequest *)v16 debugDescription];
    id v20 = [v10 debugDescription];
    id v21 = [v11 debugDescription];
    *(_DWORD *)buf = 138412802;
    v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    _os_log_debug_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEBUG, "ReplyTo address Request %@ for recipient:%@ hmeAddress:%@", buf, 0x20u);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke;
  v22[3] = &unk_1E63E37F0;
  id v18 = v13;
  id v23 = v18;
  [(AARequest *)v16 performRequestWithHandler:v22];
}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2;
  v11[3] = &unk_1E63E37C8;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  id v14 = *(id *)(a1 + 32);
  id v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v10 performBlock:v11];
}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 replyToAddress];
  if (!v3 || *(void *)(a1 + 40))
  {
    id v4 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) responseDictionary];
      id v6 = [*(id *)(a1 + 40) localizedDescription];
      __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2_cold_1(v5, v6, (uint64_t)v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (ACAccount)primaryAccount
{
  id v2 = [MEMORY[0x1E4F4EF40] sharedInstance];
  uint64_t v3 = [v2 primaryAuthKitAccount];

  return (ACAccount *)v3;
}

- (NSString)primaryAccountAltDSID
{
  id v2 = [(EMHideMyEmail *)self primaryAccount];
  uint64_t v3 = [v2 accountPropertyForKey:@"altDSID"];

  return (NSString *)v3;
}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F59BB8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2;
  v2[3] = &unk_1E63E3818;
  id v3 = *(id *)(a1 + 32);
  [v1 requestFeatureWithId:@"mail.hide-my-email.create" completion:v2];
}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v5 status];
    id v9 = 0;
    BOOL v10 = v8 == 0;
  }
  else
  {
    id v11 = +[EMHideMyEmail log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2_cold_1();
    }

    BOOL v10 = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
  }
  (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v10, v9);
}

- (BOOL)hasCheckedIfFeatureIsAvailable
{
  return self->_hasCheckedIfFeatureIsAvailable;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (AKPrivateEmailController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (EFAssertableScheduler)scheduler
{
  return (EFAssertableScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScheduler:(id)a3
{
}

- (EFLocked)isAvailableLocked
{
  return self->_isAvailableLocked;
}

- (void)setIsAvailableLocked:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAvailableLocked, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
}

void __29__EMHideMyEmail_isAvailable___block_invoke_64_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "AppleAccount %@ missing PremimumMailSettings Dataclass. Renewing Credentials Failed %@", v4, v5);
}

- (void)_isConfiguredForAccount:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Hide My Email configuration error for account:%@", (uint8_t *)&v3, 0xCu);
}

void __74__EMHideMyEmail_hideMyEmailAddressForRecipientAddress_altDSID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1BEFDB000, v3, v4, "Is HME address failed with error: %{public}@", v5);
}

void __69__EMHideMyEmail_hideMyEmailAddressesInAccountWithAltDSID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1BEFDB000, v3, v4, "Fetching HME addresses failed with error: %{public}@", v5);
}

void __68__EMHideMyEmail_isHideMyEmailAddressValid_senderAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1BEFDB000, v3, v4, "The checking for HME address is valid failed:%{public}@, adding telemetry for isHideMyEmailAddressValid session", v5);
}

void __62__EMHideMyEmail__lookUpHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1BEFDB000, v3, v4, "The _lookUpHideMyEmailAddress for HME address failed with error: %{public}@", v5);
}

void __64__EMHideMyEmail__registerHideMyEmailAddress_altDSID_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Failed to generate new HME address. %{public}@", (uint8_t *)&v3, 0xCu);
}

void __80__EMHideMyEmail_generateReplyToEmailForRecipient_hmeAddress_account_completion___block_invoke_2_cold_1(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_3((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1BEFDB000, "Invalid replyToAddress. Response dictionary:%@ error:%@", v5, v6);
}

void __43__EMHideMyEmail__hasCloudPlusSubscription___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1BEFDB000, v3, v4, "Failed to check for HME feature. %{public}@", v5);
}

@end