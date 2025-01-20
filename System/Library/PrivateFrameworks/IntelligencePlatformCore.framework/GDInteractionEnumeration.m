@interface GDInteractionEnumeration
- (GDInteractionEnumeration)initWithStore:(id)a3 batchSize:(unint64_t)a4;
- (GDInteractionEnumeration)initWithStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation GDInteractionEnumeration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v5 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a3->var0)
  {
    unint64_t v7 = a3->var3[0];
  }
  else
  {
    unint64_t v7 = 0;
    a3->var2 = (unint64_t *)self;
    a3->var3[0] = 0;
    a3->var0 = 1;
  }
  a3->var1 = a4;
  predicate = self->_predicate;
  sortDescriptor = self->_sortDescriptor;
  unint64_t batchSize = self->_batchSize;
  v11 = self->_store;
  v12 = predicate;
  v13 = sortDescriptor;
  uint64_t v14 = self;
  v15 = (void *)MEMORY[0x1C87B9E80](v14);
  *(void *)buf = v13;
  v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)buf, 1);
  id v46 = 0;
  v19 = objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_error_(v11, v18, (uint64_t)v12, (uint64_t)v17, batchSize, v7, &v46);
  id v20 = v46;

  id v21 = 0;
  if (!v19) {
    id v21 = v20;
  }

  id v22 = v21;
  objc_msgSend__pas_mappedArrayWithTransform_(v19, v23, (uint64_t)&unk_1F220ABF8, v24);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  batch = self->_batch;
  self->_batch = v25;

  v27 = self->_batch;
  if (v27)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v28 = v27;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v30)
    {
      uint64_t v32 = v30;
      unint64_t v33 = 0;
      uint64_t v34 = *(void *)v43;
      while (2)
      {
        uint64_t v35 = 0;
        if (a5 >= v33) {
          unint64_t v36 = a5 - v33;
        }
        else {
          unint64_t v36 = 0;
        }
        do
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v28);
          }
          if (v36 == v35)
          {
            unint64_t v37 = v32 - 1;
            if (v36 < v32 - 1) {
              unint64_t v37 = v36;
            }
            v33 += v37;
            goto LABEL_25;
          }
          *v5++ = *(id *)(*((void *)&v42 + 1) + 8 * v35++);
        }
        while (v32 != v35);
        v33 += v35;
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v42, (uint64_t)v47, 16);
        if (v32) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v33 = 0;
    }
LABEL_25:

    a3->var3[0] += v33;
  }
  else
  {
    v38 = GDDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_1C6DE6000, v38, OS_LOG_TYPE_ERROR, "GDInteractionEnumeration: _cdInteractionFromStore error: %@", buf, 0xCu);
    }

    unint64_t v33 = 0;
  }

  return v33;
}

- (GDInteractionEnumeration)initWithStore:(id)a3 predicate:(id)a4 sortDescriptor:(id)a5 batchSize:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v17 = a5;
  if (!a6)
  {
    id v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, @"GDInteractionStoreShim.m", 278, @"Invalid parameter not satisfying: %@", @"batchSize > 0");
  }
  v24.receiver = self;
  v24.super_class = (Class)GDInteractionEnumeration;
  v18 = [(GDInteractionEnumeration *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_store, a3);
    objc_storeStrong((id *)&v19->_predicate, a4);
    objc_storeStrong((id *)&v19->_sortDescriptor, a5);
    unint64_t v20 = 10;
    if (a6 > 0xA) {
      unint64_t v20 = a6;
    }
    v19->_unint64_t batchSize = v20;
  }

  return v19;
}

- (GDInteractionEnumeration)initWithStore:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = (void *)MEMORY[0x1C87B9E80]();
  v10 = objc_msgSend_predicateWithValue_(MEMORY[0x1E4F28F60], v8, 1, v9);
  v11 = (void *)MEMORY[0x1C87B9E80]();
  id v13 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E4F29008], v12, @"startDate", 1);
  uint64_t v15 = (GDInteractionEnumeration *)objc_msgSend_initWithStore_predicate_sortDescriptor_batchSize_(self, v14, (uint64_t)v6, (uint64_t)v10, v13, a4);

  return v15;
}

@end