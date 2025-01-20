@interface _DKHistogramQuery
+ (BOOL)supportsSecureCoding;
+ (id)histogramQueryForPersistedHistogramsForStream:(id)a3 withCustomIdentifier:(id)a4;
+ (id)histogramQueryForStream:(id)a3 interval:(id)a4;
+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 predicate:(id)a5 valueKeyPaths:(id)a6;
+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 withPredicate:(id)a5;
- (BOOL)includeLocalResults;
- (BOOL)includeRemoteResults;
- (NSArray)valueKeyPaths;
- (NSDateInterval)interval;
- (NSPredicate)predicate;
- (_DKEventStream)stream;
- (_DKHistogram)_histogramFromEvents:(_DKHistogram *)a1;
- (_DKHistogram)_histogramFromManagedObjects:(_DKHistogram *)a1;
- (_DKHistogram)_histogramFromValueCounts:(_DKHistogram *)a1;
- (_DKHistogramQuery)init;
- (_DKHistogramQuery)initWithCoder:(id)a3;
- (id)_fetchRemoteResultsWithStorage:(void *)a3 error:;
- (id)_valueForEvent:(void *)a1;
- (id)description;
- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4;
- (id)handleResults:(id)a3 error:(id)a4;
- (id)histogramHandler;
- (int64_t)remoteHistogramLimit;
- (unint64_t)minimumOccurrencesForInclusion;
- (void)_constructFetchRequestPredicate;
- (void)_defaultValueKeyPaths;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomIdentifier:(uint64_t)a1;
- (void)setHistogramHandler:(id)a3;
- (void)setIncludeLocalResults:(BOOL)a3;
- (void)setIncludeRemoteResults:(BOOL)a3;
- (void)setInterval:(uint64_t)a1;
- (void)setMinimumOccurrencesForInclusion:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setRemoteHistogramLimit:(int64_t)a3;
- (void)setStream:(uint64_t)a1;
- (void)setValueKeyPaths:(id)a3;
@end

@implementation _DKHistogramQuery

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [(_DKHistogramQuery *)self stream];
  if (v8)
  {
    v4 = [(_DKHistogramQuery *)self stream];
    v86[0] = v4;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
  }
  else
  {
    v9 = 0;
  }
  v10 = _streamNameFromStreams(v9);
  _cdknowledge_signpost_query_begin(v10);

  if (v8)
  {
  }
  v11 = [(_DKHistogramQuery *)self stream];

  if (!v11)
  {
    v40 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[_DKHistogramQuery executeUsingCoreDataStorage:error:](v40);
    }

    if (a4)
    {
      v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      v85 = @"No event stream specified.";
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      *a4 = [v41 errorWithDomain:@"com.apple.coreduet.knowledge" code:4 userInfo:v42];
    }
    uint64_t v43 = 4;
    goto LABEL_32;
  }
  if (![(_DKHistogramQuery *)self includeLocalResults]
    && ![(_DKHistogramQuery *)self includeRemoteResults])
  {
    v46 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[_DKHistogramQuery executeUsingCoreDataStorage:error:](v46);
    }

    if (a4)
    {
      v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      v83 = @"Invalid parameters: includeLocalResults and includeRemoteResults are both NO.";
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      *a4 = [v47 errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:v48];
    }
    uint64_t v43 = 3;
LABEL_32:
    _cdknowledge_signpost_query_end(0, v43);
    id v49 = 0;
    goto LABEL_58;
  }
  v12 = [(_DKHistogramQuery *)self valueKeyPaths];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    v14 = -[_DKHistogramQuery _defaultValueKeyPaths](self);
    [(_DKHistogramQuery *)self setValueKeyPaths:v14];
  }
  if ([(_DKHistogramQuery *)self includeLocalResults])
  {
    id v65 = v7;
    v64 = (void *)MEMORY[0x192FB2F20]();
    v15 = [(_DKHistogramQuery *)self interval];
    v16 = [v15 startDate];
    v17 = [(_DKHistogramQuery *)self interval];
    v18 = [v17 endDate];
    uint64_t v19 = +[_DKQuery predicateForEventsBetweenStartDate:v16 endDate:v18];

    v20 = (void *)MEMORY[0x1E4F28BA0];
    v67 = (void *)v19;
    v81[0] = v19;
    v21 = [(_DKHistogramQuery *)self predicate];
    v81[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    uint64_t v23 = [v20 andPredicateWithSubpredicates:v22];

    v24 = [(_DKHistogramQuery *)self stream];
    v80 = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v66 = (void *)v23;
    v26 = +[_DKEventQuery eventQueryWithPredicate:v23 eventStreams:v25 offset:0 limit:0 sortDescriptors:0];

    v27 = [NSString stringWithUTF8String:"_DKHistogramQuery.m"];
    v28 = objc_msgSend(v27, "stringByAppendingFormat:", @":%d", 371);
    [v26 setClientName:v28];

    [v26 setTracker:&__block_literal_global_56];
    v29 = (void *)MEMORY[0x1E4F1CA48];
    v30 = [(_DKHistogramQuery *)self valueKeyPaths];
    v31 = objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v32 = [(_DKHistogramQuery *)self valueKeyPaths];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      v63 = a4;
      uint64_t v35 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v72 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v38 = +[_DKEvent moKeyPathForKeyPath:]((uint64_t)_DKEvent, v37);
          if (!v38)
          {
            v50 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v76 = v37;
              _os_log_impl(&dword_18ECEB000, v50, OS_LOG_TYPE_DEFAULT, "Unsupported key for histogram query fast-path: '%@'. Falling back to full query.", buf, 0xCu);
            }

            v31 = 0;
            goto LABEL_36;
          }
          v39 = (void *)v38;
          [v31 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v34) {
          continue;
        }
        break;
      }
LABEL_36:
      id v7 = v65;
      a4 = v63;
    }
    else
    {
      id v7 = v65;
    }

    if ([v31 count])
    {
      [v26 setGroupByProperties:v31];
      [v26 setResultType:4];
      v51 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [(_DKHistogramQuery *)self stream];
        *(_DWORD *)buf = 138412546;
        v76 = v31;
        __int16 v77 = 2112;
        v78 = v52;
        _os_log_impl(&dword_18ECEB000, v51, OS_LOG_TYPE_DEFAULT, "Fetching value counts for histogram for keyPaths: %@ stream: %@", buf, 0x16u);
      }
      id v70 = 0;
      v53 = [v26 executeUsingCoreDataStorage:v7 error:&v70];
      id v44 = v70;
      uint64_t v54 = -[_DKHistogramQuery _histogramFromValueCounts:]((_DKHistogram *)self, v53);
    }
    else
    {
      v55 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = [(_DKHistogramQuery *)self stream];
        *(_DWORD *)buf = 138412290;
        v76 = v56;
        _os_log_impl(&dword_18ECEB000, v55, OS_LOG_TYPE_DEFAULT, "Fetching events for histogram query for stream: %@", buf, 0xCu);
      }
      id v69 = 0;
      v53 = [v26 executeUsingCoreDataStorage:v7 error:&v69];
      id v44 = v69;
      uint64_t v54 = -[_DKHistogramQuery _histogramFromEvents:]((_DKHistogram *)self, v53);
    }
    v45 = (void *)v54;
  }
  else
  {
    id v44 = 0;
    v45 = 0;
  }
  if (![(_DKHistogramQuery *)self includeRemoteResults])
  {
    v58 = 0;
    if (!a4) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  v57 = (void *)MEMORY[0x192FB2F20]();
  id v68 = v44;
  v58 = -[_DKHistogramQuery _fetchRemoteResultsWithStorage:error:](self, v7, &v68);
  id v59 = v68;

  id v44 = v59;
  if (a4) {
LABEL_50:
  }
    *a4 = v44;
LABEL_51:
  if ([(_DKHistogramQuery *)self includeLocalResults]
    && [(_DKHistogramQuery *)self includeRemoteResults])
  {
    [v45 addHistogram:v58];
    _cdknowledge_signpost_query_end(0, 0);
    v60 = v45;
  }
  else
  {
    BOOL v61 = [(_DKHistogramQuery *)self includeRemoteResults];
    _cdknowledge_signpost_query_end(0, 0);
    if (v61) {
      v60 = v58;
    }
    else {
      v60 = v45;
    }
  }
  id v49 = v60;

LABEL_58:
  return v49;
}

- (_DKHistogramQuery)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKHistogramQuery;
  result = [(_DKHistogramQuery *)&v3 init];
  if (result)
  {
    result->_minimumOccurrencesForInclusion = 1;
    result->_includeLocalResults = 1;
    result->_includeRemoteResults = 1;
    result->_remoteHistogramLimit = 0;
  }
  return result;
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  v8 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v9 = [v7 histogramQueryForStream:v6 interval:v5 withPredicate:v8];

  return v9;
}

- (void)_defaultValueKeyPaths
{
  if (result)
  {
    v1 = [result stream];
    v2 = [v1 eventValueType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      return &unk_1EDE1E788;
    }
    else {
      return &unk_1EDE1E7A0;
    }
  }
  return result;
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 withPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 eventValueType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = objc_alloc_init((Class)a1);
    -[_DKHistogramQuery setStream:]((uint64_t)v13, v8);
    -[_DKHistogramQuery setInterval:]((uint64_t)v13, v9);
    [v13 setPredicate:v10];
    v14 = -[_DKHistogramQuery _defaultValueKeyPaths](v13);
    [v13 setValueKeyPaths:v14];
  }
  return v13;
}

- (void)setStream:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setInterval:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 predicate:(id)a5 valueKeyPaths:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_opt_class();
  v14 = v13;
  if (v11)
  {
    v15 = [v13 histogramQueryForStream:v9 interval:v10 withPredicate:v11];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    v15 = [v14 histogramQueryForStream:v9 interval:v10 withPredicate:v16];
  }
  [v15 setValueKeyPaths:v12];

  return v15;
}

+ (id)histogramQueryForPersistedHistogramsForStream:(id)a3 withCustomIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  -[_DKHistogramQuery setStream:]((uint64_t)v8, v7);

  -[_DKHistogramQuery setCustomIdentifier:]((uint64_t)v8, v6);
  [v8 setIncludeLocalResults:0];
  return v8;
}

- (void)setCustomIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (id)description
{
  v16 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(_DKHistogramQuery *)self stream];
  if (self) {
    customIdentifier = self->_customIdentifier;
  }
  else {
    customIdentifier = 0;
  }
  id v7 = customIdentifier;
  id v8 = [(_DKHistogramQuery *)self interval];
  id v9 = [(_DKHistogramQuery *)self predicate];
  id v10 = [(_DKHistogramQuery *)self valueKeyPaths];
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_DKHistogramQuery includeLocalResults](self, "includeLocalResults"));
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults"));
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[_DKHistogramQuery remoteHistogramLimit](self, "remoteHistogramLimit"));
  objc_msgSend(v16, "stringWithFormat:", @"%@:{stream=%@; customIdentifier=%@; interval=%@; predicate=%@; valueKeyPaths=%@; includeLocalResults=%@; includeRemoteResults=%@; remoteHistogramLimit=%@}",
    v4,
    v5,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
  v14 = v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKHistogramQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_DKHistogramQuery;
  id v5 = [(_DKQuery *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stream"];
    stream = v5->_stream;
    v5->_stream = (_DKEventStream *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customIdentifier"];
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v8;

    v5->_includeLocalResults = [v4 decodeBoolForKey:@"includeLocalResults"];
    v5->_includeRemoteResults = [v4 decodeBoolForKey:@"includeRemoteResults"];
    v5->_remoteHistogramLimit = [v4 decodeIntegerForKey:@"remoteHistogramLimit"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval"];
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"valueKeyPaths"];
    valueKeyPaths = v5->_valueKeyPaths;
    v5->_valueKeyPaths = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_DKHistogramQuery;
  id v4 = a3;
  [(_DKQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stream, @"stream", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_customIdentifier forKey:@"customIdentifier"];
  [v4 encodeBool:self->_includeLocalResults forKey:@"includeLocalResults"];
  [v4 encodeBool:self->_includeRemoteResults forKey:@"includeRemoteResults"];
  [v4 encodeInteger:self->_remoteHistogramLimit forKey:@"remoteHistogramLimit"];
  [v4 encodeObject:self->_interval forKey:@"interval"];
  [v4 encodeObject:self->_predicate forKey:@"predicate"];
  [v4 encodeObject:self->_valueKeyPaths forKey:@"valueKeyPaths"];
}

- (_DKHistogram)_histogramFromValueCounts:(_DKHistogram *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v41 = [v3 count];
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "Generating histogram from %lu entries.", buf, 0xCu);
    }

    objc_super v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v3;
    obuint64_t j = v3;
    uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v27)
    {
      v25 = v5;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v8 = [v7 objectForKeyedSubscript:@"count"];
          id v9 = (void *)[v7 mutableCopy];
          [v9 removeObjectForKey:@"count"];
          if ([v9 count])
          {
            v29 = v8;
            uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v28 = v9;
            id v11 = v9;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v31;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v31 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                  uint64_t v17 = +[_DKEvent keyPathForMOKeyPath:]((uint64_t)_DKEvent, v16);
                  v18 = [v11 objectForKeyedSubscript:v16];
                  if (v17) {
                    uint64_t v19 = v17;
                  }
                  else {
                    uint64_t v19 = v16;
                  }
                  [v10 setObject:v18 forKeyedSubscript:v19];
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v13);
            }

            if ([v10 count] == 1)
            {
              objc_super v20 = [v10 allValues];
              v21 = [v20 firstObject];
              objc_super v5 = v25;
              uint64_t v8 = v29;
              [v25 setObject:v29 forKeyedSubscript:v21];
            }
            else
            {
              objc_super v5 = v25;
              uint64_t v8 = v29;
              [v25 setObject:v29 forKeyedSubscript:v10];
            }
            id v9 = v28;
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v27);
    }

    if ([v5 count]) {
      a1 = [[_DKHistogram alloc] initWithHistogram:v5];
    }
    else {
      a1 = 0;
    }

    id v3 = v23;
  }

  return a1;
}

- (id)_valueForEvent:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 valueKeyPaths];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      uint64_t v6 = [a1 valueKeyPaths];
      id v7 = [v6 firstObject];
      a1 = [v3 valueForKeyPath:v7];
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
      id v9 = [a1 valueKeyPaths];
      uint64_t v6 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = objc_msgSend(a1, "valueKeyPaths", 0);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v16 = [v3 valueForKeyPath:v15];
            [v6 setObject:v16 forKeyedSubscript:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      a1 = (void *)[v6 copy];
    }
  }
  return a1;
}

- (_DKHistogram)_histogramFromEvents:(_DKHistogram *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [v3 count];
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "Generating histogram from %lu events.", buf, 0xCu);
    }

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = -[_DKHistogramQuery _valueForEvent:](a1, *(void **)(*((void *)&v13 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      a1 = [[_DKHistogram alloc] initWithValues:v5];
    }
    else {
      a1 = 0;
    }
  }
  return a1;
}

- (void)_constructFetchRequestPredicate
{
  v1 = a1;
  if (a1)
  {
    if (a1[8])
    {
      v2 = (void *)MEMORY[0x1E4F28F60];
      id v3 = [a1 stream];
      id v4 = [v3 name];
      uint64_t v5 = NSNumber;
      id v6 = [v1 stream];
      uint64_t v7 = [v6 eventValueType];
      uint64_t v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "typeCode"));
      v1 = [v2 predicateWithFormat:@"streamName == %@ && streamTypeCode == %@ && customIdentifier == %@", v4, v8, v1[8]];
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v9 = [a1 interval];

    if (v9)
    {
      long long v16 = (void *)MEMORY[0x1E4F28F60];
      id v3 = [v1 stream];
      id v4 = [v3 name];
      uint64_t v10 = NSNumber;
      id v6 = [v1 stream];
      uint64_t v7 = [v6 eventValueType];
      uint64_t v8 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v7, "typeCode"));
      uint64_t v11 = [v1 interval];
      uint64_t v12 = [v11 startDate];
      long long v13 = [v1 interval];
      long long v14 = [v13 endDate];
      v1 = [v16 predicateWithFormat:@"streamName == %@ && streamTypeCode == %@ && startDate >= %@ && startDate <= %@", v4, v8, v12, v14];

      goto LABEL_6;
    }
    v1 = 0;
  }
LABEL_7:
  return v1;
}

- (_DKHistogram)_histogramFromManagedObjects:(_DKHistogram *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = objc_alloc_init(_DKHistogram);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [_DKHistogram alloc];
          uint64_t v11 = -[_DKHistogram initWithManagedObject:](v10, "initWithManagedObject:", v9, (void)v13);
          if (v11) {
            [(_DKHistogram *)a1 addHistogram:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return a1;
}

- (id)_fetchRemoteResultsWithStorage:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v7 = -[_DKHistogramQuery _constructFetchRequestPredicate](a1);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    long long v31 = __Block_byref_object_copy__17;
    long long v32 = __Block_byref_object_dispose__17;
    id v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__17;
    uint64_t v26 = __Block_byref_object_dispose__17;
    id v27 = 0;
    uint64_t v8 = [v5 managedObjectContextFor:*MEMORY[0x1E4F28358]];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke;
    v15[3] = &unk_1E560E9B0;
    id v9 = v8;
    id v16 = v9;
    id v10 = v7;
    id v17 = v10;
    uint64_t v18 = a1;
    id v11 = v6;
    id v19 = v11;
    uint64_t v20 = &v22;
    long long v21 = &v28;
    [v9 performWithOptions:4 andBlock:v15];
    if (a3)
    {
      uint64_t v12 = (void *)v23[5];
      if (v12) {
        *a3 = v12;
      }
    }
    id v13 = (id)v29[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  histogramHandler = (void (**)(id, _DKHistogramQuery *, id, id))self->_histogramHandler;
  if (histogramHandler) {
    histogramHandler[2](histogramHandler, self, v6, a4);
  }
  return v6;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (id)histogramHandler
{
  return self->_histogramHandler;
}

- (void)setHistogramHandler:(id)a3
{
}

- (BOOL)includeLocalResults
{
  return self->_includeLocalResults;
}

- (void)setIncludeLocalResults:(BOOL)a3
{
  self->_includeLocalResults = a3;
}

- (BOOL)includeRemoteResults
{
  return self->_includeRemoteResults;
}

- (void)setIncludeRemoteResults:(BOOL)a3
{
  self->_includeRemoteResults = a3;
}

- (unint64_t)minimumOccurrencesForInclusion
{
  return self->_minimumOccurrencesForInclusion;
}

- (void)setMinimumOccurrencesForInclusion:(unint64_t)a3
{
  self->_minimumOccurrencesForInclusion = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)valueKeyPaths
{
  return self->_valueKeyPaths;
}

- (void)setValueKeyPaths:(id)a3
{
}

- (int64_t)remoteHistogramLimit
{
  return self->_remoteHistogramLimit;
}

- (void)setRemoteHistogramLimit:(int64_t)a3
{
  self->_remoteHistogramLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueKeyPaths, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong(&self->_histogramHandler, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)executeUsingCoreDataStorage:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "HistogramQuery does not specify an event stream. Skipping execution.", v1, 2u);
}

- (void)executeUsingCoreDataStorage:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "HistogramQuery excludes all results. Skipping execution.", v1, 2u);
}

@end