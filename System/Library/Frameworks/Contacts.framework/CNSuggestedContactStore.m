@interface CNSuggestedContactStore
+ (BOOL)isSuggestionsSupported;
+ (id)os_log;
+ (id)storeIdentifier;
+ (id)storeInfoClasses;
- (BOOL)_processSuggestions:(id)a3 error:(id *)a4 withBlock:(id)a5;
- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)shouldLogContactsAccess;
- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings;
- (CNSuggestedContactStore)init;
- (CNSuggestedContactStore)initWithSuggestionsService:(id)a3 siriIntelligenceSettings:(id)a4;
- (SGSuggestionsServiceContactsProtocol)suggestionService;
- (id)originForSuggestion:(id)a3 error:(id *)a4;
- (id)requestAccessForEntityType:(int64_t)a3;
- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5;
- (void)setSiriIntelligenceSettings:(id)a3;
- (void)setSuggestionService:(id)a3;
@end

@implementation CNSuggestedContactStore

+ (id)storeIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CNSuggestedContactStore_storeIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (storeIdentifier_cn_once_token_1 != -1) {
    dispatch_once(&storeIdentifier_cn_once_token_1, block);
  }
  v2 = (void *)storeIdentifier_cn_once_object_1;

  return v2;
}

- (CNSuggestedContactStore)initWithSuggestionsService:(id)a3 siriIntelligenceSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNSuggestedContactStore;
  v9 = [(CNContactStore *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_suggestionService, a3);
      if (v8)
      {
LABEL_4:
        v11 = (CNSiriIntelligenceSettingsProtocol *)v8;
        siriIntelligenceSettings = v10->_siriIntelligenceSettings;
        v10->_siriIntelligenceSettings = v11;
LABEL_7:

        v16 = v10;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F5DB70] serviceForContacts];
      suggestionService = v10->_suggestionService;
      v10->_suggestionService = (SGSuggestionsServiceContactsProtocol *)v13;

      [(SGSuggestionsServiceContactsProtocol *)v10->_suggestionService setSyncTimeout:0.2];
      if (v8) {
        goto LABEL_4;
      }
    }
    uint64_t v15 = objc_opt_new();
    siriIntelligenceSettings = v10->_siriIntelligenceSettings;
    v10->_siriIntelligenceSettings = (CNSiriIntelligenceSettingsProtocol *)v15;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

void __42__CNSuggestedContactStore_storeIdentifier__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 copy];
  v2 = (void *)storeIdentifier_cn_once_object_1;
  storeIdentifier_cn_once_object_1 = v1;
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CNSiriIntelligenceSettingsProtocol *)self->_siriIntelligenceSettings shouldShowSiriSuggestions])
  {
    v10 = [v8 predicate];
    if ([v10 conformsToProtocol:&unk_1EE090C30]) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      uint64_t v13 = [v8 sortOrder];
      v14 = [v8 keysToFetch];
      unsigned int v15 = [v8 mutableObjects];
      suggestionService = self->_suggestionService;
      id v37 = 0;
      v17 = -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v12, v13, v14, v15, suggestionService, &v37);
      id v18 = v37;

      if (!v17)
      {
        v19 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CNSuggestedContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:]((uint64_t)v18, v19);
        }

        id v18 = 0;
        v17 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __90__CNSuggestedContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
      v30 = &unk_1E56B86C8;
      v32 = &v33;
      id v31 = v9;
      [v17 enumerateObjectsUsingBlock:&v27];
      if (v34[3])
      {
        v20 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CNSuggestedContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:](v20);
        }

        uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNErrorDomain" code:2 userInfo:0];

        v22 = (void *)MEMORY[0x1E4F5A4F8];
        uint64_t v23 = v34[3];
        uint64_t v24 = [v17 count];
        objc_msgSend(v22, "simulateCrashWithMessage:", @"enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted", v23, v24, 0, v27, v28, v29, v30);
        id v18 = (id)v21;
      }
      BOOL v25 = v18 == 0;
      if (a4 && v18) {
        *a4 = v18;
      }

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      BOOL v25 = 1;
    }
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

+ (id)storeInfoClasses
{
  if (storeInfoClasses_cn_once_token_0 != -1) {
    dispatch_once(&storeInfoClasses_cn_once_token_0, &__block_literal_global_106);
  }
  v2 = (void *)storeInfoClasses_cn_once_object_0;

  return v2;
}

void __43__CNSuggestedContactStore_storeInfoClasses__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 copy];
  uint64_t v1 = (void *)storeInfoClasses_cn_once_object_0;
  storeInfoClasses_cn_once_object_0 = v0;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2_3 != -1) {
    dispatch_once(&os_log_cn_once_token_2_3, &__block_literal_global_3_2);
  }
  id v2 = (void *)os_log_cn_once_object_2_3;

  return v2;
}

uint64_t __33__CNSuggestedContactStore_os_log__block_invoke()
{
  os_log_cn_once_object_2_3 = (uint64_t)os_log_create("com.apple.contact", "suggestions");

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isSuggestionsSupported
{
  return [MEMORY[0x1E4F5DB70] isHarvestingSupported];
}

- (CNSuggestedContactStore)init
{
  return [(CNSuggestedContactStore *)self initWithSuggestionsService:0 siriIntelligenceSettings:0];
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F5A408] futureWithResult:MEMORY[0x1E4F1CC38]];
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CNSiriIntelligenceSettingsProtocol *)self->_siriIntelligenceSettings shouldShowSiriSuggestions])
  {
    id v7 = [v6 suggestionRecordId];
    if (v7)
    {
      id v8 = [(SGSuggestionsServiceContactsProtocol *)self->_suggestionService originFromRecordId:v7 error:a4];
    }
    else
    {
      id v9 = +[CNErrorFactory errorWithCode:205 userInfo:0];
      v10 = v9;
      if (a4) {
        *a4 = v9;
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __90__CNSuggestedContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A280] + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(CNSiriIntelligenceSettingsProtocol *)self->_siriIntelligenceSettings shouldShowSiriSuggestions])
  {
    id v10 = v8;
    if ([v10 conformsToProtocol:&unk_1EE090C30]) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      uint64_t v13 = -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v12, 0, v9, 0, self->_suggestionService, a5);
    }
    else
    {
      v14 = +[CNErrorFactory errorWithCode:400 userInfo:0];
      unsigned int v15 = v14;
      if (a5) {
        *a5 = v14;
      }

      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (BOOL)_processSuggestions:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (uint64_t (**)(id, void *, uint64_t, id *))a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "isSuggested", (void)v21))
        {
          unsigned int v15 = [v14 suggestionRecordId];

          if (v15)
          {
            v16 = [v14 suggestionRecordId];
            uint64_t v17 = objc_opt_class();
            int v18 = v8[2](v8, v16, v17, a4);

            if (!v18)
            {
              BOOL v19 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return [(CNSuggestedContactStore *)self executeSaveRequest:a3 response:0 authorizationContext:0 error:a4];
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v8 = a3;
  if ([(CNSiriIntelligenceSettingsProtocol *)self->_siriIntelligenceSettings shouldShowSiriSuggestions])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v9 = [v8 suppressChangeNotifications];
      if ((v9 & 1) == 0)
      {
        uint64_t v10 = +[CNChangesNotifier sharedNotifier];
        [v10 willSaveChanges];
      }
      id v11 = v8;
      uint64_t v12 = [v11 confirmedSuggestions];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke;
      v25[3] = &unk_1E56B86F0;
      v25[4] = self;
      BOOL v13 = [(CNSuggestedContactStore *)self _processSuggestions:v12 error:a6 withBlock:v25];

      if (v13)
      {
        v14 = [v11 rejectedSuggestions];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke_2;
        v24[3] = &unk_1E56B86F0;
        v24[4] = self;
        BOOL v15 = [(CNSuggestedContactStore *)self _processSuggestions:v14 error:a6 withBlock:v24];

        if (v9) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v15 = 0;
        if (v9)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      long long v21 = +[CNChangesNotifier sharedNotifier];
      long long v22 = [v11 saveRequestIdentifier];
      [v21 didSaveChangesSuccessfully:v15 fromContactStore:self requestIdentifier:v22];

      goto LABEL_15;
    }
    int v18 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 raise:@"CNSuggestedContactStoreInvalidSaveRequest", @"Unexpected save request of class %@", v20 format];
  }
  else
  {
    v16 = +[CNErrorFactory errorWithCode:103 userInfo:0];
    uint64_t v17 = v16;
    if (a6) {
      *a6 = v16;
    }
  }
  LOBYTE(v15) = 0;
LABEL_16:

  return v15;
}

uint64_t __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  int v8 = [a3 isSubclassOfClass:objc_opt_class()];
  char v9 = [*(id *)(a1 + 32) suggestionService];
  uint64_t v10 = v9;
  if (v8) {
    uint64_t v11 = [v9 confirmContactDetailRecord:v7 error:a4];
  }
  else {
    uint64_t v11 = [v9 confirmRecord:v7 error:a4];
  }
  uint64_t v12 = v11;

  return v12;
}

uint64_t __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  int v8 = [a3 isSubclassOfClass:objc_opt_class()];
  char v9 = [*(id *)(a1 + 32) suggestionService];
  uint64_t v10 = v9;
  if (v8) {
    uint64_t v11 = [v9 rejectContactDetailRecord:v7 rejectionUI:1 error:a4];
  }
  else {
    uint64_t v11 = [v9 rejectRecord:v7 rejectionUI:1 error:a4];
  }
  uint64_t v12 = v11;

  return v12;
}

- (SGSuggestionsServiceContactsProtocol)suggestionService
{
  return self->_suggestionService;
}

- (void)setSuggestionService:(id)a3
{
}

- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings
{
  return self->_siriIntelligenceSettings;
}

- (void)setSiriIntelligenceSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, 0);

  objc_storeStrong((id *)&self->_suggestionService, 0);
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(os_log_t)log error:usingBlock:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (suggested)", v1, 2u);
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(uint64_t)a1 error:(NSObject *)a2 usingBlock:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error fetching from CoreSuggestions: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end