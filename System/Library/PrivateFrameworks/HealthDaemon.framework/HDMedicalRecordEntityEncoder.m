@interface HDMedicalRecordEntityEncoder
@end

@implementation HDMedicalRecordEntityEncoder

uint64_t __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 ontologyVersion];
}

id __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2ADE8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 conceptIdentifier];

  v6 = (void *)[v4 initWithRawIdentifier:v5];

  return v6;
}

BOOL __74___HDMedicalRecordEntityEncoder__applyConceptIndexToObject_profile_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = a2;
  id v11 = v7;
  self;
  id v12 = v11;
  id v13 = v10;
  self;
  v14 = [v13 profile];

  v15 = [v14 ontologyDatabase];
  id v16 = [v15 ontologyContentVersionWithError:a3];

  if (!v16) {
    goto LABEL_22;
  }
  if (([v16 isEqual:v12] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 1001, @"Failed to load concepts; ontology version (%@) does not match expected (%@)",
      v16,
      v12);
LABEL_22:
    id v42 = 0;
    v43 = v12;
LABEL_27:

    goto LABEL_28;
  }

  v17 = [v13 profile];
  v18 = [v17 ontologyConceptManager];

  v19 = [v9 allObjects];
  v52 = v18;
  v20 = [v18 conceptsForIdentifiers:v19 options:0 error:a3];

  if (v20)
  {
    uint64_t v53 = a3;
    id v49 = v9;
    uint64_t v51 = v5;
    v47 = v20;
    v21 = objc_msgSend(v20, "hk_mapToDictionary:", &__block_literal_global_450);
    id v50 = v8;
    id v22 = v8;
    id v16 = v21;
    id v48 = v13;
    id v54 = v13;
    self;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v24 = v22;
    uint64_t v57 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v57)
    {
      uint64_t v25 = *(void *)v59;
      id v55 = v16;
      uint64_t v56 = *MEMORY[0x1E4F29908];
LABEL_6:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v59 != v25) {
          objc_enumerationMutation(v24);
        }
        v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
        v28 = [v27 keyPath];
        id v29 = [v23 objectForKeyedSubscript:v28];

        if (!v29)
        {
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v30 = [v27 keyPath];
          [v23 setObject:v29 forKeyedSubscript:v30];
        }
        v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v27, "conceptIdentifier"));
        v32 = [v16 objectForKeyedSubscript:v31];

        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v53, 1001, @"Unable to find concepts referenced from concept index entry.");
LABEL_25:

          id v42 = 0;
          id v16 = v55;
          goto LABEL_26;
        }
        v33 = [v27 keyPath];
        if (![v33 isEqualToString:v56]) {
          goto LABEL_17;
        }
        uint64_t v34 = v25;
        id v35 = v23;
        id v36 = v24;
        char v37 = [v32 relationshipsAreLoaded];

        if ((v37 & 1) == 0) {
          break;
        }
        id v24 = v36;
        id v23 = v35;
        uint64_t v25 = v34;
        id v16 = v55;
LABEL_18:
        v41 = objc_msgSend(MEMORY[0x1E4F2B110], "indexableObjectWithObject:compoundIndex:", v32, objc_msgSend(v27, "compoundIndex"));
        [v29 addObject:v41];

        if (v57 == ++v26)
        {
          uint64_t v57 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v57) {
            goto LABEL_6;
          }
          goto LABEL_20;
        }
      }
      v38 = [v32 identifier];
      v39 = [v54 profile];
      v33 = +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:v38 profile:v39 error:v53];

      id v24 = v36;
      id v23 = v35;
      if (!v33) {
        goto LABEL_25;
      }
      uint64_t v40 = [v32 copyWithRelationships:v33];

      v32 = (void *)v40;
      uint64_t v25 = v34;
      id v16 = v55;
LABEL_17:

      goto LABEL_18;
    }
LABEL_20:

    id v42 = v23;
LABEL_26:

    id v8 = v50;
    uint64_t v5 = v51;
    id v13 = v48;
    id v9 = v49;
    id v12 = v47;
    v43 = v52;
    goto LABEL_27;
  }
  id v12 = 0;
  id v42 = 0;
  v43 = v52;
LABEL_28:

  uint64_t v44 = *(void *)(*(void *)(v5 + 56) + 8);
  v45 = *(void **)(v44 + 40);
  *(void *)(v44 + 40) = v42;

  return *(void *)(*(void *)(*(void *)(v5 + 56) + 8) + 40) != 0;
}

void __152___HDMedicalRecordEntityEncoder__indexableConceptsByKeyPathForConceptIndexEntries_conceptIdentifiers_expectedOntologyVersion_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = a3;
  id v6 = a2;
  id v8 = [v6 identifier];
  v7 = [v8 numberRepresentation];
  ((void (**)(void, void *, id))a3)[2](v5, v7, v6);
}

@end