@interface ACHEarnedInstanceDuplicateUtility
- (ACHEarnedInstanceDuplicateUtility)initWithTemplateStore:(id)a3;
- (ACHTemplateStore)templateStore;
- (NSCalendar)gregorianCalendar;
- (id)earnedInstancesLimitedByEarnLimit:(id)a3;
- (id)earnedInstancesWithoutDuplicates:(id)a3;
- (void)setGregorianCalendar:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation ACHEarnedInstanceDuplicateUtility

- (ACHEarnedInstanceDuplicateUtility)initWithTemplateStore:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHEarnedInstanceDuplicateUtility;
  v5 = [(ACHEarnedInstanceDuplicateUtility *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_templateStore, v4);
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;
  }
  return v6;
}

- (id)earnedInstancesWithoutDuplicates:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_17);
  if ([v5 count] != 1)
  {
    v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceDuplicateUtility earnedInstancesWithoutDuplicates:]((uint64_t)v5, v6);
    }
  }
  uint64_t v7 = [(ACHEarnedInstanceDuplicateUtility *)self templateStore];
  v8 = [v4 anyObject];
  v9 = [v8 templateUniqueName];
  objc_super v10 = [v7 templateForUniqueName:v9];

  id v62 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v11 = [(ACHEarnedInstanceDuplicateUtility *)self gregorianCalendar];
  uint64_t v64 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  id v12 = v4;
  v61 = v12;
  if ([v12 count])
  {
    v70 = v10;
    v74 = v11;
    do
    {
      context = (void *)MEMORY[0x223C50570]();
      v78 = [v12 anyObject];
      id v76 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id obj = v12;
      id v79 = (id)[obj countByEnumeratingWithState:&v81 objects:v89 count:16];
      if (!v79) {
        goto LABEL_46;
      }
      uint64_t v77 = *(void *)v82;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v82 != v77) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v13);
          v15 = (void *)MEMORY[0x223C50570]();
          id v16 = v10;
          id v17 = v11;
          id v18 = v78;
          id v19 = v14;
          if ([v18 isEqual:v19])
          {
LABEL_13:

LABEL_14:
            [v76 addObject:v19];
            goto LABEL_42;
          }
          if ([v16 duplicateRemovalStrategy] == 4)
          {
            v20 = [v18 externalIdentifier];
            v21 = [v19 externalIdentifier];
            char v22 = [v20 isEqual:v21];
            goto LABEL_17;
          }
          if (![v16 duplicateRemovalCalendarUnit]) {
            goto LABEL_41;
          }
          uint64_t v23 = [v16 duplicateRemovalCalendarUnit];
          unint64_t v24 = [v18 packedEarnedDateComponents];
          unint64_t v25 = [v19 packedEarnedDateComponents];
          uint64_t v26 = v24 & 0xFFFFFFFFFFLL;
          uint64_t v27 = v25 & 0xFFFFFFFFFFLL;
          uint64_t v71 = (v24 >> 16) & 0xFFFFFF;
          uint64_t v28 = (v25 >> 16) & 0xFFFFFF;
          id v29 = v17;
          if (v23 > 15)
          {
            if (v23 == 16)
            {
              if ((unsigned __int16)v27 != (unsigned __int16)v26 || v28 != v71)
              {

                objc_super v10 = v70;
                v11 = v74;
LABEL_41:

                goto LABEL_42;
              }
              unint64_t v30 = (v27 ^ v26) & 0xFF000000;
LABEL_24:

              objc_super v10 = v70;
              v11 = v74;
              if (v30) {
                goto LABEL_41;
              }
              goto LABEL_33;
            }
            if (v23 != 0x2000)
            {
LABEL_30:
              v35 = v29;
              v73 = ACHDateComponentsForPackedDateComponents(v26);
              v66 = [v35 dateFromComponents:v73];
              v69 = ACHDateComponentsForPackedDateComponents(v27);
              v36 = [v35 dateFromComponents:v69];
              char v37 = [v35 isDate:v66 equalToDate:v36 toUnitGranularity:v23];

              objc_super v10 = v70;
              v11 = v74;
              if ((v37 & 1) == 0) {
                goto LABEL_41;
              }
              goto LABEL_33;
            }
            v31 = v29;
            v72 = ACHDateComponentsForPackedDateComponents(v26);
            v67 = v31;
            v65 = [v31 dateFromComponents:v72];
            v68 = ACHDateComponentsForPackedDateComponents(v27);
            v32 = [v31 dateFromComponents:v68];
            v33 = objc_msgSend(v31, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v64, v65, 0);
            v34 = objc_msgSend(v31, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v64, v32, 0);
            LOBYTE(v31) = [v33 isEqual:v34];

            objc_super v10 = v70;
            v11 = v74;
            if ((v31 & 1) == 0) {
              goto LABEL_41;
            }
          }
          else
          {
            if (v23 != 2)
            {
              if (v23 != 8) {
                goto LABEL_30;
              }
              unint64_t v30 = (unsigned __int16)(v27 ^ v26) | (unint64_t)(v28 ^ v71);
              goto LABEL_24;
            }

            objc_super v10 = v70;
            v11 = v74;
          }
LABEL_33:
          int v38 = [v16 duplicateRemovalStrategy];
          if ((v38 - 1) < 2) {
            goto LABEL_13;
          }
          if (v38 != 3) {
            goto LABEL_41;
          }
          uint64_t v39 = [v18 value];
          if (!v39) {
            goto LABEL_41;
          }
          v40 = (void *)v39;
          v41 = [v19 value];

          if (!v41) {
            goto LABEL_41;
          }
          v20 = [v18 value];
          v21 = [v19 value];
          char v22 = [v20 compare:v21] == 0;
LABEL_17:

          v11 = v74;
          if (v22) {
            goto LABEL_14;
          }
LABEL_42:
          v13 = (char *)v13 + 1;
        }
        while (v79 != v13);
        uint64_t v42 = [obj countByEnumeratingWithState:&v81 objects:v89 count:16];
        id v79 = (id)v42;
      }
      while (v42);
LABEL_46:

      id v43 = v10;
      id v44 = v11;
      id v45 = v76;
      id v46 = [v45 anyObject];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v80 = v45;
      uint64_t v47 = [v80 countByEnumeratingWithState:&v85 objects:v90 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v86 != v49) {
              objc_enumerationMutation(v80);
            }
            v51 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            id v52 = v43;
            id v53 = v44;
            id v54 = v46;
            id v55 = v51;
            char v56 = [v54 isEqual:v55];
            v57 = v54;
            if ((v56 & 1) == 0)
            {
              if (ACHComparisonForEarnedInstances(v52, v53, v54, v55) == -1) {
                v57 = v55;
              }
              else {
                v57 = v54;
              }
            }
            id v46 = v57;
          }
          uint64_t v48 = [v80 countByEnumeratingWithState:&v85 objects:v90 count:16];
        }
        while (v48);
      }

      [v62 addObject:v46];
      objc_msgSend(obj, "hk_minus:", v80);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_super v10 = v70;
      v11 = v74;
    }
    while ([v12 count]);
  }
  v58 = (void *)[v62 copy];

  return v58;
}

uint64_t __70__ACHEarnedInstanceDuplicateUtility_earnedInstancesWithoutDuplicates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

- (id)earnedInstancesLimitedByEarnLimit:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_280);
  if ([v5 count] != 1)
  {
    v6 = ACHLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceDuplicateUtility earnedInstancesWithoutDuplicates:]((uint64_t)v5, v6);
    }
  }
  uint64_t v7 = [(ACHEarnedInstanceDuplicateUtility *)self templateStore];
  v8 = [v4 anyObject];
  v9 = [v8 templateUniqueName];
  objc_super v10 = [v7 templateForUniqueName:v9];

  unsigned int v11 = [v10 earnLimit];
  if (*MEMORY[0x263F235F0] == v11)
  {
    id v12 = v4;
  }
  else
  {
    uint64_t v13 = v11;
    v14 = [v4 allObjects];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke_281;
    v21 = &unk_264517288;
    id v22 = v10;
    uint64_t v23 = self;
    v15 = [v14 sortedArrayUsingComparator:&v18];

    id v16 = objc_msgSend(v15, "subarrayWithRange:", objc_msgSend(v15, "count", v18, v19, v20, v21) - v13, v13);
    id v12 = [MEMORY[0x263EFFA08] setWithArray:v16];
  }
  return v12;
}

uint64_t __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke(uint64_t a1, void *a2)
{
  return [a2 templateUniqueName];
}

uint64_t __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke_281(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 gregorianCalendar];
  uint64_t v9 = ACHComparisonForEarnedInstances(v4, v8, v7, v6);

  return v9;
}

- (ACHTemplateStore)templateStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  return (ACHTemplateStore *)WeakRetained;
}

- (void)setTemplateStore:(id)a3
{
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_destroyWeak((id *)&self->_templateStore);
}

- (void)earnedInstancesWithoutDuplicates:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "-earnedInstancesWithoutDuplicates: called with instances of multiple templates, template names: %@", (uint8_t *)&v2, 0xCu);
}

@end