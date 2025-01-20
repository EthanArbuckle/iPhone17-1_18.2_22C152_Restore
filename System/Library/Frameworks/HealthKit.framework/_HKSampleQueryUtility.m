@interface _HKSampleQueryUtility
- (BOOL)sortStartDateAscending;
- (_HKSampleQueryUtility)init;
- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6;
- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6 updateHandler:(id)a7;
- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 resultsHandler:(id)a6;
- (id)updateHandler;
- (void)execute;
- (void)handleAddedObjects:(id)a3 deletedObjects:(id)a4 queryAnchor:(id)a5 error:(id)a6 resultsHandler:(id)a7;
- (void)setSortStartDateAscending:(BOOL)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setupQueryWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation _HKSampleQueryUtility

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6 updateHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_HKSampleQueryUtility;
  v18 = [(_HKSampleQueryUtility *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    objc_storeStrong((id *)&v19->_sampleType, a4);
    objc_storeStrong((id *)&v19->_predicate, a5);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    samples = v19->_samples;
    v19->_samples = v20;

    [(_HKSampleQueryUtility *)v19 setupQueryWithCompletionHandler:v16];
    [(_HKSampleQueryUtility *)v19 setUpdateHandler:v17];
  }

  return v19;
}

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 resultsHandler:(id)a6
{
  return [(_HKSampleQueryUtility *)self initWithHealthStore:a3 sampleType:a4 predicate:a5 completionHandler:a6 updateHandler:a6];
}

- (_HKSampleQueryUtility)initWithHealthStore:(id)a3 sampleType:(id)a4 predicate:(id)a5 completionHandler:(id)a6
{
  return [(_HKSampleQueryUtility *)self initWithHealthStore:a3 sampleType:a4 predicate:a5 completionHandler:a6 updateHandler:0];
}

- (_HKSampleQueryUtility)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void)setupQueryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)[(HKSampleType *)self->_sampleType copy];
  v6 = [HKAnchoredObjectQuery alloc];
  sampleType = self->_sampleType;
  predicate = self->_predicate;
  queryAnchor = self->_queryAnchor;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E58C9308;
  id v10 = v5;
  id v15 = v10;
  objc_copyWeak(&v17, &location);
  id v11 = v4;
  id v16 = v11;
  v12 = [(HKAnchoredObjectQuery *)v6 initWithType:sampleType predicate:predicate anchor:queryAnchor limit:0 resultsHandler:v14];
  query = self->_query;
  self->_query = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setUpdateHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_query)
  {
    v6 = _Block_copy(v4);
    id updateHandler = self->_updateHandler;
    self->_id updateHandler = v6;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42___HKSampleQueryUtility_setUpdateHandler___block_invoke;
    v8[3] = &unk_1E58C9330;
    objc_copyWeak(&v9, &location);
    [(HKAnchoredObjectQuery *)self->_query setUpdateHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)handleAddedObjects:(id)a3 deletedObjects:(id)a4 queryAnchor:(id)a5 error:(id)a6 resultsHandler:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = v15;
  if (a6)
  {
    (*((void (**)(id, _HKSampleQueryUtility *, void, id))v15 + 2))(v15, self, 0, a6);
  }
  else
  {
    id obj = a5;
    id v30 = v15;
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          samples = self->_samples;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __92___HKSampleQueryUtility_handleAddedObjects_deletedObjects_queryAnchor_error_resultsHandler___block_invoke;
          v31[3] = &unk_1E58C9358;
          v31[4] = v23;
          uint64_t v25 = -[NSMutableArray indexOfObjectPassingTest:](samples, "indexOfObjectPassingTest:", v31, obj);
          if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
            [v17 addIndex:v25];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v20);
    }

    [(NSMutableArray *)self->_samples removeObjectsAtIndexes:v17];
    [(NSMutableArray *)self->_samples addObjectsFromArray:v12];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:self->_sortStartDateAscending];
    v27 = self->_samples;
    v36 = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    [(NSMutableArray *)v27 sortUsingDescriptors:v28];

    objc_storeStrong((id *)&self->_queryAnchor, obj);
    id v16 = v30;
    (*((void (**)(id, _HKSampleQueryUtility *, NSMutableArray *, void))v30 + 2))(v30, self, self->_samples, 0);
  }
}

- (void)execute
{
}

- (void)stop
{
  if (self->_query)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    query = self->_query;
    self->_query = 0;
  }
}

- (BOOL)sortStartDateAscending
{
  return self->_sortStartDateAscending;
}

- (void)setSortStartDateAscending:(BOOL)a3
{
  self->_sortStartDateAscending = a3;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_queryAnchor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end