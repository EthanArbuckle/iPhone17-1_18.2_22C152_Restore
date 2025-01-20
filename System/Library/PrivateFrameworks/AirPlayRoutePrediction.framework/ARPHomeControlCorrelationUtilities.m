@interface ARPHomeControlCorrelationUtilities
- (ARPHomeControlCorrelationUtilities)initWithKnowledgeStore:(id)a3;
- (BOOL)writeArchive:(id)a3 toFilePath:(id)a4;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)firstHomeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4;
- (id)homeKitAccessoriesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5;
- (id)homeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4;
- (id)homeKitScenesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5;
@end

@implementation ARPHomeControlCorrelationUtilities

- (ARPHomeControlCorrelationUtilities)initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARPHomeControlCorrelationUtilities;
  v6 = [(ARPHomeControlCorrelationUtilities *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
  }

  return v7;
}

- (BOOL)writeArchive:(id)a3 toFilePath:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    id v25 = 0;
    v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v25];
    objc_super v9 = v25;
    if (v9)
    {
      v10 = v9;
      BOOL v11 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = [v7 stringByDeletingLastPathComponent];
    v13 = [MEMORY[0x263F08850] defaultManager];
    id v24 = 0;
    [v13 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v24];
    v10 = v24;

    if (!v10)
    {
      id v23 = 0;
      [v8 writeToFile:v7 options:1 error:&v23];
      v10 = v23;
      v14 = ARPLog();
      v15 = v14;
      if (!v10)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_impl(&dword_20BE41000, v15, OS_LOG_TYPE_DEFAULT, "Successfully persisted correlations dictionary produced when correlating Home Controls and MicroLocations: %@", buf, 0xCu);
        }

        notify_post((const char *)[@"com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery" UTF8String]);
        v10 = 0;
        BOOL v11 = 1;
        goto LABEL_14;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ARPHomeControlCorrelationUtilities writeArchive:toFilePath:]((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    BOOL v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v10 = ARPLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ARPHomeControlCorrelationUtilities writeArchive:toFilePath:](v10);
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (id)firstHomeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(ARPHomeControlCorrelationUtilities *)self homeKitAccessoriesWithPredicate:v6 sortStartDateAscending:v4 limit:1];
  v8 = [(ARPHomeControlCorrelationUtilities *)self homeKitScenesWithPredicate:v6 sortStartDateAscending:v4 limit:1];

  objc_super v9 = [v7 arrayByAddingObjectsFromArray:v8];
  v10 = v9;
  if (v4) {
    BOOL v11 = &__block_literal_global;
  }
  else {
    BOOL v11 = &__block_literal_global_4;
  }
  v12 = [v9 sortedArrayUsingComparator:v11];
  v13 = [v12 firstObject];

  return v13;
}

uint64_t __93__ARPHomeControlCorrelationUtilities_firstHomeKitEventsWithPredicate_sortStartDateAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __93__ARPHomeControlCorrelationUtilities_firstHomeKitEventsWithPredicate_sortStartDateAscending___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 startDate];
  uint64_t v7 = [v5 startDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 0.0)
  {
    BOOL v11 = [v4 startDate];
    v12 = [v5 startDate];
    [v11 timeIntervalSinceDate:v12];
    uint64_t v10 = v13 < 0.0;
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (id)homeKitEventsWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(ARPHomeControlCorrelationUtilities *)self homeKitAccessoriesWithPredicate:v6 sortStartDateAscending:v4 limit:3000];
  double v8 = [(ARPHomeControlCorrelationUtilities *)self homeKitScenesWithPredicate:v6 sortStartDateAscending:v4 limit:2000];

  double v9 = [v7 arrayByAddingObjectsFromArray:v8];
  uint64_t v10 = v9;
  if (v4) {
    BOOL v11 = &__block_literal_global_6;
  }
  else {
    BOOL v11 = &__block_literal_global_8;
  }
  v12 = [v9 sortedArrayUsingComparator:v11];

  return v12;
}

uint64_t __88__ARPHomeControlCorrelationUtilities_homeKitEventsWithPredicate_sortStartDateAscending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __88__ARPHomeControlCorrelationUtilities_homeKitEventsWithPredicate_sortStartDateAscending___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 startDate];
  uint64_t v7 = [v5 startDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 0.0)
  {
    BOOL v11 = [v4 startDate];
    v12 = [v5 startDate];
    [v11 timeIntervalSinceDate:v12];
    uint64_t v10 = v13 < 0.0;
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (id)homeKitAccessoriesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5
{
  BOOL v6 = a4;
  v38[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = [MEMORY[0x263F35148] homeKitAccessoryControlStream];
  v38[0] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];

  BOOL v11 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:v6];
  v37 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];

  double v13 = (void *)MEMORY[0x263F35110];
  v14 = [MEMORY[0x263F350C8] eligibleForSuggestions];
  v15 = [v13 predicateForObjectsWithMetadataKey:v14 andValue:&unk_26C0FF710];

  uint64_t v16 = (void *)MEMORY[0x263F35090];
  uint64_t v17 = (void *)MEMORY[0x263F08730];
  v36[0] = v8;
  v36[1] = v15;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  uint64_t v19 = [v17 andPredicateWithSubpredicates:v18];
  uint64_t v20 = [v16 eventQueryWithPredicate:v19 eventStreams:v10 offset:0 limit:a5 sortDescriptors:v12];

  uint64_t v21 = [NSString stringWithUTF8String:"ARPHomeControlCorrelationUtilities.m"];
  v22 = objc_msgSend(v21, "stringByAppendingFormat:", @":%d", 129);
  [v20 setClientName:v22];

  [v20 setTracker:&__block_literal_global_23];
  [v20 setExecuteConcurrently:1];
  id v23 = [(ARPHomeControlCorrelationUtilities *)self knowledgeStore];
  id v35 = 0;
  id v24 = [v23 executeQuery:v20 error:&v35];
  id v25 = v35;

  if (v25)
  {
    v26 = ARPLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ARPHomeControlCorrelationUtilities homeKitAccessoriesWithPredicate:sortStartDateAscending:limit:]((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
    }

    id v33 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v33 = v24;
  }

  return v33;
}

uint64_t __99__ARPHomeControlCorrelationUtilities_homeKitAccessoriesWithPredicate_sortStartDateAscending_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)homeKitScenesWithPredicate:(id)a3 sortStartDateAscending:(BOOL)a4 limit:(int64_t)a5
{
  BOOL v6 = a4;
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = (void *)MEMORY[0x263F35148];
  id v9 = a3;
  uint64_t v10 = [v8 homeKitSceneStream];
  v31[0] = v10;
  BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];

  v12 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:v6];
  uint64_t v30 = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];

  v14 = [MEMORY[0x263F35090] eventQueryWithPredicate:v9 eventStreams:v11 offset:0 limit:a5 sortDescriptors:v13];

  v15 = [NSString stringWithUTF8String:"ARPHomeControlCorrelationUtilities.m"];
  uint64_t v16 = objc_msgSend(v15, "stringByAppendingFormat:", @":%d", 151);
  [v14 setClientName:v16];

  [v14 setTracker:&__block_literal_global_25];
  [v14 setExecuteConcurrently:1];
  uint64_t v17 = [(ARPHomeControlCorrelationUtilities *)self knowledgeStore];
  id v29 = 0;
  uint64_t v18 = [v17 executeQuery:v14 error:&v29];
  id v19 = v29;

  if (v19)
  {
    uint64_t v20 = ARPLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ARPHomeControlCorrelationUtilities homeKitScenesWithPredicate:sortStartDateAscending:limit:]((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }

    id v27 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v27 = v18;
  }

  return v27;
}

uint64_t __94__ARPHomeControlCorrelationUtilities_homeKitScenesWithPredicate_sortStartDateAscending_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void).cxx_destruct
{
}

- (void)writeArchive:(os_log_t)log toFilePath:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE41000, log, OS_LOG_TYPE_ERROR, "Empty archive or filePath when trying to persist Home Controls MicroLocation Correlation", v1, 2u);
}

- (void)writeArchive:(uint64_t)a3 toFilePath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)homeKitAccessoriesWithPredicate:(uint64_t)a3 sortStartDateAscending:(uint64_t)a4 limit:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)homeKitScenesWithPredicate:(uint64_t)a3 sortStartDateAscending:(uint64_t)a4 limit:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end