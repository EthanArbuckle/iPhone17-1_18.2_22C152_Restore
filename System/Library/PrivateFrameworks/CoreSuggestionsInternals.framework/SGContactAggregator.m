@interface SGContactAggregator
+ (id)mergeContact:(id)a3 withContact:(id)a4;
+ (id)messageIdentifiersGeneratingContact:(id)a3;
+ (id)replaceDetailsInContact:(id)a3 onDiskContact:(id)a4;
- (SGContactAggregator)init;
- (id)augmentSuggestedContactWithContact:(id)a3 conversationId:(id)a4 store:(id)a5 handle:(id)a6;
- (void)clear;
- (void)clearContactsWithConversationIdentifier:(id)a3;
- (void)removeContact:(id)a3;
@end

@implementation SGContactAggregator

- (void).cxx_destruct
{
}

- (id)augmentSuggestedContactWithContact:(id)a3 conversationId:(id)a4 store:(id)a5 handle:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  v15 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v11 second:v13];
  uint64_t v16 = [(_PASLRUCache *)v14->_cachedContacts objectForKey:v15];
  v17 = (void *)v16;
  if (v10 && v16)
  {
    id v18 = +[SGContactAggregator mergeContact:v16 withContact:v10];
    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
    if (!(v16 | v10))
    {
      id v18 = 0;
      goto LABEL_21;
    }
    if (v16) {
      v19 = (void *)v16;
    }
    else {
      v19 = (void *)v10;
    }
    id v18 = v19;
  }
  if (([v18 isEqual:v17] & 1) != 0
    || !+[SGSqlEntityStore contactContainsEphemeralId:v18])
  {
    goto LABEL_20;
  }
  if ([v13 containsString:@"@"]) {
    [v12 suggestContactMatchesByEmailAddress:v13 isMaybe:0 onlySignificant:0];
  }
  else {
  v24 = [v12 suggestContactMatchesByPhoneNumber:v13 isMaybe:0 onlySignificant:0];
  }
  v20 = [v24 firstObject];
  v21 = [v20 contact];

  if (!v21)
  {

    goto LABEL_20;
  }
  uint64_t v22 = [(id)objc_opt_class() replaceDetailsInContact:v18 onDiskContact:v21];

  id v18 = (id)v22;
  if (v22) {
LABEL_20:
  }
    [(_PASLRUCache *)v14->_cachedContacts setObject:v18 forKey:v15];
LABEL_21:

  objc_sync_exit(v14);
  return v18;
}

- (void)removeContact:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__37885;
  v20 = __Block_byref_object_dispose__37886;
  id v21 = 0;
  v6 = +[SGContactAggregator messageIdentifiersGeneratingContact:v4];
  cachedContacts = v5->_cachedContacts;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __37__SGContactAggregator_removeContact___block_invoke;
  id v13 = &unk_1E65BFB40;
  id v8 = v6;
  id v14 = v8;
  v15 = &v16;
  [(_PASLRUCache *)cachedContacts enumerateKeysAndObjectsUsingBlock:&v10];
  v9 = v5->_cachedContacts;
  if (v17[5]) {
    -[_PASLRUCache removeObjectForKey:](v9, "removeObjectForKey:", v10, v11, v12, v13);
  }
  else {
    [(_PASLRUCache *)v9 removeAllObjects];
  }

  _Block_object_dispose(&v16, 8);
  objc_sync_exit(v5);
}

void __37__SGContactAggregator_removeContact___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = +[SGContactAggregator messageIdentifiersGeneratingContact:a3];
  if ([*(id *)(a1 + 32) intersectsSet:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)clearContactsWithConversationIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_opt_new();
  cachedContacts = v5->_cachedContacts;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__SGContactAggregator_clearContactsWithConversationIdentifier___block_invoke;
  v18[3] = &unk_1E65BFB18;
  id v8 = v4;
  id v19 = v8;
  id v9 = v6;
  id v20 = v9;
  [(_PASLRUCache *)cachedContacts enumerateKeysAndObjectsUsingBlock:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        -[_PASLRUCache removeObjectForKey:](v5->_cachedContacts, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

void __63__SGContactAggregator_clearContactsWithConversationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 first];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  [(_PASLRUCache *)obj->_cachedContacts removeAllObjects];
  objc_sync_exit(obj);
}

- (SGContactAggregator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGContactAggregator;
  v2 = [(SGContactAggregator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:10];
    cachedContacts = v2->_cachedContacts;
    v2->_cachedContacts = (_PASLRUCache *)v3;
  }
  return v2;
}

+ (id)replaceDetailsInContact:(id)a3 onDiskContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_2;
  v54[3] = &unk_1E65BFC10;
  id v55 = &__block_literal_global_38_37899;
  uint64_t v7 = MEMORY[0x1CB79B4C0](v54);
  id v8 = [v5 name];
  id v9 = [v6 name];
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 && v11)
  {
    uint64_t v13 = [v10 fullName];
    if ([v13 length])
    {
      long long v14 = [v12 fullName];
      if ([v14 length])
      {
        long long v15 = [v10 fullName];
        long long v16 = [v12 fullName];
        char v17 = [v15 isEqual:v16];

        uint64_t v18 = v12;
        if (v17) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }
LABEL_9:
  uint64_t v18 = v10;
LABEL_10:
  id v52 = v18;

  id v19 = [v5 emailAddresses];
  id v20 = [v6 emailAddresses];
  v51 = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v20, v19, v20, &__block_literal_global_52);

  id v21 = [v5 phones];
  uint64_t v22 = [v6 phones];
  v50 = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v22, v21, v22, &__block_literal_global_54_37900);

  v23 = [v5 postalAddresses];
  v24 = [v6 postalAddresses];
  v53 = (void *)v7;
  v49 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v23, v24);

  v25 = [v5 socialProfiles];
  v26 = [v6 socialProfiles];
  v48 = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke((uint64_t)v26, v25, v26, &__block_literal_global_56_37901);

  v27 = [v5 birthday];
  v28 = [v6 birthday];
  id v29 = v27;
  id v30 = v28;
  v31 = v30;
  if (!v29 || !v30) {
    goto LABEL_16;
  }
  v32 = [v29 dateComponents];
  uint64_t v33 = [v32 month];
  v34 = [v31 dateComponents];
  if (v33 != [v34 month])
  {

    goto LABEL_16;
  }
  v35 = [v29 dateComponents];
  uint64_t v36 = [v35 day];
  v37 = [v31 dateComponents];
  uint64_t v38 = [v37 day];

  v39 = v31;
  if (v36 != v38) {
LABEL_16:
  }
    v39 = v29;
  id v40 = v39;

  v41 = [v5 photoPath];
  if (v41) {
    v42 = v5;
  }
  else {
    v42 = v6;
  }
  v43 = [v42 photoPath];

  v44 = (void *)MEMORY[0x1E4F5D9B0];
  v45 = [v6 recordId];
  v46 = [v44 contactWithId:v45 name:v52 emailAddresses:v51 phones:v50 postalAddresses:v49 socialProfiles:v48 birthday:v40 photoPath:v43];

  objc_msgSend(v46, "setUpdatedFields:", objc_msgSend(v5, "updatedFields"));
  return v46;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v5 count] || !objc_msgSend(v6, "count"))
  {
    id v8 = v5;
    goto LABEL_6;
  }
  uint64_t v7 = [v5 count];
  if ((unint64_t)([v6 count] + v7) >= 6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    id v9 = v8;
    goto LABEL_7;
  }
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_5;
  v27[3] = &unk_1E65BFC78;
  id v22 = v6;
  id v28 = v6;
  id v29 = &__block_literal_global_44_37909;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v27);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = v12[2](v12, v18);
        id v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = v19;
        }
        else {
          uint64_t v21 = v18;
        }
        [v11 addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v15);
  }

  id v9 = (void *)[v11 copy];
  id v6 = v22;
LABEL_7:

  return v9;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    id v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    id v9 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v16 = v8[2](v8, v15);
          [v9 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v29 = v6;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          long long v23 = ((void (**)(id, void *))v8)[2](v8, v22);
          long long v24 = [v9 objectForKeyedSubscript:v23];

          if (v24) {
            long long v25 = v24;
          }
          else {
            long long v25 = v22;
          }
          [v30 addObject:v25];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v19);
    }

    id v26 = (id)[v30 copy];
    id v7 = v28;
    id v6 = v29;
  }
  else
  {
    id v26 = v6;
  }

  return v26;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v2];

  int v4 = [(SGSocialProfileDetails *)v3 preferredUniqueIdentifier];
  SGNormalizeSocialProfile(v4);
  objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 phoneNumber];
  uint64_t v3 = SGNormalizePhoneNumber();

  return v3;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 emailAddress];
  uint64_t v3 = SGNormalizeEmailAddress();

  return v3;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40)))
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 address];
  uint64_t v6 = [v4 address];

  uint64_t v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

id __61__SGContactAggregator_replaceDetailsInContact_onDiskContact___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 address];
  id v3 = SGNormalizeAddress(v2);

  return v3;
}

+ (id)mergeContact:(id)a3 withContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __48__SGContactAggregator_mergeContact_withContact___block_invoke_3;
  v46[3] = &unk_1E65BFC10;
  id v47 = &__block_literal_global_37917;
  uint64_t v7 = MEMORY[0x1CB79B4C0](v46);
  id v8 = [v5 name];
  id v9 = [v8 fullName];
  unint64_t v10 = [v9 length];
  uint64_t v11 = [v6 name];
  long long v12 = [v11 fullName];
  if (v10 <= [v12 length]) {
    long long v13 = v6;
  }
  else {
    long long v13 = v5;
  }
  v45 = [v13 name];

  long long v14 = [v5 recordId];
  if (+[SGSqlEntityStore isEphemeralIdentifier:](SGSqlEntityStore, "isEphemeralIdentifier:", [v14 numericValue]))
  {
    long long v15 = [v6 recordId];
    BOOL v16 = +[SGSqlEntityStore isEphemeralIdentifier:](SGSqlEntityStore, "isEphemeralIdentifier:", [v15 numericValue]);

    if (v16) {
      id v17 = v6;
    }
    else {
      id v17 = v5;
    }
    if (!v16) {
      id v5 = v6;
    }
    id v6 = v17;
  }
  else
  {
  }
  uint64_t v18 = [v5 emailAddresses];
  uint64_t v19 = [v6 emailAddresses];
  v44 = __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v19, v18, v19, &__block_literal_global_30_37918);

  uint64_t v20 = [v5 phones];
  uint64_t v21 = [v6 phones];
  v42 = __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v21, v20, v21, &__block_literal_global_32);

  id v22 = [v5 postalAddresses];
  long long v23 = [v6 postalAddresses];
  uint64_t v41 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v22, v23);

  long long v24 = [v5 socialProfiles];
  [v6 socialProfiles];
  long long v25 = v43 = (void *)v7;
  id v40 = __48__SGContactAggregator_mergeContact_withContact___block_invoke((uint64_t)v25, v24, v25, &__block_literal_global_34_37919);

  id v26 = [v5 birthday];
  v27 = [v6 birthday];
  id v28 = v26;
  id v29 = v28;
  if (v28) {
    id v30 = v28;
  }
  else {
    id v30 = v27;
  }
  id v31 = v30;

  long long v32 = [v5 photoPath];
  if (v32) {
    long long v33 = v5;
  }
  else {
    long long v33 = v6;
  }
  long long v34 = [v33 photoPath];

  long long v35 = (void *)MEMORY[0x1E4F5D9B0];
  long long v36 = [v5 recordId];
  long long v37 = [v35 contactWithId:v36 name:v45 emailAddresses:v44 phones:v42 postalAddresses:v41 socialProfiles:v40 birthday:v31 photoPath:v34];

  if ([v5 updatedFields]) {
    long long v38 = v5;
  }
  else {
    long long v38 = v6;
  }
  objc_msgSend(v37, "setUpdatedFields:", objc_msgSend(v38, "updatedFields"));

  return v37;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 count])
  {
    id v8 = v6;
    goto LABEL_7;
  }
  if (![v6 count])
  {
    id v8 = v5;
    goto LABEL_7;
  }
  uint64_t v7 = [v5 count];
  if ((unint64_t)([v6 count] + v7) >= 6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    id v9 = v8;
    goto LABEL_9;
  }
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
  [v10 addObjectsFromArray:v5];
  [v10 addObjectsFromArray:v6];
  uint64_t v11 = +[SGDeduper bucketerWithEqualityTest:&__block_literal_global_21_37925];
  long long v12 = +[SGDeduper resolveByPairs:&__block_literal_global_23_37926];
  id v9 = +[SGDeduper dedupe:v10 bucketer:v11 resolver:v12];

LABEL_9:
  return v9;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
    [v9 addObjectsFromArray:v6];
    [v9 addObjectsFromArray:v7];
    unint64_t v10 = +[SGDeduper bucketerWithMapping:v8];
    uint64_t v11 = +[SGDeduper resolveByPairs:&__block_literal_global_15];
    id v12 = +[SGDeduper dedupe:v9 bucketer:v10 resolver:v11];
  }
  else
  {
    if ([v6 count]) {
      long long v13 = v6;
    }
    else {
      long long v13 = v7;
    }
    id v12 = v13;
  }

  return v12;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v2];

  id v4 = [(SGSocialProfileDetails *)v3 preferredUniqueIdentifier];
  SGNormalizeSocialProfile(v4);
  objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = [a2 phoneNumber];
  id v3 = SGNormalizePhoneNumber();

  return v3;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = [a2 emailAddress];
  id v3 = SGNormalizeEmailAddress();

  return v3;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __48__SGContactAggregator_mergeContact_withContact___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 address];
  id v6 = [v4 address];

  uint64_t v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

id __48__SGContactAggregator_mergeContact_withContact___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 address];
  id v3 = SGNormalizeAddress(v2);

  return v3;
}

+ (id)messageIdentifiersGeneratingContact:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "richness"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__SGContactAggregator_messageIdentifiersGeneratingContact___block_invoke;
  v19[3] = &unk_1E65BFB68;
  id v5 = v4;
  id v20 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v19);
  uint64_t v7 = [v3 name];
  id v8 = [v7 origin];
  id v9 = [v8 externalKey];

  if (v9)
  {
    unint64_t v10 = [v3 name];
    uint64_t v11 = [v10 origin];
    id v12 = [v11 externalKey];
    [v5 addObject:v12];
  }
  long long v13 = [v3 emailAddresses];
  ((void (**)(void, void *))v6)[2](v6, v13);

  long long v14 = [v3 phones];
  ((void (**)(void, void *))v6)[2](v6, v14);

  long long v15 = [v3 postalAddresses];
  ((void (**)(void, void *))v6)[2](v6, v15);

  BOOL v16 = [v3 socialProfiles];
  ((void (**)(void, void *))v6)[2](v6, v16);

  id v17 = v5;
  return v17;
}

void __59__SGContactAggregator_messageIdentifiersGeneratingContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 origin];
        unint64_t v10 = [v9 externalKey];

        if (v10)
        {
          uint64_t v11 = *(void **)(a1 + 32);
          id v12 = [v8 origin];
          long long v13 = [v12 externalKey];
          [v11 addObject:v13];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

@end