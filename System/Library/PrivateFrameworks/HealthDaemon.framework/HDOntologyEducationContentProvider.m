@interface HDOntologyEducationContentProvider
+ (BOOL)localizedEducationContentForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 localizedEducationContentOut:(id *)a5 error:(id *)a6;
+ (id)_localizedSectionDataForAttribute:(void *)a3 timestamp:;
@end

@implementation HDOntologyEducationContentProvider

+ (BOOL)localizedEducationContentForConceptWithIdentifier:(id)a3 ontologyTransaction:(id)a4 localizedEducationContentOut:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = +[HDOntologyConceptManager predicateMatchingRelationshipsWithSubjectId:v10 relationshipType:988];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = -1;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __143__HDOntologyEducationContentProvider_localizedEducationContentForConceptWithIdentifier_ontologyTransaction_localizedEducationContentOut_error___block_invoke;
  v23 = &unk_1E6305280;
  v25 = &v32;
  v26 = &v28;
  id v14 = v13;
  id v24 = v14;
  id v27 = a1;
  BOOL v15 = +[HDOntologyConceptManager enumerateRelationshipsMatchingPredicate:v12 options:13 transaction:v11 error:a6 enumerationHandler:&v20];
  if (v15)
  {
    if (v33[3] != -1)
    {
      if (*((unsigned char *)v29 + 24))
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F2B2E8], "nullPropertyWithVersion:", v20, v21, v22, v23);
        goto LABEL_7;
      }
      if (objc_msgSend(v14, "count", v20, v21, v22, v23))
      {
        id v17 = objc_alloc(MEMORY[0x1E4F2B2E8]);
        uint64_t v16 = [v17 initWithSections:v14 version:v33[3] timestamp:0 deleted:CFAbsoluteTimeGetCurrent()];
LABEL_7:
        v18 = (void *)v16;
        if (!a5)
        {
LABEL_9:

          goto LABEL_10;
        }
LABEL_8:
        *a5 = v18;
        goto LABEL_9;
      }
    }
    v18 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_10:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

uint64_t __143__HDOntologyEducationContentProvider_localizedEducationContentForConceptWithIdentifier_ontologyTransaction_localizedEducationContentOut_error___block_invoke(void *a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 version];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v4 > v6) {
    uint64_t v6 = v4;
  }
  *(void *)(v5 + 24) = v6;
  char v7 = [v3 isDeleted];
  uint64_t v8 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (([v3 isDeleted] & 1) == 0)
  {
    v67 = (void *)a1[4];
    id v68 = v3;
    id v10 = [v3 destination];
    uint64_t v11 = self;
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double Current = CFAbsoluteTimeGetCurrent();
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v66 = v10;
    id obj = [v10 attributes];
    v70 = v13;
    v71 = v12;
    uint64_t v83 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
    if (!v83)
    {
      int64_t v18 = 0xFFFFFFFF80000000;
      int64_t v76 = 0xFFFFFFFF80000000;
      goto LABEL_43;
    }
    uint64_t v80 = *(void *)v94;
    int64_t v18 = 0xFFFFFFFF80000000;
    int64_t v76 = 0xFFFFFFFF80000000;
    uint64_t v69 = v11;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v94 != v80) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v93 + 1) + 8 * v19);
        uint64_t v21 = [v20 type];
        if (v21 <= 799)
        {
          switch(v21)
          {
            case 666:
              v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v23 = v82;
              id v24 = v22;
              v25 = &unk_1F17EEB98;
              break;
            case 667:
              v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v23 = v82;
              id v24 = v22;
              v25 = &unk_1F17EEBB0;
              break;
            case 668:
              v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v23 = v82;
              id v24 = v22;
              v25 = &unk_1F17EEBC8;
              break;
            default:
              goto LABEL_36;
          }
LABEL_35:
          [v23 setObject:v24 forKeyedSubscript:v25];
        }
        else
        {
          switch(v21)
          {
            case 800:
              v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v23 = v82;
              id v24 = v22;
              v25 = &unk_1F17EEB68;
              goto LABEL_35;
            case 801:
              v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              v23 = v82;
              id v24 = v22;
              v25 = &unk_1F17EEB80;
              goto LABEL_35;
            case 802:
              v38 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
              [v74 addObject:v38];

              break;
            case 803:
              v39 = [v20 stringValue];
              objc_msgSend(v12, "hk_addNonNilObject:", v39);

              uint64_t v40 = [v20 version];
              int64_t v41 = v76;
              if (v76 <= v40) {
                int64_t v41 = v40;
              }
              int64_t v76 = v41;
              if (v16) {
                uint64_t v16 = 1;
              }
              else {
                uint64_t v16 = [v20 isDeleted];
              }
              break;
            case 804:
              v42 = [v20 stringValue];
              objc_msgSend(v13, "hk_addNonNilObject:", v42);

              uint64_t v43 = [v20 version];
              if (v18 <= v43) {
                int64_t v18 = v43;
              }
              if (v15) {
                uint64_t v15 = 1;
              }
              else {
                uint64_t v15 = [v20 isDeleted];
              }
              break;
            default:
              if (v21 == 957)
              {
                v22 = +[HDOntologyEducationContentProvider _localizedSectionDataForAttribute:timestamp:](Current, v11, v20);
                v23 = v82;
                id v24 = v22;
                v25 = &unk_1F17EEB50;
                goto LABEL_35;
              }
              if (v21 == 959)
              {
                id v26 = objc_alloc(MEMORY[0x1E4F2B2E0]);
                [v20 stringValue];
                id v27 = v72 = v17;
                uint64_t v28 = [v27 componentsSeparatedByString:@","];
                uint64_t v29 = v16;
                int64_t v30 = v18;
                uint64_t v31 = v15;
                uint64_t v32 = HDOntologyEducationContentSectionDataTypeForAttributeType([v20 type]);
                uint64_t v33 = [v20 version];
                uint64_t v34 = [v20 isDeleted];
                uint64_t v35 = v26;
                id v13 = v70;
                uint64_t v36 = v32;
                uint64_t v15 = v31;
                int64_t v18 = v30;
                uint64_t v16 = v29;
                uint64_t v37 = [v35 initWithStringValues:v28 sectionDataType:v36 version:v33 timestamp:v34 deleted:Current];

                uint64_t v11 = v69;
                id v17 = (void *)v37;
                id v12 = v71;
              }
              break;
          }
        }
LABEL_36:
        ++v19;
      }
      while (v83 != v19);
      uint64_t v44 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
      uint64_t v83 = v44;
      if (!v44)
      {
LABEL_43:

        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_msgSend(v45, "hk_addNonNilObject:", v17);
        if ([v12 count])
        {
          id v46 = objc_alloc(MEMORY[0x1E4F2B2E0]);
          v47 = [v12 allObjects];
          v48 = (void *)[v46 initWithStringValues:v47 sectionDataType:4 version:v76 timestamp:v16 & 1 deleted:Current];

          [v45 addObject:v48];
        }
        v73 = v17;
        if ([v13 count])
        {
          id v49 = objc_alloc(MEMORY[0x1E4F2B2E0]);
          v50 = [v13 allObjects];
          v51 = (void *)[v49 initWithStringValues:v50 sectionDataType:5 version:v18 timestamp:v15 & 1 deleted:Current];

          [v45 addObject:v51];
        }
        id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v75 = v74;
        uint64_t v81 = [v75 countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (v81)
        {
          uint64_t v77 = *(void *)v90;
          id obja = v45;
          do
          {
            uint64_t v53 = 0;
            do
            {
              if (*(void *)v90 != v77) {
                objc_enumerationMutation(v75);
              }
              uint64_t v84 = v53;
              v54 = [v45 arrayByAddingObject:*(void *)(*((void *)&v89 + 1) + 8 * v53)];
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              id v55 = v82;
              uint64_t v56 = [v55 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v56)
              {
                uint64_t v57 = v56;
                uint64_t v58 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v57; ++i)
                  {
                    if (*(void *)v86 != v58) {
                      objc_enumerationMutation(v55);
                    }
                    v60 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                    v61 = [v55 objectForKeyedSubscript:v60];
                    v62 = [v54 arrayByAddingObject:v61];

                    v63 = objc_msgSend(v62, "hk_mapToDictionary:", &__block_literal_global_161);
                    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B2F0]), "initWithSectionDataTypeMapping:sectionType:", v63, objc_msgSend(v60, "integerValue"));
                    [v52 addObject:v64];
                  }
                  uint64_t v57 = [v55 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }
                while (v57);
              }

              uint64_t v53 = v84 + 1;
              id v45 = obja;
            }
            while (v84 + 1 != v81);
            uint64_t v81 = [v75 countByEnumeratingWithState:&v89 objects:v98 count:16];
          }
          while (v81);
        }

        [v67 addObjectsFromArray:v52];
        id v3 = v68;
        break;
      }
    }
  }

  return 1;
}

+ (id)_localizedSectionDataForAttribute:(void *)a3 timestamp:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\\n", @"\n", 0, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\\t", @"\t", 0, 0, objc_msgSend(v6, "length"));
  id v7 = objc_alloc(MEMORY[0x1E4F2B2E0]);
  v14[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v9 = HDOntologyEducationContentSectionDataTypeForAttributeType([v4 type]);
  uint64_t v10 = [v4 version];
  uint64_t v11 = [v4 isDeleted];

  id v12 = (void *)[v7 initWithStringValues:v8 sectionDataType:v9 version:v10 timestamp:v11 deleted:a1];

  return v12;
}

void __83__HDOntologyEducationContentProvider__localizedEducationContentSectionsForConcept___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a3)[2](v6, v8, v7);
}

@end