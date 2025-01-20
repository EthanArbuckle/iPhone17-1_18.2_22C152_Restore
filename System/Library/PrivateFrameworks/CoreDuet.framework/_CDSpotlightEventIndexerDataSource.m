@interface _CDSpotlightEventIndexerDataSource
+ (unint64_t)currentVersion;
- (_CDSpotlightEventIndexerDataSource)initWithKnowledgeStore:(id)a3 eventStream:(id)a4;
- (_DKEventStream)stream;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3;
- (id)bundleIDToSearchableItemsDictionaryWithCreationDateInInterval:(id)a3 limit:(int64_t)a4 nextBatch:(BOOL *)a5 latestCreationDate:(id *)a6 error:(id *)a7;
- (id)earliestEventCreationDateWithError:(id *)a3;
- (id)searchableItemIdentifiersForTombstonedEventsInInterval:(id)a3 latestTombstoneDate:(id *)a4 error:(id *)a5;
- (id)searchableItemUniqueIdentifierWithDomain:(id)a3 indexingIdentifier:(id)a4;
@end

@implementation _CDSpotlightEventIndexerDataSource

+ (unint64_t)currentVersion
{
  return 0;
}

- (_CDSpotlightEventIndexerDataSource)initWithKnowledgeStore:(id)a3 eventStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDSpotlightEventIndexerDataSource;
  v9 = [(_CDSpotlightEventIndexerDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knowledgeStore, a3);
    objc_storeStrong((id *)&v10->_stream, a4);
  }

  return v10;
}

- (id)earliestEventCreationDateWithError:(id *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F29008];
  v6 = NSStringFromSelector(sel_creationDate);
  id v7 = [v5 sortDescriptorWithKey:v6 ascending:1];

  id v8 = [(_CDSpotlightEventIndexerDataSource *)self stream];
  v25[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v24 = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v11 = +[_DKEventQuery eventQueryWithPredicate:0 eventStreams:v9 offset:0 limit:1 sortDescriptors:v10];

  objc_super v12 = [NSString stringWithUTF8String:"_CDSpotlightEventIndexerDataSource.m"];
  v13 = objc_msgSend(v12, "stringByAppendingFormat:", @":%d", 51);
  [v11 setClientName:v13];

  [v11 setTracker:&__block_literal_global_23];
  [v11 setReadMetadata:0];
  v14 = [(_CDSpotlightEventIndexerDataSource *)self knowledgeStore];
  id v23 = 0;
  v15 = [v14 executeQuery:v11 error:&v23];
  id v16 = v23;

  if (a3) {
    *a3 = v16;
  }
  if (v15)
  {
    v17 = [v15 firstObject];
    v18 = [v17 creationDate];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)searchableItemUniqueIdentifierWithDomain:(id)a3 indexingIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
LABEL_6:
    id v8 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = [v5 length];
  id v8 = 0;
  if (v6 && v7)
  {
    if ([v6 length])
    {
      id v8 = [NSString stringWithFormat:@"com.apple.coreduet.%@.%@", v5, v6];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (id)searchableItemIdentifiersForTombstonedEventsInInterval:(id)a3 latestTombstoneDate:(id *)a4 error:(id *)a5
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[_DKTombstoneMetadataKey eventStreamName];
  v9 = [(_CDSpotlightEventIndexerDataSource *)self stream];
  v10 = [v9 name];
  uint64_t v11 = +[_DKQuery predicateForObjectsWithMetadataKey:v8 andStringValue:v10];

  objc_super v12 = [v7 startDate];
  v43 = v7;
  v13 = [v7 endDate];
  v14 = +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:v12 to:v13];

  v42 = (void *)v11;
  v52[0] = v11;
  v52[1] = v14;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28BA0], "andPredicateWithSubpredicates:");
  id v16 = (void *)MEMORY[0x1E4F29008];
  v17 = NSStringFromSelector(sel_creationDate);
  v18 = [v16 sortDescriptorWithKey:v17 ascending:1];

  v19 = +[_DKSystemEventStreams tombstoneStream];
  v51 = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v50 = v18;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v40 = (void *)v15;
  v22 = +[_DKEventQuery eventQueryWithPredicate:v15 eventStreams:v20 offset:0 limit:0 sortDescriptors:v21];

  id v23 = [NSString stringWithUTF8String:"_CDSpotlightEventIndexerDataSource.m"];
  v24 = objc_msgSend(v23, "stringByAppendingFormat:", @":%d", 96);
  [v22 setClientName:v24];

  [v22 setTracker:&__block_literal_global_17];
  [v22 setReadMetadata:0];
  v25 = [(_CDSpotlightEventIndexerDataSource *)self knowledgeStore];
  id v48 = 0;
  v26 = [v25 executeQuery:v22 error:&v48];
  id v27 = v48;

  if (a5) {
    *a5 = v27;
  }
  if (v26)
  {
    v38 = v14;
    v28 = [v26 lastObject];
    *a4 = [v28 creationDate];

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v30 = v26;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v44 + 1) + 8 * i) stringValue];
          if (v35) {
            [v29 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v32);
    }

    v36 = (void *)[v29 copy];
    v14 = v38;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)bundleIDToSearchableItemsDictionaryWithCreationDateInInterval:(id)a3 limit:(int64_t)a4 nextBatch:(BOOL *)a5 latestCreationDate:(id *)a6 error:(id *)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  objc_super v12 = [v11 startDate];
  v13 = [v11 endDate];

  v14 = +[_DKQuery predicateForEventsWithCreationInDateRangeFromAfter:v12 to:v13];

  uint64_t v15 = (void *)MEMORY[0x1E4F29008];
  id v16 = NSStringFromSelector(sel_creationDate);
  v17 = [v15 sortDescriptorWithKey:v16 ascending:1];

  v18 = [(_CDSpotlightEventIndexerDataSource *)self stream];
  v33[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v32 = v17;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v21 = +[_DKEventQuery eventQueryWithPredicate:v14 eventStreams:v19 offset:0 limit:a4 sortDescriptors:v20];

  v22 = [NSString stringWithUTF8String:"_CDSpotlightEventIndexerDataSource.m"];
  id v23 = objc_msgSend(v22, "stringByAppendingFormat:", @":%d", 131);
  [v21 setClientName:v23];

  [v21 setTracker:&__block_literal_global_20_0];
  v24 = [(_CDSpotlightEventIndexerDataSource *)self knowledgeStore];
  id v31 = 0;
  v25 = [v24 executeQuery:v21 error:&v31];
  id v26 = v31;

  if (a7) {
    *a7 = v26;
  }
  if (v25)
  {
    id v27 = [v25 lastObject];
    *a6 = [v27 creationDate];

    *a5 = [v25 count] == a4;
    v28 = [(_CDSpotlightEventIndexerDataSource *)self bundleIDToSearchableItemsDictionaryFromEvents:v25];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v4 raise:v5, @"%@ is an abstract class, subclasses must override %@", v6, v7 format];

  return 0;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end