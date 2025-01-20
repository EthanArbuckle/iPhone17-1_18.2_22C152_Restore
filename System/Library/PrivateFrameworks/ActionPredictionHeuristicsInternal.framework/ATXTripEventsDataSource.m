@interface ATXTripEventsDataSource
- (ATXTripEventsDataSource)initWithDevice:(id)a3;
- (id)fetchTripEventsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5;
@end

@implementation ATXTripEventsDataSource

- (ATXTripEventsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXTripEventsDataSource;
  v6 = [(ATXTripEventsDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_opt_new();
    eventStore = v7->_eventStore;
    v7->_eventStore = (PPEventStore *)v8;
  }
  return v7;
}

- (id)fetchTripEventsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727290))
  {
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = (id)objc_opt_new();
    id v10 = objc_alloc_init(MEMORY[0x1E4F89FB8]);
    [v10 setFromDate:v8];
    [v10 setToDate:v9];
    [v10 setTripOptions:0];
    eventStore = self->_eventStore;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke;
    v20[3] = &unk_1E68A4DB8;
    v20[4] = buf;
    id v21 = 0;
    [(PPEventStore *)eventStore iterScoredEventsWithQuery:v10 error:&v21 block:v20];
    id v12 = v21;
    if (v12)
    {
      v13 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v28 = 138412802;
        uint64_t v29 = (uint64_t)v12;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        id v33 = v9;
        _os_log_error_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_ERROR, "Error when fetching trip events from PersonalPortrait: %@ from %{public}@ to %{public}@", v28, 0x20u);
      }

      id v14 = 0;
      if (a5) {
        *a5 = v12;
      }
    }
    else
    {
      v16 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [*((id *)v23 + 5) count];
        uint64_t v18 = *((void *)v23 + 5);
        *(_DWORD *)v28 = 134218754;
        uint64_t v29 = v17;
        __int16 v30 = 2114;
        id v31 = v8;
        __int16 v32 = 2114;
        id v33 = v9;
        __int16 v34 = 2112;
        uint64_t v35 = v18;
        _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "Got %tu trip events from PersonalPortrait from %{public}@ to %{public}@: %@", v28, 0x2Au);
      }

      id v14 = *((id *)v23 + 5);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v15 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "Calendar is not learnable for trip event fetching", buf, 2u);
    }

    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  else
  {
    v4 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v62 = 0;
  objc_super v11 = [(ATXTripEventsDataSource *)self fetchTripEventsFromStartDate:v8 endDate:v9 error:&v62];
  id v12 = v62;
  if (v11 && [v11 count])
  {
    id v49 = v12;
    id v52 = v8;
    id v53 = v10;
    id v51 = v9;
    v13 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v50 = v11;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v59 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v20 = [v19 startDate];
          id v21 = [MEMORY[0x1E4F1C9C8] now];
          uint64_t v22 = [v20 compare:v21];

          if (v22 == 1) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v16);
    }

    v23 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v13 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v70 = v24;
      _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "Got %tu trip events after discarding old trips.", buf, 0xCu);
    }

    v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v68 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    id v27 = [v13 sortedArrayUsingDescriptors:v26];

    if ([v27 count])
    {
      v48 = v27;
      v28 = [v27 objectAtIndexedSubscript:0];
      uint64_t v29 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v70 = (uint64_t)v28;
        _os_log_impl(&dword_1D0F43000, v29, OS_LOG_TYPE_DEFAULT, "Considering first trip: %@", buf, 0xCu);
      }

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      __int16 v30 = [v28 tripParts];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        id v33 = 0;
        uint64_t v34 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v55 != v34) {
              objc_enumerationMutation(v30);
            }
            uint64_t v36 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            if ([v36 tripMode] == 2)
            {
              uint64_t v37 = [v36 mainLocation];

              id v33 = (void *)v37;
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v67 count:16];
        }
        while (v32);

        id v27 = v48;
        if (v33)
        {
          v38 = [v33 name];
          if (v38)
          {

            id v9 = v51;
            id v8 = v52;
            id v10 = v53;
          }
          else
          {
            v41 = [v33 locality];

            id v9 = v51;
            id v8 = v52;
            id v10 = v53;
            if (!v41)
            {
              v63 = @"location";
              v64 = v33;
              v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
              (*((void (**)(id, void *, void))v53 + 2))(v53, v47, 0);

              id v12 = v49;
              objc_super v11 = v50;
LABEL_43:

              goto LABEL_44;
            }
          }
          v42 = v25;
          v65[0] = @"location";
          v65[1] = @"locality";
          v66[0] = v33;
          [v33 locality];
          v44 = v43 = (void (**)(id, void *, void))v10;
          v45 = v44;
          if (!v44)
          {
            v45 = [v33 name];
          }
          v66[1] = v45;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
          v43[2](v43, v46, 0);

          if (!v44) {
          id v10 = v53;
          }
          id v12 = v49;
          objc_super v11 = v50;
          v25 = v42;
          id v27 = v48;
          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    v40 = __atxlog_handle_heuristic();
    id v9 = v51;
    id v8 = v52;
    id v12 = v49;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v40, OS_LOG_TYPE_DEFAULT, "No selected placemark for trips", buf, 2u);
    }

    id v10 = v53;
    (*((void (**)(id, void, void))v53 + 2))(v53, 0, 0);
    id v33 = 0;
    objc_super v11 = v50;
    goto LABEL_43;
  }
  if (v12) {
    id v39 = v12;
  }
  else {
    id v39 = 0;
  }
  (*((void (**)(id, void, id))v10 + 2))(v10, 0, v39);
LABEL_44:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_FAULT, "Expect trip event for trip query but got %{public}@", (uint8_t *)&v5, 0xCu);
}

@end