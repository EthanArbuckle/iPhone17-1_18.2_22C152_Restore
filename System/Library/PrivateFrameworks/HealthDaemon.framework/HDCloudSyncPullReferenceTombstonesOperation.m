@interface HDCloudSyncPullReferenceTombstonesOperation
- (BOOL)performWithError:(id *)a3;
@end

@implementation HDCloudSyncPullReferenceTombstonesOperation

- (BOOL)performWithError:(id *)a3
{
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v5 = [(HDCloudSyncOperation *)self configuration];
  v6 = [v5 repository];
  v7 = [v6 profile];
  v8 = [v7 legacyRepositoryProfile];
  id v64 = 0;
  uint64_t v9 = HDCloudSyncAttachmentReferenceTombstoneEpoch(v8, (uint64_t)&v64);
  id v10 = v64;

  uint64_t v68 = v9;
  if (v66[3]) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (v11)
  {
    v12 = [(HDCloudSyncOperation *)self configuration];
    v13 = [v12 cachedCloudState];
    v14 = [(HDCloudSyncOperation *)self configuration];
    v15 = [v14 repository];
    v16 = [v15 primaryCKContainer];
    v17 = [v16 containerIdentifier];
    id v63 = 0;
    uint64_t v51 = [v13 attachmentZoneForContainerID:v17 error:&v63];
    id v18 = v63;

    v19 = (void *)v51;
    if (!v51 && v18)
    {
      id v20 = v18;
      v21 = v20;
      if (a3)
      {
        BOOL v22 = 0;
        *a3 = v20;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v22 = 0;
        v19 = 0;
      }
      goto LABEL_34;
    }
    if (!v51)
    {
      v24 = [(HDCloudSyncOperation *)self configuration];
      v25 = [v24 repository];
      uint64_t v26 = [v25 profileType];

      v19 = 0;
      if (v26 != 1)
      {
        BOOL v22 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke;
    aBlock[3] = &unk_1E62FA3A8;
    id v59 = v19;
    v62 = &v65;
    id v49 = v27;
    id v60 = v49;
    v61 = self;
    v28 = _Block_copy(aBlock);
    v29 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
    v30 = [(HDCloudSyncOperation *)self configuration];
    v31 = [v30 accessibilityAssertion];
    v50 = [v29 contextWithAccessibilityAssertion:v31];

    v32 = [(HDCloudSyncOperation *)self configuration];
    v33 = [v32 repository];
    v34 = [v33 profile];
    v35 = [v34 database];
    id v57 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_3;
    v55[3] = &unk_1E62FA3D0;
    id v56 = v28;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_4;
    v53[3] = &unk_1E62F8610;
    id v48 = v56;
    id v54 = v48;
    LODWORD(v31) = [v35 performTransactionWithContext:v50 error:&v57 block:v55 inaccessibilityHandler:v53];
    id v36 = v57;

    if (v31)
    {
      id v47 = v36;
      uint64_t v37 = v66[3];
      v38 = [(HDCloudSyncOperation *)self configuration];
      v39 = [v38 repository];
      v40 = [v39 profile];
      v41 = [v40 legacyRepositoryProfile];
      id v52 = v10;
      LOBYTE(v37) = HDSetCloudSyncAttachmentReferenceTombstoneEpoch(v37, v41, (uint64_t)&v52);
      id v42 = v52;

      if (v37)
      {
        BOOL v22 = 1;
        id v10 = v42;
        v19 = (void *)v51;
        v43 = v48;
        v21 = v49;
        id v36 = v47;
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      id v45 = v42;
      id v44 = v45;
      v19 = (void *)v51;
      v21 = v49;
      id v36 = v47;
      if (!v45)
      {
        id v10 = 0;
        BOOL v22 = 1;
        goto LABEL_32;
      }
      if (!a3)
      {
        _HKLogDroppedError();
        BOOL v22 = 0;
        id v10 = v44;
        v19 = (void *)v51;
        v21 = v49;
        id v36 = v47;
        goto LABEL_32;
      }
      id v10 = v45;
      goto LABEL_26;
    }
    id v44 = v36;
    if (v44)
    {
      v19 = (void *)v51;
      v21 = v49;
      if (a3)
      {
LABEL_26:
        id v44 = v44;
        BOOL v22 = 0;
        *a3 = v44;
LABEL_32:
        v43 = v48;

        goto LABEL_33;
      }
      _HKLogDroppedError();
      BOOL v22 = 0;
    }
    else
    {
      BOOL v22 = 1;
    }
    v19 = (void *)v51;
    v21 = v49;
    goto LABEL_32;
  }
  id v23 = v10;
  id v18 = v23;
  if (a3)
  {
    BOOL v22 = 0;
    *a3 = v23;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v22 = 0;
  }
  id v10 = v18;
LABEL_36:

  _Block_object_dispose(&v65, 8);
  return v22;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 24);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_2;
  id v20 = &unk_1E62FA380;
  uint64_t v22 = v7;
  id v21 = *(id *)(a1 + 40);
  if ([v5 recordsForClass:v6 epoch:v8 error:a3 enumerationHandler:&v17])
  {
    uint64_t v9 = [HDDeleteAttachmentReferenceOperation alloc];
    id v10 = -[HDDeleteAttachmentReferenceOperation initWithSynchronizedReferences:](v9, "initWithSynchronizedReferences:", *(void *)(a1 + 40), v17, v18, v19, v20);
    BOOL v11 = [*(id *)(a1 + 48) configuration];
    v12 = [v11 repository];
    v13 = [v12 profile];
    v14 = [v13 legacyRepositoryProfile];
    uint64_t v15 = [(HDJournalableOperation *)v10 performOrJournalWithProfile:v14 error:a3];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 <= a3) {
    uint64_t v4 = a3;
  }
  *(void *)(v3 + 24) = v4;
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = [a2 attachmentReferenceTombstones];
  [v5 addObjectsFromArray:v6];

  return 1;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end