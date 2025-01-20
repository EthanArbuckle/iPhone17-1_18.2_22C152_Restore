@interface HDOntologyConceptManager
+ (BOOL)_conceptRelationshipFromGraphRelationship:(void *)a3 relationshipOut:(uint64_t)a4 options:(void *)a5 transaction:(uint64_t)a6 error:;
+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8;
+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)enumerateRelationshipsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)followRelationshipsWithTypes:(id)a3 startingIdentifier:(id)a4 options:(unint64_t)a5 ontologyTransaction:(id)a6 conceptOut:(id *)a7 deletedRelationshipVersionOut:(int64_t *)a8 error:(id *)a9;
+ (id)_conceptFromGraphNode:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)_relationshipsForConceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)conceptForCodingCollection:(id)a3 configuration:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)inflateGraphWithRootConceptsPredicate:(id)a3 limit:(int64_t)a4 maximumDepth:(int64_t)a5 attributeTypes:(id)a6 relationshipTypes:(id)a7 ontologyTransaction:(id)a8 error:(id *)a9;
+ (id)predicateForConceptsFollowingRelationshipOfTypes:(id)a3 fromSubjectId:(id)a4;
+ (id)predicateForConceptsWithoutAttributeType:(int64_t)a3 attributeValue:(id)a4;
+ (id)predicateForRelationshipsWithTypes:(id)a3 onConceptId:(id)a4;
+ (id)predicateMatchingConceptWithID:(id)a3;
+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 attributeValue:(id)a4;
+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 beingsWithAttributeValue:(id)a4;
+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 likeAttributeValue:(id)a4;
+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withObjectId:(id)a4;
+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withSubjectId:(id)a4;
+ (id)predicateMatchingRelationshipsWithSubjectId:(id)a3 relationshipType:(int64_t)a4;
+ (id)predicateToExcludeSentinel;
+ (id)relationshipsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (uint64_t)_conceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(void *)a5 conceptOut:(uint64_t)a6 error:;
+ (uint64_t)_inflateConcept:(void *)a3 rootNode:(unint64_t)a4 maximumDepth:(void *)a5 attributesPredicate:(void *)a6 relationshipsPredicate:(void *)a7 cache:(void *)a8 ontologyTransaction:(uint64_t)a9 error:;
+ (uint64_t)_inflateRelationshipsIfPossibleForConcept:(unint64_t)a3 maximumDepth:(void *)a4 attributesPredicate:(void *)a5 relationshipsPredicate:(void *)a6 cache:(void *)a7 ontologyTransaction:(uint64_t)a8 error:;
- (BOOL)unitTesting_attributeIdentifierByCodingSystemURNMapIsReady;
- (HDOntologyConceptManager)init;
- (HDOntologyConceptManager)initWithProfile:(id)a3;
- (id)attributeIdentifierForCodingSystem:(id)a3;
- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6;
- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6;
- (id)unitTesting_didResetAttributeIdentifierMap;
- (void)daemonReady:(id)a3;
- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4;
- (void)setUnitTesting_didResetAttributeIdentifierMap:(id)a3;
@end

@implementation HDOntologyConceptManager

- (HDOntologyConceptManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyConceptManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDOntologyConceptManager;
  v5 = [(HDOntologyConceptManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDDatabaseValueCache alloc];
    v8 = [(HDOntologyConceptManager *)v6 hk_classNameWithTag:@"concepts"];
    uint64_t v9 = [(HDDatabaseValueCache *)v7 initWithName:v8 cacheScope:1];
    conceptsByIdentifier = v6->_conceptsByIdentifier;
    v6->_conceptsByIdentifier = (HDDatabaseValueCache *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributeIdentifierByCodingSystemURN = v6->_attributeIdentifierByCodingSystemURN;
    v6->_attributeIdentifierByCodingSystemURN = v11;

    v6->_attributeIdentifierByCodingSystemURNLock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v14 = [WeakRetained daemon];
    [v14 registerForDaemonReady:v6];
  }
  return v6;
}

- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  v10 = [v8 arrayWithObjects:&v14 count:1];

  v11 = -[HDOntologyConceptManager conceptsForIdentifiers:options:error:](self, "conceptsForIdentifiers:options:error:", v10, a4, a5, v14, v15);
  v12 = [v11 firstObject];

  return v12;
}

- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a5;
  id v12 = a3;
  v13 = [v10 arrayWithObjects:&v17 count:1];

  id v14 = -[HDOntologyConceptManager conceptsForIdentifiers:options:transaction:error:](self, "conceptsForIdentifiers:options:transaction:error:", v13, a4, v11, a6, v17, v18);

  uint64_t v15 = [v14 firstObject];

  return v15;
}

- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__134;
  v23 = __Block_byref_object_dispose__134;
  id v24 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v10 = [WeakRetained ontologyDatabase];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HDOntologyConceptManager_conceptsForIdentifiers_options_error___block_invoke;
  v15[3] = &unk_1E6305448;
  id v17 = &v19;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  unint64_t v18 = a4;
  LODWORD(a5) = [v10 performTransactionWithError:a5 transactionHandler:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __65__HDOntologyConceptManager_conceptsForIdentifiers_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) conceptsForIdentifiers:*(void *)(a1 + 40) options:*(void *)(a1 + 56) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        conceptsByIdentifier = self->_conceptsByIdentifier;
        id v17 = [v9 databaseTransaction];
        unint64_t v61 = a4;
        id v62 = 0;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __77__HDOntologyConceptManager_conceptsForIdentifiers_options_transaction_error___block_invoke;
        v59[3] = &unk_1E6305470;
        v59[4] = v15;
        id v60 = v9;
        unint64_t v18 = [(HDDatabaseValueCache *)conceptsByIdentifier fetchObjectForKey:v15 transaction:v17 error:&v62 faultHandler:v59];
        id v19 = v62;

        if (v18)
        {
          [obj addObject:v18];
        }
        else if (v19)
        {
          if (a6) {
            *a6 = v19;
          }
          else {
            _HKLogDroppedError();
          }
          id v42 = obj;

          v43 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    id v45 = v10;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v22 = obj;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          if ((a4 & ~[v27 options]) != 0) {
            v28 = v21;
          }
          else {
            v28 = v20;
          }
          [v28 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v24);
    }

    id v29 = v20;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obja = v21;
    uint64_t v30 = [obja countByEnumeratingWithState:&v51 objects:v67 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      while (2)
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(obja);
          }
          v34 = *(void **)(*((void *)&v51 + 1) + 8 * k);
          v35 = [v34 identifier];
          id v50 = 0;
          int v36 = +[HDOntologyConceptManager _conceptWithIdentifier:options:transaction:conceptOut:error:]((uint64_t)HDOntologyConceptManager, v35, a4, v9, &v50, (uint64_t)a6);
          id v37 = v50;

          if (!v36)
          {

            id v42 = v29;
            v43 = 0;
            id v10 = v45;
            goto LABEL_38;
          }
          objc_msgSend(v29, "hk_addNonNilObject:", v37);
          v38 = self->_conceptsByIdentifier;
          v39 = [v34 identifier];
          v40 = [v9 databaseTransaction];
          [(HDDatabaseValueCache *)v38 setObject:v37 forKey:v39 transaction:v40];
        }
        uint64_t v31 = [obja countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    v41 = v29;
    id v10 = v45;
  }
  else
  {
    v41 = obj;
  }
  id v42 = v41;
  v43 = v42;
LABEL_38:

  return v43;
}

id __77__HDOntologyConceptManager_conceptsForIdentifiers_options_transaction_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[5];
  unint64_t v4 = a1[6];
  v6 = (void *)a1[4];
  id v12 = 0;
  int v7 = +[HDOntologyConceptManager _conceptWithIdentifier:options:transaction:conceptOut:error:]((uint64_t)HDOntologyConceptManager, v6, v4, v5, &v12, a3);
  id v8 = v12;
  id v9 = v8;
  if (!v7) {
    id v8 = 0;
  }
  id v10 = v8;

  return v10;
}

+ (uint64_t)_conceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(void *)a5 conceptOut:(uint64_t)a6 error:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  self;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__134;
  v40 = __Block_byref_object_dispose__134;
  id v41 = 0;
  uint64_t v31 = v7;
  id v53 = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __88__HDOntologyConceptManager__conceptWithIdentifier_options_transaction_conceptOut_error___block_invoke;
  v35[3] = &unk_1E62F4DF0;
  v35[4] = &v36;
  id v10 = v9;
  id v11 = v8;
  id v12 = v35;
  uint64_t v30 = self;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        int v20 = [v19 isAdHoc];
        id v21 = [v19 numberRepresentation];
        if (v20) {
          id v22 = v14;
        }
        else {
          id v22 = v13;
        }
        [v22 addObject:v21];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  if (![v14 count]) {
    goto LABEL_22;
  }
  uint64_t v23 = [v11 profile];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke;
  v47[3] = &unk_1E6305628;
  v48 = v12;
  BOOL v24 = +[HDAdHocConceptEntity enumerateAdHocConceptWithRawIdentifiers:v14 options:a3 profile:v23 error:a6 enumerationHandler:v47];

  if (!v24)
  {
    uint64_t v28 = 0;
  }
  else
  {
LABEL_22:
    if ([v13 count])
    {
      uint64_t v25 = [v11 graphDatabase];
      v26 = HDSimpleGraphDatabaseNodeEntityPredicateForIdentifiers((uint64_t)v13);
      uint64_t v27 = *MEMORY[0x1E4F65DE0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke_2;
      v42[3] = &unk_1E6305650;
      uint64_t v45 = v30;
      unint64_t v46 = a3;
      id v43 = v11;
      v44 = v12;
      uint64_t v28 = [v25 enumerateNodesForPredicate:v26 includeDeleted:(a3 >> 1) & 1 limit:v27 error:a6 enumerationHandler:v42];
    }
    else
    {
      uint64_t v28 = 1;
    }
  }

  if (a5) {
    *a5 = (id) v37[5];
  }
  _Block_object_dispose(&v36, 8);

  return v28;
}

+ (id)conceptForCodingCollection:(id)a3 configuration:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__134;
  v39 = __Block_byref_object_dispose__134;
  id v40 = 0;
  id v13 = [v12 daemon];
  id v14 = [v13 ontologyConfigurationProvider];
  id v15 = [v11 countryCode];
  uint64_t v16 = [v14 ontologyConfigurationForCountryCode:v15];

  uint64_t v17 = [v12 database];
  unint64_t v18 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke;
  v28[3] = &unk_1E63054C0;
  id v19 = v12;
  id v29 = v19;
  id v20 = v16;
  id v30 = v20;
  id v21 = v10;
  id v31 = v21;
  v33 = &v35;
  id v22 = v11;
  id v32 = v22;
  id v34 = a1;
  LOBYTE(a6) = [v17 performTransactionWithContext:v18 error:a6 block:v28 inaccessibilityHandler:0];

  if (a6)
  {
    id v23 = (id)v36[5];
  }
  else
  {
    _HKInitializeLogging();
    BOOL v24 = HKLogHealthOntology();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138412802;
      id v42 = v26;
      __int16 v43 = 2112;
      v44 = v27;
      __int16 v45 = 2112;
      uint64_t v46 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "Error resolving concept for context: %@, country: %@, error: %@", buf, 0x20u);
    }
    id v23 = 0;
  }

  _Block_object_dispose(&v35, 8);

  return v23;
}

uint64_t __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 ontologyDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_2;
  v12[3] = &unk_1E6305498;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v11;
  long long v15 = v11;
  uint64_t v16 = *(void *)(a1 + 72);
  uint64_t v9 = [v7 performTransactionWithDatabaseTransaction:v6 error:a3 transactionHandler:v12];

  return v9;
}

BOOL __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v124[16] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v93 = a1;
  uint64_t v5 = [*(id *)(a1 + 32) supportedCodingSystems];
  id v6 = [*(id *)(a1 + 40) codings];
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_3;
  v106[3] = &unk_1E62FDBC8;
  id v90 = v5;
  id v107 = v90;
  id v7 = objc_msgSend(v6, "hk_filter:", v106);

  id v8 = *(void **)(v93 + 48);
  id v105 = 0;
  id v9 = v7;
  id v102 = v8;
  id v101 = v4;
  self;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v9;
  uint64_t v100 = [obj countByEnumeratingWithState:&v109 objects:v124 count:16];
  if (!v100)
  {

    id v10 = 0;
    goto LABEL_47;
  }
  uint64_t v94 = 0;
  id v10 = 0;
  id v11 = 0;
  uint64_t v99 = *(void *)v110;
  uint64_t v95 = *MEMORY[0x1E4F65DE0];
  do
  {
    uint64_t v12 = 0;
    id v13 = v10;
    id v104 = v11;
    do
    {
      v103 = v13;
      if (*(void *)v110 != v99) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v109 + 1) + 8 * v12);
      unint64_t v15 = [v102 options];
      id v108 = 0;
      id v16 = v14;
      id v17 = v101;
      uint64_t v18 = self;
      uint64_t v118 = 0;
      uint64_t v119 = (uint64_t)&v118;
      uint64_t v120 = 0x3032000000;
      v121 = __Block_byref_object_copy__134;
      v122 = __Block_byref_object_dispose__134;
      id v123 = 0;
      id v19 = [v17 profile];
      id v20 = [v19 ontologyConceptManager];
      id v21 = [v16 codingSystem];
      id v22 = [v20 attributeIdentifierForCodingSystem:v21];

      if (v22)
      {
        uint64_t v23 = [v22 longLongValue];
        BOOL v24 = [v16 code];
        uint64_t v25 = HDSimpleGraphDatabaseNodeEntityPredicateForAttribute(v23, v24);

        id v26 = [v17 graphDatabase];
        uint64_t v113 = MEMORY[0x1E4F143A8];
        uint64_t v114 = 3221225472;
        uint64_t v115 = (uint64_t)__76__HDOntologyConceptManager__findConceptForCoding_options_transaction_error___block_invoke;
        uint64_t v116 = (uint64_t)&unk_1E63055B0;
        v117 = &v118;
        LOBYTE(v23) = [v26 enumerateNodesForPredicate:v25 includeDeleted:(v15 >> 1) & 1 limit:v95 error:&v108 enumerationHandler:&v113];

        if (v23)
        {
          uint64_t v27 = *(void **)(v119 + 40);
          if (v27)
          {
            uint64_t v28 = +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](v18, v27, v15, v17, (uint64_t)&v108);
            goto LABEL_13;
          }
          id v30 = (void *)MEMORY[0x1E4F28C58];
          id v31 = HKSensitiveLogItem();
          objc_msgSend(v30, "hk_assignError:code:format:", &v108, 118, @"Failed to find concept for coding %@.", v31);
        }
      }
      else
      {
        id v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = HKSensitiveLogItem();
        objc_msgSend(v29, "hk_assignError:code:format:", &v108, 118, @"Failed to find concept for coding %@ (attribute identifier not found).", v25);
      }
      uint64_t v28 = 0;
LABEL_13:

      _Block_object_dispose(&v118, 8);
      id v32 = v108;
      if (!v28)
      {
        v33 = v32;
        if ((objc_msgSend(v32, "hk_isObjectNotFoundError") & 1) == 0)
        {
          id v66 = v33;
          v67 = v66;
          if (v66) {
            id v105 = v66;
          }

          goto LABEL_53;
        }
LABEL_19:
        id v10 = v103;
        id v11 = v104;
        goto LABEL_20;
      }
      v33 = v32;
      if ([v28 isNebulous]) {
        goto LABEL_19;
      }
      id v34 = [v28 validInRegions];
      uint64_t v35 = [v102 countryCode];
      int v36 = [v34 containsObject:v35];

      if (!v36) {
        goto LABEL_19;
      }
      id v37 = v17;
      id v38 = v28;
      self;
      id v97 = v38;
      id v39 = v37;
      self;
      uint64_t v113 = 0;
      uint64_t v114 = (uint64_t)&v113;
      uint64_t v115 = 0x2020000000;
      uint64_t v116 = 0x7FFFFFFFFFFFFFFFLL;
      id v40 = (void *)MEMORY[0x1E4F65D58];
      id v41 = (void *)MEMORY[0x1E4F65D00];
      uint64_t v42 = [v97 identifier];
      __int16 v43 = [(id)v42 numberRepresentation];
      v44 = [v41 predicateWithProperty:@"subject_id" equalToValue:v43];
      __int16 v45 = HDSimpleGraphRelationshipEntityPredicateForRelationshipType(1013);
      uint64_t v46 = [v40 compoundPredicateWithPredicate:v44 otherPredicate:v45];

      uint64_t v47 = [v39 graphDatabase];
      v48 = [v47 underlyingDatabase];
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      uint64_t v120 = (uint64_t)__74__HDOntologyConceptManager__grouperConceptIDForConcept_transaction_error___block_invoke;
      v121 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E63055D8;
      v122 = (void (*)(uint64_t))&v113;
      LOBYTE(v42) = +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithPredicate:v46 skipDeleted:1 database:v48 error:&v105 enumerationHandler:&v118];

      if (v42) {
        uint64_t v49 = *(void *)(v114 + 24);
      }
      else {
        uint64_t v49 = 0;
      }

      _Block_object_dispose(&v113, 8);
      if (!v49)
      {
LABEL_52:
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v105, 1002, @"Inconsistent grouper concepts encountered. Unable to resolve concept for codings: %@, configuration: %@", obj, v102);
        goto LABEL_53;
      }
      if (v94)
      {
        if (v49 != v94) {
          goto LABEL_52;
        }
      }
      else
      {
        uint64_t v94 = v49;
      }
      id v50 = v102;
      id v11 = v104;
      id v10 = v103;
      id v98 = v97;
      id v51 = v16;
      self;
      if (!v10 || !v11)
      {

LABEL_33:
        id v52 = v98;

        id v50 = v10;
        id v10 = v51;
        id v11 = v52;
LABEL_34:

        goto LABEL_20;
      }
      if ([v98 isEqual:v11])
      {

        goto LABEL_34;
      }
      id v92 = v50;
      self;
      uint64_t v53 = [v92 recordCategoryType];

      long long v54 = (void *)MEMORY[0x1E4F1CBF0];
      if ((unint64_t)(v53 - 1) <= 9) {
        long long v54 = (void *)qword_1E6305738[v53 - 1];
      }
      id v91 = v54;
      uint64_t v55 = [v10 codingSystem];
      long long v56 = [v55 identifier];
      [v91 indexOfObject:v56];

      long long v57 = [v51 codingSystem];
      long long v58 = [v57 identifier];
      [v91 indexOfObject:v58];

      uint64_t v59 = HKCompareIntegers();
      if (!v59)
      {
        id v60 = [v11 preferredName];
        [v60 length];
        unint64_t v61 = [v98 preferredName];
        [v61 length];
        uint64_t v59 = HKCompareIntegers();

        if (!v59)
        {
          id v62 = [v98 identifier];
          [v62 rawIdentifier];
          long long v63 = [v11 identifier];
          [v63 rawIdentifier];
          uint64_t v59 = HKCompareIntegers();
        }
      }

      if (v59 == -1) {
        goto LABEL_33;
      }
      if (!v59)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v105, 1002, @"Multiple concepts of equal priority encountered. Unable to resolve concept for codings: %@, configuration: %@", obj, v92);
LABEL_53:

        id v65 = 0;
        id v10 = v103;
        goto LABEL_54;
      }
LABEL_20:

      ++v12;
      id v13 = v10;
      id v104 = v11;
    }
    while (v100 != v12);
    uint64_t v64 = [obj countByEnumeratingWithState:&v109 objects:v124 count:16];
    uint64_t v100 = v64;
  }
  while (v64);

  if (v11) {
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v105, 118, @"Unable to find valid concept for codings: %@, configuration: %@", obj, v102);
  id v11 = 0;
LABEL_48:
  id v104 = v11;
  id v65 = v104;
LABEL_54:

  id v68 = v105;
  uint64_t v69 = *(void *)(*(void *)(v93 + 56) + 8);
  uint64_t v70 = *(void **)(v69 + 40);
  *(void *)(v69 + 40) = v65;

  if (*(void *)(*(void *)(*(void *)(v93 + 56) + 8) + 40))
  {
    BOOL v71 = 1;
    goto LABEL_72;
  }
  if ((objc_msgSend(v68, "hk_isHealthKitErrorWithCode:", 118) & 1) != 0
    || (objc_msgSend(v68, "hk_isHealthKitErrorWithCode:", 1002) & 1) != 0)
  {
    v72 = *(void **)(v93 + 40);
    uint64_t v73 = [*(id *)(v93 + 48) options];
    id v74 = v72;
    id v75 = v101;
    self;
    v76 = [v75 profile];

    v124[0] = 0;
    v77 = +[HDAdHocConceptEntity adHocConceptForCodingCollection:v74 options:v73 profile:v76 error:v124];
    id v78 = v124[0];
    v79 = v78;
    if (v77)
    {
      id v80 = v77;
      goto LABEL_62;
    }
    if (objc_msgSend(v78, "hk_isHealthKitErrorWithCode:", 118))
    {
      id v80 = +[HDAdHocConceptEntity generateAdHocConceptForCodingCollection:v74 options:v73 profile:v76 error:a3];
LABEL_62:
      id v81 = v80;
    }
    else
    {
      id v86 = v79;
      v87 = v86;
      if (v86)
      {
        if (a3) {
          *a3 = v86;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v81 = 0;
    }

    uint64_t v82 = *(void *)(*(void *)(v93 + 56) + 8);
    v83 = *(void **)(v82 + 40);
    *(void *)(v82 + 40) = v81;

    BOOL v71 = *(void *)(*(void *)(*(void *)(v93 + 56) + 8) + 40) != 0;
    goto LABEL_72;
  }
  id v84 = v68;
  v85 = v84;
  if (v84)
  {
    if (a3) {
      *a3 = v84;
    }
    else {
      _HKLogDroppedError();
    }
  }

  BOOL v71 = 0;
LABEL_72:

  return v71;
}

uint64_t __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 codingSystem];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)relationshipsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__134;
  uint64_t v23 = __Block_byref_object_dispose__134;
  id v24 = 0;
  id v10 = [v9 ontologyDatabase];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HDOntologyConceptManager_relationshipsForConceptWithIdentifier_profile_error___block_invoke;
  v15[3] = &unk_1E63054E8;
  id v17 = &v19;
  id v18 = a1;
  id v11 = v8;
  id v16 = v11;
  LODWORD(a5) = [v10 performTransactionWithError:a5 transactionHandler:v15];

  if (a5) {
    uint64_t v12 = (void *)v20[5];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);

  return v13;
}

BOOL __80__HDOntologyConceptManager_relationshipsForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = +[HDOntologyConceptManager _relationshipsForConceptWithIdentifier:options:transaction:error:](*(void *)(a1 + 48), *(void **)(a1 + 32), 0, a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_relationshipsForConceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = self;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = (a3 >> 3) & 1;
  id v13 = [v8 graphDatabase];
  uint64_t v14 = [v9 rawIdentifier];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __93__HDOntologyConceptManager__relationshipsForConceptWithIdentifier_options_transaction_error___block_invoke;
  id v22 = &unk_1E6305678;
  uint64_t v25 = v10;
  uint64_t v26 = a3;
  id v23 = v8;
  id v15 = v11;
  id v24 = v15;
  id v16 = v8;
  LODWORD(a5) = [v13 enumerateRelationshipsWithSubjectID:v14 includeDeleted:v12 error:a5 enumerationHandler:&v19];

  if (a5) {
    id v17 = objc_msgSend(v15, "copy", v19, v20, v21, v22, v23, v24, v25, v26);
  }
  else {
    id v17 = 0;
  }

  return v17;
}

+ (BOOL)enumerateRelationshipsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  unint64_t v14 = (a4 >> 3) & 1;
  id v15 = a3;
  id v16 = [v12 graphDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __113__HDOntologyConceptManager_enumerateRelationshipsMatchingPredicate_options_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6305510;
  id v23 = a1;
  unint64_t v24 = a4;
  id v21 = v12;
  id v22 = v13;
  id v17 = v13;
  id v18 = v12;
  LOBYTE(a6) = [v16 enumerateRelationshipsForPredicate:v15 includeDeleted:v14 error:a6 enumerationHandler:v20];

  return (char)a6;
}

uint64_t __113__HDOntologyConceptManager_enumerateRelationshipsMatchingPredicate_options_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = 0;
  BOOL v4 = +[HDOntologyConceptManager _conceptRelationshipFromGraphRelationship:relationshipOut:options:transaction:error:](*(void *)(a1 + 48), a2, &v9, *(void *)(a1 + 56), *(void **)(a1 + 32), a3);
  id v5 = v9;
  id v6 = v5;
  if (v4)
  {
    if (v5) {
      uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)_conceptRelationshipFromGraphRelationship:(void *)a3 relationshipOut:(uint64_t)a4 options:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a5;
  uint64_t v12 = self;
  id v13 = [v11 graphDatabase];
  unint64_t v14 = objc_msgSend(v13, "nodeForID:error:", objc_msgSend(v10, "objectID"), a6);

  if (v14)
  {
    if ((a4 & 2) != 0 || ([v14 isDeleted] & 1) == 0)
    {
      id v16 = +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](v12, v14, a4 & 0xFFFFFFFFFFFFFFFELL, v11, a6);
      BOOL v15 = v16 != 0;
      if (v16)
      {
        id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ADF8]), "initWithType:destination:version:deleted:", objc_msgSend(v10, "type"), v16, objc_msgSend(v10, "version"), objc_msgSend(v10, "isDeleted"));
        id v18 = v17;
        if (a3) {
          *a3 = v17;
        }
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a4 ontologyDatabase];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_profile_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6305538;
  id v18 = v11;
  id v19 = a1;
  id v17 = v10;
  id v13 = v11;
  id v14 = v10;
  LOBYTE(a5) = [v12 performTransactionWithError:a5 transactionHandler:v16];

  return (char)a5;
}

uint64_t __96__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_profile_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) enumerateConceptsMatchingPredicate:*(void *)(a1 + 32) options:1 limit:*MEMORY[0x1E4F65DE0] transaction:a2 error:a3 enumerationHandler:*(void *)(a1 + 40)];
}

+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v13 = a6;
  id v14 = a8;
  unint64_t v15 = (a4 >> 1) & 1;
  id v16 = a3;
  id v17 = [v13 graphDatabase];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __114__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_options_limit_transaction_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6305560;
  id v23 = v14;
  unint64_t v24 = a4;
  id v22 = v13;
  id v18 = v14;
  id v19 = v13;
  LOBYTE(a7) = [v17 enumerateNodesForPredicate:v16 includeDeleted:v15 limit:a5 error:a7 enumerationHandler:v21];

  return (char)a7;
}

uint64_t __114__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_options_limit_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v4 = +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:]((uint64_t)HDOntologyConceptManager, a2, *(void *)(a1 + 48), *(void **)(a1 + 32), a3);
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v5;
}

+ (id)_conceptFromGraphNode:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = self;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel__conceptFromGraphNode_options_transaction_error_, v10, @"HDOntologyConceptManager.m", 803, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = [v9 graphDatabase];
  uint64_t v13 = [v8 rowID];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__HDOntologyConceptManager__conceptFromGraphNode_options_transaction_error___block_invoke;
  v21[3] = &unk_1E6305600;
  id v14 = v11;
  id v22 = v14;
  int v15 = [v12 enumerateAttributesForNodeWithID:v13 includeDeleted:(a3 >> 2) & 1 error:a5 enumerationHandler:v21];

  if (!v15)
  {
    id v18 = 0;
    goto LABEL_10;
  }
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ADE8]), "initWithRawIdentifier:", objc_msgSend(v8, "rowID"));
  if (a3)
  {
    id v17 = +[HDOntologyConceptManager _relationshipsForConceptWithIdentifier:options:transaction:error:](v10, v16, a3, v9, a5);
    if (!v17)
    {
      id v18 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v17 = 0;
  }
  id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ADD8]), "initWithIdentifier:attributes:relationships:version:deleted:options:", v16, v14, v17, objc_msgSend(v8, "version"), objc_msgSend(v8, "isDeleted"), a3);

LABEL_9:
LABEL_10:

  return v18;
}

+ (BOOL)followRelationshipsWithTypes:(id)a3 startingIdentifier:(id)a4 options:(unint64_t)a5 ontologyTransaction:(id)a6 conceptOut:(id *)a7 deletedRelationshipVersionOut:(int64_t *)a8 error:(id *)a9
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v34 = a6;
  if (![v14 count])
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDOntologyConceptManager.m", 333, @"Invalid parameter not satisfying: %@", @"relationshipTypes.count > 0" object file lineNumber description];
  }
  id v28 = v15;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v14;
  id v16 = 0;
  uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v17)
  {
    unint64_t v32 = a5 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v33 = *(void *)v43;
    id v18 = v28;
LABEL_5:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v43 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = +[HDOntologyConceptManager predicateMatchingRelationshipsWithSubjectId:relationshipType:](HDOntologyConceptManager, "predicateMatchingRelationshipsWithSubjectId:relationshipType:", v18, [*(id *)(*((void *)&v42 + 1) + 8 * v19) integerValue]);
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x3032000000;
      id v39 = __Block_byref_object_copy__134;
      id v40 = __Block_byref_object_dispose__134;
      id v41 = 0;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __151__HDOntologyConceptManager_followRelationshipsWithTypes_startingIdentifier_options_ontologyTransaction_conceptOut_deletedRelationshipVersionOut_error___block_invoke;
      v35[3] = &unk_1E6305588;
      v35[4] = &v36;
      if (+[HDOntologyConceptManager enumerateRelationshipsMatchingPredicate:v20 options:v32 transaction:v34 error:a9 enumerationHandler:v35])
      {
        id v21 = (void *)v37[5];
        if (!v21) {
          goto LABEL_14;
        }
        if (![v21 isDeleted])
        {
          id v23 = [(id)v37[5] destination];

          uint64_t v24 = [v23 identifier];

          int v22 = 1;
          id v18 = (void *)v24;
          id v16 = v23;
          goto LABEL_17;
        }
        if (a8)
        {
          int v22 = 0;
          *a8 = [(id)v37[5] version];
        }
        else
        {
LABEL_14:
          int v22 = 0;
        }
        char v31 = 1;
      }
      else
      {
        char v31 = 0;
        int v22 = 0;
      }
LABEL_17:
      _Block_object_dispose(&v36, 8);

      if (!v22)
      {

        goto LABEL_26;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v17) {
          goto LABEL_5;
        }
        goto LABEL_23;
      }
    }
  }
  id v18 = v28;
LABEL_23:

  if (a7)
  {
    id v16 = v16;
    *a7 = v16;
  }
  char v31 = 1;
LABEL_26:

  return v31 & 1;
}

uint64_t __151__HDOntologyConceptManager_followRelationshipsWithTypes_startingIdentifier_options_ontologyTransaction_conceptOut_deletedRelationshipVersionOut_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (id)inflateGraphWithRootConceptsPredicate:(id)a3 limit:(int64_t)a4 maximumDepth:(int64_t)a5 attributeTypes:(id)a6 relationshipTypes:(id)a7 ontologyTransaction:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a4 < 0)
  {
    long long v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"HDOntologyConceptManager.m", 383, @"Invalid parameter not satisfying: %@", @"limit >= 0" object file lineNumber description];
  }
  int64_t v45 = a5;
  if (a5 < 0)
  {
    long long v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"HDOntologyConceptManager.m", 384, @"Invalid parameter not satisfying: %@", @"maximumDepth >= 0" object file lineNumber description];
  }
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v47 = v16;
  uint64_t v23 = self;
  id v24 = v22;
  self;
  if (v24)
  {
    if ([v24 count])
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v48 = MEMORY[0x1E4F143A8];
      uint64_t v49 = 3221225472;
      id v50 = __66__HDOntologyConceptManager__attributesPredicateForAttributeTypes___block_invoke;
      id v51 = &unk_1E63056C8;
      id v52 = v25;
      id v26 = v25;
      [v24 enumerateIntegersUsingBlock:&v48];
      uint64_t v27 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"attribute_type" values:v26];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  id v28 = v21;
  self;
  int64_t v46 = a4;
  if (v28)
  {
    if ([v28 count])
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v48 = MEMORY[0x1E4F143A8];
      uint64_t v49 = 3221225472;
      id v50 = __71__HDOntologyConceptManager__relationshipPredicateForRelationshipTypes___block_invoke;
      id v51 = &unk_1E63056C8;
      id v52 = v29;
      id v30 = v29;
      [v28 enumerateIntegersUsingBlock:&v48];
      char v31 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"relationship_type" values:v30];
    }
    else
    {
      char v31 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
  }
  else
  {
    char v31 = 0;
  }

  unint64_t v32 = objc_alloc_init(_HDOntologyGraphInflationCache);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = [v20 graphDatabase];
  uint64_t v48 = MEMORY[0x1E4F143A8];
  uint64_t v49 = 3221225472;
  id v50 = __145__HDOntologyConceptManager__inflateGraphWithRootConceptsPredicate_limit_maximumDepth_attributeTypes_relationshipTypes_ontologyTransaction_error___block_invoke;
  id v51 = &unk_1E63056A0;
  uint64_t v57 = v23;
  int64_t v58 = v45;
  id v52 = v27;
  id v53 = v31;
  long long v54 = v32;
  id v55 = v20;
  id v56 = v33;
  id v35 = v33;
  id v36 = v20;
  id v37 = v32;
  id v38 = v31;
  id v39 = v27;
  LODWORD(v32) = [v34 enumerateNodesForPredicate:v47 includeDeleted:0 limit:v46 error:a9 enumerationHandler:&v48];

  if (v32) {
    id v40 = v35;
  }
  else {
    id v40 = 0;
  }
  id v41 = v40;

  return v41;
}

+ (id)predicateMatchingConceptWithID:(id)a3
{
  uint64_t v3 = [a3 rawIdentifier];

  return HDSimpleGraphDatabaseNodeEntityPredicateForIdentifier(v3, 1);
}

+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withSubjectId:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F65D08];
  id v6 = HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToSubjectID([a4 rawIdentifier]);
  v11[0] = v6;
  uint64_t v7 = HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(a3);
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v5 predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withObjectId:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F65D08];
  id v6 = HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToObjectID([a4 rawIdentifier]);
  v11[0] = v6;
  uint64_t v7 = HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(a3);
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v5 predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)predicateMatchingRelationshipsWithSubjectId:(id)a3 relationshipType:(int64_t)a4
{
  uint64_t v5 = [a3 rawIdentifier];

  return HDSimpleGraphRelationshipEntityPredicateForSubject(v5, a4);
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 attributeValue:(id)a4
{
  return HDSimpleGraphDatabaseNodeEntityPredicateForAttribute(a3, a4);
}

+ (id)predicateForConceptsWithoutAttributeType:(int64_t)a3 attributeValue:(id)a4
{
  return HDSimpleGraphDatabaseNodeEntityPredicateWithoutAttribute(a3, a4);
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 likeAttributeValue:(id)a4
{
  BOOL v4 = [NSString stringWithFormat:@"%%%@%%", a4];
  uint64_t v5 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(960, 1);
  id v6 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v4, 8);
  uint64_t v7 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v5 otherPredicate:v6];

  return v7;
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 beingsWithAttributeValue:(id)a4
{
  BOOL v4 = [NSString stringWithFormat:@"%@%%", a4];
  uint64_t v5 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(960, 1);
  id v6 = HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v4, 8);
  uint64_t v7 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v5 otherPredicate:v6];

  return v7;
}

+ (id)predicateForConceptsFollowingRelationshipOfTypes:(id)a3 fromSubjectId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"relationship_type"];
  id v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"subject_id"];
  id v9 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:v7 values:v6];

  uint64_t v10 = (void *)MEMORY[0x1E4F65D00];
  id v11 = [v5 numberRepresentation];

  uint64_t v12 = [v10 predicateWithProperty:v8 equalToValue:v11];

  uint64_t v13 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v9 otherPredicate:v12];

  return v13;
}

+ (id)predicateForRelationshipsWithTypes:(id)a3 onConceptId:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F65D08];
  id v6 = a3;
  uint64_t v7 = HDSimpleGraphRelationshipEntityPredicateForFetchType(0, [a4 rawIdentifier]);
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"relationship_type" values:v6];

  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v5 predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)predicateToExcludeSentinel
{
  v2 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v3 = [NSNumber numberWithLongLong:204];
  BOOL v4 = [v2 predicateWithProperty:@"rowid" notEqualToValue:v3];

  return v4;
}

uint64_t __76__HDOntologyConceptManager__findConceptForCoding_options_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __74__HDOntologyConceptManager__grouperConceptIDForConcept_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 objectID];
  return 0;
}

uint64_t __76__HDOntologyConceptManager__conceptFromGraphNode_options_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F2ADE0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 type];
  uint64_t v7 = [v4 value];
  uint64_t v8 = [v4 version];
  uint64_t v9 = [v4 isDeleted];

  uint64_t v10 = (void *)[v5 initWithType:v6 value:v7 version:v8 deleted:v9];
  [*(id *)(a1 + 32) addObject:v10];

  return 1;
}

uint64_t __88__HDOntologyConceptManager__conceptWithIdentifier_options_transaction_conceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](*(void *)(a1 + 48), a2, *(void *)(a1 + 56), *(void **)(a1 + 32), a3);
  if (v4) {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL __93__HDOntologyConceptManager__relationshipsForConceptWithIdentifier_options_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = 0;
  BOOL v4 = +[HDOntologyConceptManager _conceptRelationshipFromGraphRelationship:relationshipOut:options:transaction:error:](*(void *)(a1 + 48), a2, &v7, *(void *)(a1 + 56), *(void **)(a1 + 32), a3);
  id v5 = v7;
  if (v4) {
    objc_msgSend(*(id *)(a1 + 40), "hk_addNonNilObject:", v5);
  }

  return v4;
}

uint64_t __145__HDOntologyConceptManager__inflateGraphWithRootConceptsPredicate_limit_maximumDepth_attributeTypes_relationshipTypes_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void **)(a1 + 56);
  id v13 = 0;
  uint64_t v10 = +[HDOntologyConceptManager _inflateConcept:rootNode:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v4, &v13, a2, v5, v6, v7, v8, v9, a3);
  id v11 = v13;
  if (v10) {
    objc_msgSend(*(id *)(a1 + 64), "hk_addNonNilObject:", v11);
  }

  return v10;
}

+ (uint64_t)_inflateConcept:(void *)a3 rootNode:(unint64_t)a4 maximumDepth:(void *)a5 attributesPredicate:(void *)a6 relationshipsPredicate:(void *)a7 cache:(void *)a8 ontologyTransaction:(uint64_t)a9 error:
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v64 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a3;
  uint64_t v17 = self;
  id v18 = v16;
  id v19 = v13;
  id v20 = v14;
  id v21 = v15;
  self;
  if (v20) {
    id v22 = (void *)v20[1];
  }
  else {
    id v22 = 0;
  }
  uint64_t v23 = NSNumber;
  id v24 = v22;
  id v25 = objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v18, "rowID"));
  id v26 = [v24 objectForKeyedSubscript:v25];

  if (v26)
  {
    id v27 = v26;
    id v28 = v64;
    goto LABEL_16;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __96__HDOntologyConceptManager__conceptForNode_attributesPredicate_cache_ontologyTransaction_error___block_invoke;
  v65[3] = &unk_1E6305600;
  id v61 = v29;
  id v66 = v61;
  id v30 = v18;
  id v59 = v19;
  id v31 = v19;
  id v58 = v21;
  id v32 = v21;
  id v33 = v65;
  id v34 = v31;
  self;
  uint64_t v60 = v17;
  if (v31)
  {
    id v35 = (void *)MEMORY[0x1E4F65D08];
    id v36 = HDSimpleGraphAttributeEntityPredicateForNodeID([v30 rowID], 1);
    v67[0] = v36;
    v67[1] = v34;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    id v37 = v57 = v30;
    [v35 predicateMatchingAllPredicates:v37];
    v39 = id v38 = v34;

    id v40 = [v32 graphDatabase];
    id v41 = [v40 underlyingDatabase];
    long long v42 = v38;
    char v43 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesWithPredicate:v39 skipDeleted:1 database:v41 error:a9 enumerationHandler:v33];

    id v30 = v57;
  }
  else
  {
    long long v44 = [MEMORY[0x1E4F65D58] falsePredicate];

    if (!v44)
    {

      goto LABEL_12;
    }
    [v32 graphDatabase];
    v39 = long long v42 = 0;
    char v43 = objc_msgSend(v39, "enumerateAttributesForNodeWithID:error:enumerationHandler:", objc_msgSend(v30, "rowID"), a9, v33);
  }

  if (v43)
  {
LABEL_12:
    id v45 = objc_alloc(MEMORY[0x1E4F2ADD8]);
    int64_t v46 = v30;
    id v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2ADE8]), "initWithRawIdentifier:", objc_msgSend(v30, "rowID"));
    uint64_t v48 = [v30 version];
    uint64_t v49 = [v46 isDeleted];
    id v27 = (id)[v45 initWithIdentifier:v47 attributes:v61 relationships:MEMORY[0x1E4F1CBF0] version:v48 deleted:v49 options:0];

    id v28 = v64;
    id v21 = v58;
    id v19 = v59;
    if (v20) {
      id v50 = (void *)v20[1];
    }
    else {
      id v50 = 0;
    }
    id v51 = v50;
    id v52 = [v27 identifier];
    id v53 = [v52 numberRepresentation];
    [v51 setObject:v27 forKeyedSubscript:v53];

    uint64_t v17 = v60;
    goto LABEL_15;
  }
  id v27 = 0;
  id v28 = v64;
  id v19 = v59;
  uint64_t v17 = v60;
  id v21 = v58;
LABEL_15:

LABEL_16:
  if (v27)
  {
    uint64_t v54 = +[HDOntologyConceptManager _inflateRelationshipsIfPossibleForConcept:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v17, v27, a4, v19, v28, v20, v21, a9);
    uint64_t v55 = v54;
    if (a2 && v54)
    {
      *a2 = v27;
      uint64_t v55 = 1;
    }
  }
  else
  {
    uint64_t v55 = 0;
  }

  return v55;
}

void __66__HDOntologyConceptManager__attributesPredicateForAttributeTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

void __71__HDOntologyConceptManager__relationshipPredicateForRelationshipTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

+ (uint64_t)_inflateRelationshipsIfPossibleForConcept:(unint64_t)a3 maximumDepth:(void *)a4 attributesPredicate:(void *)a5 relationshipsPredicate:(void *)a6 cache:(void *)a7 ontologyTransaction:(uint64_t)a8 error:
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  self;
  if (v15) {
    uint64_t v17 = (void *)v15[2];
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = v17;
  id v19 = [v12 identifier];
  if ([v18 containsObject:v19])
  {

    goto LABEL_5;
  }
  if (v15) {
    id v21 = (void *)v15[2];
  }
  else {
    id v21 = 0;
  }
  unint64_t v22 = [v21 count];

  if (v22 >= a3)
  {
    uint64_t v20 = 1;
    goto LABEL_24;
  }
  if (v15) {
    uint64_t v23 = (void *)v15[2];
  }
  else {
    uint64_t v23 = 0;
  }
  id v24 = v23;
  id v25 = [v12 identifier];
  [v24 addObject:v25];

  id v74 = v16;
  id v26 = v16;
  id v75 = v15;
  id v27 = v15;
  id v76 = v14;
  id v28 = v14;
  id v77 = v13;
  id v29 = v13;
  id v78 = v12;
  id v30 = v12;
  self;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  id v91 = __158__HDOntologyConceptManager__subgraphPopulatedRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error___block_invoke;
  id v92 = &unk_1E63056F0;
  id v93 = v31;
  id v73 = v31;
  id v32 = v30;
  id v33 = v29;
  id v34 = v28;
  id v35 = v27;
  id v36 = v26;
  id v37 = v90;
  uint64_t v38 = self;
  id v39 = [v32 relationships];
  uint64_t v40 = [v39 count];

  v79 = v32;
  id v86 = v34;
  v87 = v33;
  id v84 = v37;
  id v85 = v36;
  if (v40)
  {
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = [v32 relationships];
    uint64_t v41 = [obj countByEnumeratingWithState:&v102 objects:v94 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v103;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v103 != v43) {
            objc_enumerationMutation(obj);
          }
          id v45 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          int64_t v46 = [v45 destination];
          id v47 = v35;
          int v48 = +[HDOntologyConceptManager _inflateRelationshipsIfPossibleForConcept:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v38, v46, a3, v33, v86, v35, v85, a8);

          if (!v48 || !((unsigned int (*)(void *, void *, uint64_t))v91)(v84, v45, a8))
          {
            int v89 = 0;
            id v14 = v76;
            id v13 = v77;
            id v16 = v74;
            id v15 = v75;
            id v18 = v73;
            id v35 = v47;
            goto LABEL_29;
          }
          id v35 = v47;
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v102 objects:v94 count:16];
        if (v42) {
          continue;
        }
        break;
      }
      id v14 = v76;
      id v13 = v77;
      id v16 = v74;
      id v15 = v75;
      id v18 = v73;
      id v50 = v85;
      uint64_t v49 = v86;
      id v51 = obj;
      int v89 = 1;
    }
    else
    {
      int v89 = 1;
      id v14 = v76;
      id v13 = v77;
      id v16 = v74;
      id v15 = v75;
      id v18 = v73;
LABEL_29:
      id v50 = v85;
      uint64_t v49 = v86;
      id v51 = obj;
    }
    goto LABEL_34;
  }
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __169__HDOntologyConceptManager__enumerateRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error_enumerationHandler___block_invoke;
  v94[3] = &unk_1E6305718;
  uint64_t v100 = v38;
  unint64_t v101 = a3;
  id v95 = v33;
  id v53 = v34;
  id v96 = v53;
  v83 = v35;
  id v97 = v35;
  id v54 = v36;
  id v98 = v54;
  uint64_t v99 = v37;
  id v55 = v53;
  id v56 = v54;
  id v57 = v94;
  id v58 = v32;
  self;
  id v59 = [v58 identifier];

  uint64_t v60 = [v59 rawIdentifier];
  id obja = v55;
  if (v55)
  {
    id v61 = (void *)MEMORY[0x1E4F65D08];
    id v62 = HDSimpleGraphRelationshipEntityPredicateForFetchType(0, v60);
    *(void *)&long long v102 = v62;
    *((void *)&v102 + 1) = v55;
    long long v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:2];
    id v64 = [v61 predicateMatchingAllPredicates:v63];

    id v65 = v56;
    id v66 = [v56 graphDatabase];
    int v89 = [v66 enumerateRelationshipsForPredicate:v64 error:a8 enumerationHandler:v57];

    v67 = v57;
    id v14 = v76;
    id v13 = v77;
    id v16 = v74;
    id v15 = v75;
    id v18 = v73;
  }
  else
  {
    v72 = v57;
    id v68 = [MEMORY[0x1E4F65D58] falsePredicate];

    id v14 = v76;
    id v13 = v77;
    id v16 = v74;
    id v15 = v75;
    id v18 = v73;
    if (!v68)
    {
      id v65 = v56;
      int v89 = 1;
      id v50 = v85;
      uint64_t v49 = v86;
      v67 = v72;
      goto LABEL_33;
    }
    id v65 = v56;
    id v64 = [v56 graphDatabase];
    uint64_t v69 = v60;
    v67 = v72;
    int v89 = [v64 enumerateRelationshipsWithSubjectID:v69 includeDeleted:0 error:a8 enumerationHandler:v72];
  }
  id v50 = v85;
  uint64_t v49 = v86;

LABEL_33:
  id v51 = v95;
  id v35 = v83;
LABEL_34:

  if (v89) {
    uint64_t v70 = v18;
  }
  else {
    uint64_t v70 = 0;
  }
  uint64_t v20 = v70;

  if (v15) {
    BOOL v71 = (void *)v35[2];
  }
  else {
    BOOL v71 = 0;
  }
  [v71 removeLastObject];
  id v12 = v78;
  if (!v20)
  {
    id v18 = 0;
    goto LABEL_6;
  }
  if ([(id)v20 count]) {
    [v79 mutateBySettingRelationships:v20];
  }
LABEL_5:
  uint64_t v20 = 1;
LABEL_6:

LABEL_24:
  return v20;
}

uint64_t __96__HDOntologyConceptManager__conceptForNode_attributesPredicate_cache_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F2ADE0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 type];
  id v7 = [v4 value];
  uint64_t v8 = [v4 version];
  uint64_t v9 = [v4 isDeleted];

  uint64_t v10 = (void *)[v5 initWithType:v6 value:v7 version:v8 deleted:v9];
  [*(id *)(a1 + 32) addObject:v10];

  return 1;
}

uint64_t __158__HDOntologyConceptManager__subgraphPopulatedRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __169__HDOntologyConceptManager__enumerateRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error_enumerationHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v34 = a1[10];
  id v5 = (void *)a1[4];
  uint64_t v6 = (void *)a1[5];
  id v7 = (void *)a1[6];
  uint64_t v8 = (void *)a1[7];
  id v9 = a2;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = [v13 graphDatabase];
  id v16 = v9;
  uint64_t v17 = objc_msgSend(v15, "nodeForID:error:", objc_msgSend(v9, "objectID"), a3);

  id v36 = v11;
  id v37 = v10;
  if (v17)
  {
    id v38 = 0;
    int v18 = +[HDOntologyConceptManager _inflateConcept:rootNode:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v14, &v38, v17, v34, v10, v11, v12, v13, a3);
    id v19 = v38;
    uint64_t v20 = v19;
    id v21 = 0;
    uint64_t v22 = a3;
    uint64_t v23 = v16;
    if (v18)
    {
      if (v19)
      {
        if (v12) {
          id v24 = (void *)v12[2];
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;
        id v26 = [v20 identifier];
        int v27 = [v25 containsObject:v26];

        id v28 = objc_alloc(MEMORY[0x1E4F2ADF8]);
        uint64_t v35 = [v23 type];
        uint64_t v29 = [v23 version];
        uint64_t v30 = [v23 isDeleted];
        if (v27) {
          uint64_t v31 = [v28 initWithType:v35 weakDestination:v20 version:v29 deleted:v30];
        }
        else {
          uint64_t v31 = [v28 initWithType:v35 destination:v20 version:v29 deleted:v30];
        }
        id v21 = (void *)v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v22, 118, @"No destination found for node %@", v17);
        id v21 = 0;
      }
    }
  }
  else
  {
    id v21 = 0;
    uint64_t v23 = v16;
  }

  if (v21) {
    uint64_t v32 = (*(uint64_t (**)(void))(a1[8] + 16))();
  }
  else {
    uint64_t v32 = 0;
  }

  return v32;
}

- (id)attributeIdentifierForCodingSystem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDOntologyConceptManager.m", 1335, @"Invalid parameter not satisfying: %@", @"codingSystem" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  BOOL attributeIdentifierByCodingSystemURNIsReady = self->_attributeIdentifierByCodingSystemURNIsReady;
  os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
  if (!attributeIdentifierByCodingSystemURNIsReady)
  {
    _HKInitializeLogging();
    id v7 = HKLogHealthOntology();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will now populate the attribute identifier map", buf, 0xCu);
    }

    os_unfair_lock_assert_not_owner(&self->_attributeIdentifierByCodingSystemURNLock);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v10 = [WeakRetained ontologyDatabase];
    id v27 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke;
    uint64_t v31 = &unk_1E62F9428;
    id v11 = v8;
    id v32 = v11;
    char v12 = [v10 performTransactionWithError:&v27 transactionHandler:buf];
    id v13 = (HDOntologyConceptManager *)v27;

    if (v12)
    {
      os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
      [(NSMutableDictionary *)self->_attributeIdentifierByCodingSystemURN removeAllObjects];
      [(NSMutableDictionary *)self->_attributeIdentifierByCodingSystemURN addEntriesFromDictionary:v11];
      self->_BOOL attributeIdentifierByCodingSystemURNIsReady = 1;
      os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
      _HKInitializeLogging();
      uint64_t v14 = HKLogHealthOntology();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v28 = 138543362;
        uint64_t v29 = self;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ did populate the attribute identifier map", v28, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = HKLogHealthOntology();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id v28 = 138543362;
        uint64_t v29 = v13;
        _os_log_fault_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_FAULT, "HDOntologyConceptManager failed to populate the attribute identifier map. Error: %{public}@", v28, 0xCu);
      }
    }
  }
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  attributeIdentifierByCodingSystemURN = self->_attributeIdentifierByCodingSystemURN;
  uint64_t v16 = [v5 identifier];
  uint64_t v17 = (void *)v16;
  if (v16) {
    int v18 = (__CFString *)v16;
  }
  else {
    int v18 = &stru_1F1728D60;
  }
  id v19 = [(NSMutableDictionary *)attributeIdentifierByCodingSystemURN objectForKeyedSubscript:v18];

  os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
  if (!v19)
  {
    _HKInitializeLogging();
    uint64_t v20 = HKLogHealthOntology();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: no attribute identifier found for %{public}@", buf, 0x16u);
    }
    id v19 = objc_msgSend(v5, "ontology_hasCodingSystemAttributeIdentifier");
    if (v19)
    {
      _HKInitializeLogging();
      uint64_t v22 = HKLogHealthOntology();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v23;
        _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: attribute identifier found in fallback mapping for coding system \"%{public}@\"", buf, 0x16u);
      }
      id v24 = v19;
    }
  }

  return v19;
}

BOOL __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[HDSimpleGraphDatabaseAttributeEntity predicateForAttributesWithType:500];
  id v7 = [v5 graphDatabase];

  id v8 = [v7 underlyingDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke_2;
  void v11[3] = &unk_1E6305600;
  id v12 = *(id *)(a1 + 32);
  BOOL v9 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesWithPredicate:v6 skipDeleted:1 database:v8 error:a3 enumerationHandler:v11];

  return v9;
}

uint64_t __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "nodeID"));
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v4 value];

  [v6 setObject:v5 forKeyedSubscript:v7];
  return 1;
}

- (BOOL)unitTesting_attributeIdentifierByCodingSystemURNMapIsReady
{
  v2 = self;
  p_attributeIdentifierByCodingSystemURNLocuint64_t k = &self->_attributeIdentifierByCodingSystemURNLock;
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  LOBYTE(v2) = v2->_attributeIdentifierByCodingSystemURNIsReady;
  os_unfair_lock_unlock(p_attributeIdentifierByCodingSystemURNLock);
  return (char)v2;
}

- (void)daemonReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  id v5 = [v4 ontologyUpdateCoordinator];
  uint64_t v6 = [v5 importer];
  [v6 addOntologyShardImporterObserver:self queue:0];
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "identifier", a3);
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2A2D0]];

  if (v6)
  {
    _HKInitializeLogging();
    id v7 = HKLogHealthOntology();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = self;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ got notified that the \"Universal\" shard was imported. Will reset attribute identifier map if necessary.", (uint8_t *)&v11, 0xCu);
    }

    if (self)
    {
      os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
      BOOL attributeIdentifierByCodingSystemURNIsReady = self->_attributeIdentifierByCodingSystemURNIsReady;
      self->_BOOL attributeIdentifierByCodingSystemURNIsReady = 0;
      [(NSMutableDictionary *)self->_attributeIdentifierByCodingSystemURN removeAllObjects];
      os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
      BOOL v9 = _Block_copy(self->_unitTesting_didResetAttributeIdentifierMap);
      id v10 = v9;
      if (v9) {
        (*((void (**)(void *, BOOL))v9 + 2))(v9, attributeIdentifierByCodingSystemURNIsReady);
      }
    }
  }
}

- (id)unitTesting_didResetAttributeIdentifierMap
{
  return self->_unitTesting_didResetAttributeIdentifierMap;
}

- (void)setUnitTesting_didResetAttributeIdentifierMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didResetAttributeIdentifierMap, 0);
  objc_storeStrong((id *)&self->_attributeIdentifierByCodingSystemURN, 0);
  objc_storeStrong((id *)&self->_conceptsByIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end