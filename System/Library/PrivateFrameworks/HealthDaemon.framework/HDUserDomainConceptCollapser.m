@interface HDUserDomainConceptCollapser
+ (BOOL)keepOldestConcept;
+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)shouldDeleteDuplicateConcept;
+ (id)collapseUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4;
- (HDUserDomainConceptCollapser)init;
@end

@implementation HDUserDomainConceptCollapser

- (HDUserDomainConceptCollapser)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)collapseUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  v86[3] = *(id *)MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v12;
  id v17 = v13;
  if ([a1 keepOldestConcept])
  {
    v18 = [v17 creationDate];
    v19 = [v16 creationDate];
    char v20 = objc_msgSend(v18, "hk_isBeforeDate:", v19);

    v21 = v16;
    id v22 = v17;
    if ((v20 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v23 = [v17 modificationDate];
  v24 = [v16 modificationDate];
  int v25 = objc_msgSend(v23, "hk_isAfterDate:", v24);

  v21 = v16;
  id v22 = v17;
  if (v25)
  {
LABEL_5:

    id v22 = v16;
    v21 = v17;
  }
LABEL_6:
  id v26 = v22;
  id v27 = v21;
  id v28 = v14;
  id v29 = v15;
  v30 = self;
  if (![v30 preDeduplicationProcessingForUserDomainConcept:v27 duplicateConcept:v26 transaction:v29 error:a7])goto LABEL_19; {
  v31 = [v26 UUID];
  }
  uint64_t v32 = [v27 UUID];
  v33 = a7;
  v34 = (void *)v32;
  v82 = v33;
  BOOL v35 = +[HDUserDomainConceptEntity updateLinksTargetingUserDomainConceptUUID:toTargetUserDomainConceptUUID:profile:transaction:error:](HDUserDomainConceptEntity, "updateLinksTargetingUserDomainConceptUUID:toTargetUserDomainConceptUUID:profile:transaction:error:", v31, v32, v28, v29);

  if (!v35)
  {
LABEL_19:
    id v65 = 0;
    goto LABEL_37;
  }
  v80 = v28;
  id v77 = v17;
  id v78 = v16;
  id v36 = v27;
  id v37 = v26;
  v79 = v30;
  self;
  id v38 = v36;
  id v39 = v37;
  self;
  v40 = [v39 propertyCollection];

  v41 = (void *)[v38 copyUserDomainConceptByMergingInPropertyCollection:v40];
  id v76 = v38;

  v75 = v41;
  id v42 = v41;
  id v43 = v39;
  id v81 = [self mergeSubclassDataTo:v42 fromDuplicateConcept:v43];
  v44 = [v42 codingCollection];
  v45 = [v44 codings];
  v46 = (void *)[v45 mutableCopy];

  v47 = [v43 codingCollection];
  v48 = [v47 codings];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __103__HDUserDomainConceptCollapser__migrateLinkAndCodingCollectionsAndSubclassDataFrom_to_outShouldUpdate___block_invoke;
  v85 = &unk_1E62FDBC8;
  id v49 = v46;
  v86[0] = v49;
  objc_msgSend(v49, "hk_addObjectsFromArray:passingTest:", v48, buf);

  uint64_t v50 = [v49 count];
  v51 = [v42 codingCollection];
  v52 = [v51 codings];
  uint64_t v53 = [v52 count];

  BOOL v55 = v50 != v53 || v81 != v42;
  id v56 = v43;
  id v57 = v42;
  self;
  v58 = [v57 linkCollection];

  v59 = (void *)MEMORY[0x1E4F2B648];
  v60 = [v56 linkCollection];
  v83 = v56;

  v61 = [v59 collectionByMergingCollection:v58 otherCollection:v60];

  if (v61 != v58 && (!v58 || ([v61 isEqual:v58] & 1) == 0))
  {

    goto LABEL_21;
  }

  if (v55)
  {
LABEL_21:
    v63 = v76;
    id v17 = v77;
    v64 = v81;
    if ([v49 count]) {
      [v81 userDomainConceptByReplacingLinks:v61 andCodings:v49];
    }
    else {
    id v62 = [v81 userDomainConceptByReplacingLinks:v61];
    }
    int v74 = 1;
    goto LABEL_25;
  }
  id v62 = v57;
  int v74 = 0;
  v63 = v76;
  id v17 = v77;
  v64 = v81;
LABEL_25:

  v66 = v62;
  if (v75 != v63 || v74)
  {
    _HKInitializeLogging();
    v67 = HKLogHealthOntology();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2114;
      v85 = v83;
      LOWORD(v86[0]) = 2114;
      *(id *)((char *)v86 + 2) = v63;
      _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: Update UDC %{public}@ during deduplication by merging %{public}@ into %{public}@", buf, 0x2Au);
    }

    v68 = [v80 userDomainConceptManager];
    int v69 = [v68 updateUserDomainConcept:v62 error:v82];

    if (!v69) {
      goto LABEL_35;
    }
  }
  if (![v79 shouldDeleteDuplicateConcept]) {
    goto LABEL_34;
  }
  _HKInitializeLogging();
  v70 = HKLogHealthOntology();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v79;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v83;
    *(_WORD *)&buf[22] = 2114;
    v85 = v66;
    _os_log_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@: Delete duplicate UDC %{public}@ keeping UDC %{public}@", buf, 0x20u);
  }

  v71 = [v80 userDomainConceptManager];
  int v72 = [v71 deleteUserDomainConcept:v83 error:v82];

  if (v72) {
LABEL_34:
  }
    id v65 = v66;
  else {
LABEL_35:
  }
    id v65 = 0;
  id v28 = v80;

  id v16 = v78;
LABEL_37:

  return v65;
}

uint64_t __103__HDUserDomainConceptCollapser__migrateLinkAndCodingCollectionsAndSubclassDataFrom_to_outShouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v5 = [v3 codingSystem];
    v6 = [v5 identifier];
    uint64_t v7 = *MEMORY[0x1E4F29FC0];
    if (v6 == (void *)*MEMORY[0x1E4F29FC0])
    {
      uint64_t v4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    if (v7)
    {
      v8 = [v3 codingSystem];
      v9 = [v8 identifier];
      if ([v9 isEqualToString:v7])
      {
        uint64_t v4 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v18 = v9;
      char v20 = v8;
    }
    v10 = objc_msgSend(v3, "codingSystem", v18, v20);
    uint64_t v11 = [v10 identifier];
    id v12 = (void *)v11;
    uint64_t v13 = *MEMORY[0x1E4F29FC8];
    uint64_t v4 = v11 != *MEMORY[0x1E4F29FC8];
    if (*MEMORY[0x1E4F29FC8]) {
      BOOL v14 = v11 == v13;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      id v15 = [v3 codingSystem];
      id v16 = [v15 identifier];
      uint64_t v4 = [v16 isEqualToString:v13] ^ 1;
    }
    v9 = v19;
    v8 = v21;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v4 = 0;
LABEL_18:

  return v4;
}

+ (BOOL)preDeduplicationProcessingForUserDomainConcept:(id)a3 duplicateConcept:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (id)mergeSubclassDataTo:(id)a3 fromDuplicateConcept:(id)a4
{
  id v4 = a3;

  return v4;
}

+ (BOOL)shouldDeleteDuplicateConcept
{
  return 1;
}

+ (BOOL)keepOldestConcept
{
  return 1;
}

@end