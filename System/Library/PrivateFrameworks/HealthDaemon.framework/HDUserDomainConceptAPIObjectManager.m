@interface HDUserDomainConceptAPIObjectManager
+ (BOOL)_enumerateConceptDeriveAPIObjectAndAddToResults:(id)a3 mutableResults:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 profile:(id)a5 error:(id *)a6;
+ (id)allAPIObjectsFromUserDomainConceptsWithProfile:(id)a3 error:(id *)a4;
@end

@implementation HDUserDomainConceptAPIObjectManager

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v10 daemon];
  v12 = [v11 userDomainConceptEntityRegistry];
  v13 = [v9 identifier];
  uint64_t v14 = [v12 userDomainConceptEntityClassForTypeIdentifier:v13];

  if (v14)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__123;
    v30 = __Block_byref_object_dispose__123;
    id v31 = 0;
    v15 = [v10 database];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __104__HDUserDomainConceptAPIObjectManager_generateAPIObjectForUserDomainConcept_apiObjectOut_profile_error___block_invoke;
    v22[3] = &unk_1E6303ED8;
    uint64_t v25 = v14;
    id v23 = v9;
    v24 = &v26;
    BOOL v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:a6 block:v22];

    char v17 = !v16;
    if (!a4) {
      char v17 = 1;
    }
    if ((v17 & 1) == 0) {
      *a4 = (id) v27[5];
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    v19 = [v9 description];
    objc_msgSend(v18, "hk_error:format:", 100, @"User Domain Concept entity was not ever registered for identifier %@", v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (a6) {
        *a6 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v16 = 0;
  }

  return v16;
}

uint64_t __104__HDUserDomainConceptAPIObjectManager_generateAPIObjectForUserDomainConcept_apiObjectOut_profile_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = (void *)a1[6];
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 generateAPIObjectForUserDomainConcept:v5 apiObjectOut:&obj transaction:a2 error:a3];
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (id)allAPIObjectsFromUserDomainConceptsWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [v6 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke;
  v14[3] = &unk_1E62F4200;
  id v16 = v7;
  id v17 = a1;
  id v15 = v6;
  id v9 = v7;
  id v10 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v14];

  if (a4) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

uint64_t __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) userDomainConceptManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke_2;
  v11[3] = &unk_1E6303F00;
  id v7 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v12 = v7;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v8 = v5;
  uint64_t v9 = [v6 enumerateUserDomainConceptsWithPredicate:0 enumerationOptions:0 limit:0 orderingTerms:0 transaction:v8 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 56) _enumerateConceptDeriveAPIObjectAndAddToResults:a2 mutableResults:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48) error:a4];
}

+ (BOOL)_enumerateConceptDeriveAPIObjectAndAddToResults:(id)a3 mutableResults:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a3;
  id v14 = [a5 daemon];
  uint64_t v15 = [v14 userDomainConceptEntityRegistry];
  id v16 = [v13 identifier];
  id v17 = (void *)[v15 userDomainConceptEntityClassForTypeIdentifier:v16];

  if (v17)
  {
    id v24 = 0;
    LODWORD(a7) = [v17 generateAPIObjectForUserDomainConcept:v13 apiObjectOut:&v24 transaction:v12 error:a7];

    id v18 = v24;
    if (a7) {
      objc_msgSend(v11, "hk_addNonNilObject:", v18);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    id v20 = NSString;
    v21 = [v13 identifier];

    v22 = [v20 stringWithFormat:@"Could not determine User Domain Concept entity class for identifier %@", v21];
    objc_msgSend(v19, "hk_assignError:code:description:", a7, 100, v22);

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

@end