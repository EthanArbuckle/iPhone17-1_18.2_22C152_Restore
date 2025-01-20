@interface _DKEventQuery
+ (BOOL)supportsSecureCoding;
+ (id)allDevices;
+ (id)constructFetchRequestPredicateForEventStreams:(id)a3 predicate:(id)a4 deviceIDs:(id)a5;
+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7;
+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8;
+ (id)expressionForEventDuration;
+ (id)onlyLocalDevice;
+ (id)onlyRemoteDevice;
+ (id)predicateForEventsOfMaximumDuration:(double)a3;
+ (id)predicateForEventsOfMinimumDuration:(double)a3;
- (BOOL)deduplicateValues;
- (BOOL)disableBiomeShim;
- (BOOL)readMetadata;
- (BOOL)returnsDistinctResults;
- (NSArray)eventStreams;
- (NSArray)excludedMetadataKeys;
- (NSArray)groupByProperties;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (NSSet)deviceIDs;
- (_DKEventQuery)init;
- (_DKEventQuery)initWithCoder:(id)a3;
- (_DKEventQuery)initWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8;
- (id)constructFetchRequestPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4;
- (id)explicitEventStreamsOrEventStreamsInPredicate;
- (id)handleResults:(id)a3 error:(id)a4;
- (id)resultsHandler;
- (int64_t)resultType;
- (unint64_t)limit;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
- (void)setDeduplicateValues:(BOOL)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setDisableBiomeShim:(BOOL)a3;
- (void)setEventStreams:(id)a3;
- (void)setExcludedMetadataKeys:(id)a3;
- (void)setGroupByProperties:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setReadMetadata:(BOOL)a3;
- (void)setResultType:(int64_t)a3;
- (void)setResultsHandler:(id)a3;
- (void)setReturnsDistinctResults:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation _DKEventQuery

+ (id)constructFetchRequestPredicateForEventStreams:(id)a3 predicate:(id)a4 deviceIDs:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "name", (void)v35);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v13);
  }

  v17 = +[_DKEventQuery allDevices];
  char v18 = [v9 isEqualToSet:v17];

  if ((v18 & 1) == 0)
  {
    v19 = +[_DKEventQuery onlyLocalDevice];
    int v20 = [v9 isEqualToSet:v19];

    if (v20)
    {
      uint64_t v21 = +[_DKQuery predicateForEventsWithNullSourceDeviceID];
    }
    else
    {
      v22 = +[_DKEventQuery onlyRemoteDevice];
      int v23 = [v9 isEqualToSet:v22];

      if (v23)
      {
        v24 = (void *)MEMORY[0x1E4F28BA0];
        v25 = +[_DKQuery predicateForEventsWithNullSourceDeviceID];
        v26 = [v24 notPredicateWithSubpredicate:v25];

        if (v26) {
          goto LABEL_16;
        }
        goto LABEL_19;
      }
      uint64_t v21 = +[_DKQuery predicateForEventsWithSourceDeviceIDs:v9];
    }
    v26 = (void *)v21;
    if (v21)
    {
LABEL_16:
      if (v8)
      {
        v27 = (void *)MEMORY[0x1E4F28BA0];
        v40[0] = v8;
        v40[1] = v26;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        uint64_t v29 = [v27 andPredicateWithSubpredicates:v28];

        id v8 = (id)v29;
      }
      else
      {
        id v8 = v26;
      }
    }
LABEL_19:
  }
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  if (objc_msgSend(v10, "count", (void)v35))
  {
    v30 = (void *)MEMORY[0x1E4F28BA0];
    v31 = +[_DKQuery predicateForEventsWithStreamNames:v10];
    v39[0] = v31;
    v39[1] = v8;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v33 = [v30 andPredicateWithSubpredicates:v32];

    id v8 = (id)v33;
  }

  return v8;
}

+ (id)allDevices
{
  if (allDevices_onceToken != -1) {
    dispatch_once(&allDevices_onceToken, &__block_literal_global_14_1);
  }
  v2 = (void *)allDevices_set;
  return v2;
}

+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) initWithPredicate:v14 eventStreams:v13 offset:a5 limit:a6 sortDescriptors:v12 resultHandler:0];

  return v15;
}

- (_DKEventQuery)initWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8
{
  id v28 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_DKEventQuery;
  char v18 = [(_DKEventQuery *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_predicate, a3);
    v19->_offset = a5;
    v19->_limit = a6;
    objc_storeStrong((id *)&v19->_sortDescriptors, a7);
    objc_storeStrong((id *)&v19->_eventStreams, a4);
    uint64_t v20 = MEMORY[0x192FB31A0](v17);
    id resultsHandler = v19->_resultsHandler;
    v19->_id resultsHandler = (id)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.coreduet.eventquery", v22);
    defaultQueue = v19->_defaultQueue;
    v19->_defaultQueue = (OS_dispatch_queue *)v23;

    v19->_readMetadata = 1;
    *(_WORD *)&v19->_deduplicateValues = 1;
    v19->_disableBiomeShim = 0;
    uint64_t v25 = +[_DKEventQuery onlyLocalDevice];
    deviceIDs = v19->_deviceIDs;
    v19->_deviceIDs = (NSSet *)v25;
  }
  return v19;
}

+ (id)onlyLocalDevice
{
  if (onlyLocalDevice_onceToken != -1) {
    dispatch_once(&onlyLocalDevice_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)onlyLocalDevice_set;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_eventStreams, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DKEventQuery;
  id v4 = a3;
  [(_DKQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventStreams, @"eventStreams", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_predicate forKey:@"predicate"];
  [v4 encodeInt64:self->_offset forKey:@"offset"];
  [v4 encodeInt64:self->_limit forKey:@"limit"];
  [v4 encodeObject:self->_sortDescriptors forKey:@"sortDescriptors"];
  [v4 encodeObject:self->_groupByProperties forKey:@"groupByProperties"];
  [v4 encodeBool:self->_readMetadata forKey:@"readMetadata"];
  [v4 encodeBool:self->_deduplicateValues forKey:@"deduplicateValues"];
  [v4 encodeInteger:self->_resultType forKey:@"resultType"];
  [v4 encodeObject:self->_deviceIDs forKey:@"deviceIDs"];
  [v4 encodeBool:self->_returnsDistinctResults forKey:@"returnsDistinctResults"];
}

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [(_DKEventQuery *)self readMetadata];
  [(_DKEventQuery *)self deduplicateValues];
  kdebug_trace();
  v6 = [(_DKEventQuery *)self explicitEventStreamsOrEventStreamsInPredicate];
  id v7 = _streamNameFromStreams(v6);
  _cdknowledge_signpost_query_begin(v7);

  if (self->_disableBiomeShim)
  {
    id v8 = v6;
    BOOL v9 = 0;
    v10 = (void *)MEMORY[0x1E4F1CBF0];
    BOOL v11 = 1;
  }
  else
  {
    v10 = +[_DKBiomeQuery biomeExclusiveStreamsFromEventStreams:v6];
    id v8 = +[_DKBiomeQuery duetExclusiveStreamsFromEventStreams:v6];
    BOOL v9 = [v10 count] != 0;
    BOOL v11 = [v8 count] != 0;
  }
  v47 = v10;
  if (_os_feature_enabled_impl()
    && !+[_DKBiomeQuery shimDisabled])
  {
    if (![v10 count] && !objc_msgSend(v8, "count"))
    {
      id v13 = _CDCurrentOrXPCProcessName();
      id v14 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.7((uint64_t)v13, self, v14);
      }
    }
    int v12 = 0;
  }
  else
  {
    int v12 = 1;
  }
  v46 = v8;
  id v15 = +[_DKEventQuery constructFetchRequestPredicateForEventStreams:v8 predicate:self->_predicate deviceIDs:self->_deviceIDs];
  int64_t v16 = [(_DKEventQuery *)self resultType];
  if ([(_DKEventQuery *)self resultType] == 1)
  {
    id v17 = [(_DKEventQuery *)self groupByProperties];
    BOOL v18 = v17 == 0;

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v18 = 0;
    if (!v16) {
      goto LABEL_22;
    }
  }
  if (!v18 && v9 && v11)
  {
    v19 = _CDCurrentOrXPCProcessName();
    uint64_t v20 = +[_CDLogging knowledgeChannel];
    uint64_t v21 = v5;
    v22 = a4;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.6(self, (uint64_t)v19, v20);
    }

    dispatch_queue_t v23 = 0;
    goto LABEL_38;
  }
LABEL_22:
  if ((v12 | !v9))
  {
    dispatch_queue_t v23 = 0;
    uint64_t v21 = v5;
  }
  else
  {
    uint64_t v43 = MEMORY[0x192FB2F20]();
    uint64_t v42 = os_transaction_create();
    v24 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.5(v24);
    }

    v67[0] = 0;
    v44 = [[_DKBiomeQuery alloc] initWithDKEventQuery:self];
    dispatch_queue_t v23 = [(_DKBiomeQuery *)v44 executeBiomeQueryError:v67];
    id v25 = v67[0];
    v26 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[_DKEventQuery executeUsingCoreDataStorage:error:].cold.4(v26);
    }

    v27 = +[_CDLogging knowledgeChannel];
    id v28 = v27;
    if (v25)
    {
      uint64_t v21 = v5;
      v30 = (void *)v42;
      objc_super v29 = (void *)v43;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[_DKEventQuery executeUsingCoreDataStorage:error:]();
      }
    }
    else
    {
      BOOL v31 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
      uint64_t v21 = v5;
      if (v18)
      {
        v30 = (void *)v42;
        objc_super v29 = (void *)v43;
        if (v31) {
          -[_DKEventQuery executeUsingCoreDataStorage:error:](v23);
        }
      }
      else
      {
        v30 = (void *)v42;
        objc_super v29 = (void *)v43;
        if (v31) {
          -[_DKEventQuery executeUsingCoreDataStorage:error:](v23);
        }
      }
    }

    [v23 count];
    [v25 code];
    kdebug_trace();
    _cdknowledge_signpost_query_end([v23 count], objc_msgSend(v25, "code"));

    if (!v11)
    {
      [v23 count];
      [0 code];
      kdebug_trace();
      _cdknowledge_signpost_query_end([v23 count], objc_msgSend(0, "code"));
      id v37 = v23;
      id v40 = v37;
      goto LABEL_45;
    }
  }
  v22 = a4;
LABEL_38:
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__24;
  v65 = __Block_byref_object_dispose__24;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__24;
  v59 = __Block_byref_object_dispose__24;
  id v60 = 0;
  BOOL v32 = [(_DKQuery *)self executeConcurrently];
  uint64_t v33 = *MEMORY[0x1E4F28358];
  if (v32) {
    [v21 privateManagedObjectContextFor:v33];
  }
  else {
  v34 = [v21 managedObjectContextFor:v33];
  }
  long long v35 = (void *)os_transaction_create();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __51___DKEventQuery_executeUsingCoreDataStorage_error___block_invoke;
  v48[3] = &unk_1E5610610;
  id v36 = v34;
  id v49 = v36;
  id v50 = v15;
  v51 = self;
  v53 = &v55;
  v54 = &v61;
  id v37 = v23;
  id v52 = v37;
  [v36 performWithOptions:4 andBlock:v48];
  if (v22)
  {
    long long v38 = (void *)v56[5];
    if (v38) {
      id *v22 = v38;
    }
  }
  [(id)v62[5] count];
  [(id)v56[5] code];
  kdebug_trace();
  uint64_t v39 = [(id)v62[5] count];
  _cdknowledge_signpost_query_end(v39, [(id)v56[5] code]);
  id v40 = (id)v62[5];

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

LABEL_45:
  return v40;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (BOOL)deduplicateValues
{
  return self->_deduplicateValues;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDeviceIDs:(id)a3
{
}

- (BOOL)readMetadata
{
  return self->_readMetadata;
}

- (id)explicitEventStreamsOrEventStreamsInPredicate
{
  v3 = [(_DKEventQuery *)self eventStreams];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(_DKEventQuery *)self eventStreams];
  }
  else
  {
    v6 = [(_DKEventQuery *)self predicate];
    id v5 = +[_DKBiomeQuery eventStreamsFromPredicate:v6];
  }
  return v5;
}

- (NSArray)eventStreams
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id resultsHandler = (void (**)(id, _DKEventQuery *, id, id))self->_resultsHandler;
  if (resultsHandler) {
    resultsHandler[2](resultsHandler, self, v6, a4);
  }
  return v6;
}

- (NSArray)sortDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)returnsDistinctResults
{
  return self->_returnsDistinctResults;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSArray)groupByProperties
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)excludedMetadataKeys
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (_DKEventQuery)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_DKEventQuery;
  id v5 = [(_DKQuery *)&v30 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"eventStreams"];
    eventStreams = v5->_eventStreams;
    v5->_eventStreams = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v11;

    v5->_offset = [v4 decodeInt64ForKey:@"offset"];
    v5->_limit = [v4 decodeInt64ForKey:@"limit"];
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"sortDescriptors"];
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v16;

    BOOL v18 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v20 = [v18 setWithArray:v19];

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"groupByProperties"];
    groupByProperties = v5->_groupByProperties;
    v5->_groupByProperties = (NSArray *)v21;

    v5->_readMetadata = [v4 decodeBoolForKey:@"readMetadata"];
    v5->_deduplicateValues = [v4 decodeBoolForKey:@"_deduplicateValues"];
    v5->_resultType = [v4 decodeIntegerForKey:@"resultType"];
    dispatch_queue_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    id v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"deviceIDs"];
    deviceIDs = v5->_deviceIDs;
    v5->_deviceIDs = (NSSet *)v26;

    v5->_returnsDistinctResults = [v4 decodeBoolForKey:@"returnsDistinctResults"];
    id v28 = v5;
  }
  return v5;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (void)setGroupByProperties:(id)a3
{
}

- (void)setReadMetadata:(BOOL)a3
{
  self->_readMetadata = a3;
}

- (void)setDeduplicateValues:(BOOL)a3
{
  self->_deduplicateValues = a3;
}

+ (id)predicateForEventsOfMinimumDuration:(double)a3
{
  id v4 = [(id)objc_opt_class() expressionForEventDuration];
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = [NSNumber numberWithDouble:a3];
  uint64_t v7 = [v5 expressionForConstantValue:v6];

  id v8 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v4 rightExpression:v7 modifier:0 type:3 options:4];

  return v8;
}

+ (id)expressionForEventDuration
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"startDate.timeIntervalSinceReferenceDate"];
  v3 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"endDate.timeIntervalSinceReferenceDate"];
  id v4 = (void *)MEMORY[0x1E4F28C68];
  v8[0] = v3;
  v8[1] = v2;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v4 expressionForFunction:@"from:subtract:" arguments:v5];

  return v6;
}

+ (id)onlyRemoteDevice
{
  if (onlyRemoteDevice_onceToken != -1) {
    dispatch_once(&onlyRemoteDevice_onceToken, &__block_literal_global_16_1);
  }
  v2 = (void *)onlyRemoteDevice_set;
  return v2;
}

+ (id)eventQueryWithPredicate:(id)a3 eventStreams:(id)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 sortDescriptors:(id)a7 resultHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  BOOL v18 = (void *)[objc_alloc((Class)a1) initWithPredicate:v17 eventStreams:v16 offset:a5 limit:a6 sortDescriptors:v15 resultHandler:v14];

  return v18;
}

- (_DKEventQuery)init
{
  return [(_DKEventQuery *)self initWithPredicate:0 eventStreams:0 offset:0 limit:0 sortDescriptors:0 resultHandler:0];
}

- (id)constructFetchRequestPredicate
{
  v3 = [(_DKEventQuery *)self eventStreams];
  id v4 = [(_DKEventQuery *)self predicate];
  id v5 = [(_DKEventQuery *)self deviceIDs];
  id v6 = +[_DKEventQuery constructFetchRequestPredicateForEventStreams:v3 predicate:v4 deviceIDs:v5];

  return v6;
}

+ (id)predicateForEventsOfMaximumDuration:(double)a3
{
  id v4 = [(id)objc_opt_class() expressionForEventDuration];
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = [NSNumber numberWithDouble:a3];
  uint64_t v7 = [v5 expressionForConstantValue:v6];

  id v8 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v4 rightExpression:v7 modifier:0 type:1 options:4];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setEventStreams:self->_eventStreams];
  [v4 setPredicate:self->_predicate];
  [v4 setOffset:self->_offset];
  [v4 setLimit:self->_limit];
  [v4 setSortDescriptors:self->_sortDescriptors];
  [v4 setGroupByProperties:self->_groupByProperties];
  [v4 setReadMetadata:self->_readMetadata];
  [v4 setDeduplicateValues:self->_deduplicateValues];
  [v4 setResultType:self->_resultType];
  [v4 setDeviceIDs:self->_deviceIDs];
  [v4 setReturnsDistinctResults:self->_returnsDistinctResults];
  objc_msgSend(v4, "setExecuteConcurrently:", -[_DKQuery executeConcurrently](self, "executeConcurrently"));
  return v4;
}

- (id)description
{
  deviceIDs = self->_deviceIDs;
  id v4 = +[_DKEventQuery allDevices];
  LOBYTE(deviceIDs) = [(NSSet *)deviceIDs isEqualToSet:v4];

  if (deviceIDs)
  {
    id v5 = @"All";
  }
  else
  {
    id v6 = self->_deviceIDs;
    uint64_t v7 = +[_DKEventQuery onlyRemoteDevice];
    LOBYTE(v6) = [(NSSet *)v6 isEqualToSet:v7];

    if (v6)
    {
      id v5 = @"OnlyRemote";
    }
    else
    {
      id v8 = self->_deviceIDs;
      uint64_t v9 = +[_DKEventQuery onlyLocalDevice];
      LOBYTE(v8) = [(NSSet *)v8 isEqualToSet:v9];

      if (v8)
      {
        id v5 = @"OnlyLocal";
      }
      else
      {
        _CDPrettyPrintCollection(self->_deviceIDs, 0, 0, 0);
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  id v13 = [(NSArray *)self->_eventStreams valueForKeyPath:@"name"];
  id v14 = [v13 componentsJoinedByString:@", "];
  objc_msgSend(v10, "stringWithFormat:", @"%@:{eventStreams=%@; predicate=%@; limit=%lu; offset=%lu; groupBy=%@; sort=%@; resultType=%ld; deviceIDs=%@ }}",
    v12,
    v14,
    self->_predicate,
    self->_limit,
    self->_offset,
    self->_groupByProperties,
    self->_sortDescriptors,
    self->_resultType,
  id v15 = v5);

  return v15;
}

- (void)setPredicate:(id)a3
{
}

- (void)setEventStreams:(id)a3
{
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (NSSet)deviceIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (id)resultsHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setResultsHandler:(id)a3
{
}

- (void)setReturnsDistinctResults:(BOOL)a3
{
  self->_returnsDistinctResults = a3;
}

- (void)setExcludedMetadataKeys:(id)a3
{
}

- (BOOL)disableBiomeShim
{
  return self->_disableBiomeShim;
}

- (void)setDisableBiomeShim:(BOOL)a3
{
  self->_disableBiomeShim = a3;
}

- (void)executeUsingCoreDataStorage:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 firstObject];
  [v1 unsignedIntegerValue];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "_DKBiomeQuery success, count: %ld", v4, v5, v6, v7, v8);
}

- (void)executeUsingCoreDataStorage:(void *)a1 error:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "_DKBiomeQuery success, result count: %ld", v3, v4, v5, v6, v7);
}

- (void)executeUsingCoreDataStorage:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "_DKBiomeQuery failure, error: %@", v1, 0xCu);
}

- (void)executeUsingCoreDataStorage:(os_log_t)log error:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "_DKBiomeQuery completed Biome-shimmed query", v1, 2u);
}

- (void)executeUsingCoreDataStorage:(os_log_t)log error:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "_DKBiomeQuery starting Biome-shimmed query", v1, 2u);
}

- (void)executeUsingCoreDataStorage:(NSObject *)a3 error:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "resultType"));
  uint8_t v7 = [a1 constructFetchRequestPredicate];
  OUTLINED_FUNCTION_1_11();
  uint64_t v11 = a2;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_fault_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_FAULT, "Query contains mix of Biome/CoreDuet streams and a non-event result type (%@). %@: %@", v10, 0x20u);
}

- (void)executeUsingCoreDataStorage:(NSObject *)a3 error:.cold.7(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 constructFetchRequestPredicate];
  OUTLINED_FUNCTION_1_11();
  uint64_t v7 = v5;
  _os_log_fault_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_FAULT, "Query does not specify any stream list. Client: %@, Predicate: %@", v6, 0x16u);
}

@end