@interface CLSPublicEventCache
+ (id)defaultCacheName;
- (BOOL)hasTimeLocationTuple:(id)a3;
- (BOOL)insertBatchesOfPublicEventsByTimeLocationIdentifier:(id)a3 forTimeLocationTuples:(id)a4;
- (id)dataModelName;
- (id)predicateForTimeLocationTuple:(id)a3;
- (id)publicEventFromManagedObject:(id)a3;
- (id)publicEventsForMuid:(unint64_t)a3;
- (id)publicEventsForTimeLocationTuple:(id)a3;
- (unint64_t)numberOftimeLocationTuplesForTimeLocationTuple:(id)a3;
- (void)_updateManagedEvent:(id)a3 withEvent:(id)a4 inContext:(id)a5;
- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3;
@end

@implementation CLSPublicEventCache

+ (id)defaultCacheName
{
  return @"CLSPublicEventCache";
}

- (unint64_t)numberOftimeLocationTuplesForTimeLocationTuple:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__CLSPublicEventCache_numberOftimeLocationTuplesForTimeLocationTuple___block_invoke;
  v10[3] = &unk_1E6910548;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  v13 = &v14;
  id v7 = v5;
  id v12 = v7;
  [v7 performBlockAndWait:v10];
  unint64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __70__CLSPublicEventCache_numberOftimeLocationTuplesForTimeLocationTuple___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[CLSManagedQueryLocation entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [*(id *)(a1 + 32) predicateForTimeLocationTuple:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v9 = 0;
  uint64_t v7 = [v6 countForFetchRequest:v4 error:&v9];
  id v8 = v9;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
}

- (BOOL)hasTimeLocationTuple:(id)a3
{
  return [(CLSPublicEventCache *)self numberOftimeLocationTuplesForTimeLocationTuple:a3] != 0;
}

- (id)publicEventFromManagedObject:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 performers];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v11 = [CLSPublicEventPerformer alloc];
        id v12 = [v10 localizedName];
        v13 = [v10 iTunesIdentifier];
        uint64_t v14 = [(CLSPublicEventPerformer *)v11 initWithLocalizedName:v12 iTunesIdentifier:v13];

        [v5 addObject:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v7);
  }
  v42 = v5;

  v43 = v3;
  v15 = [v3 categories];
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v23 = [CLSPublicEventCategory alloc];
        v24 = [v22 category];
        v25 = [(CLSPublicEventCategory *)v23 initWithCategory:v24];

        v26 = [v22 localizedName];
        [(CLSPublicEventCategory *)v25 setLocalizedName:v26];

        v27 = [v22 localizedSubcategories];
        v28 = v27;
        if (v27)
        {
          v29 = [v27 componentsSeparatedByString:@"_#_"];
        }
        else
        {
          v29 = 0;
        }
        [(CLSPublicEventCategory *)v25 setLocalizedSubcategories:v29];

        [v16 addObject:v25];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v19);
  }

  v30 = objc_alloc_init(CLSPublicEvent);
  -[CLSPublicEvent setMuid:](v30, "setMuid:", [v43 muid]);
  v31 = [v43 name];
  [(CLSPublicEvent *)v30 setName:v31];

  id v32 = objc_alloc(MEMORY[0x1E4F28C18]);
  v33 = [v43 localStartDate];
  v34 = [v43 localEndDate];
  v35 = (void *)[v32 initWithStartDate:v33 endDate:v34];
  [(CLSPublicEvent *)v30 setLocalDateInterval:v35];

  [v43 localStartTime];
  -[CLSPublicEvent setLocalStartTime:](v30, "setLocalStartTime:");
  [v43 localEndTime];
  -[CLSPublicEvent setLocalEndTime:](v30, "setLocalEndTime:");
  v36 = [v43 timeZone];
  [(CLSPublicEvent *)v30 setTimeZone:v36];

  [(CLSPublicEvent *)v30 setCategories:v16];
  [(CLSPublicEvent *)v30 setPerformers:v42];
  -[CLSPublicEvent setExpectedAttendance:](v30, "setExpectedAttendance:", [v43 expectedAttendance]);
  -[CLSPublicEvent setBusinessItemMuid:](v30, "setBusinessItemMuid:", [v43 businessItemMuid]);
  [v43 businessItemLatitude];
  CLLocationDegrees v38 = v37;
  [v43 businessItemLongitude];
  CLLocationCoordinate2D v40 = CLLocationCoordinate2DMake(v38, v39);
  -[CLSPublicEvent setBusinessItemCoordinates:](v30, "setBusinessItemCoordinates:", v40.latitude, v40.longitude);

  return v30;
}

- (id)publicEventsForTimeLocationTuple:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7441;
  uint64_t v18 = __Block_byref_object_dispose__7442;
  id v19 = 0;
  v5 = [(CLSDBCache *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__CLSPublicEventCache_publicEventsForTimeLocationTuple___block_invoke;
  v10[3] = &unk_1E6910548;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  v13 = &v14;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __56__CLSPublicEventCache_publicEventsForTimeLocationTuple___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedQueryLocation entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [*(id *)(a1 + 32) predicateForTimeLocationTuple:*(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 48);
  id v35 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v35];
  id v8 = v35;
  if (v7 && [v7 count])
  {
    id v24 = v8;
    v26 = v4;
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v25 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v18 = [v17 publicEvents];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v28;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(a1 + 32) publicEventFromManagedObject:*(void *)(*((void *)&v27 + 1) + 8 * v22)];
                [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v23];

                ++v22;
              }
              while (v20 != v22);
              uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v14);
    }

    id v7 = v25;
    id v4 = v26;
    id v8 = v24;
  }
}

- (id)publicEventsForMuid:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [(CLSDBCache *)self managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CLSPublicEventCache_publicEventsForMuid___block_invoke;
  v12[3] = &unk_1E6910520;
  unint64_t v16 = a3;
  id v13 = v6;
  uint64_t v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  [v8 performBlockAndWait:v12];
  uint64_t v9 = v15;
  id v10 = v7;

  return v10;
}

void __43__CLSPublicEventCache_publicEventsForMuid___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[CLSManagedPublicEvent entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"muid == %lu", *(void *)(a1 + 56));
  [v4 setPredicate:v5];

  id v6 = *(void **)(a1 + 32);
  id v22 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v22];
  id v8 = v22;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(a1 + 40) publicEventFromManagedObject:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
        [*(id *)(a1 + 48) addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v11);
  }

  if (![v9 count])
  {
    id v15 = +[CLSLogging sharedLogging];
    unint64_t v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v17;
      _os_log_error_impl(&dword_1D2150000, v16, OS_LOG_TYPE_ERROR, "Didn't find event for muid %lu", buf, 0xCu);
    }
  }
}

- (void)_updateManagedEvent:(id)a3 withEvent:(id)a4 inContext:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend(v7, "setMuid:", objc_msgSend(v8, "muid"));
  uint64_t v10 = [v8 name];
  [v7 setName:v10];

  uint64_t v11 = [v8 localDateInterval];
  uint64_t v12 = [v11 startDate];
  [v7 setLocalStartDate:v12];

  v57 = v11;
  uint64_t v13 = [v11 endDate];
  [v7 setLocalEndDate:v13];

  [v8 localStartTime];
  objc_msgSend(v7, "setLocalStartTime:");
  [v8 localEndTime];
  objc_msgSend(v7, "setLocalEndTime:");
  uint64_t v14 = [v8 timeZone];
  objc_msgSend(v7, "setTimeZoneOffset:", objc_msgSend(v14, "secondsFromGMT"));

  objc_msgSend(v7, "setExpectedAttendance:", objc_msgSend(v8, "expectedAttendance"));
  objc_msgSend(v7, "setBusinessItemMuid:", objc_msgSend(v8, "businessItemMuid"));
  [v8 businessItemCoordinates];
  objc_msgSend(v7, "setBusinessItemLatitude:");
  v59 = v8;
  [v8 businessItemCoordinates];
  [v7 setBusinessItemLongitude:v15];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v58 = v7;
  unint64_t v16 = [v7 categories];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v73 != v19) {
          objc_enumerationMutation(v16);
        }
        [v9 deleteObject:*(void *)(*((void *)&v72 + 1) + 8 * i)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v18);
  }

  long long v21 = [v59 categories];
  uint64_t v22 = [v21 count];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v22];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v24 = v21;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v69 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        long long v30 = (void *)MEMORY[0x1E4F1C0A8];
        long long v31 = +[CLSManagedPublicEventCategory entityName];
        long long v32 = [v30 insertNewObjectForEntityForName:v31 inManagedObjectContext:v9];

        long long v33 = [v29 category];
        [v32 setCategory:v33];

        long long v34 = [v29 localizedName];
        [v32 setLocalizedName:v34];

        id v35 = [v29 localizedSubcategories];
        if ([v35 count])
        {
          v36 = [v35 componentsJoinedByString:@"_#_"];
        }
        else
        {
          v36 = 0;
        }
        [v32 setLocalizedSubcategories:v36];

        [v23 addObject:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v26);
  }
  v56 = v24;

  [v58 setCategories:v23];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v37 = [v58 performers];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v65 != v40) {
          objc_enumerationMutation(v37);
        }
        [v9 deleteObject:*(void *)(*((void *)&v64 + 1) + 8 * k)];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v39);
  }

  v42 = [v59 performers];
  uint64_t v43 = [v42 count];
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v43];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v45 = v42;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v61;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v61 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = *(void **)(*((void *)&v60 + 1) + 8 * m);
        long long v51 = (void *)MEMORY[0x1E4F1C0A8];
        long long v52 = +[CLSManagedPublicEventPerformer entityName];
        v53 = [v51 insertNewObjectForEntityForName:v52 inManagedObjectContext:v9];

        v54 = [v50 localizedName];
        [v53 setLocalizedName:v54];

        uint64_t v55 = [v50 iTunesIdentifier];
        [v53 setITunesIdentifier:v55];

        [v44 addObject:v53];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v47);
  }

  [v58 setPerformers:v44];
}

- (BOOL)insertBatchesOfPublicEventsByTimeLocationIdentifier:(id)a3 forTimeLocationTuples:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  uint64_t v9 = [v6 count];
  uint64_t v10 = v9;
  if (v6 && v7 && v8 == v9)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v24 = 0;
    uint64_t v11 = [(CLSDBCache *)self managedObjectContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97__CLSPublicEventCache_insertBatchesOfPublicEventsByTimeLocationIdentifier_forTimeLocationTuples___block_invoke;
    v17[3] = &unk_1E69104F8;
    id v18 = v7;
    id v12 = v11;
    id v19 = v12;
    id v20 = v6;
    long long v21 = self;
    uint64_t v22 = buf;
    [v12 performBlockAndWait:v17];
    BOOL v13 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v14 = +[CLSLogging sharedLogging];
    double v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      _os_log_error_impl(&dword_1D2150000, v15, OS_LOG_TYPE_ERROR, "Number of event batches (%lu) does not match number of time location tuples (%lu). Cannot insert batches.", buf, 0x16u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __97__CLSPublicEventCache_insertBatchesOfPublicEventsByTimeLocationIdentifier_forTimeLocationTuples___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v5;
        id v6 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1D2602300]();
        id v7 = (void *)MEMORY[0x1E4F1C0A8];
        uint64_t v8 = +[CLSManagedQueryLocation entityName];
        uint64_t v9 = [v7 insertNewObjectForEntityForName:v8 inManagedObjectContext:*(void *)(a1 + 40)];

        long long v34 = v9;
        [v9 setUpdateTimestamp:v4];
        uint64_t v10 = *(void **)(a1 + 48);
        long long v33 = v6;
        uint64_t v11 = [v6 timeLocationIdentifier];
        id v12 = [v10 objectForKeyedSubscript:v11];

        BOOL v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v12, "count"));
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v38;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v38 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * v18);
              id v20 = (void *)MEMORY[0x1E4F1C0A8];
              long long v21 = +[CLSManagedPublicEvent entityName];
              uint64_t v22 = [v20 insertNewObjectForEntityForName:v21 inManagedObjectContext:*(void *)(a1 + 40)];

              [*(id *)(a1 + 56) _updateManagedEvent:v22 withEvent:v19 inContext:*(void *)(a1 + 40)];
              [v13 addObject:v22];

              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v16);
        }

        [v33 coordinates];
        double v24 = v23;
        double v26 = v25;
        uint64_t v27 = [v33 startDate];
        [v34 setStartDate:v27];

        long long v28 = [v33 endDate];
        [v34 setEndDate:v28];

        [v34 setLatitude:v24];
        [v34 setLongitude:v26];
        [v34 setPublicEvents:v13];

        uint64_t v5 = v36 + 1;
      }
      while (v36 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v32);
  }

  uint64_t result = [*(id *)(a1 + 56) _save];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (id)predicateForTimeLocationTuple:(id)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  double v3 = (objc_class *)MEMORY[0x1E4F1E5A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 coordinates];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  id v12 = objc_msgSend(v5, "initWithCenter:radius:identifier:", v11, v7, v9, 20.0);

  CLSCalculateRangeCoordinateForRegion(v12, (double *)&v21, (double *)&v20, (double *)&v19, (double *)&v18);
  BOOL v13 = (void *)MEMORY[0x1E4F28F60];
  id v14 = [v4 startDate];
  uint64_t v15 = [v4 endDate];

  uint64_t v16 = [v13 predicateWithFormat:@"startDate >= %@ && endDate <= %@ && %f <= latitude && latitude <= %f && %f <= longitude && longitude <= %f", v14, v15, v21, v19, v20, v18];

  return v16;
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  id v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E69104D0;
  double v9 = a3;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performBlockAndWait:v7];
}

void __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  double v3 = +[CLSManagedQueryLocation entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  double v7 = [v5 predicateWithFormat:@"updateTimestamp <= %@", v6];

  [v4 setPredicate:v7];
  id v8 = [*(id *)(a1 + 32) managedObjectContext];
  id v30 = 0;
  double v9 = [v8 executeFetchRequest:v4 error:&v30];
  id v10 = v30;

  if ([v9 count])
  {
    uint64_t v21 = v7;
    uint64_t v22 = v4;
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke_2;
    v29[3] = &unk_1E69104A8;
    v29[4] = *(void *)(a1 + 32);
    double v23 = (void (**)(void, void, void))MEMORY[0x1D2602540](v29);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v20 = v9;
    obuint64_t j = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = (void *)MEMORY[0x1D2602300]();
          uint64_t v19 = [v17 publicEvents];
          if (v19) {
            [v11 unionSet:v19];
          }
          [*(id *)(a1 + 40) deleteObject:v17];
          if ((unint64_t)(v14 + i) >= 0x32) {
            ((void (**)(void, void, void *))v23)[2](v23, *(void *)(a1 + 40), v11);
          }
        }
        v14 += v13;
        uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v13);
    }

    ((void (**)(void, void, void *))v23)[2](v23, *(void *)(a1 + 40), v11);
    double v7 = v21;
    id v4 = v22;
    double v9 = v20;
  }
}

void __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v5 processPendingChanges];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "queryLocations", (void)v15);
        uint64_t v14 = [v13 count];

        if (!v14) {
          [v5 deleteObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v7 removeAllObjects];
  [*(id *)(a1 + 32) _save];
}

- (id)dataModelName
{
  return @"CLSPublicEventCacheModel";
}

@end