@interface MSAccounts
+ (BOOL)canSendMail;
+ (BOOL)canSendMailSourceAccountManagement:(int)a3;
+ (BOOL)deleteAccountsWithUniqueIdentifiers:(id)a3 error:(id *)a4;
+ (BOOL)hasActiveAccounts;
+ (BOOL)setPushStateForMailboxWithPath:(id)a3 account:(id)a4 pushState:(BOOL)a5 error:(id *)a6;
+ (id)attachmentCapabilities;
+ (id)customSignatureForSendingEmailAddress:(id)a3;
+ (void)accountValuesForKeys:(id)a3 completionBlock:(id)a4;
+ (void)accountValuesForKeys:(id)a3 launchMobileMail:(BOOL)a4 completionBlock:(id)a5;
+ (void)accountValuesForKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 launchMobileMail:(BOOL)a6 completionBlock:(id)a7;
+ (void)mailboxListingForAccountWithUniqueIdentifier:(id)a3 keys:(id)a4 completionBlock:(id)a5;
- (void)_listAccountKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 handler:(id)a6;
- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
@end

@implementation MSAccounts

+ (BOOL)hasActiveAccounts
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v2 = objc_alloc_init(MSAccounts);
  [(MSMailDefaultService *)v2 setShouldLaunchMobileMail:1];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [MEMORY[0x263EFF8C0] array];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__MSAccounts_hasActiveAccounts__block_invoke;
  v7[3] = &unk_264242DE0;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  [(MSAccounts *)v2 _listAccountKeys:v4 originatingBundleID:0 sourceAccountManagement:1 handler:v7];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __31__MSAccounts_hasActiveAccounts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v5 && [v6 count]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)accountValuesForKeys:(id)a3 completionBlock:(id)a4
{
}

+ (void)accountValuesForKeys:(id)a3 launchMobileMail:(BOOL)a4 completionBlock:(id)a5
{
}

+ (void)accountValuesForKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 launchMobileMail:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v14 = a3;
  id v11 = a4;
  id v12 = a7;
  char v13 = objc_alloc_init(MSAccounts);
  [(MSMailDefaultService *)v13 setShouldLaunchMobileMail:v8];
  [(MSAccounts *)v13 _listAccountKeys:v14 originatingBundleID:v11 sourceAccountManagement:v9 handler:v12];
}

- (void)_listAccountKeys:(id)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v21[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = (void *)MEMORY[0x2166BBAE0]();
  if (!v11)
  {
    id v14 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v14 bundleIdentifier];
  }
  v20[0] = @"keys";
  v20[1] = @"bundleID";
  v21[0] = v10;
  v21[1] = v11;
  v20[2] = @"sourceAccountManagement";
  v15 = [NSNumber numberWithUnsignedInt:v7];
  v21[2] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__MSAccounts__listAccountKeys_originatingBundleID_sourceAccountManagement_handler___block_invoke;
  v18[3] = &unk_264242E08;
  id v17 = v12;
  id v19 = v17;
  [(MSService *)self _callServicesMethod:@"ListAccounts" arguments:v16 callback:v18];
}

void __83__MSAccounts__listAccountKeys_originatingBundleID_sourceAccountManagement_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 objectForKey:@"accounts"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)canSendMail
{
  return [a1 canSendMailSourceAccountManagement:1];
}

+ (BOOL)canSendMailSourceAccountManagement:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 bundleIdentifier];

  id v6 = [(objc_class *)getMCProfileConnectionClass() sharedConnection];
  LOBYTE(v3) = [v6 canSendMail:v5 sourceAccountManagement:v3];

  return v3;
}

+ (id)customSignatureForSendingEmailAddress:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (__CFString *)a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v4 = objc_alloc_init(MSAccounts);
  [(MSMailDefaultService *)v4 setShouldLaunchMobileMail:1];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_26C6000F0;
  }
  v20 = @"sendingEmailAddress";
  v21[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__MSAccounts_customSignatureForSendingEmailAddress___block_invoke;
  v11[3] = &unk_264242E30;
  dispatch_semaphore_t v12 = v7;
  char v13 = &v14;
  BOOL v8 = v7;
  [(MSService *)v4 _callServicesMethod:@"CustomSignature" arguments:v6 callback:v11];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __52__MSAccounts_customSignatureForSendingEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectForKey:@"signature"];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)deleteAccountsWithUniqueIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v6 = objc_alloc_init(MSAccounts);
  [(MSMailDefaultService *)v6 setShouldLaunchMobileMail:1];
  id v7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v5, @"accountUniqueIdentifiers", 0);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__MSAccounts_deleteAccountsWithUniqueIdentifiers_error___block_invoke;
  v13[3] = &unk_264242E58;
  uint64_t v16 = &v17;
  dispatch_semaphore_t v14 = v8;
  v15 = &v23;
  id v9 = v8;
  [(MSService *)v6 _callServicesMethod:@"RemoveAccounts" arguments:v7 callback:v13];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  int v10 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((unsigned char *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v10 = *((unsigned __int8 *)v24 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __56__MSAccounts_deleteAccountsWithUniqueIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [v10 objectForKey:@"success"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 BOOLValue];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)mailboxListingForAccountWithUniqueIdentifier:(id)a3 keys:(id)a4 completionBlock:(id)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MSAccounts);
  BOOL v11 = (void *)MEMORY[0x2166BBAE0]([(MSMailDefaultService *)v10 setShouldLaunchMobileMail:1]);
  id v20 = v7;
  v21[0] = @"accountUniqueIdentifiers";
  dispatch_semaphore_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v21[1] = @"keys";
  v22[0] = v12;
  v22[1] = v8;
  char v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__MSAccounts_mailboxListingForAccountWithUniqueIdentifier_keys_completionBlock___block_invoke;
  v17[3] = &unk_264242E80;
  id v15 = v9;
  dispatch_semaphore_t v18 = v14;
  id v19 = v15;
  uint64_t v16 = v14;
  [(MSService *)v10 _callServicesMethod:@"ListMailboxes" arguments:v13 callback:v17];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
}

void __80__MSAccounts_mailboxListingForAccountWithUniqueIdentifier_keys_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 objectForKey:@"mailboxes"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)setPushStateForMailboxWithPath:(id)a3 account:(id)a4 pushState:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v32[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  BOOL v11 = objc_alloc_init(MSAccounts);
  dispatch_semaphore_t v12 = (void *)MEMORY[0x2166BBAE0]([(MSMailDefaultService *)v11 setShouldLaunchMobileMail:1]);
  id v30 = v10;
  v31[0] = @"accountUniqueIdentifiers";
  char v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v32[0] = v13;
  v32[1] = v9;
  v31[1] = @"relativePath";
  v31[2] = @"pushState";
  dispatch_semaphore_t v14 = [NSNumber numberWithBool:v7];
  v32[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__MSAccounts_setPushStateForMailboxWithPath_account_pushState_error___block_invoke;
  v19[3] = &unk_264242EA8;
  v19[4] = &v26;
  v19[5] = &v20;
  [(MSService *)v11 _callServicesMethod:@"MailboxPushState" arguments:v15 callback:v19];

  int v16 = *((unsigned __int8 *)v27 + 24);
  if (a6 && !*((unsigned char *)v27 + 24))
  {
    *a6 = (id) v21[5];
    int v16 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __69__MSAccounts_setPushStateForMailboxWithPath_account_pushState_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 objectForKey:@"success"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 BOOLValue];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

+ (id)attachmentCapabilities
{
  uint64_t v11 = 0;
  dispatch_semaphore_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_semaphore_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v2 = objc_alloc_init(MSAccounts);
  uint64_t v3 = (void *)MEMORY[0x2166BBAE0]([(MSMailDefaultService *)v2 setShouldLaunchMobileMail:1]);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__MSAccounts_attachmentCapabilities__block_invoke;
  v8[3] = &unk_264242E30;
  dispatch_semaphore_t v9 = v4;
  id v10 = &v11;
  id v5 = v4;
  [(MSService *)v2 _callServicesMethod:@"AttachmentCapabilities" arguments:MEMORY[0x263EFFA78] callback:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __36__MSAccounts_attachmentCapabilities__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:@"capabilities"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  v21[16] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 isEqualToString:@"ListAccounts"])
  {
    v20[0] = @"uniqueID";
    v20[1] = @"fullUserName";
    v21[0] = @"6ADE0CAF-7F5B-4251-A792-71ECB04D5617";
    v21[1] = @"Example User";
    v20[2] = @"username";
    void v20[3] = @"emailAddresses";
    void v21[2] = @"example";
    v21[3] = &unk_26C6036D8;
    v20[4] = @"emailAddressAndAliases";
    v20[5] = @"fromEmailAddresses";
    void v21[4] = &unk_26C6036F0;
    v21[5] = &unk_26C603708;
    v20[6] = @"fromEmailAddressesIncludingDisabled";
    v20[7] = @"defaultAddress";
    v21[6] = &unk_26C603720;
    v21[7] = &unk_26C603738;
    v20[8] = @"isDefaultSendingAccount";
    v20[9] = @"isActive";
    v21[8] = &unk_26C603750;
    v21[9] = &unk_26C603750;
    v20[10] = @"restrictsRepliesAndForwards";
    v20[11] = @"sendingRestricted";
    v21[10] = &unk_26C603768;
    v21[11] = &unk_26C603768;
    v20[12] = @"supportsThreadOperations";
    v20[13] = @"supportsMailDrop";
    v21[12] = &unk_26C603750;
    v21[13] = &unk_26C603750;
    v20[14] = @"isManaged";
    v20[15] = @"attachmentCapabilities";
    v21[14] = &unk_26C603768;
    v21[15] = MEMORY[0x263EFFA78];
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:16];
    BOOL v17 = v11;
    dispatch_semaphore_t v18 = @"accounts";
    dispatch_semaphore_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    id v19 = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    v10[2](v10, v13, 0);
  }
  else
  {
    if (![v8 isEqualToString:@"CustomSignature"])
    {
      v14.receiver = self;
      v14.super_class = (Class)MSAccounts;
      [(MSService *)&v14 _simulateServicesMethod:v8 arguments:v9 callback:v10];
      goto LABEL_7;
    }
    id v15 = @"signature";
    id v16 = @"Sent from my iPhone Simulator";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v10[2](v10, v11, 0);
  }

LABEL_7:
}

@end