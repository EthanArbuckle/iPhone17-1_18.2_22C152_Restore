@interface GDInteractionStoreShim
+ (id)interactionFromCDInteraction:(id)a3;
+ (id)interactionHistoryEnumeratorFromStore:(id)a3 batchSize:(unint64_t)a4;
+ (id)interactionHistoryEnumeratorFromStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6;
+ (id)interactionHistoryEnumeratorWithBatchSize:(unint64_t)a3;
+ (id)interactionHistoryEnumeratorWithPredicate:(id)a3 sortDescriptor:(id)a4 batchSize:(unint64_t)a5;
+ (id)interactionHistoryFromStore:(id)a3;
@end

@implementation GDInteractionStoreShim

+ (id)interactionHistoryEnumeratorFromStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [GDInteractionEnumeration alloc];
  v14 = objc_msgSend_initWithStore_predicate_sortDescriptor_batchSize_(v12, v13, (uint64_t)v11, (uint64_t)v10, v9, a6);

  return v14;
}

+ (id)interactionHistoryEnumeratorFromStore:(id)a3 batchSize:(unint64_t)a4
{
  id v5 = a3;
  v6 = [GDInteractionEnumeration alloc];
  v8 = objc_msgSend_initWithStore_batchSize_(v6, v7, (uint64_t)v5, a4);

  return v8;
}

+ (id)interactionHistoryEnumeratorWithPredicate:(id)a3 sortDescriptor:(id)a4 batchSize:(unint64_t)a5
{
  v8 = (void *)MEMORY[0x1E4F5B400];
  id v9 = a4;
  id v10 = a3;
  v14 = objc_msgSend_defaultDatabaseDirectory(v8, v11, v12, v13);
  v16 = objc_msgSend_storeWithDirectory_readOnly_(v8, v15, (uint64_t)v14, 1);

  v18 = objc_msgSend_interactionHistoryEnumeratorFromStore_predicate_sortDescriptor_batchSize_(a1, v17, (uint64_t)v16, (uint64_t)v10, v9, a5);

  return v18;
}

+ (id)interactionHistoryEnumeratorWithBatchSize:(unint64_t)a3
{
  v6 = (void *)MEMORY[0x1E4F5B400];
  v7 = objc_msgSend_defaultDatabaseDirectory(MEMORY[0x1E4F5B400], a2, a3, v3);
  id v9 = objc_msgSend_storeWithDirectory_readOnly_(v6, v8, (uint64_t)v7, 1);

  id v11 = objc_msgSend_interactionHistoryEnumeratorFromStore_batchSize_(a1, v10, (uint64_t)v9, a3);

  return v11;
}

+ (id)interactionHistoryFromStore:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1C87B9E80]();
  v7 = objc_msgSend_predicateWithValue_(MEMORY[0x1E4F28F60], v5, 1, v6);
  v8 = (void *)MEMORY[0x1C87B9E80]();
  id v10 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v9, @"startDate", 1);
  id v11 = (void *)MEMORY[0x1C87B9E80]();
  v44[0] = v10;
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v44, 1);
  id v40 = 0;
  v15 = objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_error_(v3, v14, (uint64_t)v7, (uint64_t)v13, 10000, 0, &v40);
  id v16 = v40;

  if (v15)
  {
    id v35 = v3;

    v17 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = v15;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, (uint64_t)v41, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v18);
          }
          v28 = objc_msgSend_interactionFromCDInteraction_(GDInteractionStoreShim, v21, *(void *)(*((void *)&v36 + 1) + 8 * i), v22);
          if (v28) {
            objc_msgSend_addObject_(v17, v26, (uint64_t)v28, v27);
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v36, (uint64_t)v41, 16);
      }
      while (v23);
    }

    v32 = objc_msgSend_copy(v17, v29, v30, v31);
    id v3 = v35;
  }
  else
  {
    v33 = GDDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v16;
      _os_log_error_impl(&dword_1C6DE6000, v33, OS_LOG_TYPE_ERROR, "GDInteractionStoreShim: interactionHistoryFromStore error: %@", buf, 0xCu);
    }

    v32 = 0;
  }

  return v32;
}

+ (id)interactionFromCDInteraction:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_sender(v3, v4, v5, v6);

  if (v7)
  {
    id v11 = objc_msgSend_sender(v3, v8, v9, v10);
    v7 = sub_1C791D664((uint64_t)GDInteractionStoreShim, v11);
  }
  uint64_t v12 = objc_msgSend_recipients(v3, v8, v9, v10);
  v15 = objc_msgSend__pas_mappedArrayWithTransform_(v12, v13, (uint64_t)&unk_1F220ABD8, v14);

  id v16 = [GDInteraction alloc];
  uint64_t v20 = objc_msgSend_startDate(v3, v17, v18, v19);
  uint64_t v24 = objc_msgSend_endDate(v3, v21, v22, v23);
  v28 = objc_msgSend_bundleId(v3, v25, v26, v27);
  uint64_t v32 = objc_msgSend_mechanism(v3, v29, v30, v31);
  uint64_t v36 = objc_msgSend_direction(v3, v33, v34, v35);
  uint64_t v40 = objc_msgSend_selfParticipantStatus(v3, v37, v38, v39);
  started = objc_msgSend_initWithStartDate_endDate_bundleId_mechanism_direction_sender_recipients_selfParticipantStatus_(v16, v41, (uint64_t)v20, (uint64_t)v24, v28, v32, v36, v7, v15, v40);

  return started;
}

@end