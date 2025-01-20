@interface _CPLCloudKitTaskContext
- (BOOL)_operationAllowsCellular:(id)a3;
- (BOOL)hasBlockedOperationsIncludingBackground:(BOOL)a3;
- (BOOL)isCancelled;
- (CPLCloudKitTrackableTask)task;
- (NSArray)operationStatusDictionaries;
- (NSCountedSet)countOfOperationClasses;
- (NSCountedSet)countOfOperationWithCellularAccessClasses;
- (NSDate)startDate;
- (NSDictionary)statusPerOperationType;
- (_CPLCloudKitTaskContext)initWithTask:(id)a3;
- (id)_priorityDescriptionForOperation:(id)a3 forTask:(id)a4;
- (id)contextForOperation:(id)a3;
- (void)cancelAllOperations;
- (void)operationDidFinish:(id)a3;
- (void)operationWillStart:(id)a3 context:(id)a4;
- (void)setCancelled:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _CPLCloudKitTaskContext

- (_CPLCloudKitTaskContext)initWithTask:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CPLCloudKitTaskContext;
  v6 = [(_CPLCloudKitTaskContext *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    contexts = v7->_contexts;
    v7->_contexts = (NSMapTable *)v8;

    v10 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    classCounts = v7->_classCounts;
    v7->_classCounts = v10;

    v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    cellularClassCounts = v7->_cellularClassCounts;
    v7->_cellularClassCounts = v12;
  }
  return v7;
}

- (void)operationWillStart:(id)a3 context:(id)a4
{
  id v6 = a3;
  [(NSMapTable *)self->_contexts setObject:a4 forKey:v6];
  [(NSCountedSet *)self->_classCounts addObject:objc_opt_class()];
  if ([(_CPLCloudKitTaskContext *)self _operationAllowsCellular:v6]) {
    [(NSCountedSet *)self->_cellularClassCounts addObject:objc_opt_class()];
  }
}

- (void)operationDidFinish:(id)a3
{
  id v6 = a3;
  -[NSMapTable removeObjectForKey:](self->_contexts, "removeObjectForKey:");
  if (![(NSMapTable *)self->_contexts count])
  {
    v4 = +[NSDate date];
    lastOperationDate = self->_lastOperationDate;
    self->_lastOperationDate = v4;

    self->_lastOperationClass = (Class)objc_opt_class();
  }
}

- (BOOL)hasBlockedOperationsIncludingBackground:(BOOL)a3
{
  if (![(NSMapTable *)self->_contexts count]) {
    return 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_contexts;
  id v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "resolvedConfiguration", (void)v16);
        unsigned int v11 = [v10 cplDiscretionary];

        if (v11)
        {
          v12 = [(NSMapTable *)self->_contexts objectForKey:v9];
          unsigned int v13 = [v12 mightBeBlocked];

          if (v13) {
            continue;
          }
        }
        BOOL v14 = 0;
        goto LABEL_15;
      }
      id v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v14 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_15:

  return v14;
}

- (id)contextForOperation:(id)a3
{
  return [(NSMapTable *)self->_contexts objectForKey:a3];
}

- (void)cancelAllOperations
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_contexts;
  id v3 = [(NSMapTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMapTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSCountedSet)countOfOperationClasses
{
  return self->_classCounts;
}

- (NSCountedSet)countOfOperationWithCellularAccessClasses
{
  return self->_cellularClassCounts;
}

- (id)_priorityDescriptionForOperation:(id)a3 forTask:(id)a4
{
  id v5 = a4;
  id v6 = [a3 resolvedConfiguration];
  if ([v6 cplDiscretionary])
  {
    long long v7 = @"disc";
  }
  else if (v5 && ([v5 hasBackgroundActivity] & 1) != 0)
  {
    long long v7 = @"bg activity";
  }
  else
  {
    long long v7 = @"non-disc";
  }
  unint64_t v8 = __ROR8__((char *)[v6 qualityOfService] - 9, 3);
  if (v8 <= 3) {
    long long v7 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v7, off_100278950[v8]];
  }

  return v7;
}

- (BOOL)_operationAllowsCellular:(id)a3
{
  id v3 = [a3 resolvedConfiguration];
  unsigned __int8 v4 = [v3 allowsCellularAccess];

  return v4;
}

- (NSDictionary)statusPerOperationType
{
  v2 = self;
  id v3 = [(CPLCloudKitTrackableTask *)self->_task session];
  unsigned __int8 v4 = [v3 description];

  id v5 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
  if (v4)
  {
    id v6 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@" in %@", v4];
  }
  else
  {
    id v6 = &stru_10027FEB8;
  }
  if (![(NSMapTable *)v2->_contexts count])
  {
    lastOperationDate = v2->_lastOperationDate;
    id v56 = objc_alloc((Class)NSString);
    if (lastOperationDate)
    {
      Class lastOperationClass = v2->_lastOperationClass;
      uint64_t v58 = objc_opt_class();
      v59 = CPLSimplifiedStringFromClass(v58);
      id v53 = [v56 initWithFormat:@"%@ (for %@%@)", lastOperationClass, v59, v6];

      id v60 = objc_alloc((Class)NSString);
      Class v61 = v2->_lastOperationClass;
      v62 = +[CPLDateFormatter stringFromDateAgo:v2->_lastOperationDate now:0];
      v63 = (__CFString *)[v60 initWithFormat:@"%@ finished %@", v61, v62];
    }
    else
    {
      uint64_t v64 = objc_opt_class();
      v65 = CPLSimplifiedStringFromClass(v64);
      v66 = +[CPLDateFormatter stringFromDateAgo:v2->_startDate now:0];
      id v53 = [v56 initWithFormat:@"Started %@%@ %@", v65, v6, v66];

      v62 = [(CPLCloudKitTrackableTask *)v2->_task idleDescription];
      if (!v62)
      {
        v52 = @"no operation launched yet";
        goto LABEL_56;
      }
      v63 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@", v62, v68];
    }
    v52 = v63;
LABEL_56:

    id v88 = v53;
    v89 = v52;
    v54 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    goto LABEL_57;
  }
  uint64_t v74 = +[NSDate date];
  id v72 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v7 = objc_opt_class();
  uint64_t v73 = CPLSimplifiedStringFromClass(v7);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obj = v2->_contexts;
  id v75 = [(NSMapTable *)obj countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (v75)
  {
    uint64_t v71 = *(void *)v84;
    v76 = v2;
    do
    {
      for (i = 0; i != v75; i = (char *)i + 1)
      {
        if (*(void *)v84 != v71) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        long long v10 = [(NSMapTable *)v2->_contexts objectForKey:v9];
        unsigned int v11 = [v9 group];
        id v12 = objc_alloc((Class)v5[220]);
        uint64_t v13 = [v9 cplOperationClassDescription];
        BOOL v14 = (void *)v13;
        v79 = v11;
        if (v11)
        {
          objc_super v15 = [v11 name];
          id v16 = [v12 initWithFormat:@"%@ (for %@/%@%@)", v14, v73, v15, v6];
        }
        else
        {
          id v16 = [v12 initWithFormat:@"%@ (for %@%@)", v13, v73, v6];
        }
        id v80 = v16;

        v82 = [v10 startDateDescriptionWithNow:v74];
        unsigned int v77 = [v10 mightBeBlocked];
        unsigned int v17 = [v9 isCancelled];
        unsigned int v18 = [v10 isCancelled];
        long long v19 = "";
        if (v18) {
          long long v19 = "- cancelled by engine";
        }
        if (v17) {
          long long v19 = "- cancelled";
        }
        v78 = v19;
        [v10 progress];
        double v21 = v20;
        v22 = [v10 operationDescription];
        if (v22)
        {
          id v23 = objc_alloc((Class)v5[220]);
          v24 = [v9 operationID];
          id v81 = [v23 initWithFormat:@"%@ %@", v24, v22];
        }
        else
        {
          id v81 = [v9 operationID];
        }
        v25 = [v9 configuration];
        v26 = [v25 applicationBundleIdentifierOverrideForNetworkAttribution];
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          [v9 group];
          v30 = v29 = v6;
          v31 = [v30 defaultConfiguration];
          v28 = [v31 applicationBundleIdentifierOverrideForNetworkAttribution];

          id v5 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
          id v6 = v29;
          v2 = v76;
        }

        id v32 = objc_alloc((Class)v5[220]);
        v33 = [(_CPLCloudKitTaskContext *)v2 _priorityDescriptionForOperation:v9 forTask:v2->_task];
        if ([(_CPLCloudKitTaskContext *)v2 _operationAllowsCellular:v9]) {
          v34 = "";
        }
        else {
          v34 = " (no cell)";
        }
        unsigned __int8 v35 = [v9 isExecuting];
        v37 = "exc";
        if (v21 <= 0.0)
        {
          v38 = v72;
          if ((v35 & 1) == 0)
          {
            unsigned int v43 = [v9 isFinished];
            v37 = "pen";
            if (v43) {
              v37 = "fin";
            }
          }
          CFStringRef v44 = @"no bundle";
          if (v28) {
            CFStringRef v44 = v28;
          }
          v45 = "";
          if (v77) {
            v45 = " (blocked?)";
          }
          id v42 = [v32 initWithFormat:@"  [%@](%@)%s [%s]%s - %@ - %@%s", v36, v81, v33, v34, v37, v78, v44, v82, v45, v69];
        }
        else
        {
          v38 = v72;
          if ((v35 & 1) == 0)
          {
            unsigned int v39 = [v9 isFinished];
            v37 = "pen";
            if (v39) {
              v37 = "fin";
            }
          }
          CFStringRef v40 = @"no bundle";
          if (v28) {
            CFStringRef v40 = v28;
          }
          v41 = "";
          if (v77) {
            v41 = " (blocked?)";
          }
          id v42 = [v32 initWithFormat:@"  [%@](%@)%s [%s]%s - %@ - %@ - %.0f%%%s", v21 * 100.0, v81, v33, v34, v37, v78, v40, v82, v21 * 100.0, v41];
        }
        v46 = v42;

        v47 = v80;
        v48 = [v38 objectForKeyedSubscript:v80];
        id v5 = &CPLSyncSessionBlockedStateSyncRequestedKey_ptr;
        if (v48)
        {
          id v49 = v48;
          [v48 appendFormat:@"\n%@", v46];
        }
        else
        {
          id v49 = [v46 mutableCopy];
          [v38 setObject:v49 forKeyedSubscript:v80];
        }
        v50 = [v10 extendedStatusDescriptionStrings];
        if ([v50 count])
        {
          v51 = [v50 componentsJoinedByString:@"\n      "];
          [v49 appendFormat:@"\n      %@", v51];

          v47 = v80;
        }

        v2 = v76;
      }
      id v75 = [(NSMapTable *)obj countByEnumeratingWithState:&v83 objects:v87 count:16];
    }
    while (v75);
  }

  v52 = (__CFString *)v73;
  id v53 = (id)v74;
  v54 = v72;
LABEL_57:

  return (NSDictionary *)v54;
}

- (NSArray)operationStatusDictionaries
{
  return 0;
}

- (CPLCloudKitTrackableTask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_lastOperationDate, 0);
  objc_storeStrong((id *)&self->_cellularClassCounts, 0);
  objc_storeStrong((id *)&self->_classCounts, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end