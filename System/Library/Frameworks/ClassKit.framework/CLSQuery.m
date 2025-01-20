@interface CLSQuery
+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4;
+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4 error:(id *)a5;
+ (id)queryWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5;
+ (id)queryWithSearchSpecification:(id)a3;
- (BOOL)isExecuting;
- (BOOL)shouldAddResultsToDataStore;
- (BOOL)shouldFaultResults;
- (CLSQuery)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6;
- (CLSQuery)initWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5;
- (CLSQuery)initWithQuerySpecification:(id)a3 error:(id *)a4;
- (CLSQuery)initWithSearchSpecification:(id)a3 error:(id *)a4;
- (CLSSearchSpecification)searchSpec;
- (NSDate)startDate;
- (NSMutableArray)results;
- (NSString)description;
- (id)completion;
- (int64_t)fetchLimit;
- (void)_faultResultsAndComplete;
- (void)_notifyOfCompletionWithError:(id)a3;
- (void)_notifyOfCompletionWithResults:(id)a3 error:(id)a4;
- (void)clientRemote_deliverObject:(id)a3;
- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4;
- (void)clientRemote_invalidate;
- (void)lock;
- (void)reset;
- (void)setCompletion:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFetchLimit:(int64_t)a3;
- (void)setResults:(id)a3;
- (void)setShouldAddResultsToDataStore:(BOOL)a3;
- (void)setShouldFaultResults:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)unlock;
@end

@implementation CLSQuery

+ (id)queryWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  Specification_completion_error = objc_msgSend_initWithQuerySpecification_completion_error_(v10, v11, (uint64_t)v9, v8, a5);

  return Specification_completion_error;
}

+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v4 = objc_msgSend_queryWithObjectType_predicate_error_(a1, a2, (uint64_t)a3, a4, &v8);
  id v5 = v8;
  if (v5)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v6 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_1DC60F000, v6, OS_LOG_TYPE_INFO, "Error validating predicate: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

+ (id)queryWithObjectType:(Class)a3 predicate:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, a2, (uint64_t)a3, a4);
  id v9 = objc_msgSend_queryWithQuerySpecification_completion_error_(a1, v8, (uint64_t)v7, &unk_1F37A1530, a5);

  return v9;
}

+ (id)queryWithSearchSpecification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v11 = 0;
  v7 = objc_msgSend_initWithSearchSpecification_error_(v5, v6, (uint64_t)v4, &v11);

  id v8 = v11;
  if (v8)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    id v9 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_1DC60F000, v9, OS_LOG_TYPE_INFO, "Error creating searchQuery: %{public}@", buf, 0xCu);
    }
  }

  return v7;
}

- (CLSQuery)initWithQuerySpecification:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSQuery;
  v7 = [(CLSDataObserver *)&v13 initWithQuerySpecification:v6 error:a4];
  if (v7)
  {
    id v8 = objc_opt_new();
    objc_msgSend_setResults_(v7, v9, (uint64_t)v8);

    v7->_shouldAddResultsToDataStore = 1;
    v7->_shouldFaultResults = 1;
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_fetchLimit = objc_msgSend_limit(v6, v10, v11);
  }

  return v7;
}

- (CLSQuery)initWithQuerySpecification:(id)a3 completion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CLSQuery;
  id v10 = [(CLSDataObserver *)&v17 initWithQuerySpecification:v8 error:a5];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    objc_msgSend_setResults_(v10, v12, (uint64_t)v11);

    v10->_shouldAddResultsToDataStore = 1;
    v10->_shouldFaultResults = 1;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_fetchLimit = objc_msgSend_limit(v8, v13, v14);
    objc_msgSend_setCompletion_(v10, v15, (uint64_t)v9);
  }

  return v10;
}

- (CLSQuery)initWithSearchSpecification:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v10 = objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v9, v8, 0);
  uint64_t Specification_error = objc_msgSend_initWithQuerySpecification_error_(self, v11, (uint64_t)v10, a4);
  objc_super v13 = (CLSQuery *)Specification_error;
  if (Specification_error) {
    objc_storeStrong((id *)(Specification_error + 136), a3);
  }

  return v13;
}

- (CLSQuery)initWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v12 = objc_msgSend_querySpecificationWithObjectType_predicate_(CLSQuerySpecification, v11, (uint64_t)a3, a4);
  objc_msgSend_setSortDescriptors_(v12, v13, (uint64_t)v10);

  uint64_t Specification_error = (CLSQuery *)objc_msgSend_initWithQuerySpecification_error_(self, v14, (uint64_t)v12, a6);
  return Specification_error;
}

- (void)lock
{
}

- (void)unlock
{
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)CLSQuery;
  v3 = [(CLSDataObserver *)&v17 description];
  id v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  searchSpec = self->_searchSpec;
  if (searchSpec)
  {
    id v10 = objc_msgSend_description(searchSpec, v7, v8);
    objc_msgSend_appendString_(v6, v11, (uint64_t)v10);
  }
  objc_msgSend_appendString_(v6, v7, @" (executing: ");
  if (objc_msgSend_isExecuting(self, v12, v13)) {
    objc_msgSend_appendString_(v6, v14, @"YES");
  }
  else {
    objc_msgSend_appendString_(v6, v14, @"NO");
  }
  objc_msgSend_appendString_(v6, v15, @""));

  return (NSString *)v6;
}

- (void)setFetchLimit:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_querySpec(self, a2, a3);
  objc_msgSend_setLimit_(v5, v6, a3);

  self->_fetchLimit = a3;
}

- (void)reset
{
  objc_msgSend_querySpec(self, a2, v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v4, v3, 0);
}

- (void)clientRemote_invalidate
{
  objc_msgSend_lock(self, a2, v2);
  id v6 = objc_msgSend_results(self, v4, v5);
  objc_msgSend_removeAllObjects(v6, v7, v8);

  uint64_t v14 = (void (**)(id, void, void *))MEMORY[0x1E01A05F0](self->_completion);
  objc_msgSend_unlock(self, v9, v10);
  if (v14)
  {
    v12 = objc_msgSend_cls_createErrorWithCode_description_(MEMORY[0x1E4F28C58], v11, 100, @"Query invalidated");
    objc_msgSend_setExecuting_(self, v13, 0);
    v14[2](v14, 0, v12);
  }
  else
  {
    objc_msgSend_setExecuting_(self, v11, 0);
  }
}

- (void)clientRemote_deliverObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v23, v27, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_dataStore(self, v14, v15, (void)v23),
              v16 = objc_claimAutoreleasedReturnValue(),
              char isRemovedObject = objc_msgSend_isRemovedObject_(v16, v17, v13),
              v16,
              (isRemovedObject & 1) == 0))
        {
          v19 = objc_msgSend_results(self, v14, v15, (void)v23);
          objc_msgSend_addObject_(v19, v20, v13);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v14, (uint64_t)&v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend_unlock(self, v21, v22);
}

- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4
{
  long long v23 = (char *)a4;
  objc_msgSend_lock(self, v6, v7);
  uint64_t v10 = objc_msgSend_querySpec(self, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_querySpec(self, v11, v12);
    objc_msgSend_setOffset_(v13, v14, a3);
  }
  objc_msgSend_unlock(self, v11, v12);
  objc_super v17 = objc_msgSend_objectType(self, v15, v16);
  int v19 = objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1F37B96C0);
  v21 = v23;
  if (!v23 && v19 && (objc_msgSend_shouldFaultResults(self, 0, v20) & 1) != 0) {
    objc_msgSend__faultResultsAndComplete(self, v21, v22);
  }
  else {
    objc_msgSend__notifyOfCompletionWithError_(self, v21, (uint64_t)v23);
  }
}

- (void)_faultResultsAndComplete
{
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x3032000000;
  int v19 = sub_1DC630B6C;
  uint64_t v20 = sub_1DC630B7C;
  v3 = [CLSFaultProcessor alloc];
  uint64_t v6 = objc_msgSend_dataStore(self, v4, v5);
  id v21 = (id)objc_msgSend_initWithDelegate_(v3, v7, (uint64_t)v6);

  uint64_t v8 = (void *)v17[5];
  uint64_t v11 = objc_msgSend_results(self, v9, v10);
  objc_msgSend_faultObjects_(v8, v12, (uint64_t)v11);

  uint64_t v13 = (void *)v17[5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1DC630B84;
  v15[3] = &unk_1E6C96370;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend_completionNotify_(v13, v14, (uint64_t)v15);
  _Block_object_dispose(&v16, 8);
}

- (void)_notifyOfCompletionWithError:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  uint64_t v9 = objc_msgSend_results(self, v7, v8);
  uint64_t v12 = objc_msgSend_copy(v9, v10, v11);

  uint64_t v15 = objc_msgSend_results(self, v13, v14);
  objc_msgSend_removeAllObjects(v15, v16, v17);

  objc_msgSend_unlock(self, v18, v19);
  uint64_t v22 = objc_msgSend_objectType(self, v20, v21);
  uint64_t v23 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(v22, v24, v23) && self->_shouldAddResultsToDataStore)
  {
    long long v26 = objc_opt_new();
    v29 = objc_msgSend_dataStore(self, v27, v28);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v30 = v12;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v42, v46, 16);
    if (v32)
    {
      uint64_t v34 = v32;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v30);
          }
          v37 = objc_msgSend_addObject_(v29, v33, *(void *)(*((void *)&v42 + 1) + 8 * i), (void)v42);
          v40 = v37;
          if (v37 && (objc_msgSend_isDeleted(v37, v38, v39) & 1) == 0) {
            objc_msgSend_addObject_(v26, v41, (uint64_t)v40);
          }
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v42, v46, 16);
      }
      while (v34);
    }
  }
  else
  {
    long long v26 = v12;
  }
  objc_msgSend__notifyOfCompletionWithResults_error_(self, v25, (uint64_t)v26, v4, (void)v42);
}

- (void)_notifyOfCompletionWithResults:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  uint64_t v8 = (id)CLSLogConnection;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v9, v10);
    uint64_t v21 = objc_msgSend_startDate(self, v19, v20);
    objc_msgSend_timeIntervalSinceDate_(v18, v22, (uint64_t)v21);
    uint64_t v26 = v25;
    if (v6) {
      uint64_t v27 = objc_msgSend_count(v6, v23, v24);
    }
    else {
      uint64_t v27 = 0;
    }
    *(_DWORD *)buf = 138412802;
    v33 = self;
    __int16 v34 = 2048;
    uint64_t v35 = v26;
    __int16 v36 = 2048;
    uint64_t v37 = v27;
    _os_log_debug_impl(&dword_1DC60F000, v8, OS_LOG_TYPE_DEBUG, "query: %@; took: %.3f count: %ld", buf, 0x20u);
  }
  objc_msgSend_lock(self, v11, v12);
  uint64_t v13 = (void *)MEMORY[0x1E01A05F0](self->_completion);
  objc_msgSend_unlock(self, v14, v15);
  if (v13)
  {
    uint64_t v17 = dispatch_get_global_queue(33, 0);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1DC63115C;
    v28[3] = &unk_1E6C96398;
    v28[4] = self;
    id v29 = v7;
    id v31 = v13;
    id v30 = v6;
    dispatch_async(v17, v28);
  }
  else
  {
    objc_msgSend_setExecuting_(self, v16, 0);
  }
}

- (NSMutableArray)results
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setResults:(id)a3
{
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (CLSSearchSpecification)searchSpec
{
  return self->_searchSpec;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)shouldAddResultsToDataStore
{
  return self->_shouldAddResultsToDataStore;
}

- (void)setShouldAddResultsToDataStore:(BOOL)a3
{
  self->_shouldAddResultsToDataStore = a3;
}

- (BOOL)shouldFaultResults
{
  return self->_shouldFaultResults;
}

- (void)setShouldFaultResults:(BOOL)a3
{
  self->_shouldFaultResults = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_searchSpec, 0);

  objc_storeStrong((id *)&self->results, 0);
}

@end