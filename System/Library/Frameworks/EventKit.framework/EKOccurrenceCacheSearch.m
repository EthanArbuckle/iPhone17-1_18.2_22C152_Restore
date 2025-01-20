@interface EKOccurrenceCacheSearch
+ (id)searchWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6;
- (EKOccurrenceCacheSearch)initWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6;
- (id)searchTerm;
- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6;
- (void)cancel;
- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4;
- (void)run;
@end

@implementation EKOccurrenceCacheSearch

+ (id)searchWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithCalendars:v13 searchTerm:v12 store:v11 callback:v10];

  return v14;
}

- (EKOccurrenceCacheSearch)initWithCalendars:(id)a3 searchTerm:(id)a4 store:(id)a5 callback:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)EKOccurrenceCacheSearch;
  v15 = [(EKOccurrenceCacheSearch *)&v27 init];
  if (v15)
  {
    if (v11)
    {
      if (v12) {
        goto LABEL_4;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v15, @"EKOccurrenceCacheSearch.m", 38, @"Invalid parameter not satisfying: %@", @"calendars != nil" object file lineNumber description];

      if (v12)
      {
LABEL_4:
        if (v13) {
          goto LABEL_5;
        }
        goto LABEL_10;
      }
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, v15, @"EKOccurrenceCacheSearch.m", 39, @"Invalid parameter not satisfying: %@", @"searchTerm != nil" object file lineNumber description];

    if (v13)
    {
LABEL_5:
      if (v14)
      {
LABEL_6:
        uint64_t v16 = [v11 copy];
        calendars = v15->_calendars;
        v15->_calendars = (NSSet *)v16;

        uint64_t v18 = [v12 copy];
        searchTerm = v15->_searchTerm;
        v15->_searchTerm = (NSString *)v18;

        objc_storeStrong((id *)&v15->_store, a5);
        uint64_t v20 = [v14 copy];
        id callback = v15->_callback;
        v15->_id callback = (id)v20;

        goto LABEL_7;
      }
LABEL_11:
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v15, @"EKOccurrenceCacheSearch.m", 41, @"Invalid parameter not satisfying: %@", @"callback != nil" object file lineNumber description];

      goto LABEL_6;
    }
LABEL_10:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, v15, @"EKOccurrenceCacheSearch.m", 40, @"Invalid parameter not satisfying: %@", @"store != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_7:

  return v15;
}

- (int)performSearchOperation:(unsigned int)a3 inCalendars:(id)a4 withEventStore:(id)a5 andSearchTerm:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 1007;
  id v12 = [v10 connection];
  id v13 = [v12 CADOperationProxySync];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__EKOccurrenceCacheSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke;
  v15[3] = &unk_1E5B96D00;
  v15[4] = &v16;
  [v13 CADOccurrenceCacheSearchWithTerm:v11 inCalendars:v9 responseToken:v8 reply:v15];

  LODWORD(v8) = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);

  return v8;
}

uint64_t __91__EKOccurrenceCacheSearch_performSearchOperation_inCalendars_withEventStore_andSearchTerm___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)run
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  v4 = a1;
  v5 = [v3 errorWithCADResult:a2];
  int v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_ERROR, "Call to calendar daemon failed: %@", (uint8_t *)&v6, 0xCu);
}

- (void)cancel
{
  self->_canceled = 1;
  if (self->_replyID)
  {
    id v4 = [(EKEventStore *)self->_store connection];
    v3 = [v4 CADOperationProxy];
    objc_msgSend(v3, "CADOccurrenceCacheCancelSearchWithReplyID:", -[NSNumber unsignedIntValue](self->_replyID, "unsignedIntValue"));
  }
}

- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 count];
  uint64_t v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    searchTerm = self->_searchTerm;
    id v10 = NSNumber;
    id v11 = v8;
    id v12 = [v10 numberWithUnsignedInteger:v7];
    id v13 = [NSNumber numberWithBool:v4];
    replyID = self->_replyID;
    *(_DWORD *)buf = 138413058;
    v35 = searchTerm;
    __int16 v36 = 2114;
    v37 = v12;
    __int16 v38 = 2114;
    v39 = v13;
    __int16 v40 = 2114;
    v41 = replyID;
    _os_log_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEFAULT, "Received batch results from server for search term = %@, results = %{public}@/2, finished = %{public}@, reply ID = %{public}@", buf, 0x2Au);
  }
  v26 = self;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7 >> 1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v19)
        {
          v31[0] = @"occurrenceDate";
          v31[1] = @"objectID";
          v32[0] = v22;
          id v23 = v22;
          v24 = +[EKObjectID objectIDWithCADObjectID:v19];
          v32[1] = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

          [v15 addObject:v25];
          id v19 = 0;
        }
        else
        {
          id v19 = v22;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }

  (*((void (**)(void))v26->_callback + 2))();
}

- (id)searchTerm
{
  v2 = (void *)[(NSString *)self->_searchTerm copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyID, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);

  objc_storeStrong((id *)&self->_calendars, 0);
}

@end