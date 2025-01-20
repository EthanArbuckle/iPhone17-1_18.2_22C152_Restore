@interface CNiOSEncodedPeopleFetcher
- (BOOL)fetchEncodedPeopleWithError:(id *)a3 cancelationToken:(id)a4 batchHandler:(id)a5;
- (BOOL)preferLinkIdentifiersForIdentifierAudit;
- (CNiOSEncodedPeopleFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10;
- (id)cursorWithError:(id *)a1;
- (void)dealloc;
- (void)fetchNextBatchWithReply:(id)a3;
- (void)queryCursorForABSQLPredicate:(void *)a3 fetchRequest:;
- (void)setCursor:(uint64_t)a1;
- (void)setPreferLinkIdentifiersForIdentifierAudit:(BOOL)a3;
@end

@implementation CNiOSEncodedPeopleFetcher

- (id)cursorWithError:(id *)a1
{
  if (a1)
  {
    v3 = a1;
    if (a1[7])
    {
LABEL_3:
      a1 = (id *)v3[7];
LABEL_11:
      uint64_t v2 = vars8;
      goto LABEL_12;
    }
    id v5 = [a1[3] effectivePredicate];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "cn_supportsEncodedFetching"))
    {
      id v5 = v5;
      id v6 = v3[9];
      id v7 = v3[3];
      v8 = +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:v7 managedConfiguration:v6 error:a2];

      if (v8)
      {
        char v9 = objc_opt_respondsToSelector();
        id v10 = v3[2];
        if (v9)
        {
          id v11 = v3[4];
          uint64_t v12 = objc_msgSend(v5, "cn_cursorForEncodedPeopleFromAddressBook:fetchRequest:environment:error:", v10, v8, v11, a2);
        }
        else
        {
          v19 = objc_msgSend(v5, "cn_ABQSLPredicateForAddressBook:fetchRequest:error:", v3[2], v8, a2);
          id v11 = v19;
          if (!v19)
          {
LABEL_21:

            goto LABEL_3;
          }
          if ([v19 isNullPredicate])
          {
            uint64_t v12 = objc_opt_new();
          }
          else
          {
            uint64_t v12 = -[CNiOSEncodedPeopleFetcher queryCursorForABSQLPredicate:fetchRequest:](v3, v11, v8);
          }
        }
        id v20 = v3[7];
        v3[7] = (id)v12;

        goto LABEL_21;
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3B8];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = NSStringFromSelector(sel_cn_supportsEncodedFetching);
      [v13 raise:v14, @"Cannot use %@ with a predicate not supporting %@", v16, v17 format];
    }
    a1 = 0;
    goto LABEL_11;
  }
LABEL_12:
  return a1;
}

- (void)queryCursorForABSQLPredicate:(void *)a3 fetchRequest:
{
  v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [v5 keysToFetch];
    CFTypeRef v8 = +[CNiOSABConversions requiredABPropertyIDSetForKeysToFetch:]((uint64_t)CNiOSABConversions, v7);

    id v9 = objc_alloc(MEMORY[0x1E4F49880]);
    uint64_t v10 = v3[2];
    uint64_t v11 = [v5 unifiedFetch];
    uint64_t v12 = [v5 sortOrderIncludingNone];
    uint64_t v13 = [v5 batchSize];
    uint64_t v14 = [v5 managedConfiguration];

    v3 = (void *)[v9 initWithAddressBook:v10 predicate:v6 propertyIdentifierSet:v8 includeLinkedContacts:v11 sortOrder:v12 suggestedContactsPerBatch:v13 managedConfiguration:v14 identifierAuditMode:v3[10] authorizationContext:v3[11]];
  }

  return v3;
}

- (void)dealloc
{
  cursorCompletionHandler = (void (**)(id, SEL))self->_cursorCompletionHandler;
  if (cursorCompletionHandler) {
    cursorCompletionHandler[2](cursorCompletionHandler, a2);
  }
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v5.receiver = self;
  v5.super_class = (Class)CNiOSEncodedPeopleFetcher;
  [(CNiOSEncodedPeopleFetcher *)&v5 dealloc];
}

- (BOOL)fetchEncodedPeopleWithError:(id *)a3 cancelationToken:(id)a4 batchHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  while (1)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __87__CNiOSEncodedPeopleFetcher_fetchEncodedPeopleWithError_cancelationToken_batchHandler___block_invoke;
    v15[3] = &unk_1E56B51B8;
    v17 = &v19;
    v18 = &v25;
    id v11 = v9;
    id v16 = v11;
    [(CNiOSEncodedPeopleFetcher *)self fetchNextBatchWithReply:v15];

    uint64_t v12 = v20;
    if (*((unsigned char *)v26 + 24) || v20[5]) {
      break;
    }
    if ([v8 isCanceled])
    {
      uint64_t v12 = v20;
      break;
    }
  }
  if (a3)
  {
    *a3 = (id) v12[5];
    uint64_t v12 = v20;
  }
  BOOL v13 = v12[5] == 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

void __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x192FD3A40]();
  objc_super v5 = *(id **)(a1 + 32);
  id v30 = 0;
  id v6 = -[CNiOSEncodedPeopleFetcher cursorWithError:](v5, (uint64_t)&v30);
  id v7 = v30;
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[8];
  }
  id v9 = v8;
  uint64_t v10 = v9;
  if (v6)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke_2;
    v22[3] = &unk_1E56B51E0;
    id v11 = v9;
    id v23 = v11;
    id v24 = *(id *)(a1 + 40);
    uint64_t v25 = &v26;
    [v6 fetchNextBatchWithReply:v22];
    if (!*((unsigned char *)v27 + 24))
    {

      _Block_object_dispose(&v26, 8);
      goto LABEL_19;
    }
    -[CNiOSEncodedPeopleFetcher setCursor:](*(void *)(a1 + 32), 0);

    _Block_object_dispose(&v26, 8);
    uint64_t v10 = v6;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    uint64_t v15 = *(void *)(v15 + 40);
  }
  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = v16 ? *(void *)(v16 + 40) : 0;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v12, v13, v14);
    uint64_t v19 = *(void **)(a1 + 32);
    if (v19) {
      objc_setProperty_nonatomic_copy(v19, v18, 0, 40);
    }
  }
  id v20 = *(const void **)(a1 + 48);
  if (v20) {
    CFRelease(v20);
  }
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21) {
    *(void *)(v21 + 16) = 0;
  }
LABEL_19:
}

- (void)fetchNextBatchWithReply:(id)a3
{
  id v4 = a3;
  if (self)
  {
    addressBook = self->_addressBook;
    logger = self->_logger;
  }
  else
  {
    addressBook = 0;
    logger = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke;
  v8[3] = &unk_1E56B5208;
  v8[4] = self;
  id v9 = v4;
  uint64_t v10 = addressBook;
  id v7 = v4;
  [(CNContactsLogger *)logger fetchingContactsBatch:v8];
}

- (void)setCursor:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

void __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke_2(void *a1, void *a2, char a3, void *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = [v9 data];
  [v7 didFetchEncodedContacts:v10 error:v8];

  (*(void (**)(void))(a1[5] + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
}

void __87__CNiOSEncodedPeopleFetcher_fetchEncodedPeopleWithError_cancelationToken_batchHandler___block_invoke(void *a1, void *a2, char a3, void *a4)
{
  id v9 = a2;
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
    id v8 = (void *)MEMORY[0x192FD3A40]();
    (*(void (**)(void))(a1[4] + 16))();
  }
}

- (CNiOSEncodedPeopleFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10
{
  id v33 = a3;
  id v32 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)CNiOSEncodedPeopleFetcher;
  uint64_t v21 = [(CNiOSEncodedPeopleFetcher *)&v34 init];
  if (v21)
  {
    if (a4) {
      v22 = (void *)CFRetain(a4);
    }
    else {
      v22 = 0;
    }
    v21->_addressBook = v22;
    objc_storeStrong((id *)&v21->_contactFetchRequest, a3);
    objc_storeStrong((id *)&v21->_environment, a8);
    id v23 = _Block_copy(v18);
    id cursorCompletionHandler = v21->_cursorCompletionHandler;
    v21->_id cursorCompletionHandler = v23;

    uint64_t v25 = _Block_copy(v17);
    id addressBookCompletionHandler = v21->_addressBookCompletionHandler;
    v21->_id addressBookCompletionHandler = v25;

    uint64_t v27 = [v19 loggerProvider];
    uint64_t v28 = [v27 contactsLogger];
    logger = v21->_logger;
    v21->_logger = (CNContactsLogger *)v28;

    objc_storeStrong((id *)&v21->_managedConfiguration, a5);
    v21->_identifierAuditMode = a9;
    objc_storeStrong((id *)&v21->_authorizationContext, a10);
    id v30 = v21;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong(&self->_cursorCompletionHandler, 0);
  objc_storeStrong(&self->_addressBookCompletionHandler, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_contactFetchRequest, 0);
}

- (BOOL)preferLinkIdentifiersForIdentifierAudit
{
  return self->_preferLinkIdentifiersForIdentifierAudit;
}

- (void)setPreferLinkIdentifiersForIdentifierAudit:(BOOL)a3
{
  self->_preferLinkIdentifiersForIdentifierAudit = a3;
}

@end