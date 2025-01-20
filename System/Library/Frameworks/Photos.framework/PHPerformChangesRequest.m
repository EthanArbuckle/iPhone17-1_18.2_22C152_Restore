@interface PHPerformChangesRequest
+ (BOOL)supportsSecureCoding;
+ (_xpc_type_s)type;
- (BOOL)_isSupportedLimitedLibraryChangeRequest:(id)a3;
- (BOOL)hasChangeRequests;
- (BOOL)hasObjectChangeRequests;
- (NSArray)requestSets;
- (NSOrderedSet)deletes;
- (NSOrderedSet)inserts;
- (NSOrderedSet)otherChangeRequests;
- (NSOrderedSet)updates;
- (NSString)description;
- (PHPerformChangesInstrumentation)instrumentation;
- (PHPerformChangesRequest)init;
- (PHPerformChangesRequest)initWithCoder:(id)a3;
- (PHPerformChangesRequest)initWithXPCCoder:(id)a3;
- (id)_allChangeRequests;
- (id)_failureWithError:(id)a3;
- (id)changeRequestForUUID:(id)a3;
- (id)clientBundleID;
- (id)clientDescription;
- (id)clientDisplayName;
- (id)errorWithLocalizedDescription:(id)a3;
- (id)libraryServicesManager;
- (id)persistentStoreCoordinator;
- (id)serviceHandlerForChanges:(id)a3 clientAuthorization:(id)a4;
- (int64_t)accessLevel;
- (int64_t)accessScopeOptionsRequiredForRequestedChanges;
- (int64_t)determineAuthorizationStatusForChanges;
- (unint64_t)libraryRole;
- (void)decodeWithService:(id)a3 clientAuthorization:(id)a4;
- (void)didSendChangesToServiceWithResult:(BOOL)a3;
- (void)discardUnsupportedLimitedLibraryChangeRequests;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithLibraryServicesManager:(id)a3 libraryName:(const char *)a4 executionContext:(id)a5 reply:(id)a6;
- (void)executeWithService:(id)a3 reply:(id)a4;
- (void)notifyChangesTransactionFailedWithLazyPhotoLibrary:(id)a3 error:(id)a4;
- (void)recordDeleteRequest:(id)a3;
- (void)recordFailedOnDemandRequest:(id)a3;
- (void)recordInsertRequest:(id)a3;
- (void)recordOtherChangeRequest:(id)a3;
- (void)recordUpdateRequest:(id)a3;
- (void)setChangeRequest:(id)a3 forUUID:(id)a4;
- (void)setInstrumentation:(id)a3;
- (void)setLibraryRole:(unint64_t)a3;
@end

@implementation PHPerformChangesRequest

- (PHPerformChangesRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHPerformChangesRequest;
  v2 = [(PHPerformChangesRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_libraryRole = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestsByUUID, 0);
  objc_storeStrong((id *)&self->_failedOnDemandRequests, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_otherChangeHandlers, 0);
  objc_storeStrong((id *)&self->_otherChanges, 0);
  objc_storeStrong((id *)&self->_otherChangeRequests, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);

  objc_storeStrong((id *)&self->_instrumentation, 0);
}

- (void)setLibraryRole:(unint64_t)a3
{
  self->_libraryRole = a3;
}

- (unint64_t)libraryRole
{
  return self->_libraryRole;
}

- (NSOrderedSet)otherChangeRequests
{
  return &self->_otherChangeRequests->super;
}

- (NSOrderedSet)deletes
{
  return &self->_deletes->super;
}

- (NSOrderedSet)updates
{
  return &self->_updates->super;
}

- (NSOrderedSet)inserts
{
  return &self->_inserts->super;
}

- (void)setInstrumentation:(id)a3
{
}

- (PHPerformChangesInstrumentation)instrumentation
{
  return self->_instrumentation;
}

- (id)errorWithLocalizedDescription:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"%@", a3);
}

- (id)_failureWithError:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "PHPerformChangesRequest failed to execute with error: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = +[PHChangeRequest sanitizedFailureWithError:v3];

  return v5;
}

- (void)executeWithLibraryServicesManager:(id)a3 libraryName:(const char *)a4 executionContext:(id)a5 reply:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  v13 = [v10 databaseContext];
  v14 = objc_msgSend(v13, "newShortLivedLibraryWithName:libraryRole:", a4, -[PHPerformChangesRequest libraryRole](self, "libraryRole"));

  v15 = [v14 managedObjectContext];
  if ([(PHPerformChangesRequest *)self hasObjectChangeRequests])
  {
    v16 = [PHChangeValidationController alloc];
    v17 = [(PHPerformChangesRequest *)self inserts];
    v18 = [(PHPerformChangesRequest *)self updates];
    v19 = [(PHPerformChangesRequest *)self deletes];
    v20 = [(PHChangeValidationController *)v16 initWithInsertRequests:v17 updateRequests:v18 deleteRequests:v19 context:v15 photoLibrary:v14];

    v21 = [(PHChangeValidationController *)v20 validate];
    if ([v21 isFailure])
    {
      v22 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [v21 error];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "PhotoKit validation failed for %@ %@", buf, 0x16u);
      }
      v24 = [v21 error];
      v12[2](v12, 0, v24);

      goto LABEL_10;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__5517;
  v41 = __Block_byref_object_dispose__5518;
  v25 = (void *)MEMORY[0x1E4F8B9B8];
  v26 = [MEMORY[0x1E4F1CA98] null];
  v27 = [v25 successWithResult:v26];

  id v42 = v27;
  instrumentation = self->_instrumentation;
  if (instrumentation)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    instrumentation->_serviceWillExecuteTimestamp = v29;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke;
  v34[3] = &unk_1E5848DA8;
  v34[4] = self;
  id v35 = v15;
  id v36 = v14;
  v38 = buf;
  id v37 = v10;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2_121;
  v30[3] = &unk_1E58451F8;
  v33 = buf;
  v30[4] = self;
  id v31 = v36;
  v32 = v12;
  [v11 performTransactionOnLibrary:v31 transaction:v34 completionHandler:v30];

  _Block_object_dispose(buf, 8);
LABEL_10:
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke(uint64_t a1)
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(v2 + 32) = v3;
  }
  v66 = [MEMORY[0x1E4F1CA80] set];
  v65 = [MEMORY[0x1E4F1CA80] set];
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x3032000000;
  v115[3] = __Block_byref_object_copy__5517;
  v115[4] = __Block_byref_object_dispose__5518;
  id v116 = 0;
  v4 = [*(id *)(a1 + 32) deletes];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2;
  v112[3] = &unk_1E58429D0;
  id v113 = *(id *)(a1 + 40);
  id v114 = *(id *)(a1 + 48);
  [v4 enumerateObjectsUsingBlock:v112];

  v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA70]);
  int v7 = [*(id *)(a1 + 32) inserts];
  id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  uint64_t v9 = [*(id *)(a1 + 32) inserts];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3;
  v105[3] = &unk_1E58429F8;
  id v106 = *(id *)(a1 + 48);
  v110 = v115;
  id v10 = v5;
  id v107 = v10;
  id v11 = v8;
  uint64_t v111 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 32);
  id v108 = v11;
  uint64_t v109 = v12;
  [v9 enumerateObjectsUsingBlock:v105];

  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isSuccess])
  {
    if ([v11 count])
    {
      size_t v13 = [v11 count];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4;
      block[3] = &unk_1E58443B8;
      id v100 = v11;
      dispatch_apply(v13, 0, block);
    }
    v14 = [MEMORY[0x1E4F1CA80] set];
    v15 = [*(id *)(a1 + 32) inserts];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_5;
    v89[3] = &unk_1E5842A20;
    id v90 = v10;
    id v16 = *(id *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 64);
    v96 = v115;
    uint64_t v97 = v17;
    uint64_t v18 = *(void *)(a1 + 32);
    id v91 = v16;
    uint64_t v92 = v18;
    id v19 = v14;
    id v93 = v19;
    id v94 = v66;
    id v95 = v65;
    v98 = &v101;
    [v15 enumerateObjectsUsingBlock:v89];

    if ([v19 count])
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v85 objects:v119 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v86 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = [MEMORY[0x1E4F8A6B8] assetsWithAvalancheUUID:*(void *)(*((void *)&v85 + 1) + 8 * i) inManagedObjectContext:*(void *)(a1 + 40)];
            id v25 = (id)[MEMORY[0x1E4F8A6B8] revalidateAvalancheAssets:v24 inLibrary:*(void *)(a1 + 48) deleteNonPicks:0 allowDissolve:1];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v85 objects:v119 count:16];
        }
        while (v21);
      }
    }
  }
  v26 = [*(id *)(a1 + 32) inserts];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_6;
  v84[3] = &unk_1E5842A48;
  v84[4] = *(void *)(a1 + 64);
  [v26 enumerateObjectsUsingBlock:v84];

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isSuccess])
  {
    v27 = [*(id *)(a1 + 32) updates];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_7;
    v78[3] = &unk_1E5842A70;
    id v79 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 48);
    uint64_t v29 = *(void *)(a1 + 64);
    v82 = v115;
    uint64_t v83 = v29;
    uint64_t v30 = *(void *)(a1 + 32);
    id v80 = v28;
    uint64_t v81 = v30;
    [v27 enumerateObjectsUsingBlock:v78];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isSuccess])
  {
    id v31 = *(void **)(*(void *)(a1 + 32) + 64);
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_8;
    v73[3] = &unk_1E5842A98;
    id v32 = *(id *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 64);
    v76 = v115;
    uint64_t v77 = v33;
    uint64_t v34 = *(void *)(a1 + 32);
    id v74 = v32;
    uint64_t v75 = v34;
    [v31 enumerateObjectsUsingBlock:v73];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isSuccess]
    && [*(id *)(a1 + 40) hasChanges])
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v66 count]) {
      [v35 setObject:v66 forKeyedSubscript:&unk_1EEB24F48];
    }
    if ([v65 count]) {
      [v35 setObject:v65 forKeyedSubscript:&unk_1EEB24F60];
    }
    if (!*((unsigned char *)v102 + 24)) {
      goto LABEL_34;
    }
    id v36 = [*(id *)(a1 + 56) pairingManager];
    char v72 = 0;
    uint64_t v37 = *(void *)(a1 + 40);
    id v71 = 0;
    int v38 = [v36 processPairingForGroupIDs:v35 inContext:v37 deferredProcessingNeeded:&v72 error:&v71];
    id v39 = v71;
    if (v38)
    {
      if (!v72)
      {
LABEL_33:

LABEL_34:
        id v42 = PLBackendGetLog();
        os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, *(const void **)(a1 + 32));
        v44 = v42;
        v45 = v44;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "Ingest-Save", "START: save", buf, 2u);
        }

        v46 = *(void **)(a1 + 40);
        id v70 = 0;
        char v47 = [v46 save:&v70];
        id v48 = v70;
        v49 = v45;
        v50 = v49;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v50, OS_SIGNPOST_INTERVAL_END, v43, "Ingest-Save", "END: save", buf, 2u);
        }

        if ((v47 & 1) == 0)
        {
          v51 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v118 = v48;
            _os_log_impl(&dword_19B043000, v51, OS_LOG_TYPE_ERROR, "PhotoKit save failed with error: %@", buf, 0xCu);
          }

          v52 = *(void **)(a1 + 32);
          v53 = (void *)MEMORY[0x1E4F28C58];
          v54 = [v48 localizedDescription];
          v55 = objc_msgSend(v53, "ph_genericErrorWithLocalizedDescription:", @"Save failed with error %@", v54);
          uint64_t v56 = [v52 _failureWithError:v55];
          uint64_t v57 = *(void *)(*(void *)(a1 + 64) + 8);
          v58 = *(void **)(v57 + 40);
          *(void *)(v57 + 40) = v56;
        }
        goto LABEL_45;
      }
      v40 = [*(id *)(a1 + 48) libraryServicesManager];
      v41 = [v40 backgroundJobService];
      [v41 signalBackgroundProcessingNeededOnLibrary:*(void *)(a1 + 48)];
    }
    else
    {
      v40 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v118 = v39;
        _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_ERROR, "Error while attempting to pair CTM assets in the library: %@", buf, 0xCu);
      }
    }

    goto LABEL_33;
  }
LABEL_45:
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isFailure])
  {
    [*(id *)(a1 + 40) rollback];
    v59 = *(void **)(a1 + 32);
    id v60 = objc_initWeak((id *)buf, v59);

    id v61 = objc_alloc(MEMORY[0x1E4F8B948]);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_118;
    v67[3] = &unk_1E5844A50;
    objc_copyWeak(&v69, (id *)buf);
    id v68 = *(id *)(a1 + 48);
    v62 = (void *)[v61 initWithBlock:v67];

    objc_destroyWeak(&v69);
    objc_destroyWeak((id *)buf);
    v63 = *(void **)(a1 + 32);
    v64 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error];
    [v63 notifyChangesTransactionFailedWithLazyPhotoLibrary:v62 error:v64];
  }
  _Block_object_dispose(&v101, 8);

  _Block_object_dispose(v115, 8);
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2_121(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isSuccess])
  {
    uint64_t v2 = [*(id *)(a1 + 32) inserts];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3_122;
    v12[3] = &unk_1E5842AC0;
    id v13 = *(id *)(a1 + 40);
    [v2 enumerateObjectsUsingBlock:v12];

    uint64_t v3 = [*(id *)(a1 + 32) updates];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4_123;
    id v10 = &unk_1E5842AE8;
    id v11 = *(id *)(a1 + 40);
    [v3 enumerateObjectsUsingBlock:&v7];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isSuccess", v7, v8, v9, v10);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
}

uint64_t __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3_122(uint64_t a1, void *a2)
{
  return [a2 performTransactionCompletionHandlingInPhotoLibrary:*(void *)(a1 + 32)];
}

uint64_t __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4_123(uint64_t a1, void *a2)
{
  return [a2 performTransactionCompletionHandlingInPhotoLibrary:*(void *)(a1 + 32)];
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = v3;
  uint64_t v5 = [v3 objectID];
  id v6 = [v4 existingObjectWithID:v5 error:0];

  if (v6) {
    [v7 deleteManagedObject:v6 photoLibrary:*(void *)(a1 + 40)];
  }
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 createManagedObjectForInsertIntoPhotoLibrary:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [*(id *)(a1 + 40) setObject:v9 forKey:v6];
    if ([v6 shouldPerformConcurrentWork]) {
      [*(id *)(a1 + 48) addObject:v6];
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 56) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v2 performConcurrentWork];
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v9 + 40);
    char v10 = [v6 applyMutationsToManagedObject:v7 photoLibrary:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [*(id *)(a1 + 48) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    v15 = [v14 avalancheUUID];

    if (v15)
    {
      id v16 = *(void **)(a1 + 56);
      uint64_t v17 = [v14 avalancheUUID];
      [v16 addObject:v17];
    }
    uint64_t v18 = [v14 mediaGroupUUID];

    if (v18)
    {
      id v19 = *(void **)(a1 + 64);
      id v20 = [v14 mediaGroupUUID];
      [v19 addObject:v20];
    }
    uint64_t v21 = [v14 additionalAttributes];
    uint64_t v22 = [v21 spatialOverCaptureGroupIdentifier];

    if (v22)
    {
      v23 = *(void **)(a1 + 72);
      v24 = [v14 additionalAttributes];
      id v25 = [v24 spatialOverCaptureGroupIdentifier];
      [v23 addObject:v25];
    }
    BOOL v26 = [v14 importedBy] == 5
       || [v14 importedBy] == 4
       || [v14 importedBy] == 1
       || [v14 importedBy] == 2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v26;
  }
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  objc_msgSend(v3, "finalizeRequestWithBatchSuccess:", objc_msgSend(v2, "isSuccess"));
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 objectID];
  uint64_t v9 = [v7 existingObjectWithID:v8 error:0];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v11 + 40);
    char v12 = [v6 applyMutationsToManagedObject:v9 photoLibrary:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [*(id *)(a1 + 48) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }
}

void __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [a2 applyChangesWithLibrary:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [*(id *)(a1 + 40) _failureWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

id __96__PHPerformChangesRequest_executeWithLibraryServicesManager_libraryName_executionContext_reply___block_invoke_118(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v3 = *(id *)(a1 + 32);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)executeWithService:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_service, v6);
  instrumentation = self->_instrumentation;
  uint64_t v9 = self;
  id v10 = v6;
  if (instrumentation)
  {
    uint64_t v11 = PLPhotoKitGetLog();
    instrumentation->_os_signpost_id_t signpostId = os_signpost_id_generate(v11);
    char v12 = v11;
    uint64_t v13 = v12;
    os_signpost_id_t signpostId = instrumentation->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uuid = instrumentation->_uuid;
      id v16 = [v10 clientDescription];
      qos_class_self();
      uint64_t v17 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138544130;
      id v36 = uuid;
      __int16 v37 = 2114;
      int v38 = v16;
      __int16 v39 = 2114;
      v40 = v17;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "PhotoKit request [service]", "PhotoKit changes: [%{public}@] Request received from client: %{public}@ at %{public}@, %{public}@", buf, 0x2Au);
    }
    uint64_t v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = instrumentation->_uuid;
      id v20 = [v10 clientDescription];
      qos_class_self();
      uint64_t v21 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138544130;
      id v36 = v19;
      __int16 v37 = 2114;
      int v38 = v20;
      __int16 v39 = 2114;
      v40 = v21;
      __int16 v41 = 2114;
      id v42 = v9;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Request received from client: %{public}@ at %{public}@, %{public}@", buf, 0x2Au);
    }
  }

  -[PHPerformChangesRequest setLibraryRole:](v9, "setLibraryRole:", [v10 libraryRole]);
  uint64_t v22 = NSString;
  v23 = [v10 clientBundleID];
  v24 = [v10 clientDisplayName];
  id v25 = [v22 stringWithFormat:@"PhotoKit changes: %@ (%@)", v23, v24];

  id v26 = objc_alloc_init(MEMORY[0x1E4F8A6B0]);
  v27 = [v10 libraryServicesManager];
  id v28 = v25;
  uint64_t v29 = [v28 UTF8String];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__PHPerformChangesRequest_executeWithService_reply___block_invoke;
  v32[3] = &unk_1E5844D20;
  v32[4] = v9;
  id v33 = v10;
  id v34 = v7;
  id v30 = v7;
  id v31 = v10;
  [(PHPerformChangesRequest *)v9 executeWithLibraryServicesManager:v27 libraryName:v29 executionContext:v26 reply:v32];
}

id __52__PHPerformChangesRequest_executeWithService_reply___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  uint64_t v7 = v5[2];
  id v8 = a3;
  uint64_t v9 = v5;
  id v10 = v6;
  id v11 = v8;
  if (v7)
  {
    double v12 = *(double *)(v7 + 32) - *(double *)(v7 + 24);
    uint64_t v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(v7 + 40);
      v15 = [v10 clientDescription];
      qos_class_self();
      uint64_t v16 = PLStringFromQoSClass();
      uint64_t v17 = (void *)v16;
      *(_DWORD *)buf = 138544898;
      uint64_t v18 = @"NO";
      uint64_t v33 = v14;
      __int16 v34 = 2114;
      if (a2) {
        uint64_t v18 = @"YES";
      }
      id v35 = v15;
      __int16 v36 = 2114;
      uint64_t v37 = v16;
      __int16 v38 = 2114;
      __int16 v39 = v18;
      __int16 v40 = 2112;
      id v41 = v11;
      __int16 v42 = 2048;
      double v43 = v12;
      __int16 v44 = 2114;
      v45 = v9;
      id v19 = v18;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] Reply sent to client %{public}@ at %{public}@, success: %{public}@, error: %@, wait time: %f, %{public}@", buf, 0x48u);
    }
    PLPhotoKitGetLog();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v20;
    os_signpost_id_t v22 = *(void *)(v7 + 16);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      int v31 = a2;
      uint64_t v23 = *(void *)(v7 + 40);
      v24 = [v10 clientDescription];
      qos_class_self();
      uint64_t v25 = PLStringFromQoSClass();
      id v26 = (void *)v25;
      *(_DWORD *)buf = 138544898;
      v27 = @"NO";
      uint64_t v33 = v23;
      __int16 v34 = 2114;
      if (v31) {
        v27 = @"YES";
      }
      id v35 = v24;
      __int16 v36 = 2114;
      uint64_t v37 = v25;
      __int16 v38 = 2114;
      __int16 v39 = v27;
      __int16 v40 = 2112;
      id v41 = v11;
      __int16 v42 = 2048;
      double v43 = v12;
      __int16 v44 = 2114;
      v45 = v9;
      id v28 = v27;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PhotoKit request [service]", "PhotoKit changes: [%{public}@] Reply sent to client %{public}@ at %{public}@, success: %{public}@, error: %@, wait time: %f, %{public}@", buf, 0x48u);
    }
    *(void *)(v7 + 16) = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

  uint64_t v29 = (id *)(a1[4] + 80);

  return objc_storeWeak(v29, 0);
}

- (void)discardUnsupportedLimitedLibraryChangeRequests
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__5517;
  uint64_t v18 = __Block_byref_object_dispose__5518;
  id v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke;
  aBlock[3] = &unk_1E5842988;
  aBlock[4] = self;
  aBlock[5] = &v10;
  aBlock[6] = &v14;
  id v3 = _Block_copy(aBlock);
  [(NSMutableOrderedSet *)self->_inserts pl_removeObjectsPassingTest:v3];
  [(NSMutableOrderedSet *)self->_updates pl_removeObjectsPassingTest:v3];
  [(NSMutableOrderedSet *)self->_deletes pl_removeObjectsPassingTest:v3];
  [(NSMutableOrderedSet *)self->_otherChangeHandlers pl_removeObjectsPassingTest:&__block_literal_global_5550];
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Removed unsupported change requests in limited library mode:", buf, 2u);
    }

    uint64_t v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)v15[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "BEFORE: %{public}@", buf, 0xCu);
    }

    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(PHPerformChangesRequest *)self description];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "AFTER: %{public}@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) _isSupportedLimitedLibraryChangeRequest:a2];
  if ((v3 & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = [*(id *)(a1 + 32) description];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return v3 ^ 1u;
}

uint64_t __73__PHPerformChangesRequest_discardUnsupportedLimitedLibraryChangeRequests__block_invoke_2()
{
  return 0;
}

- (BOOL)_isSupportedLimitedLibraryChangeRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PHAsset managedEntityName];
  uint64_t v5 = [v3 managedEntityName];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    id v8 = +[PHAlbum managedEntityName];
    uint64_t v9 = [v3 managedEntityName];
    char v7 = [v8 isEqualToString:v9];
  }
  return v7;
}

- (void)decodeWithService:(id)a3 clientAuthorization:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  PLPhotoKitGetLog();
  id v8 = (PHPerformChangesInstrumentation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, &v8->super, OS_LOG_TYPE_DEBUG, "PLPhotoKitChangeRequest queued", buf, 2u);
  }

  uint64_t v9 = [(PLXPCObject *)self object];
  if (v9)
  {
    p_service = &self->_service;
    objc_storeWeak((id *)&self->_service, v6);
    id v11 = PLStringFromXPCDictionary();
    if (v11)
    {
      id v8 = [PHPerformChangesInstrumentation alloc];
      if (v8)
      {
        uint64_t v12 = (objc_class *)MEMORY[0x1E4F29128];
        id v13 = v11;
        uint64_t v14 = (void *)[[v12 alloc] initWithUUIDString:v13];

        id v8 = -[PHPerformChangesInstrumentation initWithUUID:](v8, v14);
        v15 = v8;
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    objc_storeStrong((id *)&self->_instrumentation, v15);
    if (v11) {

    }
    if (createObjectChangeRequestsFromXPCObject(self, v9, "deletes", v7))
    {
      uint64_t v16 = PLPhotosStatusGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v7 trustedCallerBundleID];
        int v18 = [v7 clientProcessIdentifier];
        *(_DWORD *)buf = 138412546;
        v49 = v17;
        __int16 v50 = 1024;
        LODWORD(v51) = v18;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEFAULT, "Deletion from PhotoKit triggered by %@ (%d)", buf, 0x12u);
      }
    }
    createObjectChangeRequestsFromXPCObject(self, v9, "inserts", v7);
    createObjectChangeRequestsFromXPCObject(self, v9, "updates", v7);
    otherChanges = self->_otherChanges;
    id v20 = self;
    uint64_t v21 = otherChanges;
    id v22 = v7;
    __int16 v38 = v11;
    __int16 v39 = v21;
    if (v21)
    {
      __int16 v34 = p_service;
      id v35 = v9;
      id v36 = v7;
      id v37 = v6;
      uint64_t v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "otherChanges";
        __int16 v50 = 2112;
        v51 = v39;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEBUG, "##### %s: %@", buf, 0x16u);
      }

      v24 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v25 = v39;
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v40 objects:buf count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v41 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            int v31 = -[PHPerformChangesRequest serviceHandlerForChanges:clientAuthorization:](v20, "serviceHandlerForChanges:clientAuthorization:", v30, v22, v34, v35, v36, v37, v38);
            if (v31)
            {
              [(NSMutableOrderedSet *)v24 addObject:v31];
            }
            else
            {
              id v32 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int16 v44 = 136315394;
                v45 = "otherChanges";
                __int16 v46 = 2112;
                uint64_t v47 = v30;
                _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "Failed to create change service handler from '%s' changes %@", v44, 0x16u);
              }
            }
          }
          uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v40 objects:buf count:16];
        }
        while (v27);
      }

      id v7 = v36;
      id v6 = v37;
      p_service = v34;
      uint64_t v9 = v35;
    }
    else
    {
      v24 = 0;
    }

    otherChangeHandlers = v20->_otherChangeHandlers;
    v20->_otherChangeHandlers = v24;

    objc_storeWeak((id *)p_service, 0);
  }
}

- (id)serviceHandlerForChanges:(id)a3 clientAuthorization:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8AA80]) initWithPhotoLibraryAttributesChanges:v5 clientAuthorization:v6];
  }
  else
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = objc_opt_class();
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_FAULT, "Failed to resolve service handler for changes %@, unknown class %{public}@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)clientDisplayName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v3 = [WeakRetained clientDisplayName];

  return v3;
}

- (id)clientBundleID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v3 = [WeakRetained clientBundleID];

  return v3;
}

- (id)clientDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v3 = [WeakRetained clientDescription];

  return v3;
}

- (id)libraryServicesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v3 = [WeakRetained libraryServicesManager];

  return v3;
}

- (id)persistentStoreCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v3 = [WeakRetained persistentStoreCoordinator];

  return v3;
}

- (int64_t)determineAuthorizationStatusForChanges
{
  int64_t v2 = [(PHPerformChangesRequest *)self accessScopeOptionsRequiredForRequestedChanges];
  id v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  unint64_t v4 = [v3 checkPhotosAccessAllowedWithScope:v2];

  if (v4 > 4) {
    return 0;
  }
  else {
    return qword_19B2CCB10[v4];
  }
}

- (int64_t)accessLevel
{
  if ([(PHPerformChangesRequest *)self accessScopeOptionsRequiredForRequestedChanges] == 1)return 1; {
  else
  }
    return 2;
}

- (int64_t)accessScopeOptionsRequiredForRequestedChanges
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHPerformChangesRequest_accessScopeOptionsRequiredForRequestedChanges__block_invoke;
  aBlock[3] = &unk_1E5842960;
  aBlock[4] = &v12;
  id v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  unint64_t v4 = [(PHPerformChangesRequest *)self inserts];
  v3[2](v3, v4);

  id v5 = [(PHPerformChangesRequest *)self updates];
  v3[2](v3, v5);

  id v6 = [(PHPerformChangesRequest *)self deletes];
  v3[2](v3, v6);

  if (self->_inService)
  {
    v3[2](v3, self->_otherChangeHandlers);
  }
  else
  {
    id v7 = [(PHPerformChangesRequest *)self otherChangeRequests];
    v3[2](v3, v7);
  }
  int64_t v8 = v13[3];
  if (!v8)
  {
    uint64_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = self;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "No photos access scope requirements declared for changes %{public}@", buf, 0xCu);
    }

    int64_t v8 = 7;
    v13[3] = 7;
  }

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __72__PHPerformChangesRequest_accessScopeOptionsRequiredForRequestedChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [*(id *)(*((void *)&v9 + 1) + 8 * v7++) accessScopeOptionsRequirement] | v8;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  long long v43 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This object may only be encoded by an NSXPCCoder."];
  }
  uint64_t v5 = [(NSMutableOrderedSet *)self->_inserts count];
  uint64_t v6 = [(NSMutableOrderedSet *)self->_updates count];
  uint64_t v7 = [(NSMutableOrderedSet *)self->_deletes count];
  uint64_t v8 = [(NSMutableOrderedSet *)self->_otherChangeRequests count];
  long long v9 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "##### PHPerformChangesRequest encodeToXPCObject:", buf, 2u);
  }

  if (v5)
  {
    long long v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      inserts = self->_inserts;
      *(_DWORD *)buf = 138412290;
      v53 = inserts;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "##### inserts: %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    long long v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      updates = self->_updates;
      *(_DWORD *)buf = 138412290;
      v53 = updates;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "##### updates: %@", buf, 0xCu);
    }
  }
  if (v7)
  {
    uint64_t v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      deletes = self->_deletes;
      *(_DWORD *)buf = 138412290;
      v53 = deletes;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "##### deletes: %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    uint64_t v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      otherChangeRequests = self->_otherChangeRequests;
      *(_DWORD *)buf = 138412290;
      v53 = otherChangeRequests;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "##### otherChanges: %@", buf, 0xCu);
    }
  }
  if (v6 | v5 | v7 | v8)
  {
    uint64_t v18 = xpc_dictionary_create(0, 0, 0);
    addObjectChangeRequests(self->_inserts, v18, "inserts");
    addObjectChangeRequests(self->_updates, v18, "updates");
    addObjectChangeRequests(self->_deletes, v18, "deletes");
    instrumentation = self->_instrumentation;
    if (instrumentation) {
      instrumentation = objc_getProperty(instrumentation, v19, 40, 1);
    }
    id v21 = instrumentation;
    id v22 = [v21 UUIDString];
    PLXPCDictionarySetString();

    [v43 encodeXPCObject:v18 forKey:@"_xpcObject"];
    uint64_t v23 = self->_otherChangeRequests;
    id v24 = v43;
    if ([(NSMutableOrderedSet *)v23 count])
    {
      long long v41 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v42 = v23;
      uint64_t v26 = v23;
      uint64_t v27 = [(NSMutableOrderedSet *)v26 countByEnumeratingWithState:&v44 objects:buf count:16];
      if (!v27) {
        goto LABEL_43;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v45;
      while (1)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          int v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v32 = [v31 changesForServiceHandler];
          if (![v32 hasChanges])
          {
            __int16 v34 = PLPhotoKitGetLog();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
            if (v32)
            {
              if (v35)
              {
                *(_DWORD *)id v48 = 138412546;
                v49 = v32;
                __int16 v50 = 2112;
                v51 = v31;
                id v36 = v34;
                id v37 = "No changes in %@ requested for change request %@";
                uint32_t v38 = 22;
                goto LABEL_39;
              }
            }
            else if (v35)
            {
              *(_DWORD *)id v48 = 138412290;
              v49 = v31;
              id v36 = v34;
              id v37 = "Missing expected changes for service handler for change request %@";
              uint32_t v38 = 12;
LABEL_39:
              _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, v37, v48, v38);
            }

            goto LABEL_41;
          }
          uint64_t v33 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)id v48 = 138412546;
            v49 = v32;
            __int16 v50 = 2112;
            v51 = v31;
            _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_DEBUG, "Adding changes %@ for change request %@", v48, 0x16u);
          }

          [v25 addObject:v32];
LABEL_41:
        }
        uint64_t v28 = [(NSMutableOrderedSet *)v26 countByEnumeratingWithState:&v44 objects:buf count:16];
        if (!v28)
        {
LABEL_43:

          __int16 v39 = [MEMORY[0x1E4F1C978] arrayWithArray:v25];
          long long v40 = [NSString stringWithUTF8String:"otherChanges"];
          id v24 = v41;
          [v41 encodeObject:v39 forKey:v40];

          uint64_t v23 = v42;
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "empty PHPerformChangesRequest", buf, 2u);
    }
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PHPerformChangesRequest_description__block_invoke;
  aBlock[3] = &unk_1E5842938;
  id v4 = v3;
  id v9 = v4;
  uint64_t v5 = (void (**)(void *, NSMutableOrderedSet *, __CFString *))_Block_copy(aBlock);
  v5[2](v5, self->_deletes, @"deletes");
  v5[2](v5, self->_inserts, @"inserts");
  v5[2](v5, self->_updates, @"updates");
  v5[2](v5, self->_otherChangeRequests, @"other");
  id v6 = v4;

  return (NSString *)v6;
}

void __38__PHPerformChangesRequest_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v27 + 1) + 8 * v13) changeTypeForSummary];
        if (v14) {
          uint64_t v15 = (__CFString *)v14;
        }
        else {
          uint64_t v15 = @"(nil)";
        }
        [v8 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        if ([v7 length]) {
          [v7 appendString:@", "];
        }
        [v7 appendFormat:@"%@: %lu", v21, objc_msgSend(v16, "countForObject:", v21)];
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  if ([v7 length]) {
    [*(id *)(a1 + 32) appendFormat:@"%@: [%@] ", v5, v7];
  }
}

- (void)didSendChangesToServiceWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(PHPerformChangesRequest *)self _allChangeRequests];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) didSendChangeToServiceHandlerWithResult:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_allChangeRequests
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PHPerformChangesRequest *)self requestSets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) array];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)notifyChangesTransactionFailedWithLazyPhotoLibrary:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  failedOnDemandRequests = self->_failedOnDemandRequests;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PHPerformChangesRequest_notifyChangesTransactionFailedWithLazyPhotoLibrary_error___block_invoke;
  v11[3] = &unk_1E5842910;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableOrderedSet *)failedOnDemandRequests enumerateObjectsUsingBlock:v11];
}

void __84__PHPerformChangesRequest_notifyChangesTransactionFailedWithLazyPhotoLibrary_error___block_invoke(void *a1, void *a2)
{
  BOOL v3 = (void *)a1[5];
  int v4 = *(unsigned __int8 *)(a1[4] + 72);
  id v5 = a2;
  uint64_t v6 = [v3 objectValue];
  uint64_t v7 = a1[6];
  id v8 = (id)v6;
  if (v4) {
    [v5 changeFailedOnDaemonWithLibrary:v6 error:v7];
  }
  else {
    [v5 changeFailedOnClientWithLibrary:v6 error:v7];
  }
}

- (void)recordFailedOnDemandRequest:(id)a3
{
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    failedOnDemandRequests = self->_failedOnDemandRequests;
    if (!failedOnDemandRequests)
    {
      id v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      uint64_t v6 = self->_failedOnDemandRequests;
      self->_failedOnDemandRequests = v5;

      failedOnDemandRequests = self->_failedOnDemandRequests;
    }
    [(NSMutableOrderedSet *)failedOnDemandRequests addObject:v7];
  }
}

- (void)setChangeRequest:(id)a3 forUUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  changeRequestsByUUID = self->_changeRequestsByUUID;
  if (!changeRequestsByUUID)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = self->_changeRequestsByUUID;
    self->_changeRequestsByUUID = v8;

    changeRequestsByUUID = self->_changeRequestsByUUID;
  }
  [(NSMutableDictionary *)changeRequestsByUUID setObject:v10 forKey:v6];
}

- (id)changeRequestForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_changeRequestsByUUID objectForKey:a3];
}

- (void)recordOtherChangeRequest:(id)a3
{
  id v4 = a3;
  otherChangeRequests = self->_otherChangeRequests;
  id v8 = v4;
  if (!otherChangeRequests)
  {
    id v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_otherChangeRequests;
    self->_otherChangeRequests = v6;

    id v4 = v8;
    otherChangeRequests = self->_otherChangeRequests;
  }
  [(NSMutableOrderedSet *)otherChangeRequests addObject:v4];
  [(PHPerformChangesRequest *)self recordFailedOnDemandRequest:v8];
}

- (void)recordDeleteRequest:(id)a3
{
  id v4 = a3;
  deletes = self->_deletes;
  id v8 = v4;
  if (!deletes)
  {
    id v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_deletes;
    self->_deletes = v6;

    id v4 = v8;
    deletes = self->_deletes;
  }
  [(NSMutableOrderedSet *)deletes addObject:v4];
  [(NSMutableOrderedSet *)self->_inserts removeObject:v8];
  [(NSMutableOrderedSet *)self->_updates removeObject:v8];
  [(PHPerformChangesRequest *)self recordFailedOnDemandRequest:v8];
}

- (void)recordUpdateRequest:(id)a3
{
  id v4 = a3;
  inserts = self->_inserts;
  id v11 = v4;
  if (!inserts
    || (char v6 = [(NSMutableOrderedSet *)inserts containsObject:v4], v7 = v11, (v6 & 1) == 0))
  {
    updates = self->_updates;
    if (!updates)
    {
      id v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      id v10 = self->_updates;
      self->_updates = v9;

      updates = self->_updates;
    }
    [(NSMutableOrderedSet *)updates addObject:v11];
    [(PHPerformChangesRequest *)self recordFailedOnDemandRequest:v11];
    id v7 = v11;
  }
}

- (void)recordInsertRequest:(id)a3
{
  id v4 = a3;
  inserts = self->_inserts;
  id v8 = v4;
  if (!inserts)
  {
    char v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_inserts;
    self->_inserts = v6;

    id v4 = v8;
    inserts = self->_inserts;
  }
  [(NSMutableOrderedSet *)inserts addObject:v4];
  [(NSMutableOrderedSet *)self->_updates removeObject:v8];
  [(PHPerformChangesRequest *)self recordFailedOnDemandRequest:v8];
}

- (NSArray)requestSets
{
  if (self->_inserts || self->_updates || self->_deletes || self->_otherChangeRequests)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = v3;
    if (self->_inserts) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_updates) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_deletes) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_otherChangeRequests) {
      objc_msgSend(v4, "addObject:");
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (BOOL)hasObjectChangeRequests
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_inserts count];
  uint64_t v4 = [(NSMutableOrderedSet *)self->_updates count] + v3;
  return v4 + [(NSMutableOrderedSet *)self->_deletes count] != 0;
}

- (BOOL)hasChangeRequests
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_inserts count];
  uint64_t v4 = [(NSMutableOrderedSet *)self->_updates count] + v3;
  uint64_t v5 = v4 + [(NSMutableOrderedSet *)self->_deletes count];
  return v5 + [(NSMutableOrderedSet *)self->_otherChangeRequests count] != 0;
}

- (PHPerformChangesRequest)initWithXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", objc_msgSend((id)objc_opt_class(), "type"), @"_xpcObject");
  char v6 = [(PLXPCObject *)self initWithXPCObject:v5];
  id v7 = v6;
  if (v6)
  {
    v6->_inService = 1;
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v11 = [NSString stringWithUTF8String:"otherChanges"];
    uint64_t v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];
    otherChanges = v7->_otherChanges;
    v7->_otherChanges = (NSArray *)v12;

    v7->_libraryRole = 0;
    long long v14 = v7;
  }

  return v7;
}

- (PHPerformChangesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    [v9 handleFailureInFunction:v10, @"PLHelperExtension.h", 78, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    id v8 = 0;
  }

  id v11 = [(PHPerformChangesRequest *)self initWithXPCCoder:v8];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_xpc_type_s)type
{
  return (_xpc_type_s *)MEMORY[0x1E4F14590];
}

@end