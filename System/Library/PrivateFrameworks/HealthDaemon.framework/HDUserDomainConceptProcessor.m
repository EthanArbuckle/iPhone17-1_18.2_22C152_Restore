@interface HDUserDomainConceptProcessor
+ (BOOL)processUserDomainConceptsAfter:(int64_t)a3 transactionLimit:(int64_t)a4 outAnchor:(int64_t *)a5 outProcessedConceptsCount:(int64_t *)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9;
- (HDUserDomainConceptProcessor)init;
@end

@implementation HDUserDomainConceptProcessor

- (HDUserDomainConceptProcessor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)processUserDomainConceptsAfter:(int64_t)a3 transactionLimit:(int64_t)a4 outAnchor:(int64_t *)a5 outProcessedConceptsCount:(int64_t *)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = a8;
  v16 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"sync_anchor" entityClass:objc_opt_class() ascending:1];
  v40[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int64_t v39 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  v18 = [NSNumber numberWithLongLong:a3];
  v19 = HDUserDomainConceptEntityPredicateForConceptsWithAnchorAfter((uint64_t)v18);

  v20 = [v14 userDomainConceptManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __142__HDUserDomainConceptProcessor_processUserDomainConceptsAfter_transactionLimit_outAnchor_outProcessedConceptsCount_profile_transaction_error___block_invoke;
  v26[3] = &unk_1E62FAF50;
  id v21 = v14;
  id v27 = v21;
  id v31 = a1;
  id v22 = v15;
  id v28 = v22;
  v29 = &v32;
  v30 = &v36;
  int v23 = [v20 enumerateUserDomainConceptsWithPredicate:v19 enumerationOptions:2 limit:a4 orderingTerms:v17 transaction:v22 error:a9 enumerationHandler:v26];

  if (v23)
  {
    if (a6) {
      *a6 = v33[3];
    }
    if (a5) {
      *a5 = v37[3];
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v23;
}

uint64_t __142__HDUserDomainConceptProcessor_processUserDomainConceptsAfter_transactionLimit_outAnchor_outProcessedConceptsCount_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [*(id *)(a1 + 32) daemon];
  v8 = [v7 userDomainConceptEntityRegistry];
  v9 = [v6 identifier];
  v10 = (void *)[v8 userDomainConceptEntityClassForTypeIdentifier:v9];

  if (!v10)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    v33 = NSString;
    id v21 = [v6 identifier];
    uint64_t v34 = [v33 stringWithFormat:@"Could not determine User Domain Concept entity class for identifier %@", v21];
    objc_msgSend(v32, "hk_assignError:code:description:", a4, 100, v34);

    uint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = (uint64_t)v6;
  v12 = [*(id *)(a1 + 32) daemon];
  v13 = [v12 behavior];
  int v14 = [v13 supportsOntology];

  if (v14)
  {
    id v15 = *(void **)(a1 + 32);
    id v16 = *(id *)(a1 + 40);
    id v17 = v15;
    id v18 = (id)v11;
    self;
    uint64_t v11 = [v10 refreshOntologyContentForUserDomainConcept:v18 profile:v17 transaction:v16 error:a4];
  }
  if (!v11)
  {
    id v21 = 0;
    goto LABEL_16;
  }
  v19 = *(void **)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  id v21 = (id)v11;
  id v22 = v19;
  id v23 = v20;
  uint64_t v38 = self;
  v24 = [v10 predicateMatchingSemanticDuplicatesOf:v21];
  if (!v24)
  {

LABEL_15:
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    uint64_t v11 = 1;
    goto LABEL_16;
  }
  v41 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"modification_date" entityClass:objc_opt_class() ascending:0];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__57;
  v49[4] = __Block_byref_object_dispose__57;
  id v40 = v21;
  id v50 = v40;
  v25 = [v22 userDomainConceptManager];
  v61[0] = v41;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __124__HDUserDomainConceptProcessor__enumerateAndDeduplicateConceptsWithOriginConcept_withEntityClass_profile_transaction_error___block_invoke;
  v43[3] = &unk_1E62FAF78;
  v46 = &v51;
  v47 = v49;
  v48 = v10;
  id v27 = v22;
  id v44 = v27;
  id v28 = v23;
  id v45 = v28;
  char v29 = [v25 enumerateUserDomainConceptsWithPredicate:v24 enumerationOptions:2 limit:0 orderingTerms:v26 transaction:v28 error:a4 enumerationHandler:v43];

  _HKInitializeLogging();
  v30 = HKLogHealthOntology();
  LODWORD(v26) = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);

  if (v26)
  {
    id v31 = HKLogHealthOntology();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = v52[3];
      uint64_t v36 = [v40 UUID];
      v37 = objc_msgSend(v36, "hk_shortRepresentation");
      *(_DWORD *)buf = 138543874;
      uint64_t v56 = v38;
      __int16 v57 = 2048;
      uint64_t v58 = v39;
      __int16 v59 = 2114;
      v60 = v37;
      _os_log_debug_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEBUG, "%{public}@: Enumerated %ld potential duplicates for UDC %{public}@", buf, 0x20u);
    }
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  if (v29) {
    goto LABEL_15;
  }
  uint64_t v11 = 0;
  id v21 = v40;
LABEL_16:

  return v11;
}

uint64_t __124__HDUserDomainConceptProcessor__enumerateAndDeduplicateConceptsWithOriginConcept_withEntityClass_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) UUID];
  v8 = [v6 UUID];
  if ([v7 isEqual:v8])
  {
  }
  else
  {
    int v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isSemanticallyEquivalent:v6];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 64) deduplicateUserDomainConcept:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) with:v6 profile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) error:a4];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v13 = 0;
        goto LABEL_6;
      }
    }
  }
  uint64_t v13 = 1;
LABEL_6:

  return v13;
}

@end