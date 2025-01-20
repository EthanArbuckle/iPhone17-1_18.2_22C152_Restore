@interface CNContactStore(EmailContactUtilities)
+ (id)em_authorizedContactStore;
+ (id)log;
- (_EMContactsCache)em_cache;
- (id)_allContactsForEmailAddress:()EmailContactUtilities keysToFetch:error:;
- (id)_allContactsForName:()EmailContactUtilities keysToFetch:error:;
- (id)_bestContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:error:;
- (id)_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:;
- (id)allContactEmailAddressesWithError:()EmailContactUtilities;
- (id)em_contactsFutureOnScheduler:()EmailContactUtilities forEmailAddresses:keysToFetch:;
- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:;
- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:createIfNeeded:;
- (id)em_onScheduler:()EmailContactUtilities contactFutureForEmailAddress:keysToFetch:;
@end

@implementation CNContactStore(EmailContactUtilities)

+ (id)em_authorizedContactStore
{
  uint64_t v0 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  id v1 = 0;
  if (v0 == 3) {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  }
  return v1;
}

- (id)allContactEmailAddressesWithError:()EmailContactUtilities
{
  v4 = objc_msgSend(a1, "em_cache");
  v5 = [v4 allContactEmailAddressesWithError:a3];

  return v5;
}

- (_EMContactsCache)em_cache
{
  objc_getAssociatedObject(a1, a2);
  v4 = (_EMContactsCache *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[_EMContactsCache alloc] initWithStore:a1];
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CNContactStore_EmailContactUtilities__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  id v1 = (void *)log_log_8;
  return v1;
}

- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:createIfNeeded:
{
  v5 = objc_msgSend(a1, "em_fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:", a3, a4, 0, a5);
  return v5;
}

- (id)em_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:
{
  v6 = [a1 _fetchContactForEmailAddress:a3 keysToFetch:a4 allowMatchOnDisplayName:a5 createIfNeeded:a6 error:0];
  return v6;
}

- (id)_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:
{
  id v12 = a3;
  id v13 = a4;
  v14 = [v12 emailAddressValue];
  if (!v14)
  {
    v20 = [v12 stringValue];
    v17 = v20;
    v15 = 0;
    if (v20 && a6)
    {
      v21 = (void *)MEMORY[0x1E4F1B8F8];
      v22 = objc_msgSend(v20, "ea_addressCommentPersonNameComponents");
      v15 = objc_msgSend(v21, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v22, v17, 0, 1);
    }
    if (a7 && !v15 && a6)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v24 = v23;
      if (v17) {
        [v23 setObject:v17 forKeyedSubscript:@"EMContactStoreErrorKeyAddress"];
      }
      *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"EMContactStoreErrorDomain" code:0 userInfo:v24];
      v25 = [MEMORY[0x1E4F1B980] log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[CNContactStore(EmailContactUtilities) _fetchContactForEmailAddress:keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:]((uint64_t)v12, (uint64_t)v13, v25);
      }
    }
    goto LABEL_16;
  }
  v15 = [a1 _bestContactForEmailAddress:v14 keysToFetch:v13 allowMatchOnDisplayName:a5 error:a7];
  if (!v15 && a6)
  {
    v16 = (void *)MEMORY[0x1E4F1B8F8];
    v17 = [v14 displayName];
    v18 = objc_msgSend(v17, "ec_personNameComponents");
    v19 = [v14 simpleAddress];
    v15 = objc_msgSend(v16, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v18, v19, 0, 1);

LABEL_16:
  }

  return v15;
}

- (id)em_onScheduler:()EmailContactUtilities contactFutureForEmailAddress:keysToFetch:
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F60D70];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__CNContactStore_EmailContactUtilities__em_onScheduler_contactFutureForEmailAddress_keysToFetch___block_invoke;
  v15[3] = &unk_1E63E2C78;
  v15[4] = a1;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 onScheduler:a3 futureWithBlock:v15];

  return v13;
}

- (id)em_contactsFutureOnScheduler:()EmailContactUtilities forEmailAddresses:keysToFetch:
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F60D70];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__CNContactStore_EmailContactUtilities__em_contactsFutureOnScheduler_forEmailAddresses_keysToFetch___block_invoke;
  v15[3] = &unk_1E63E2CC8;
  id v16 = v8;
  uint64_t v17 = a1;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 onScheduler:a3 futureWithBlock:v15];

  return v13;
}

- (id)_bestContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 simpleAddress];
  id v13 = [a1 _allContactsForEmailAddress:v12 keysToFetch:v11 error:a6];

  if (!v13)
  {
    v14 = 0;
    goto LABEL_11;
  }
  if ([v13 count] == 1) {
    goto LABEL_9;
  }
  if (![v13 count])
  {
    if (a5)
    {
      uint64_t v17 = [v10 displayName];
      uint64_t v18 = [a1 _allContactsForName:v17 keysToFetch:v11 error:a6];

      id v13 = (void *)v18;
    }
LABEL_9:
    v14 = [v13 firstObject];
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x1E4F1B8F8];
  id v16 = [v10 displayName];
  v14 = objc_msgSend(v15, "em_bestMatchForName:fromContacts:keysToCheck:", v16, v13, v11);

LABEL_10:
LABEL_11:

  return v14;
}

- (id)_allContactsForEmailAddress:()EmailContactUtilities keysToFetch:error:
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = objc_msgSend(a1, "em_cache");
    id v11 = [v10 contactsForEmailAddress:v8 keysToFetch:v9 error:a5];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_allContactsForName:()EmailContactUtilities keysToFetch:error:
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = objc_msgSend(a1, "em_cache");
    id v11 = [v10 contactsForName:v8 keysToFetch:v9 error:a5];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)_fetchContactForEmailAddress:()EmailContactUtilities keysToFetch:allowMatchOnDisplayName:createIfNeeded:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1BEFDB000, a2, a3, "Failed to fetch contact for email address: %@ using key descriptors: %@ due to EMContactStoreIllegalEmailAddressError", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end