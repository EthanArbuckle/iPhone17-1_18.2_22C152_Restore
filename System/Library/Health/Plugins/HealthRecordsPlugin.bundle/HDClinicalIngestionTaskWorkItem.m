@interface HDClinicalIngestionTaskWorkItem
+ (id)new;
- (BOOL)_download;
- (BOOL)getDataFromResourceFetchOperation:(id)a3;
- (HDClinicalIngestionTaskResourceSchemaOperation)schemaOperation;
- (HDClinicalIngestionTaskWorkItem)init;
- (HDClinicalIngestionTaskWorkItem)initWithResourceFetchOperation:(id)a3 schemaContext:(id)a4;
- (HDClinicalIngestionTaskWorkItem)initWithResourceFetchOperation:(id)a3 targetResourceURLsBySourceResource:(id)a4 schemaContext:(id)a5;
- (HDClinicalIngestionTaskWorkItem)initWithTargetResourceURLsBySourceResource:(id)a3 schemaContext:(id)a4;
- (HDClinicalIngestionTaskWorkItemOutcome)outcome;
- (HDFHIRIngestionResourceFetchOperation)resourceFetchOperation;
- (NSDictionary)targetResourceURLsBySourceResource;
- (id)_extractReferencesAfterFetchSuccess:(BOOL)a3;
- (id)_newExtractReferencesOperation;
- (void)main;
@end

@implementation HDClinicalIngestionTaskWorkItem

+ (id)new
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v2, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskWorkItem)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskWorkItem)initWithResourceFetchOperation:(id)a3 schemaContext:(id)a4
{
  return [(HDClinicalIngestionTaskWorkItem *)self initWithResourceFetchOperation:a3 targetResourceURLsBySourceResource:0 schemaContext:a4];
}

- (HDClinicalIngestionTaskWorkItem)initWithTargetResourceURLsBySourceResource:(id)a3 schemaContext:(id)a4
{
  return [(HDClinicalIngestionTaskWorkItem *)self initWithResourceFetchOperation:0 targetResourceURLsBySourceResource:a3 schemaContext:a4];
}

- (HDClinicalIngestionTaskWorkItem)initWithResourceFetchOperation:(id)a3 targetResourceURLsBySourceResource:(id)a4 schemaContext:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((v10 != 0) != (v11 == 0))
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDClinicalIngestionTaskWorkItem.m", 72, @"Invalid parameter not satisfying: %@", @"(resourceFetchOperation == nil) != (targetResourceURLsBySourceResource == nil)" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)HDClinicalIngestionTaskWorkItem;
  v13 = [(HDClinicalIngestionTaskWorkItem *)&v27 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_resourceFetchOperation, a3);
    v15 = (NSDictionary *)[v11 copy];
    targetResourceURLsBySourceResource = v14->_targetResourceURLsBySourceResource;
    v14->_targetResourceURLsBySourceResource = v15;

    objc_storeStrong((id *)&v14->_schemaOperation, a5);
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fetchedResourceData = v14->_fetchedResourceData;
    v14->_fetchedResourceData = v17;

    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    existingResourceData = v14->_existingResourceData;
    v14->_existingResourceData = v19;

    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    resolvableResourceObjects = v14->_resolvableResourceObjects;
    v14->_resolvableResourceObjects = v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unresolvableResourceObjects = v14->_unresolvableResourceObjects;
    v14->_unresolvableResourceObjects = v23;
  }
  return v14;
}

- (BOOL)getDataFromResourceFetchOperation:(id)a3
{
  id v4 = a3;
  v5 = [v4 fetchedData];
  if (v5)
  {
    [(NSMutableArray *)self->_fetchedResourceData addObject:v5];
  }
  else
  {
    v6 = [v4 fetchError];

    if (v6)
    {
      v7 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self->_schemaOperation accountContext];
      v8 = [v4 fetchError];
      [v7 didEncounterError:v8];

      _HKInitializeLogging();
      v9 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        schemaOperation = self->_schemaOperation;
        log = v9;
        id v11 = [(HDClinicalIngestionTaskResourceSchemaOperation *)schemaOperation accountContext];
        id v12 = [v11 account];
        v13 = [v12 identifier];
        v14 = [v4 effectiveRequestURL];
        v15 = HKSensitiveLogItem();
        v16 = [v4 fetchError];
        v17 = objc_msgSend(v16, "hrs_safelyLoggableDescription");
        *(_DWORD *)buf = 138544130;
        v29 = self;
        __int16 v30 = 2114;
        v31 = v13;
        __int16 v32 = 2112;
        v33 = v15;
        __int16 v34 = 2114;
        v35 = v17;
        _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: couldn't fetch data from URL %@: %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        v19 = self->_schemaOperation;
        v20 = v18;
        v21 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v19 accountContext];
        v22 = [v21 account];
        v23 = [v22 identifier];
        v24 = [v4 effectiveRequestURL];
        v25 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v29 = self;
        __int16 v30 = 2114;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%{public}@ Account %{public}@: did not fetch data from URL %@", buf, 0x20u);
      }
    }
  }

  return v5 != 0;
}

- (void)main
{
  self->_outcome = [(HDClinicalIngestionTaskWorkItem *)self _extractReferencesAfterFetchSuccess:[(HDClinicalIngestionTaskWorkItem *)self _download]];

  _objc_release_x1();
}

- (BOOL)_download
{
  v2 = self;
  resourceFetchOperation = self->_resourceFetchOperation;
  if (!resourceFetchOperation)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obj = v2->_targetResourceURLsBySourceResource;
    id v55 = [(NSDictionary *)obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (!v55) {
      goto LABEL_39;
    }
    uint64_t v54 = *(void *)v70;
    p_isa = (id *)&v2->super.super.isa;
    while (1)
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v70 != v54) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        v8 = [(NSDictionary *)v2->_targetResourceURLsBySourceResource objectForKeyedSubscript:v7];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v58 = v8;
        id v62 = [v8 countByEnumeratingWithState:&v65 objects:v79 count:16];
        if (!v62)
        {
LABEL_31:
          [(NSMutableSet *)v2->_resolvableResourceObjects addObject:v7];
          goto LABEL_37;
        }
        v56 = i;
        v57 = v7;
        uint64_t v60 = *(void *)v66;
        int v59 = 1;
        do
        {
          for (j = 0; j != v62; j = (char *)j + 1)
          {
            if (*(void *)v66 != v60) {
              objc_enumerationMutation(v58);
            }
            uint64_t v10 = *(void *)(*((void *)&v65 + 1) + 8 * (void)j);
            id v11 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v2->_schemaOperation accountContext];
            id v12 = [v11 ingestStartDate];
            v13 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v2->_schemaOperation accountContext];
            v14 = [v13 task];
            [v14 profile];
            v16 = v15 = v2;
            id v64 = 0;
            v17 = +[HDOriginalFHIRResourceEntity resourceDataForOriginalFHIRResourceWithSourceURL:v10 lastSeenAfter:v12 profile:v16 error:&v64];
            id v18 = v64;

            if (v17)
            {
              [(NSMutableArray *)v15->_existingResourceData addObject:v17];
              _HKInitializeLogging();
              v19 = (void *)HKLogHealthRecords;
              v2 = v15;
              if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO)) {
                goto LABEL_28;
              }
              schemaOperation = v15->_schemaOperation;
              v21 = v19;
              v22 = [(HDClinicalIngestionTaskResourceSchemaOperation *)schemaOperation accountContext];
              v23 = [v22 account];
              v24 = [v23 identifier];
              v25 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543874;
              v74 = (HDClinicalIngestionTaskWorkItem *)p_isa;
              __int16 v75 = 2114;
              v76 = v24;
              __int16 v77 = 2114;
              id v78 = v25;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%{public}@ Account %{public}@: data for URL %{public}@ is already in db, will use it and not re-download", buf, 0x20u);

              v2 = (HDClinicalIngestionTaskWorkItem *)p_isa;
            }
            else
            {
              if (v18)
              {
                if ((objc_msgSend(v18, "hk_isObjectNotFoundError") & 1) == 0)
                {
                  _HKInitializeLogging();
                  v26 = (void *)HKLogHealthRecords;
                  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                  {
                    id v34 = p_isa[6];
                    v35 = v26;
                    v36 = [v34 accountContext];
                    v37 = [v36 account];
                    v38 = [v37 identifier];
                    *(_DWORD *)buf = 138543874;
                    v74 = (HDClinicalIngestionTaskWorkItem *)p_isa;
                    __int16 v75 = 2114;
                    v76 = v38;
                    __int16 v77 = 2114;
                    id v78 = v18;
                    _os_log_error_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: failed to retrieve resource data from db, will try to download. Error: %{public}@", buf, 0x20u);
                  }
                }
              }
              v2 = (HDClinicalIngestionTaskWorkItem *)p_isa;
              v21 = [p_isa[6] runResourceFetchOperationForURL:v10];
              if (v21)
              {
                v59 &= [p_isa getDataFromResourceFetchOperation:v21];
              }
              else
              {
                _HKInitializeLogging();
                objc_super v27 = (void *)HKLogHealthRecords;
                if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
                {
                  id v28 = p_isa[6];
                  v29 = v27;
                  __int16 v30 = [v28 accountContext];
                  v31 = [v30 account];
                  __int16 v32 = [v31 identifier];
                  v33 = HKSensitiveLogItem();
                  *(_DWORD *)buf = 138543874;
                  v74 = (HDClinicalIngestionTaskWorkItem *)p_isa;
                  __int16 v75 = 2114;
                  v76 = v32;
                  __int16 v77 = 2114;
                  id v78 = v33;
                  _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: unable to run resource fetch operation for URL %{public}@", buf, 0x20u);

                  v2 = (HDClinicalIngestionTaskWorkItem *)p_isa;
                }
                int v59 = 0;
              }
            }

LABEL_28:
          }
          id v62 = [v58 countByEnumeratingWithState:&v65 objects:v79 count:16];
        }
        while (v62);
        i = v56;
        v7 = v57;
        if (v59) {
          goto LABEL_31;
        }
        v39 = [v57 JSONObject];
        v40 = [v57 sourceURL];
        v41 = [v57 FHIRVersion];
        v42 = [v57 receivedDate];
        id v63 = 0;
        v43 = +[HDFHIRResourceObject resourceObjectWithJSONObject:v39 sourceURL:v40 FHIRVersion:v41 receivedDate:v42 extractionHints:1 error:&v63];
        id v44 = v63;

        v45 = v43;
        if (!v43)
        {
          _HKInitializeLogging();
          v46 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v47 = v2->_schemaOperation;
            v48 = v46;
            v49 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v47 accountContext];
            v50 = [v49 account];
            v51 = [v50 identifier];
            v52 = objc_msgSend(v44, "hrs_safelyLoggableDescription");
            *(_DWORD *)buf = 138543874;
            v74 = v2;
            __int16 v75 = 2114;
            v76 = v51;
            __int16 v77 = 2112;
            id v78 = v52;
            _os_log_error_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "%{public}@ Account %{public}@: failed to add extraction hint to unresolvable resource: %@", buf, 0x20u);
          }
          v45 = v57;
        }
        [(NSMutableArray *)v2->_unresolvableResourceObjects addObject:v45];

LABEL_37:
      }
      id v55 = [(NSDictionary *)obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      if (!v55)
      {
LABEL_39:

        return [(NSMutableSet *)v2->_resolvableResourceObjects count] != 0;
      }
    }
  }
  [(HDFHIRIngestionResourceFetchOperation *)resourceFetchOperation start];
  id v4 = v2->_resourceFetchOperation;

  return [(HDClinicalIngestionTaskWorkItem *)v2 getDataFromResourceFetchOperation:v4];
}

- (id)_extractReferencesAfterFetchSuccess:(BOOL)a3
{
  BOOL v67 = a3;
  v3 = self;
  id v4 = [(HDClinicalIngestionTaskWorkItem *)self _newExtractReferencesOperation];
  [v4 start];
  v5 = [v4 resolutionError];

  if (v5)
  {
    v6 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v3->_schemaOperation accountContext];
    v7 = [v4 resolutionError];
    [v6 didEncounterError:v7];
  }
  v8 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v3->_schemaOperation accountContext];
  v9 = [v8 account];
  uint64_t v10 = [v9 gateway];
  id v11 = [v10 baseURL];

  long long v69 = +[NSMutableDictionary dictionary];
  long long v68 = v4;
  id v12 = [v4 extractionResult];
  v13 = [v12 incompleteResources];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v13;
  id v74 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v84;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v84 != v73) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v16 = [v15 resource];
        if ([(NSMutableSet *)v3->_resolvableResourceObjects containsObject:v16])
        {
          _HKInitializeLogging();
          v17 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            schemaOperation = v3->_schemaOperation;
            log = v17;
            long long v71 = [(HDClinicalIngestionTaskResourceSchemaOperation *)schemaOperation accountContext];
            v19 = [v71 account];
            v20 = [v19 identifier];
            [v16 identifier];
            v22 = v21 = v3;
            v23 = HKSensitiveLogItem();
            v24 = [v15 references];
            id v25 = [v24 count];
            *(_DWORD *)buf = 138544130;
            v90 = v21;
            __int16 v91 = 2114;
            v92 = v20;
            __int16 v93 = 2112;
            v94 = v23;
            __int16 v95 = 2048;
            id v96 = v25;
            _os_log_impl(&dword_0, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %{public}@: reference extraction for resource %@ still returned %lu unresolved references, unable to resolve", buf, 0x2Au);

            v3 = v21;
          }

          v26 = 0;
          v16 = 0;
        }
        else
        {
          if (v16)
          {
            objc_super v27 = +[NSMutableSet set];
            [v69 setObject:v27 forKey:v16];
            v26 = [v15 references];
            goto LABEL_16;
          }
          v26 = 0;
        }
        objc_super v27 = 0;
LABEL_16:
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v28 = v26;
        id v29 = [v28 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v80;
          do
          {
            for (j = 0; j != v30; j = (char *)j + 1)
            {
              if (*(void *)v80 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = objc_msgSend(v11, "hrs_URLByExpandingReference:", *(void *)(*((void *)&v79 + 1) + 8 * (void)j));
              if (v33) {
                [v27 addObject:v33];
              }
            }
            id v30 = [v28 countByEnumeratingWithState:&v79 objects:v88 count:16];
          }
          while (v30);
        }
      }
      id v74 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v74);
  }

  id v34 = objc_alloc_init((Class)NSMutableArray);
  if ([v69 count])
  {
    v35 = [[HDClinicalIngestionTaskWorkItem alloc] initWithTargetResourceURLsBySourceResource:v69 schemaContext:v3->_schemaOperation];
    [v34 addObject:v35];
  }
  v36 = v68;
  v37 = [v68 extractionResult];
  v38 = [v37 unresolvableReferences];

  if (v38)
  {
    v39 = v3;
    v40 = [v68 extractionResult];
    v41 = [v40 unresolvableReferences];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v42 = v41;
    id v43 = [v42 countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v76;
      do
      {
        for (k = 0; k != v44; k = (char *)k + 1)
        {
          if (*(void *)v76 != v45) {
            objc_enumerationMutation(v42);
          }
          unresolvableResourceObjects = v39->_unresolvableResourceObjects;
          v48 = [*(id *)(*((void *)&v75 + 1) + 8 * (void)k) resource];
          [(NSMutableArray *)unresolvableResourceObjects hk_addNonNilObject:v48];
        }
        id v44 = [v42 countByEnumeratingWithState:&v75 objects:v87 count:16];
      }
      while (v44);
    }

    v36 = v68;
    v3 = v39;
  }
  v49 = [v36 extractionResult];
  v50 = [v49 nextSearchResultURL];

  if (v50)
  {
    _HKInitializeLogging();
    v51 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
    {
      v52 = v3->_schemaOperation;
      v53 = v51;
      uint64_t v54 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v52 accountContext];
      id v55 = [v54 account];
      v56 = [v55 identifier];
      HKSensitiveLogItem();
      id v58 = v57 = v3;
      *(_DWORD *)buf = 138543874;
      v90 = v57;
      __int16 v91 = 2114;
      v92 = v56;
      __int16 v93 = 2114;
      v94 = v58;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "%{public}@ Account %{public}@: reference extraction found next page URL %{public}@", buf, 0x20u);

      v3 = v57;
    }
    id v59 = [(HDClinicalIngestionTaskResourceSchemaOperation *)v3->_schemaOperation newResourceFetchOperationWithPredefinedURL:v50];
    uint64_t v60 = [[HDClinicalIngestionTaskWorkItem alloc] initWithResourceFetchOperation:v59 schemaContext:v3->_schemaOperation];
    [v34 addObject:v60];
  }
  v61 = [v68 extractionResult];
  id v62 = [v61 completeResources];

  if ([(NSMutableArray *)v3->_unresolvableResourceObjects count])
  {
    if ([v62 count])
    {
      id v63 = [v62 arrayByAddingObjectsFromArray:v3->_unresolvableResourceObjects];
    }
    else
    {
      id v63 = [(NSMutableArray *)v3->_unresolvableResourceObjects copy];
    }
    id v64 = v63;

    id v62 = v64;
  }
  long long v65 = [[HDClinicalIngestionTaskWorkItemOutcome alloc] initWithFetchSuccess:v67 saveableResources:v62 followUpWorkItems:v34];

  return v65;
}

- (id)_newExtractReferencesOperation
{
  v3 = [(NSMutableArray *)self->_fetchedResourceData arrayByAddingObjectsFromArray:self->_existingResourceData];
  id v4 = [HDClinicalIngestionExtractReferencesOperation alloc];
  v5 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self->_schemaOperation accountContext];
  v6 = [v5 task];
  v7 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self->_schemaOperation accountContext];
  v8 = [v7 account];
  v9 = [(NSMutableSet *)self->_resolvableResourceObjects allObjects];
  uint64_t v10 = [(HDClinicalIngestionExtractReferencesOperation *)v4 initWithTask:v6 account:v8 resourceData:v3 sourceResourceObjects:v9 nextOperation:0];

  return v10;
}

- (HDClinicalIngestionTaskWorkItemOutcome)outcome
{
  return self->_outcome;
}

- (HDClinicalIngestionTaskResourceSchemaOperation)schemaOperation
{
  return self->_schemaOperation;
}

- (HDFHIRIngestionResourceFetchOperation)resourceFetchOperation
{
  return self->_resourceFetchOperation;
}

- (NSDictionary)targetResourceURLsBySourceResource
{
  return self->_targetResourceURLsBySourceResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetResourceURLsBySourceResource, 0);
  objc_storeStrong((id *)&self->_resourceFetchOperation, 0);
  objc_storeStrong((id *)&self->_schemaOperation, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_unresolvableResourceObjects, 0);
  objc_storeStrong((id *)&self->_resolvableResourceObjects, 0);
  objc_storeStrong((id *)&self->_existingResourceData, 0);

  objc_storeStrong((id *)&self->_fetchedResourceData, 0);
}

@end