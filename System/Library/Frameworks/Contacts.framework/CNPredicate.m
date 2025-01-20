@interface CNPredicate
+ (BOOL)supportsSecureCoding;
+ (id)_convertSuggestions:(uint64_t)a1 withSortOrder:(void *)a2 mutableObjects:;
+ (id)os_log;
- (BOOL)augmentMainStoreResults;
- (BOOL)cn_hasHighSpecificity;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (CNPredicate)init;
- (CNPredicate)initWithCoder:(id)a3;
- (CNPredicate)initWithPredicate:(id)a3;
- (NSArray)mainStoreContactIdentifiers;
- (NSString)description;
- (id)cn_predicate;
- (id)cn_resultTransformWithMatchInfos:(id)a3;
- (id)contactsFromDonationStore:(id)a3;
- (id)predicateFormat;
- (id)suggestedContactsWithSortOrder:(void *)a3 keysToFetch:(unsigned int)a4 mutableObjects:(void *)a5 service:(void *)a6 error:;
- (void)_cn_acceptVisitor:(id)a3;
- (void)_convertContactMatches:(void *)a3 withService:(void *)a4 intoSuggestions:;
- (void)encodeWithCoder:(id)a3;
- (void)mainStoreDidFetchContacts:(id)a3 unifiedFetch:(BOOL)a4;
- (void)setAugmentMainStoreResults:(BOOL)a3;
- (void)setMainStoreContactIdentifiers:(id)a3;
@end

@implementation CNPredicate

id __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A288] + 16))())
  {
    v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke_cold_1(v4);
    }

    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (*(unsigned char *)(a1 + 40) && [v3 isUnified])
    {
      v6 = [v3 linkedContacts];
      uint64_t v7 = [v6 valueForKey:@"identifier"];
    }
    else
    {
      v6 = [v3 identifier];
      v9[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    v5 = (void *)v7;
  }

  return v5;
}

- (BOOL)cn_hasHighSpecificity
{
  return 0;
}

- (void)_cn_acceptVisitor:(id)a3
{
}

- (id)contactsFromDonationStore:(id)a3
{
  return (id)[MEMORY[0x1E4F5A3B8] eitherWithLeft:MEMORY[0x1E4F1CBF0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoreContactIdentifiers, 0);

  objc_storeStrong((id *)&self->_cn_predicate, 0);
}

- (void)mainStoreDidFetchContacts:(id)a3 unifiedFetch:(BOOL)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke;
    v8[3] = &unk_1E56B45E8;
    v8[4] = self;
    BOOL v9 = a4;
    uint64_t v7 = objc_msgSend(v6, "_cn_flatMap:", v8);
    [(CNPredicate *)self setMainStoreContactIdentifiers:v7];
  }
}

- (void)setMainStoreContactIdentifiers:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cn_predicate, @"_cn_predicate", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_augmentMainStoreResults forKey:@"_augmentMainStoreResults"];
  [v4 encodeObject:self->_mainStoreContactIdentifiers forKey:@"_mainStoreContactIdentifiers"];
}

- (id)cn_resultTransformWithMatchInfos:(id)a3
{
  return 0;
}

- (CNPredicate)initWithPredicate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPredicate;
  objc_super v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cn_predicate = v5->_cn_predicate;
    v5->_cn_predicate = (NSPredicate *)v6;

    v5->_augmentMainStoreResults = 1;
    v8 = v5;
  }

  return v5;
}

- (CNPredicate)init
{
  return [(CNPredicate *)self initWithPredicate:0];
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_1 != -1) {
    dispatch_once(&os_log_cn_once_token_0_1, &__block_literal_global_10);
  }
  v2 = (void *)os_log_cn_once_object_0_1;

  return v2;
}

uint64_t __32__CNPredicate_Suggested__os_log__block_invoke()
{
  os_log_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts.predicates", "suggested-contact");

  return MEMORY[0x1F41817F8]();
}

+ (id)_convertSuggestions:(uint64_t)a1 withSortOrder:(void *)a2 mutableObjects:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v9, "mainStoreLinkedIdentifier", (void)v15);

        if (v10)
        {
          v19 = @"CNContactMainStoreLinkedIdentifier";
          v11 = [v9 mainStoreLinkedIdentifier];
          v20 = v11;
          objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        }
        v12 = [v9 contact];
        v13 = CNContactFromSGContact(v12, v10);

        if (v13) {
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_convertContactMatches:(void *)a3 withService:(void *)a4 intoSuggestions:
{
  if (a1)
  {
    id v6 = a4;
    id v7 = a3;
    objc_msgSend(a2, "_cn_map:", &__block_literal_global_39);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:v8 fromSuggestionService:v7];

    [v6 addObjectsFromArray:v8];
  }
}

id __77__CNPredicate_Suggested___convertContactMatches_withService_intoSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNContactSuggestionMatch suggestionFromContactMatch:a2];
}

- (id)suggestedContactsWithSortOrder:(void *)a3 keysToFetch:(unsigned int)a4 mutableObjects:(void *)a5 service:(void *)a6 error:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v8 = a5;
  v53 = v8;
  if (a1)
  {
    if (!v8)
    {
      if (CNGuardOSLog_cn_once_token_0 != -1) {
        dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_113);
      }
      BOOL v9 = CNGuardOSLog_cn_once_object_0;
      if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
        -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v9);
      }
    }
    objc_super v10 = &unk_1EE090C30;
    id v52 = a1;
    if ([v52 conformsToProtocol:v10]) {
      v11 = v52;
    }
    else {
      v11 = 0;
    }
    id v51 = v11;

    v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v68 = 0;
    v69 = (id *)&v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__0;
    v72 = __Block_byref_object_dispose__0;
    id v73 = 0;
    v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v14 = [v13 watchdog];
    BOOL v15 = [v14 statusForEvent:*MEMORY[0x1E4F5A310]] == 0;

    if (!v15)
    {
      objc_opt_class();
      long long v16 = +[CNPredicate os_log]();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v16);
      }
      long long v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_61:

      _Block_object_dispose(&v68, 8);
      goto LABEL_62;
    }
    id v48 = objc_alloc_init(MEMORY[0x1E4F5A508]);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke;
    v67[3] = &unk_1E56B3F48;
    v67[5] = &v68;
    v67[4] = v52;
    long long v18 = (void *)[v67 copy];
    v19 = self;
    v20 = _Block_copy(v19);
    [v48 push:v20];

    if ([v52 augmentMainStoreResults])
    {
      v21 = objc_opt_new();
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_91;
      v65[3] = &unk_1E56B3F70;
      id v22 = v21;
      id v66 = v22;
      [v50 enumerateObjectsUsingBlock:v65];
      if (suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_token_6 != -1) {
        dispatch_once(&suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_token_6, &__block_literal_global_94);
      }
      v42 = v22;
      id v43 = (id)suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6;
      if ([v43 intersectsKeyVector:v22])
      {
        [v52 mainStoreContactIdentifiers];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        v23 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
        if (v23)
        {
          uint64_t v49 = *(void *)v62;
          while (2)
          {
            for (uint64_t i = 0; i != v23; uint64_t i = ((char *)i + 1))
            {
              if (*(void *)v62 != v49) {
                objc_enumerationMutation(obj);
              }
              uint64_t v25 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              id v60 = 0;
              v26 = [v53 contactMatchesWithContactIdentifier:v25 limitTo:1 error:&v60];
              id v27 = v60;
              id v28 = v60;
              if (v28)
              {
                v34 = v28;
                objc_storeStrong(v69 + 5, v27);
                v23 = [NSString stringWithFormat:@"CONTACTS: failed to augment contact with identifier %@ with suggestions, error: %@", v25, v69[5], v42, v43];

                goto LABEL_37;
              }
              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v29 = v26;
              uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v74 count:16];
              if (v30)
              {
                uint64_t v31 = *(void *)v57;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v57 != v31) {
                      objc_enumerationMutation(v29);
                    }
                    v33 = +[CNContactSuggestionMatch suggestionFromContactMatch:*(void *)(*((void *)&v56 + 1) + 8 * j)];
                    [v33 setMainStoreLinkedIdentifier:v25];
                    [v12 addObject:v33];
                  }
                  uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v74 count:16];
                }
                while (v30);
              }
            }
            v23 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_37:
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    if (v69[5]) {
      goto LABEL_40;
    }
    if (objc_opt_respondsToSelector())
    {
      v35 = v69 + 5;
      id v55 = v69[5];
      v36 = [v51 suggestionsWithSortOrder:a2 mutableObjects:a4 service:v53 error:&v55];
      objc_storeStrong(v35, v55);
      if ([v36 count])
      {
        [v12 addObjectsFromArray:v36];
LABEL_52:
        long long v16 = v23;
        goto LABEL_53;
      }
      if (!v69[5]) {
        goto LABEL_52;
      }
      uint64_t v38 = [NSString stringWithFormat:@"CONTACTS: failed to find suggested contacts, error: %@", v69[5]];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_40:
        long long v16 = v23;
LABEL_54:
        if (v69[5])
        {
          objc_opt_class();
          v39 = +[CNPredicate os_log]();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:]((uint64_t)v16, v39);
          }

          long long v17 = 0;
          if (a6) {
            *a6 = v69[5];
          }
        }
        else
        {
          long long v17 = +[CNPredicate _convertSuggestions:withSortOrder:mutableObjects:]((uint64_t)CNPredicate, v12);
        }
        [v48 popAllWithHandler:&__block_literal_global_110];
        id v40 = self;

        goto LABEL_61;
      }
      v37 = v69 + 5;
      id v54 = v69[5];
      v36 = [v51 sgContactMatchesWithSortOrder:a2 mutableObjects:a4 service:v53 error:&v54];
      objc_storeStrong(v37, v54);
      if ([v36 count])
      {
        -[CNPredicate _convertContactMatches:withService:intoSuggestions:]((uint64_t)v52, v36, v53, v12);
        goto LABEL_52;
      }
      if (!v69[5]) {
        goto LABEL_52;
      }
      uint64_t v38 = [NSString stringWithFormat:@"CONTACTS: failed to fetch suggested contact matches, error: %@", v69[5]];
    }
    long long v16 = v38;

LABEL_53:
    goto LABEL_54;
  }
  long long v17 = 0;
LABEL_62:

  return v17;
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code] == 10)
  {
    id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
    int v3 = [v2 isEqual:*MEMORY[0x1E4F5DC80]];

    if (v3)
    {
      objc_opt_class();
      id v4 = +[CNPredicate os_log]();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_cold_1(v4);
      }

      uint64_t v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      id v6 = [v5 watchdog];
      [v6 recordExceptionForEvent:*MEMORY[0x1E4F5A310]];
    }
  }
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_91(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  id v4 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_7:
    uint64_t v5 = *(void **)(a1 + 32);
    int v3 = objc_msgSend(v4, "_cn_requiredKeys");
    [v5 unionKeyVector:v3];
LABEL_8:

    goto LABEL_9;
  }
  int v6 = [v4 conformsToProtocol:&unk_1EE097850];

  if (v6) {
    goto LABEL_7;
  }
LABEL_9:
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_2()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"emailAddresses";
  v4[1] = @"phoneNumbers";
  v4[2] = @"postalAddresses";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  int v3 = (void *)suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6;
  suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error__cn_once_object_6 = v2;
}

uint64_t __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_107(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __21__CNPredicate_os_log__block_invoke()
{
  os_log_cn_once_object_0_1 = (uint64_t)os_log_create("com.apple.contacts", "predicates");

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPredicate;
  uint64_t v5 = [(CNPredicate *)&v17 initWithCoder:v4];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cn_predicate"];
    uint64_t v7 = [v6 copy];
    cn_predicate = v5->_cn_predicate;
    v5->_cn_predicate = (NSPredicate *)v7;

    v5->_augmentMainStoreResults = [v4 decodeBoolForKey:@"_augmentMainStoreResults"];
    BOOL v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_mainStoreContactIdentifiers"];
    uint64_t v13 = [v12 copy];
    mainStoreContactIdentifiers = v5->_mainStoreContactIdentifiers;
    v5->_mainStoreContactIdentifiers = (NSArray *)v13;

    BOOL v15 = v5;
  }

  return v5;
}

- (BOOL)evaluateWithObject:(id)a3
{
  return [(NSPredicate *)self->_cn_predicate evaluateWithObject:a3];
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  return [(NSPredicate *)self->_cn_predicate evaluateWithObject:a3 substitutionVariables:a4];
}

- (id)predicateFormat
{
  return [(NSPredicate *)self->_cn_predicate predicateFormat];
}

- (id)cn_predicate
{
  return self->_cn_predicate;
}

- (NSString)description
{
  uint64_t v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  int v3 = [v2 build];

  return (NSString *)v3;
}

- (NSArray)mainStoreContactIdentifiers
{
  return self->_mainStoreContactIdentifiers;
}

- (BOOL)augmentMainStoreResults
{
  return self->_augmentMainStoreResults;
}

- (void)setAugmentMainStoreResults:(BOOL)a3
{
  self->_augmentMainStoreResults = a3;
}

- (void)suggestedContactsWithSortOrder:(uint64_t)a1 keysToFetch:(NSObject *)a2 mutableObjects:service:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)suggestedContactsWithSortOrder:(os_log_t)log keysToFetch:mutableObjects:service:error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "CoreSuggestions call timed out recently; will not attempt to augment results",
    v1,
    2u);
}

- (void)suggestedContactsWithSortOrder:(os_log_t)log keysToFetch:mutableObjects:service:error:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘service’ must be nonnull", v1, 2u);
}

void __98__CNPredicate_Suggested__suggestedContactsWithSortOrder_keysToFetch_mutableObjects_service_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "CoreSuggestions call timed out; results may not be augmented in subsequent calls",
    v1,
    2u);
}

void __54__CNPredicate_mainStoreDidFetchContacts_unifiedFetch___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "mainStoreDidFetchContacts: unexpected null contact in list of contacts", v1, 2u);
}

@end