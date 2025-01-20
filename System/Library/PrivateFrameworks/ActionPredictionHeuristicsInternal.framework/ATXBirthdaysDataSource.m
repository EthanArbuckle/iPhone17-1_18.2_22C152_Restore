@interface ATXBirthdaysDataSource
- (ATXBirthdaysDataSource)initWithDevice:(id)a3;
- (void)birthdaysWithCallback:(id)a3;
@end

@implementation ATXBirthdaysDataSource

- (void)birthdaysWithCallback:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27272A8))
  {
    id v39 = v4;
    context = (void *)MEMORY[0x1D25F43D0]();
    uint64_t v5 = [(ATXHeuristicDevice *)self->_device now];
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v37 = (void *)v5;
    uint64_t v7 = [v6 startOfDayForDate:v5];

    v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v42 = (void *)v7;
    v41 = [v8 dateByAddingUnit:16 value:1 toDate:v7 options:0];

    v44 = self;
    v9 = [(ATXHeuristicDevice *)self->_device eventStore];
    v10 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v40 = v9;
    v11 = [v9 sources];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v17 = [v16 calendarsForEntityType:0];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v51;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v51 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                if ([v22 type] == 4) {
                  [v10 addObject:v22];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }
            while (v19);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      uint64_t v23 = [v40 predicateForEventsWithStartDate:v42 endDate:v41 calendars:v10];
      v43 = objc_opt_new();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v36 = (void *)v23;
      obuint64_t j = [v40 eventsMatchingPredicate:v23];
      uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      v25 = v44;
      if (v24)
      {
        uint64_t v26 = v24;
        uint64_t v27 = *(void *)v47;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v47 != v27) {
              objc_enumerationMutation(obj);
            }
            v29 = [(ATXHeuristicDevice *)v25->_device dictForEvent:*(void *)(*((void *)&v46 + 1) + 8 * k)];
            v30 = v29;
            if (v29)
            {
              uint64_t v31 = [v29 objectForKeyedSubscript:@"birthdayContact"];
              if (v31)
              {
                v32 = (void *)v31;
                v33 = [v30 objectForKeyedSubscript:@"birthdayContact"];
                v34 = [v33 objectForKeyedSubscript:@"isMeContact"];
                char v35 = [v34 BOOLValue];

                v25 = v44;
                if ((v35 & 1) == 0) {
                  [v43 addObject:v30];
                }
              }
            }
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
        }
        while (v26);
      }

      id v4 = v39;
      (*((void (**)(id, void *, void))v39 + 2))(v39, v43, 0);
    }
    else
    {
      id v4 = v39;
      (*((void (**)(id, void, void))v39 + 2))(v39, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (ATXBirthdaysDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBirthdaysDataSource;
  v6 = [(ATXBirthdaysDataSource *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end