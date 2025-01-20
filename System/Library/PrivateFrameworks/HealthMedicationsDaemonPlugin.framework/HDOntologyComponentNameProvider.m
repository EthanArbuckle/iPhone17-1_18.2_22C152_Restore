@interface HDOntologyComponentNameProvider
+ (BOOL)_conceptIdentifiersFollowingFormOfRelationshipForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 conceptIdentifierOut:(id *)a5 deletedFormOfRelationshipVersionOut:(int64_t *)a6 error:(id *)a7;
+ (id)_componentNamesFromClinicalProductConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
+ (id)_componentNamesFromClinicalProductIdentifiers:(id)a3 deletedRelationshipVersion:(int64_t)a4 ontologyTransaction:(id)a5 error:(id *)a6;
+ (id)_conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 maximumComponentDeletedRelationshipVersionOut:(int64_t *)a5 error:(id *)a6;
+ (id)componentNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5;
@end

@implementation HDOntologyComponentNameProvider

+ (id)componentNamesForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F659F8];
  id v22 = 0;
  uint64_t v23 = v10;
  int v11 = [a1 _conceptIdentifiersFollowingFormOfRelationshipForNodeWithIdentifier:v8 ontologyTransaction:v9 conceptIdentifierOut:&v22 deletedFormOfRelationshipVersionOut:&v23 error:a5];
  id v12 = v22;
  v13 = 0;
  if (v11)
  {
    uint64_t v21 = v10;
    v14 = [a1 _conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier:v8 ontologyTransaction:v9 maximumComponentDeletedRelationshipVersionOut:&v21 error:a5];
    v15 = v14;
    if (!v14)
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v16 = v23;
    if (v12)
    {
      v24[0] = v12;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      if (![v14 count])
      {
        v18 = 0;
        goto LABEL_9;
      }
      id v17 = v15;
    }
    v18 = v17;
LABEL_9:
    if (v16 == v10) {
      uint64_t v19 = v21;
    }
    else {
      uint64_t v19 = v16;
    }
    v13 = [a1 _componentNamesFromClinicalProductIdentifiers:v18 deletedRelationshipVersion:v19 ontologyTransaction:v9 error:a5];

    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

+ (BOOL)_conceptIdentifiersFollowingFormOfRelationshipForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 conceptIdentifierOut:(id *)a5 deletedFormOfRelationshipVersionOut:(int64_t *)a6 error:(id *)a7
{
  id v12 = 0;
  int v8 = [MEMORY[0x1E4F65B90] followRelationshipsWithTypes:&unk_1F17FC6C0 startingIdentifier:a3 options:12 ontologyTransaction:a4 conceptOut:&v12 deletedRelationshipVersionOut:a6 error:a7];
  id v9 = v12;
  uint64_t v10 = v9;
  if (a5 && v8)
  {
    *a5 = [v9 identifier];
  }

  return v8;
}

+ (id)_conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier:(id)a3 ontologyTransaction:(id)a4 maximumComponentDeletedRelationshipVersionOut:(int64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = [MEMORY[0x1E4F65B90] predicateMatchingRelationshipsWithSubjectId:v9 relationshipType:809];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = *MEMORY[0x1E4F659F8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  v13 = (void *)MEMORY[0x1E4F65B90];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __187__HDOntologyComponentNameProvider__conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier_ontologyTransaction_maximumComponentDeletedRelationshipVersionOut_error___block_invoke;
  v18[3] = &unk_1E6337D10;
  v20 = &v26;
  uint64_t v21 = &v22;
  id v14 = v12;
  id v19 = v14;
  int v15 = [v13 enumerateRelationshipsMatchingPredicate:v11 options:8 transaction:v10 error:a6 enumerationHandler:v18];
  if (a5 && *((unsigned char *)v23 + 24)) {
    *a5 = v27[3];
  }
  if (v15) {
    id v16 = v14;
  }
  else {
    id v16 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __187__HDOntologyComponentNameProvider__conceptIdentifiersFollowingMultipleComponentRelationshipsForNodeWithIdentifier_ontologyTransaction_maximumComponentDeletedRelationshipVersionOut_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDeleted])
  {
    uint64_t v4 = [v3 version];

    uint64_t v5 = *(void *)(a1[5] + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    if (v4 > v6) {
      uint64_t v6 = v4;
    }
    *(void *)(v5 + 24) = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    v7 = (void *)a1[4];
    int v8 = [v3 destination];

    id v9 = [v8 identifier];
    [v7 addObject:v9];
  }
  return 1;
}

+ (id)_componentNamesFromClinicalProductIdentifiers:(id)a3 deletedRelationshipVersion:(int64_t)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(a1, "_componentNamesFromClinicalProductConceptWithIdentifier:ontologyTransaction:error:", *(void *)(*((void *)&v22 + 1) + 8 * i), v11, a6, (void)v22);
          if (!v18)
          {

            id v20 = 0;
            goto LABEL_12;
          }
          id v19 = (void *)v18;
          [v12 addObjectsFromArray:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v20 = v12;
LABEL_12:
  }
  else if (*MEMORY[0x1E4F659F8] == a4)
  {
    id v20 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v20 = [MEMORY[0x1E4F65BA0] nullLocalizedOntologyPreferredNamesWithVersion:a4 withUserDomainConceptPropertyType:160022];
  }

  return v20;
}

+ (id)_componentNamesFromClinicalProductConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F65B90];
  id v8 = a4;
  id v9 = [v7 predicateMatchingRelationshipsWithSubjectId:a3 relationshipType:809];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = (void *)MEMORY[0x1E4F65B90];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__HDOntologyComponentNameProvider__componentNamesFromClinicalProductConceptWithIdentifier_ontologyTransaction_error___block_invoke;
  v16[3] = &unk_1E6337560;
  id v17 = v10;
  id v12 = v10;
  LODWORD(a5) = [v11 enumerateRelationshipsMatchingPredicate:v9 options:5 transaction:v8 error:a5 enumerationHandler:v16];

  if (a5) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

uint64_t __117__HDOntologyComponentNameProvider__componentNamesFromClinicalProductConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F65BA0];
  id v4 = a2;
  uint64_t v5 = [v4 destination];
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = [v4 version];

  id v8 = [v6 numberWithLongLong:v7];
  id v9 = [v3 localizedOntologyPreferredNamesForConcept:v5 version:v8 withUserDomainConceptPropertyType:160022];

  [*(id *)(a1 + 32) addObjectsFromArray:v9];
  return 1;
}

@end