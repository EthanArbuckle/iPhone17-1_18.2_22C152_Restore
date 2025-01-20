@interface _CADFetchCalendarItemsWithPredicateOperation
+ (BOOL)isJunkEvent:(void *)a3;
+ (id)performSynchronouslyWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 cancellationToken:(id)a7;
+ (void)queryDatabase:(CalDatabase *)a3 withID:(int)a4 predicate:(id)a5 connection:(id)a6 serializer:(id)a7 cancellationToken:(id)a8;
- (_CADFetchCalendarItemsWithPredicateOperation)initWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 completionHandler:(id)a7;
- (int)fetchIdentifier;
- (void)cancel;
- (void)main;
@end

@implementation _CADFetchCalendarItemsWithPredicateOperation

- (void)main
{
  if (([(_CADFetchCalendarItemsWithPredicateOperation *)self isCancelled] & 1) == 0)
  {
    id v3 = [(id)objc_opt_class() performSynchronouslyWithPredicate:self->_predicate entityType:self->_entityType connection:self->_connection fetchIdentifier:self->_fetchIdentifier cancellationToken:self];
    if (([(_CADFetchCalendarItemsWithPredicateOperation *)self isCancelled] & 1) == 0) {
      (*((void (**)(void))self->_completion + 2))();
    }
  }
}

+ (id)performSynchronouslyWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 cancellationToken:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a7;
  v13 = [v10 databasesToQuery];
  v14 = [CADFetchedObjectSerializer alloc];
  v15 = [v10 defaultPropertiesToLoad];
  v16 = [v10 relatedObjectPropertiesToLoad];
  v17 = [(CADFetchedObjectSerializer *)v14 initWithConnection:v11 defaultPropertiesToLoad:v15 relatedObjectPropertiesToLoad:v16];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke;
  v41[3] = &unk_1E624E448;
  id v46 = a1;
  id v18 = v10;
  id v42 = v18;
  id v19 = v11;
  id v43 = v19;
  v20 = v17;
  v44 = v20;
  id v21 = v12;
  id v45 = v21;
  v22 = (void *)MEMORY[0x1C1867AB0](v41);
  v23 = v22;
  if (v13)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v13;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      id v32 = v21;
      uint64_t v27 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v35 + 1) + 8 * i) intValue];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_3;
          v33[3] = &unk_1E624DE68;
          id v34 = v23;
          [v19 withDatabaseID:v29 perform:v33];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v26);
      id v21 = v32;
    }
  }
  else
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __138___CADFetchCalendarItemsWithPredicateOperation_performSynchronouslyWithPredicate_entityType_connection_fetchIdentifier_cancellationToken___block_invoke_2;
    v39[3] = &unk_1E624E310;
    id v40 = v22;
    [v19 withAllDatabasesPerform:v39];
    id v24 = v40;
  }

  if ([v21 isCancelled])
  {
    v30 = 0;
  }
  else
  {
    v30 = [(CADFetchedObjectSerializer *)v20 fetchedObjectWrappers];
  }

  return v30;
}

+ (void)queryDatabase:(CalDatabase *)a3 withID:(int)a4 predicate:(id)a5 connection:(id)a6 serializer:(id)a7 cancellationToken:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (([v17 isCancelled] & 1) == 0)
  {
    os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)CADPredicateSignpostsHandle);
    id v19 = (id)CADPredicateSignpostsHandle;
    v20 = v19;
    unint64_t v21 = v18 - 1;
    unint64_t v41 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138412546;
      id v48 = (id)objc_opt_class();
      __int16 v49 = 1024;
      int v50 = v11;
      id v22 = v48;
      _os_signpost_emit_with_name_impl(&dword_1BBC88000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PredicateFetch", "class=%@, dbid=%i", buf, 0x12u);

      unint64_t v21 = v18 - 1;
    }

    if ([v15 eventAccessLevel] == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v15 restrictedCalendarRowIDsForAction:0 inDatabase:a3];
        [v14 setRestrictedCalendarRowIDs:v23 forDatabaseID:v11];
      }
      id v24 = (void *)[v14 copyMatchingItemsWithDatabase:a3];
    }
    else
    {
      id v24 = 0;
    }
    uint64_t v25 = (id)CADPredicateSignpostsHandle;
    uint64_t v26 = v25;
    os_signpost_id_t spid = v18;
    id v40 = v15;
    if (v21 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v28 = (id)CADPredicateSignpostsHandle;
    }
    else
    {
      if (os_signpost_enabled(v25))
      {
        uint64_t v27 = (void *)[v24 count];
        *(_DWORD *)buf = 134217984;
        id v48 = v27;
        _os_signpost_emit_with_name_impl(&dword_1BBC88000, v26, OS_SIGNPOST_INTERVAL_END, v18, "PredicateFetch", "results.count = %lu", buf, 0xCu);
      }

      v28 = (id)CADPredicateSignpostsHandle;
      if (os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBC88000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v18, "WrapResults", (const char *)&unk_1BBD072D6, buf, 2u);
      }
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v29 = v24;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          long long v35 = (void *)MEMORY[0x1C1867850]();
          if ([v17 isCancelled])
          {
            goto LABEL_28;
          }
          if (([a1 isJunkEvent:v34] & 1) == 0) {
            id v36 = (id)[v16 addEntity:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    long long v37 = (id)CADPredicateSignpostsHandle;
    long long v38 = v37;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC88000, v38, OS_SIGNPOST_INTERVAL_END, spid, "WrapResults", (const char *)&unk_1BBD072D6, buf, 2u);
    }

    id v15 = v40;
  }
}

+ (BOOL)isJunkEvent:(void *)a3
{
  uint64_t Event = (uint64_t)a3;
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 == CalEventOccurrenceGetTypeID()) {
    uint64_t Event = CalEventOccurrenceGetEvent();
  }
  return Event && CalEventGetJunkStatus() == 1;
}

- (_CADFetchCalendarItemsWithPredicateOperation)initWithPredicate:(id)a3 entityType:(int)a4 connection:(id)a5 fetchIdentifier:(int)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_CADFetchCalendarItemsWithPredicateOperation;
  id v16 = [(_CADFetchCalendarItemsWithPredicateOperation *)&v21 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_predicate, a3);
    v17->_entityType = a4;
    objc_storeStrong((id *)&v17->_connection, a5);
    v17->_fetchIdentifier = a6;
    uint64_t v18 = MEMORY[0x1C1867AB0](v15);
    id completion = v17->_completion;
    v17->_id completion = (id)v18;
  }
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)_CADFetchCalendarItemsWithPredicateOperation;
  [(_CADFetchCalendarItemsWithPredicateOperation *)&v3 cancel];
  (*((void (**)(void))self->_completion + 2))();
}

- (int)fetchIdentifier
{
  return self->_fetchIdentifier;
}

@end