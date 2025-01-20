@interface FTRegAppleIDSetupManager
+ (id)sharedInstance;
- (BOOL)_shouldAttemptAccountRegistration;
- (BOOL)_shouldShowAliasSelectionUI;
- (BOOL)aliasIsEnabled:(id)a3;
- (BOOL)beginSetupWithCompletionHandler:(id)a3;
- (BOOL)shouldShowAliasSelectionUI;
- (BOOL)showsPhoneNumberDisplayString;
- (FTRegAppleIDSetupManager)init;
- (IDSAccountController)faceTimeAccountController;
- (IDSAccountController)iMessageAccountController;
- (NSArray)candidateAliases;
- (NSArray)selectedAliases;
- (NSMutableDictionary)setupOperations;
- (NSString)selectionSummaryText;
- (id)_aliasesForDictionary:(id)a3;
- (id)_appleID;
- (id)accountControllerForService:(id)a3;
- (id)handler;
- (id)phoneNumberDisplayString;
- (void)_cleanup;
- (void)_notifyFailureWithError:(id)a3;
- (void)_notifySuccess;
- (void)_notifySuccess:(BOOL)a3 error:(id)a4;
- (void)_updateCandidateAliases;
- (void)_updateSelectionSummaryText;
- (void)addSetupDictionary:(id)a3 forService:(int64_t)a4;
- (void)setCandidateAliases:(id)a3;
- (void)setFaceTimeAccountController:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIMessageAccountController:(id)a3;
- (void)setSelectedAliases:(id)a3;
- (void)setSelectionSummaryText:(id)a3;
- (void)setSetupOperations:(id)a3;
@end

@implementation FTRegAppleIDSetupManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __42__FTRegAppleIDSetupManager_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(FTRegAppleIDSetupManager);
  return MEMORY[0x270F9A758]();
}

- (FTRegAppleIDSetupManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTRegAppleIDSetupManager;
  v2 = [(FTRegAppleIDSetupManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    setupOperations = v2->_setupOperations;
    v2->_setupOperations = v3;
  }
  return v2;
}

- (IDSAccountController)iMessageAccountController
{
  iMessageAccountController = self->_iMessageAccountController;
  if (!iMessageAccountController)
  {
    id v4 = objc_alloc(MEMORY[0x263F49FF8]);
    v5 = (IDSAccountController *)[v4 initWithService:*MEMORY[0x263F49FB8]];
    objc_super v6 = self->_iMessageAccountController;
    self->_iMessageAccountController = v5;

    iMessageAccountController = self->_iMessageAccountController;
  }
  return iMessageAccountController;
}

- (IDSAccountController)faceTimeAccountController
{
  faceTimeAccountController = self->_faceTimeAccountController;
  if (!faceTimeAccountController)
  {
    id v4 = objc_alloc(MEMORY[0x263F49FF8]);
    v5 = (IDSAccountController *)[v4 initWithService:*MEMORY[0x263F49FA0]];
    objc_super v6 = self->_faceTimeAccountController;
    self->_faceTimeAccountController = v5;

    faceTimeAccountController = self->_faceTimeAccountController;
  }
  return faceTimeAccountController;
}

- (id)accountControllerForService:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F49FB8]]) {
    [(FTRegAppleIDSetupManager *)self iMessageAccountController];
  }
  else {
  id v4 = [(FTRegAppleIDSetupManager *)self faceTimeAccountController];
  }
  return v4;
}

- (void)_cleanup
{
  [(FTRegAppleIDSetupManager *)self setSetupOperations:0];
  [(FTRegAppleIDSetupManager *)self setCandidateAliases:0];
  [(FTRegAppleIDSetupManager *)self setSelectedAliases:0];
  [(FTRegAppleIDSetupManager *)self setHandler:0];
}

- (void)_notifySuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  objc_super v6 = [(FTRegAppleIDSetupManager *)self handler];

  if (v6)
  {
    v7 = [(FTRegAppleIDSetupManager *)self handler];
    v8 = (void (**)(void, void, void))[v7 copy];

    [(FTRegAppleIDSetupManager *)self setHandler:0];
    ((void (**)(void, BOOL, id))v8)[2](v8, v4, v9);
  }
  [(FTRegAppleIDSetupManager *)self _cleanup];
}

- (void)_notifySuccess
{
}

- (void)_notifyFailureWithError:(id)a3
{
}

- (id)_aliasesForDictionary:(id)a3
{
  return 0;
}

- (id)_appleID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v2 = [(FTRegAppleIDSetupManager *)self setupOperations];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__FTRegAppleIDSetupManager__appleID__block_invoke;
  v5[3] = &unk_2644F1148;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__FTRegAppleIDSetupManager__appleID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  IDSParseAuthDictionary();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v7 objectForKey:*MEMORY[0x263F4A130]];
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
    if (a4) {
      *a4 = 1;
    }
  }
}

- (BOOL)_shouldAttemptAccountRegistration
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(FTRegAppleIDSetupManager *)self setupOperations];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__FTRegAppleIDSetupManager__shouldAttemptAccountRegistration__block_invoke;
  v5[3] = &unk_2644F1170;
  v5[4] = v2;
  void v5[5] = &v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __61__FTRegAppleIDSetupManager__shouldAttemptAccountRegistration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = IDSParseAuthDictionary();
  v5 = [v4 objectForKey:*MEMORY[0x263F4A130]];
  int v6 = [v3 intValue];

  id v7 = (id *)MEMORY[0x263F49FB8];
  if (v6 != 1) {
    id v7 = (id *)MEMORY[0x263F49FA0];
  }
  id v8 = *v7;
  char v9 = [*(id *)(a1 + 32) accountControllerForService:v8];
  v10 = [v9 serviceName];
  id v11 = [v9 accountWithLoginID:v5 service:v10];

  if (![v11 isActive] || objc_msgSend(v11, "registrationStatus") != 5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  v12 = csui_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    int v14 = 138412546;
    v15 = v13;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Should attempt registration: %@ for account %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)addSetupDictionary:(id)a3 forService:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v6 = a3;
    id v7 = csui_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = a4;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Adding setup dictionary for service type: %ld", (uint8_t *)&v10, 0xCu);
    }

    [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_51_0];
    id v8 = (void *)[objc_alloc(NSNumber) initWithInteger:a4];
    char v9 = [(FTRegAppleIDSetupManager *)self setupOperations];
    [v9 setObject:v6 forKey:v8];

    [(FTRegAppleIDSetupManager *)self _updateCandidateAliases];
  }
}

void __58__FTRegAppleIDSetupManager_addSetupDictionary_forService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isEqual:@"password"];
  id v7 = csui_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      char v9 = "  => password : REDACTED";
      int v10 = v7;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v5;
    char v9 = "  => %@ : %@";
    int v10 = v7;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

- (BOOL)_shouldShowAliasSelectionUI
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(FTRegAppleIDSetupManager *)self _shouldAttemptAccountRegistration])
  {
    id v3 = [(FTRegAppleIDSetupManager *)self candidateAliases];
    id v4 = (__CFString *)_IDSCopyOrderedAliases();
    unint64_t v5 = [(__CFString *)v4 count];
    int v6 = csui_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      __int16 v14 = v4;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "  => Squashed sorted candidates: %@", (uint8_t *)&v13, 0xCu);
    }

    BOOL v7 = [(FTRegAppleIDSetupManager *)self showsPhoneNumberDisplayString];
    unint64_t v8 = 1;
    if (v7) {
      unint64_t v8 = 2;
    }
    BOOL v9 = v5 > v8;
  }
  else
  {
    BOOL v9 = 0;
  }
  int v10 = csui_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = @"NO";
    if (v9) {
      uint32_t v11 = @"YES";
    }
    int v13 = 138412290;
    __int16 v14 = v11;
    _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "shouldShowAliasSelectionUI: %@", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

- (BOOL)shouldShowAliasSelectionUI
{
  [(FTRegAppleIDSetupManager *)self _updateCandidateAliases];
  return [(FTRegAppleIDSetupManager *)self _shouldShowAliasSelectionUI];
}

- (BOOL)aliasIsEnabled:(id)a3
{
  id v4 = a3;
  unint64_t v5 = CommunicationsSetupUIBundle();
  int v6 = CNFRegStringTableName();
  BOOL v7 = [v5 localizedStringForKey:@"YOUR_NUMBER_STRING" value:&stru_26D05D4F8 table:v6];
  char v8 = [v4 isEqualToString:v7];

  if (v8)
  {
    char v9 = 0;
  }
  else if ([(FTRegAppleIDSetupManager *)self showsPhoneNumberDisplayString])
  {
    int v10 = [(FTRegAppleIDSetupManager *)self phoneNumberDisplayString];
    char v11 = [v4 isEqualToString:v10];

    char v9 = v11 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)showsPhoneNumberDisplayString
{
  v2 = [MEMORY[0x263F3BB18] sharedInstance];
  char v3 = [v2 supportsSMSIdentification];

  return v3;
}

- (id)phoneNumberDisplayString
{
  if ([(FTRegAppleIDSetupManager *)self showsPhoneNumberDisplayString])
  {
    v2 = [MEMORY[0x263F3BB18] sharedInstance];
    char v3 = [v2 telephoneNumber];
    id v4 = [v3 _stripFZIDPrefix];

    if ([v4 length]) {
      CNFRegFormattedPhoneNumberForString(v4);
    }
    else {
    unint64_t v5 = CNFRegLocalPhoneNumberDisplayString();
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)_updateSelectionSummaryText
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v35 = [(FTRegAppleIDSetupManager *)self _appleID];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v37 = self;
  char v3 = [(FTRegAppleIDSetupManager *)self selectedAliases];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v4)
  {

LABEL_27:
    [(FTRegAppleIDSetupManager *)v37 setSelectionSummaryText:0];
    BOOL v7 = 0;
    goto LABEL_38;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  BOOL v7 = 0;
  uint64_t v8 = *(void *)v39;
  id obj = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v39 != v8) {
        objc_enumerationMutation(obj);
      }
      int v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      char v11 = CommunicationsSetupUIBundle();
      int v12 = CNFRegStringTableName();
      int v13 = [v11 localizedStringForKey:@"YOUR_NUMBER_STRING" value:&stru_26D05D4F8 table:v12];
      int v14 = [v10 isEqualToString:v13];

      if (v14)
      {
        id v20 = v10;

LABEL_22:
        BOOL v7 = v20;
        v19 = obj;
        goto LABEL_23;
      }
      if ([(FTRegAppleIDSetupManager *)v37 showsPhoneNumberDisplayString])
      {
        uint64_t v15 = [(FTRegAppleIDSetupManager *)v37 phoneNumberDisplayString];
        int v16 = [v10 isEqualToString:v15];

        if (v16)
        {
          id v20 = v10;

          char v6 = [v20 _appearsToBePhoneNumber];
          goto LABEL_22;
        }
      }
      if (((v7 != 0) & v6) != 0)
      {
        char v6 = 1;
        continue;
      }
      char v17 = [v10 _appearsToBePhoneNumber];
      if ((v17 & 1) == 0 && v7)
      {
        if (![v10 isEqualToString:v35]) {
          continue;
        }
        char v17 = 0;
      }
      id v18 = v10;

      char v6 = v17;
      BOOL v7 = v18;
    }
    v19 = obj;
    uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_23:

  if (!v7) {
    goto LABEL_27;
  }
  v21 = [MEMORY[0x263F3BB18] sharedInstance];
  int v22 = [v21 callingAvailable];

  if (v14)
  {
    v23 = CommunicationsSetupUIBundle();
    v24 = CNFRegStringTableName();
    if (v22) {
      v25 = @"BUDDY_CALLERID_GENERIC_PHONE";
    }
    else {
      v25 = @"BUDDY_CALLERID_GENERIC_PHONE_NO_FACETIME_AUDIO";
    }
    v30 = [v23 localizedStringForKey:v25 value:&stru_26D05D4F8 table:v24];
    [(FTRegAppleIDSetupManager *)v37 setSelectionSummaryText:v30];
  }
  else
  {
    char v26 = [v7 _appearsToBePhoneNumber] | v6;
    v27 = NSString;
    v28 = CommunicationsSetupUIBundle();
    if (v26)
    {
      if (v22) {
        v29 = @"BUDDY_CALLERID_UNQUOTED";
      }
      else {
        v29 = @"BUDDY_CALLERID_UNQUOTED_NO_FACETIME_AUDIO";
      }
    }
    else if (v22)
    {
      v29 = @"BUDDY_CALLERID_QUOTED";
    }
    else
    {
      v29 = @"BUDDY_CALLERID_QUOTED_NO_FACETIME_AUDIO";
    }
    v31 = CNFStringKeyForIdiom(v29);
    v32 = CNFRegStringTableName();
    v33 = [v28 localizedStringForKey:v31 value:&stru_26D05D4F8 table:v32];
    v34 = objc_msgSend(v27, "stringWithFormat:", v33, v7);

    [(FTRegAppleIDSetupManager *)v37 setSelectionSummaryText:v34];
  }
LABEL_38:
}

- (void)_updateCandidateAliases
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v3 = csui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Updating candidate aliases", buf, 2u);
  }

  *(void *)buf = 0;
  v27 = buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v4 = (void *)MEMORY[0x223C3A7C0]();
  uint64_t v5 = [(FTRegAppleIDSetupManager *)self setupOperations];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke;
  v25[3] = &unk_2644F1148;
  v25[4] = buf;
  [v5 enumerateKeysAndObjectsUsingBlock:v25];

  char v6 = [*((id *)v27 + 5) allObjects];
  BOOL v7 = (void *)_IDSCopyOrderedAliases();

  uint64_t v8 = csui_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (void *)*((void *)v27 + 5);
    *(_DWORD *)v33 = 138412290;
    id v34 = v9;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Candidates: %@", v33, 0xCu);
  }

  int v10 = csui_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v33 = 138412290;
    id v34 = v7;
    _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "Sorted candidate aliases: %@", v33, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(FTRegAppleIDSetupManager *)self showsPhoneNumberDisplayString])
  {
    int v12 = [(FTRegAppleIDSetupManager *)self phoneNumberDisplayString];
    [v11 addObject:v12];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        char v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "_stripFZIDPrefix", (void)v21);
        if ([v17 _appearsToBePhoneNumber])
        {
          id v18 = CNFRegFormattedPhoneNumberForString(v17);
          if ([v18 length] && (objc_msgSend(v11, "containsObject:", v18) & 1) == 0) {
            [v11 addObject:v18];
          }
        }
        else if (([v11 containsObject:v17] & 1) == 0)
        {
          [v11 addObject:v17];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v14);
  }

  v19 = csui_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v33 = 138412290;
    id v34 = v11;
    _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "Setting candidate aliases to: %@", v33, 0xCu);
  }

  [(FTRegAppleIDSetupManager *)self setCandidateAliases:v11];
  [(FTRegAppleIDSetupManager *)self setSelectedAliases:v11];
  id v20 = csui_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "...Done", v33, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke(uint64_t a1)
{
  IDSParseAuthDictionary();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v8 objectForKey:*MEMORY[0x263F4A138]];
  char v3 = objc_msgSend(v2, "__imArrayByApplyingBlock:", &__block_literal_global_81_0);

  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v4)
    {
      uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v3];
      [v4 intersectSet:v5];
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v5 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

id __51__FTRegAppleIDSetupManager__updateCandidateAliases__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 objectForKey:@"uri"];
  uint64_t v4 = [v2 objectForKey:@"status"];

  LODWORD(v2) = [v4 intValue];
  if (v2 == 5051)
  {
    uint64_t v5 = [v3 _stripFZIDPrefix];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setSelectedAliases:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (NSArray *)a3;
  uint64_t v5 = v4;
  if (self->_selectedAliases != v4)
  {
    uint64_t v6 = (NSArray *)[(NSArray *)v4 copy];
    selectedAliases = self->_selectedAliases;
    self->_selectedAliases = v6;

    id v8 = csui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      int v10 = v5;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Set selected aliases: %@", (uint8_t *)&v9, 0xCu);
    }

    [(FTRegAppleIDSetupManager *)self _updateSelectionSummaryText];
  }
}

- (BOOL)beginSetupWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(FTRegAppleIDSetupManager *)self setHandler:a3];
  uint64_t v4 = [(FTRegAppleIDSetupManager *)self setupOperations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = csui_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ([(FTRegAppleIDSetupManager *)self _shouldShowAliasSelectionUI]) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      id v8 = [(FTRegAppleIDSetupManager *)self selectedAliases];
      *(_DWORD *)buf = 138412546;
      char v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Starting setup operation. Should show selection UI:%@  selectedAliases: %@", buf, 0x16u);
    }
    int v9 = [(FTRegAppleIDSetupManager *)self setupOperations];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_91;
    v14[3] = &unk_2644F11E8;
    v14[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_98;
    v13[3] = &unk_2644F04A0;
    v13[4] = self;
    int v10 = MEMORY[0x263EF83A0];
    uint64_t v11 = v13;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke;
    block[3] = &unk_2644F04A0;
    block[4] = self;
    int v10 = MEMORY[0x263EF83A0];
    uint64_t v11 = block;
  }
  dispatch_async(v10, v11);
  return 1;
}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySuccess];
}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = IDSParseAuthDictionary();
  int v5 = [v3 intValue];

  uint64_t v6 = (id *)MEMORY[0x263F49FB8];
  if (v5 != 1) {
    uint64_t v6 = (id *)MEMORY[0x263F49FA0];
  }
  id v7 = *v6;
  id v8 = [*(id *)(a1 + 32) accountControllerForService:v7];
  int v9 = [*(id *)(a1 + 32) selectedAliases];
  if (![*(id *)(a1 + 32) showsPhoneNumberDisplayString])
  {
    id v10 = v9;
    goto LABEL_7;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    uint64_t v11 = v10;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
LABEL_9:
  int v12 = objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_93);
  id v13 = [MEMORY[0x263F3BB18] sharedInstance];
  int v14 = [v13 supportsSMSIdentification];

  if (v14)
  {
    if ([v12 count]) {
      [v12 arrayByAddingObject:*MEMORY[0x263F4A280]];
    }
    else {
    uint64_t v15 = IMSingleObjectArray();
    }

    int v12 = (void *)v15;
  }
  uint64_t v16 = [v4 objectForKey:*MEMORY[0x263F4A130]];
  char v17 = [v4 objectForKey:*MEMORY[0x263F4A140]];
  __int16 v18 = csui_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    v36 = v17;
    __int16 v37 = 2112;
    long long v38 = v12;
    _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, " => Setting up service: %@   with apple id: %@  profile id: %@  aliases: %@", buf, 0x2Au);
  }

  v19 = [v8 serviceName];
  uint64_t v20 = [v8 accountWithLoginID:v16 service:v19];

  if ([v20 isActive] && objc_msgSend(v20, "registrationStatus") == 5)
  {
    long long v21 = csui_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v20;
      long long v22 = " => Has existing registered account: %@";
      long long v23 = v21;
      uint32_t v24 = 12;
LABEL_25:
      _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
  }
  else
  {
    v25 = csui_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v20;
      _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, " => Existing account: %@", buf, 0xCu);
    }

    if (![v20 isUserDisabled])
    {
      v27 = v8;
      id v28 = v4;
      id v29 = v12;
      id v30 = v7;
      char v26 = dispatch_get_global_queue(21, 0);
      IDSRegistrationControlGetStateForRegistrationType();

      long long v21 = v27;
      goto LABEL_27;
    }
    long long v21 = csui_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v22 = " => Account was disabled by the user, not setting up...";
      long long v23 = v21;
      uint32_t v24 = 2;
      goto LABEL_25;
    }
  }
LABEL_27:
}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F3CE80](a2);
}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_94(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v2 = csui_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, " => Do not have permission to use PhoneNumber, not setting up...", v7, 2u);
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 48), "__imSetFromArray");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2_95;
    v8[3] = &unk_2644F1198;
    int v9 = *(id *)(a1 + 56);
    [v4 setupAccountWithSetupParameters:v5 aliases:v6 completionHandler:v8];

    id v2 = v9;
  }
}

void __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_2_95(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = csui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = @"NO";
    int v10 = 138412802;
    if (a3) {
      int v9 = @"YES";
    }
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Got response from setup operation for service: %@. Success=%@, error=%@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __60__FTRegAppleIDSetupManager_beginSetupWithCompletionHandler___block_invoke_98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySuccess];
}

- (NSMutableDictionary)setupOperations
{
  return self->_setupOperations;
}

- (void)setSetupOperations:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSArray)candidateAliases
{
  return self->_candidateAliases;
}

- (void)setCandidateAliases:(id)a3
{
}

- (NSArray)selectedAliases
{
  return self->_selectedAliases;
}

- (NSString)selectionSummaryText
{
  return self->_selectionSummaryText;
}

- (void)setSelectionSummaryText:(id)a3
{
}

- (void)setIMessageAccountController:(id)a3
{
}

- (void)setFaceTimeAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTimeAccountController, 0);
  objc_storeStrong((id *)&self->_iMessageAccountController, 0);
  objc_storeStrong((id *)&self->_selectionSummaryText, 0);
  objc_storeStrong((id *)&self->_selectedAliases, 0);
  objc_storeStrong((id *)&self->_candidateAliases, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_setupOperations, 0);
}

@end