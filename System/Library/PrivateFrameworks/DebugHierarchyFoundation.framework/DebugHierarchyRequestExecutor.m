@interface DebugHierarchyRequestExecutor
+ (id)executorWithRequest:(id)a3;
- (DebugHierarchyRequestActionExecutor)actionExecutor;
- (DebugHierarchyRequestExecutionContext)requestContext;
- (DebugHierarchyRequestExecutor)initWithRequest:(id)a3;
- (id)_performanceMetricsDictionaryRequestActionDuration:(double)a3;
- (id)_v1CompatibleRequestResponseFromResponse:(id)a3;
- (id)runWithError:(id *)a3;
- (void)_executeRequestActionsWithCrawler;
- (void)_executeRequestActionsWithKnownObjects;
- (void)_v1MakePropertyDescriptionCompatible:(id)a3 withRuntimeType:(id)a4;
- (void)_v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:(id)a3;
- (void)setActionExecutor:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation DebugHierarchyRequestExecutor

+ (id)executorWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithRequest:v4];

  return v5;
}

- (DebugHierarchyRequestExecutor)initWithRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DebugHierarchyRequestExecutor;
  id v5 = [(DebugHierarchyRequestExecutor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[DebugHierarchyRequestExecutionContext contextWithRequest:v4];
    requestContext = v5->_requestContext;
    v5->_requestContext = (DebugHierarchyRequestExecutionContext *)v6;

    uint64_t v8 = +[DebugHierarchyRequestActionExecutor actionExecutorWithContext:v5->_requestContext];
    actionExecutor = v5->_actionExecutor;
    v5->_actionExecutor = (DebugHierarchyRequestActionExecutor *)v8;
  }
  return v5;
}

- (id)runWithError:(id *)a3
{
  v78 = +[NSDate date];
  id v4 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
  uint64_t v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 136446210;
    v83 = "Initial Standalone Actions";
    _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Request Executor", "Begin %{public}s", buf, 0xCu);
  }

  uint64_t v8 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
  [v8 executeInitialStandaloneActions];

  v9 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
  objc_super v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v10, "Request Executor", "Completed", buf, 2u);
  }

  v13 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v14 = [v13 request];
  v15 = (char *)[v14 objectDiscovery];

  if (v15 == (unsigned char *)&dword_0 + 2)
  {
    v24 = DebugHierarchyRequestsOSLog();
    os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, self);
    v26 = v24;
    v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 136446210;
      v83 = "Actions With Known Objects";
      _os_signpost_emit_with_name_impl(&dword_0, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "Request Executor", "Begin %{public}s", buf, 0xCu);
    }

    [(DebugHierarchyRequestExecutor *)self _executeRequestActionsWithKnownObjects];
    v28 = DebugHierarchyRequestsOSLog();
    os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v28, self);
    v29 = v28;
    v23 = v29;
    if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v29)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    goto LABEL_21;
  }
  if (v15 == (unsigned char *)&dword_0 + 1)
  {
    v16 = DebugHierarchyRequestsOSLog();
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
    v18 = v16;
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 136446210;
      v83 = "Actions With Crawler";
      _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Request Executor", "Begin %{public}s", buf, 0xCu);
    }

    [(DebugHierarchyRequestExecutor *)self _executeRequestActionsWithCrawler];
    v20 = DebugHierarchyRequestsOSLog();
    os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, self);
    v22 = v20;
    v23 = v22;
    if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v22)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
LABEL_21:
    _os_signpost_emit_with_name_impl(&dword_0, v23, OS_SIGNPOST_INTERVAL_END, v21, "Request Executor", "Completed", buf, 2u);
LABEL_22:
  }
  v30 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, self);
  v32 = v30;
  v33 = v32;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_DWORD *)buf = 136446210;
    v83 = "Final Standalone Actions";
    _os_signpost_emit_with_name_impl(&dword_0, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "Request Executor", "Begin %{public}s", buf, 0xCu);
  }

  v34 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
  [v34 executeFinalStandaloneActions];

  v35 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v35, self);
  v37 = v35;
  v38 = v37;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v38, OS_SIGNPOST_INTERVAL_END, v36, "Request Executor", "Completed", buf, 2u);
  }

  v39 = +[NSDate date];
  [v39 timeIntervalSinceDate:v78];
  v77 = v39;
  v40 = -[DebugHierarchyRequestExecutor _performanceMetricsDictionaryRequestActionDuration:](self, "_performanceMetricsDictionaryRequestActionDuration:");
  v41 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v42 = [v41 metaData];
  [v42 setObject:v40 forKeyedSubscript:@"metaDataRequestPerformance"];

  v43 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v44 = os_signpost_id_make_with_pointer(v43, self);
  v45 = v43;
  v46 = v45;
  if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "Request Executor", "Begin Response Generation", buf, 2u);
  }

  v47 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v48 = [v47 requestResponse];

  v49 = DebugHierarchyRequestsOSLog();
  os_signpost_id_t v50 = os_signpost_id_make_with_pointer(v49, self);
  v51 = v49;
  v52 = v51;
  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v52, OS_SIGNPOST_INTERVAL_END, v50, "Request Executor", "Completed", buf, 2u);
  }

  v53 = +[DebugHierarchyTargetHub sharedHub];
  v54 = [v53 runtimeInfo];
  v55 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v56 = [v55 contextRuntimeInfo];
  [v54 mergeWith:v56];

  v57 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v58 = [v57 request];
  LODWORD(v56) = [v58 needsCompatibilityConversion];

  if (v56)
  {
    uint64_t v59 = [(DebugHierarchyRequestExecutor *)self _v1CompatibleRequestResponseFromResponse:v48];

    v48 = (void *)v59;
  }
  id v79 = 0;
  v60 = [v48 generateJSONDataWithError:&v79];
  id v61 = v79;
  v62 = v61;
  if (v61)
  {
    v63 = [v61 localizedDescription];
    v64 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "-[DebugHierarchyRequestExecutor runWithError:]", 4);
    v65 = +[DebugHierarchyLogEntry errorLogEntryWithTitle:@"Error generating request response data." message:v63 methodSignature:v64];

    v66 = [(DebugHierarchyRequestExecutor *)self requestContext];
    v67 = [v66 request];
    [v67 addLogEntry:v65];

    v80 = @"request";
    v68 = [(DebugHierarchyRequestExecutor *)self requestContext];
    v69 = [v68 request];
    v70 = [v69 dictionaryRepresentation];
    v81 = v70;
    v71 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];

    id v72 = [v71 generateJSONDataWithError:0];
  }
  else
  {
    id v72 = v60;
  }

  v73 = [(DebugHierarchyRequestExecutor *)self requestContext];
  v74 = [v73 request];
  v75 = [v74 formattedResponseDataForRawRequestResultData:v72];

  return v75;
}

- (id)_v1CompatibleRequestResponseFromResponse:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = +[DebugHierarchyTargetHub sharedHub];
  uint64_t v6 = [v5 knownObjectsMap];

  v7 = +[DebugHierarchyTargetHub sharedHub];
  uint64_t v8 = [v7 runtimeInfo];

  id v9 = [v4 mutableCopy];
  os_signpost_id_t v10 = [v9 objectForKeyedSubscript:@"topLevelGroups"];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke;
  v25[3] = &unk_24308;
  v25[4] = self;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v26;
  [v10 enumerateKeysAndObjectsUsingBlock:v25];
  [v9 setObject:v11 forKeyedSubscript:@"topLevelGroups"];
  v12 = [v4 objectForKeyedSubscript:@"topLevelPropertyDescriptions"];

  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
  os_signpost_id_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke_2;
  v20 = &unk_24330;
  id v21 = v6;
  id v22 = v8;
  v23 = self;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v24;
  id v14 = v8;
  id v15 = v6;
  [v12 enumerateKeysAndObjectsUsingBlock:&v17];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, @"topLevelPropertyDescriptions", v17, v18, v19, v20);

  return v9;
}

void __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 mutableCopy];
  [*(id *)(a1 + 32) _v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:v6];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
}

void __74__DebugHierarchyRequestExecutor__v1CompatibleRequestResponseFromResponse___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "rangeOfString:", @"."));
  v7 = [a1[4] objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = [a1[5] typeOfObject:v7];
    if (v8)
    {
      id v9 = [v5 mutableCopy];
      [a1[6] _v1MakePropertyDescriptionCompatible:v9 withRuntimeType:v8];
      [a1[7] setObject:v9 forKeyedSubscript:v10];
    }
  }
}

- (void)_v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:(id)a3
{
  id v4 = a3;
  id v5 = +[DebugHierarchyTargetHub sharedHub];
  v42 = [v5 knownObjectsMap];

  id v6 = +[DebugHierarchyTargetHub sharedHub];
  v38 = [v6 runtimeInfo];

  v34 = v4;
  v7 = [v4 objectForKeyedSubscript:@"debugHierarchyObjects"];
  v41 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    uint64_t v35 = *(void *)v52;
    do
    {
      id v11 = 0;
      id v36 = v9;
      do
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v11);
        id v13 = [v12 mutableCopy];
        id v14 = [v13 objectForKeyedSubscript:@"childGroup"];
        id v15 = [v14 mutableCopy];

        v16 = v15;
        [(DebugHierarchyRequestExecutor *)self _v1RecursivelyMakePropertyDescriptionCompatibleWithGroup:v15];
        if (v15) {
          [v13 setObject:v15 forKeyedSubscript:@"childGroup"];
        }
        os_signpost_id_t v17 = [v13 objectForKeyedSubscript:@"properties"];
        uint64_t v18 = [v12 objectForKeyedSubscript:@"objectID"];
        uint64_t v19 = [v42 objectForKey:v18];
        v20 = (void *)v19;
        if (v19)
        {
          v43 = (void *)v19;
          os_signpost_id_t v44 = v18;
          id v21 = [v38 typeOfObject:v19];
          if (v21)
          {
            v40 = v16;
            id v22 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 count]);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v39 = v17;
            id v23 = v17;
            id v24 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v48;
              do
              {
                for (i = 0; i != v25; i = (char *)i + 1)
                {
                  if (*(void *)v48 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  id v28 = [*(id *)(*((void *)&v47 + 1) + 8 * i) mutableCopy];
                  [(DebugHierarchyRequestExecutor *)self _v1MakePropertyDescriptionCompatible:v28 withRuntimeType:v21];
                  [v22 addObject:v28];
                }
                id v25 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v25);
            }

            v29 = +[NSMutableDictionary dictionary];
            id v30 = v21;
            do
            {
              os_signpost_id_t v31 = [v30 instanceProperties];
              [v29 addEntriesFromDictionary:v31];

              uint64_t v32 = [v30 parentType];

              id v30 = (id)v32;
            }
            while (v32);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = __90__DebugHierarchyRequestExecutor__v1RecursivelyMakePropertyDescriptionCompatibleWithGroup___block_invoke;
            v45[3] = &unk_24358;
            id v46 = v22;
            id v33 = v22;
            [v29 enumerateKeysAndObjectsUsingBlock:v45];

            [v13 setObject:v33 forKeyedSubscript:@"properties"];
            uint64_t v10 = v35;
            id v9 = v36;
            os_signpost_id_t v17 = v39;
            v16 = v40;
          }

          v20 = v43;
          uint64_t v18 = v44;
        }
        [v41 addObject:v13];

        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v9);
  }

  [v34 setObject:v41 forKeyedSubscript:@"debugHierarchyObjects"];
}

void __90__DebugHierarchyRequestExecutor__v1RecursivelyMakePropertyDescriptionCompatibleWithGroup___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (DebugHierarchyBitMaskComparison((uint64_t)[v4 options], 1, 1))
  {
    v17[0] = @"propertyName";
    id v5 = [v4 name];
    v18[0] = v5;
    v18[1] = &off_2DF08;
    v17[1] = @"propertyValueStatus";
    v17[2] = @"propertyRuntimeType";
    uint64_t v6 = [v4 runtimeTypeName];
    v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_29008;
    }
    v18[2] = v8;
    v17[3] = @"propertyOptions";
    id v9 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 options]);
    v18[3] = v9;
    v17[4] = @"propertyLogicalType";
    uint64_t v10 = [v4 logicalType];
    id v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_29008;
    }
    v18[4] = v12;
    v17[5] = @"propertyFormat";
    uint64_t v13 = [v4 format];
    id v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_29008;
    }
    v17[6] = @"visibility";
    v18[5] = v15;
    v18[6] = &off_2DF20;
    v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];

    [*(id *)(a1 + 32) addObject:v16];
  }
}

- (void)_v1MakePropertyDescriptionCompatible:(id)a3 withRuntimeType:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  uint64_t v6 = [v28 objectForKeyedSubscript:@"propertyName"];
  if (v6)
  {
    v7 = [v5 propertyWithName:v6];
    id v8 = v7;
    if (!v7)
    {
LABEL_25:

      goto LABEL_26;
    }
    id v9 = [v7 format];

    if (v9)
    {
      uint64_t v10 = [v8 format];
      [v28 setObject:v10 forKeyedSubscript:@"propertyFormat"];
    }
    id v11 = [v8 logicalType];

    if (!v11)
    {
LABEL_12:
      os_signpost_id_t v17 = [v8 runtimeTypeName];

      if (v17)
      {
        uint64_t v18 = [v8 runtimeTypeName];
        [v28 setObject:v18 forKeyedSubscript:@"propertyRuntimeType"];
      }
      if ([v8 visibility] == (char *)&dword_0 + 1) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = 3;
      }
      v20 = +[NSNumber numberWithUnsignedInteger:v19];
      [v28 setObject:v20 forKeyedSubscript:@"visibility"];

      id v21 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v8 options]);
      [v28 setObject:v21 forKeyedSubscript:@"propertyOptions"];

      id v22 = [v28 objectForKeyedSubscript:@"fetchStatus"];
      id v23 = [v28 objectForKeyedSubscript:@"propertyValue"];

      if (v22)
      {
        id v24 = (int *)[v22 integerValue];
        uint64_t v25 = 2;
        if (v24 == &dword_4) {
          uint64_t v25 = v23 == 0;
        }
        if (v24 == &dword_8) {
          uint64_t v26 = 3;
        }
        else {
          uint64_t v26 = v25;
        }
      }
      else
      {
        uint64_t v26 = 2 * (v23 == 0);
      }
      v27 = +[NSNumber numberWithUnsignedInteger:v26];
      [v28 setObject:v27 forKeyedSubscript:@"propertyValueStatus"];

      goto LABEL_25;
    }
    v12 = [v8 logicalType];
    uint64_t v13 = [v8 logicalType];
    if ([v13 isEqualToString:@"DebugHierarchyLogicalPropertyTypeEnum"])
    {
      id v14 = [v8 name];
      unsigned int v15 = [v14 isEqualToString:@"orientation"];

      if (!v15)
      {
        v16 = @"DebugHierarchyLogicalPropertyTypeNumber";
LABEL_11:

        [v28 setObject:v16 forKeyedSubscript:@"propertyLogicalType"];
        goto LABEL_12;
      }
    }
    else
    {
    }
    v16 = [v8 logicalType];
    goto LABEL_11;
  }
LABEL_26:
}

- (void)_executeRequestActionsWithCrawler
{
  v3 = [(DebugHierarchyRequestExecutor *)self requestContext];
  id v4 = +[DebugHierarchyTargetHub sharedHub];
  id v5 = [v4 knownObjectsMap];
  id v7 = +[DebugHierarchyCrawler crawlerWithRequestContext:v3 knownObjectsMap:v5];

  uint64_t v6 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
  [v7 setActionExecutor:v6];

  [v7 run];
}

- (void)_executeRequestActionsWithKnownObjects
{
  v3 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
  id v32 = 0;
  unsigned int v4 = [v3 allObjectActionsTargetIdentifiers:&v32];
  id v5 = v32;

  if (v4)
  {
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v12 = +[DebugHierarchyTargetHub sharedHub];
          uint64_t v13 = [v12 knownObjectsMap];
          id v14 = [v13 objectForKey:v11];

          if (v14)
          {
            unsigned int v15 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
            [v15 executeActionsWithObject:v14];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    *((void *)&v24 + 1) = 0;
    long long v25 = 0uLL;
    v16 = +[DebugHierarchyTargetHub sharedHub];
    os_signpost_id_t v17 = [v16 knownObjectsMap];
    id v6 = [v17 objectEnumerator];

    id v18 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v6);
          }
          uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
          id v23 = [(DebugHierarchyRequestExecutor *)self actionExecutor];
          [v23 executeActionsWithObject:v22];
        }
        id v19 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v19);
    }
  }
}

- (id)_performanceMetricsDictionaryRequestActionDuration:(double)a3
{
  id v6 = @"actionExecution";
  v3 = +[NSNumber numberWithDouble:a3];
  id v7 = v3;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (DebugHierarchyRequestActionExecutor)actionExecutor
{
  return self->_actionExecutor;
}

- (void)setActionExecutor:(id)a3
{
}

- (DebugHierarchyRequestExecutionContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionExecutor, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end