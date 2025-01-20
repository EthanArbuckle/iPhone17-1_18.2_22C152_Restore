@interface HDDocumentQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)includeDocumentData;
- (BOOL)validateConfiguration:(id *)a3;
- (HDDocumentQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSArray)sortDescriptors;
- (id)_unsupportedDocumentTypeError;
- (uint64_t)_deliverAuthorizedSamplesToClient:(uint64_t)a3 errorOut:;
- (unint64_t)maxResults;
- (void)_queue_start;
@end

@implementation HDDocumentQueryServer

- (HDDocumentQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDDocumentQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v11->_maxResults = [v10 limit];
    uint64_t v12 = [v10 sortDescriptors];
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    v11->_includeDocumentData = [v10 includeDocumentData];
    v11->_suspended = 0;
    authorizedSamples = v11->_authorizedSamples;
    v11->_authorizedSamples = 0;

    v11->_clientSampleIndex = 0;
  }

  return v11;
}

- (BOOL)validateConfiguration:(id *)a3
{
  v5 = [(HDQueryServer *)self objectType];
  uint64_t v6 = [v5 code];

  if (v6 == 107)
  {
    v9.receiver = self;
    v9.super_class = (Class)HDDocumentQueryServer;
    return [(HDQueryServer *)&v9 validateConfiguration:a3];
  }
  else
  {
    -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    return 0;
  }
}

- (id)_unsupportedDocumentTypeError
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    v5 = [v1 objectType];
    objc_msgSend(v2, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v3, sel__unsupportedDocumentTypeError, @"[%@] Unsupported document type: %@"", v4, v5);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

uint64_t __81__HDDocumentQueryServer__samplesBeforeAuthorizationWithSortDescriptors_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldStopProcessingQuery])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) _shouldSuspendQuery];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    if (!v6)
    {
      [v8 addObject:v3];
      uint64_t v9 = 1;
      goto LABEL_7;
    }
    *(void *)(v7 + 40) = 0;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

uint64_t __59__HDDocumentQueryServer__deliverOneSample_client_errorOut___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (uint64_t)_deliverAuthorizedSamplesToClient:(uint64_t)a3 errorOut:
{
  id v4 = a2;
  if (a1)
  {
    unint64_t v5 = [*(id *)(a1 + 208) count];
    if (*(void *)(a1 + 216) < v5)
    {
      uint64_t v21 = 0x1F17639C0;
      while (1)
      {
        if (objc_msgSend((id)a1, "_shouldStopProcessingQuery", v21)) {
          goto LABEL_17;
        }
        if ([(id)a1 _shouldSuspendQuery])
        {
          *(unsigned char *)(a1 + 200) = 1;
          goto LABEL_17;
        }
        id v6 = [*(id *)(a1 + 208) objectAtIndex:*(void *)(a1 + 216)];
        id v7 = v4;
        uint64_t v24 = 0;
        v25 = &v24;
        uint64_t v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__1;
        v28 = __Block_byref_object_dispose__1;
        id v8 = v6;
        uint64_t v9 = v8;
        id v29 = v8;
        if (!*(unsigned char *)(a1 + 224)) {
          break;
        }
        id v10 = [v8 UUID];
        v11 = HDDataEntityPredicateForDataUUID();

        uint64_t v12 = (void *)[(id)a1 newDataEntityEnumerator];
        [v12 setPredicate:v11];
        v13 = [(id)a1 objectType];
        uint64_t v14 = [v13 code];

        if (v14 == 107)
        {
          [v12 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:0x1F17639A0];
          [v12 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:v21];
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59__HDDocumentQueryServer__deliverOneSample_client_errorOut___block_invoke;
        v23[3] = &unk_1E62F2FE0;
        v23[4] = &v24;
        int v15 = [v12 enumerateWithError:a3 handler:v23];

        id v16 = (id)v25[5];
        if (v16) {
          goto LABEL_12;
        }
LABEL_13:
        _Block_object_dispose(&v24, 8);

        if (!v15)
        {
          a1 = 0;
          goto LABEL_20;
        }
        unint64_t v18 = *(void *)(a1 + 216) + 1;
        *(void *)(a1 + 216) = v18;
        if (v18 >= v5) {
          goto LABEL_17;
        }
      }
      int v15 = 1;
      id v16 = v8;
      if (!v8) {
        goto LABEL_13;
      }
LABEL_12:
      v17 = [(id)a1 queryUUID];
      objc_msgSend(v7, "client_deliverDocument:query:", v16, v17);

      goto LABEL_13;
    }
LABEL_17:
    if (*(void *)(a1 + 216) >= v5)
    {
      v19 = [(id)a1 queryUUID];
      objc_msgSend(v4, "client_deliverDocument:query:", 0, v19);
    }
    a1 = 1;
  }
LABEL_20:

  return a1;
}

- (void)_queue_start
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)HDDocumentQueryServer;
  [(HDQueryServer *)&v40 _queue_start];
  id v4 = [(HDQueryServer *)self clientProxy];
  if (!self->_suspended)
  {
    sortDescriptors = self->_sortDescriptors;
    id v39 = 0;
    uint64_t v9 = sortDescriptors;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__1;
    v45 = __Block_byref_object_dispose__1;
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = [(HDQueryServer *)self objectType];
    uint64_t v11 = [v10 code];

    if (v11 == 107)
    {
      uint64_t v12 = [(HDQueryServer *)self sampleType];
      v13 = [(HDQueryServer *)self readAuthorizationStatusForType:v12 error:&v39];

      if (v13)
      {
        if ([v13 canRead])
        {
          id v14 = [(HDQueryServer *)self newDataEntityEnumerator];
          int v15 = [(HDQueryServer *)self filter];
          [v14 setFilter:v15];

          id v16 = [v13 restrictedSourceEntities];
          [v14 setRestrictedSourceEntities:v16];

          v17 = [(HDQueryServer *)self sampleAuthorizationFilter];
          [v14 setAuthorizationFilter:v17];

          [v14 setSortDescriptors:v9];
          unint64_t v18 = [(HDQueryServer *)self objectType];
          BOOL v19 = [v18 code] == 107;

          if (v19) {
            [v14 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:0x1F17639A0];
          }
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __81__HDDocumentQueryServer__samplesBeforeAuthorizationWithSortDescriptors_errorOut___block_invoke;
          v41[3] = &unk_1E62F2FB8;
          v41[4] = self;
          v41[5] = &buf;
          [v14 enumerateWithError:&v39 handler:v41];
        }
        id v6 = *(id *)(*((void *)&buf + 1) + 40);
        goto LABEL_17;
      }
    }
    else
    {
      -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = v20;
      if (v20) {
        id v39 = v20;
      }

      v13 = 0;
    }
    id v6 = 0;
LABEL_17:

    _Block_object_dispose(&buf, 8);
    id v22 = v39;
    if (v22)
    {
      v23 = v22;
      id v7 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v4, "client_deliverError:forQuery:", v23, v7);
    }
    else
    {
      self->_clientSampleIndex = 0;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v34 = __37__HDDocumentQueryServer__queue_start__block_invoke;
      v35 = &unk_1E62F3008;
      v36 = self;
      id v37 = v4;
      SEL v38 = a2;
      id v6 = v6;
      uint64_t v24 = v33;
      v25 = [(HDQueryServer *)self objectType];
      uint64_t v26 = [v25 code];

      if (v26 == 107)
      {
        v27 = [(HDQueryServer *)self delegate];
        id v28 = v6;
        id v29 = [[HDObjectAuthorizationRequestContext alloc] initWithSamples:v28 metadata:0];

        [(HDObjectAuthorizationRequestContext *)v29 setPersistSession:0];
        [(HDObjectAuthorizationRequestContext *)v29 setPromptWithNoSamples:0];
        [v27 queryServer:self requestsAuthorizationWithContext:v29 completion:v24];
      }
      else
      {
        v27 = -[HDDocumentQueryServer _unsupportedDocumentTypeError](self);
        v34((uint64_t)v24, 0, v27);
      }

      id v7 = 0;
    }
    goto LABEL_23;
  }
  self->_suspended = 0;
  _HKInitializeLogging();
  unint64_t v5 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEBUG))
  {
    v30 = v5;
    v31 = [(HDQueryServer *)self queryUUID];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v31;
    _os_log_debug_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEBUG, "resume query %{public}@.", (uint8_t *)&buf, 0xCu);
  }
  id v32 = 0;
  -[HDDocumentQueryServer _deliverAuthorizedSamplesToClient:errorOut:]((uint64_t)self, v4, (uint64_t)&v32);
  id v6 = v32;
  if (v6)
  {
    id v7 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v6, v7);
LABEL_23:
  }
}

void __37__HDDocumentQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__HDDocumentQueryServer__queue_start__block_invoke_2;
    v14[3] = &unk_1E62F2A70;
    v14[4] = v8;
    id v15 = v5;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v16 = v9;
    uint64_t v17 = v10;
    [v8 scheduleDatabaseAccessOnQueueWithBlock:v14];
  }
  else
  {
    if (!v6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HDDocumentQueryServer.m", 259, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
    }
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v11, "client_deliverError:forQuery:", v7, v12);
  }
}

void __37__HDDocumentQueryServer__queue_start__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v10 = 0;
  char v4 = -[HDDocumentQueryServer _deliverAuthorizedSamplesToClient:errorOut:](v2, v3, (uint64_t)&v10);
  id v5 = v10;
  id v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (!v5)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HDDocumentQueryServer.m", 254, @"Invalid parameter not satisfying: %@", @"secondPassError != nil" object file lineNumber description];
    }
    id v7 = *(void **)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v7, "client_deliverError:forQuery:", v6, v8);
  }
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_authorizedSamples, 0);
}

@end