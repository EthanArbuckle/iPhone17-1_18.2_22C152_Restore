@interface CNiOSABContactBuffersDecoder
- (BOOL)decodeContactsFromData:(id)a3 moreComing:(BOOL)a4 replyHandler:(id)a5 error:(id *)a6;
- (BOOL)mutableResults;
- (BOOL)unifyResults;
- (CNContactBufferDecoder)decoder;
- (CNContactUnificationOptions)unificationOptions;
- (CNiOSABContactBuffersDecoder)init;
- (CNiOSABContactBuffersDecoder)initWithDecoder:(id)a3 unifyResults:(BOOL)a4 unificationOptions:(id)a5 mutableResults:(BOOL)a6 decodeBatchLimit:(int64_t)a7;
- (CNiOSABContactBuffersDecoder)initWithFetchRequest:(id)a3;
- (NSMutableArray)contactsWaitingForUnification;
- (NSMutableDictionary)matchInfosWaitingForUnification;
- (id)_contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4;
- (id)contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4;
- (id)unifyContacts:(id)a3 moreComing:(BOOL)a4;
- (int64_t)decodeBatchSize;
- (void)_addContactMatchInfoFromABMatchInfos:(id)a3 forContact:(id)a4 toDictionary:(id)a5;
@end

@implementation CNiOSABContactBuffersDecoder

void __85__CNiOSABContactBuffersDecoder_decodeContactsFromData_moreComing_replyHandler_error___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id v6 = v5;
  id v12 = v5;
  if (v5) {
    id v5 = (id)[*(id *)(a1 + 32) addObject:v5];
  }
  v7 = (void *)MEMORY[0x192FD3A40](v5, v6);
  uint64_t v8 = [*(id *)(a1 + 32) count];
  if (v8 == [*(id *)(a1 + 40) decodeBatchSize] || (a3 & 1) == 0)
  {
    id v9 = *(id *)(a1 + 32);
    if ([*(id *)(a1 + 40) unifyResults])
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = a3;
      }
      uint64_t v11 = [*(id *)(a1 + 40) unifyContacts:*(void *)(a1 + 32) moreComing:v10];

      id v9 = (id)v11;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) removeAllObjects];
  }
}

- (int64_t)decodeBatchSize
{
  return self->_decodeBatchSize;
}

void __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 linkIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  if (v7)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else
  {
    uint64_t v8 = [v5 linkIdentifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = *(void **)(a1 + 32);
      v13 = [*(id *)(a1 + 40) contactsWaitingForUnification];
      v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
      v15 = [v13 objectsAtIndexes:v14];
      v16 = (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);
      [v12 addObject:v16];
    }
    v17 = [v5 linkIdentifier];

    if (v17)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      *(void *)(v18 + 32) = a3;
      *(void *)(v18 + 40) = 1;
    }
    else
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      *(void *)(v19 + 32) = a3 + 1;
      *(void *)(v19 + 40) = 0;
      v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 48);
      v24[0] = v5;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      v23 = (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
      [v20 addObject:v23];
    }
  }
}

id __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    +[CNMutableContact unifyContacts:a2];
  }
  else {
  v2 = +[CN contactUnifyingContacts:a2 options:*(void *)(a1 + 32)];
  }

  return v2;
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (id)unifyContacts:(id)a3 moreComing:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CNiOSABContactBuffersDecoder *)self mutableResults];
  uint64_t v8 = [(CNiOSABContactBuffersDecoder *)self unificationOptions];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke;
  aBlock[3] = &unk_1E56B3FE0;
  BOOL v48 = v7;
  id v9 = v8;
  id v47 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
  id v12 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v6 count];

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__1;
  v44[4] = __Block_byref_object_dispose__1;
  v15 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
  v16 = [v15 firstObject];
  id v45 = [v16 linkIdentifier];

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3010000000;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v41 = &unk_190BB649E;
  v17 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
  uint64_t v18 = [v17 count];
  uint64_t v42 = 0;
  uint64_t v43 = v18;

  uint64_t v19 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
  [v19 addObjectsFromArray:v6];

  v20 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v13, v14);
  uint64_t v21 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __57__CNiOSABContactBuffersDecoder_unifyContacts_moreComing___block_invoke_13;
  v32 = &unk_1E56B4008;
  v36 = v44;
  v37 = &v38;
  id v22 = v11;
  id v33 = v22;
  id v23 = v10;
  v34 = self;
  id v35 = v23;
  [v21 enumerateObjectsAtIndexes:v20 options:0 usingBlock:&v29];

  if (v39[5])
  {
    v24 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
    objc_msgSend(v24, "removeObjectsInRange:", 0, v39[4]);

    if (a4) {
      goto LABEL_6;
    }
    v25 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
    v26 = (*((void (**)(id, void *))v23 + 2))(v23, v25);
    [v22 addObject:v26];
  }
  else
  {
    v25 = [(CNiOSABContactBuffersDecoder *)self contactsWaitingForUnification];
    [v25 removeAllObjects];
  }

LABEL_6:
  id v27 = v22;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);

  return v27;
}

- (NSMutableArray)contactsWaitingForUnification
{
  return self->_contactsWaitingForUnification;
}

- (CNContactUnificationOptions)unificationOptions
{
  return self->_unificationOptions;
}

- (BOOL)mutableResults
{
  return self->_mutableResults;
}

- (id)_contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v13 isUnified])
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v14 = [v13 linkedContacts];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                [(CNiOSABContactBuffersDecoder *)self _addContactMatchInfoFromABMatchInfos:v6 forContact:*(void *)(*((void *)&v21 + 1) + 8 * j) toDictionary:v8];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v16);
          }
        }
        else
        {
          [(CNiOSABContactBuffersDecoder *)self _addContactMatchInfoFromABMatchInfos:v6 forContact:v13 toDictionary:v8];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  return v8;
}

- (void)_addContactMatchInfoFromABMatchInfos:(id)a3 forContact:(id)a4 toDictionary:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [v14 iOSLegacyIdentifier];
  uint64_t v10 = [NSNumber numberWithInt:v9];
  uint64_t v11 = [v8 objectForKey:v10];

  if (v11)
  {
    id v12 = +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v11);
    uint64_t v13 = [v14 identifier];
    [v7 setObject:v12 forKey:v13];
  }
}

- (id)contactMatchInfosFromABMatchInfos:(id)a3 contacts:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(CNiOSABContactBuffersDecoder *)self _contactMatchInfosFromABMatchInfos:a3 contacts:v6];
  if ([(CNiOSABContactBuffersDecoder *)self unifyResults])
  {
    id v41 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = [(CNiOSABContactBuffersDecoder *)self matchInfosWaitingForUnification];
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    v36 = v9;
    objc_msgSend(v8, "addEntriesFromDictionary:");

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (!v11) {
      goto LABEL_25;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v49;
    uint64_t v37 = *(void *)v49;
    id v38 = v6;
    while (1)
    {
      uint64_t v14 = 0;
      uint64_t v39 = v12;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * v14);
        if (![v15 isUnified])
        {
          v32 = [(CNiOSABContactBuffersDecoder *)self matchInfosWaitingForUnification];
          id v33 = [v15 identifier];
          uint64_t v16 = [v32 objectForKey:v33];

          if (!v16) {
            goto LABEL_23;
          }
          v34 = [v15 identifier];
          [v41 setObject:v16 forKey:v34];

          uint64_t v30 = [(CNiOSABContactBuffersDecoder *)self matchInfosWaitingForUnification];
          uint64_t v31 = [v15 identifier];
          [v30 removeObjectForKey:v31];
          goto LABEL_21;
        }
        uint64_t v43 = v14;
        uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v42 = v15;
        uint64_t v17 = [v15 linkedContacts];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              long long v23 = [(CNiOSABContactBuffersDecoder *)self matchInfosWaitingForUnification];
              long long v24 = [v22 identifier];
              long long v25 = [v23 objectForKey:v24];

              if (v25)
              {
                long long v26 = [v22 identifier];
                [v16 setObject:v25 forKey:v26];

                long long v27 = [(CNiOSABContactBuffersDecoder *)self matchInfosWaitingForUnification];
                long long v28 = [v22 identifier];
                [v27 removeObjectForKey:v28];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v19);
        }

        if ([v16 count])
        {
          uint64_t v29 = [v42 linkedContacts];
          uint64_t v30 = +[CN unifyContactMatchInfos:v16 linkedContacts:v29];

          uint64_t v31 = [v42 identifier];
          [v41 setObject:v30 forKey:v31];
          uint64_t v13 = v37;
          id v6 = v38;
          uint64_t v12 = v39;
          uint64_t v14 = v43;
LABEL_21:

          goto LABEL_23;
        }
        uint64_t v13 = v37;
        id v6 = v38;
        uint64_t v12 = v39;
        uint64_t v14 = v43;
LABEL_23:

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v12)
      {
LABEL_25:

        id v7 = v36;
        goto LABEL_27;
      }
    }
  }
  id v41 = v7;
LABEL_27:

  return v41;
}

- (NSMutableDictionary)matchInfosWaitingForUnification
{
  return self->_matchInfosWaitingForUnification;
}

- (CNiOSABContactBuffersDecoder)initWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[CNContactBufferDecoderFactory decoderForFetchRequest:v4];
  id v6 = [[CNContactUnificationOptions alloc] initWithContactFetchRequest:v4];
  uint64_t v7 = [v4 unifyResults];
  uint64_t v8 = [v4 mutableObjects];
  uint64_t v9 = [v4 decoderBatchSize];

  uint64_t v10 = [(CNiOSABContactBuffersDecoder *)self initWithDecoder:v5 unifyResults:v7 unificationOptions:v6 mutableResults:v8 decodeBatchLimit:v9];
  return v10;
}

- (CNiOSABContactBuffersDecoder)initWithDecoder:(id)a3 unifyResults:(BOOL)a4 unificationOptions:(id)a5 mutableResults:(BOOL)a6 decodeBatchLimit:(int64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNiOSABContactBuffersDecoder;
  uint64_t v15 = [(CNiOSABContactBuffersDecoder *)&v26 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_decoder, a3);
    uint64_t v17 = objc_opt_new();
    contactsWaitingForUnification = v16->_contactsWaitingForUnification;
    v16->_contactsWaitingForUnification = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    matchInfosWaitingForUnification = v16->_matchInfosWaitingForUnification;
    v16->_matchInfosWaitingForUnification = (NSMutableDictionary *)v19;

    int64_t v21 = 10;
    if (a7 > 0) {
      int64_t v21 = a7;
    }
    v16->_decodeBatchSize = v21;
    v16->_unifyResults = a4;
    uint64_t v22 = [v14 copy];
    unificationOptions = v16->_unificationOptions;
    v16->_unificationOptions = (CNContactUnificationOptions *)v22;

    v16->_mutableResults = a6;
    long long v24 = v16;
  }

  return v16;
}

- (BOOL)decodeContactsFromData:(id)a3 moreComing:(BOOL)a4 replyHandler:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = a3;
  id v13 = objc_msgSend(v11, "arrayWithCapacity:", -[CNiOSABContactBuffersDecoder decodeBatchSize](self, "decodeBatchSize"));
  id v14 = [(CNiOSABContactBuffersDecoder *)self decoder];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int64_t v21 = __85__CNiOSABContactBuffersDecoder_decodeContactsFromData_moreComing_replyHandler_error___block_invoke;
  uint64_t v22 = &unk_1E56B3FB8;
  id v15 = v13;
  id v23 = v15;
  long long v24 = self;
  BOOL v26 = a4;
  id v16 = v10;
  id v25 = v16;
  char v17 = [v14 decodeContactsFromBuffer:v12 replyHandler:&v19];

  if (a6 && (v17 & 1) == 0)
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1009, v19, v20, v21, v22, v23, v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (CNContactBufferDecoder)decoder
{
  return self->_decoder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfosWaitingForUnification, 0);
  objc_storeStrong((id *)&self->_contactsWaitingForUnification, 0);
  objc_storeStrong((id *)&self->_unificationOptions, 0);

  objc_storeStrong((id *)&self->_decoder, 0);
}

- (CNiOSABContactBuffersDecoder)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end