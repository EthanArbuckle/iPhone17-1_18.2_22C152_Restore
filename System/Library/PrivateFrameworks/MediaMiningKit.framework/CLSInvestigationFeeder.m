@interface CLSInvestigationFeeder
- (BOOL)allowsInterview;
- (CLSInvestigationFeeder)init;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSMutableSet)focusItems;
- (NSSet)focusPersonLocalIdentifiers;
- (double)behavioralScore;
- (id)_prepareFeederWithServiceManager:(id)a3 locationCache:(id)a4 progressBlock:(id)a5;
- (id)allItems;
- (id)approximateLocation;
- (id)itemAtIndex:(unint64_t)a3;
- (id)localEndDateComponents;
- (id)localStartDateComponents;
- (id)locationClustersWithProgressBlock:(id)a3;
- (id)privateItems;
- (id)sharedItems;
- (unint64_t)locationClusteringAlgorithm;
- (unint64_t)numberOfItems;
- (unint64_t)numberOfItemsInInvestigation:(id)a3;
- (unint64_t)numberOfRegularGemItems;
- (unint64_t)numberOfShinyGemItems;
- (void)_enumerateLocationClustersWithGaussians:(id)a3 enumerationBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePersonNames:(id)a3 withGaussiansUsingBlock:(id)a4;
- (void)setAllowsInterview:(BOOL)a3;
- (void)setFocusPersonLocalIdentifiers:(id)a3;
- (void)setLocationClusteringAlgorithm:(unint64_t)a3;
@end

@implementation CLSInvestigationFeeder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_focusItems, 0);
}

- (void)setFocusPersonLocalIdentifiers:(id)a3
{
}

- (NSSet)focusPersonLocalIdentifiers
{
  return self->_focusPersonLocalIdentifiers;
}

- (NSMutableSet)focusItems
{
  return self->_focusItems;
}

- (void)setAllowsInterview:(BOOL)a3
{
  self->_allowsInterview = a3;
}

- (BOOL)allowsInterview
{
  return self->_allowsInterview;
}

- (void)setLocationClusteringAlgorithm:(unint64_t)a3
{
  self->_locationClusteringAlgorithm = a3;
}

- (unint64_t)locationClusteringAlgorithm
{
  return self->_locationClusteringAlgorithm;
}

- (unint64_t)numberOfItemsInInvestigation:(id)a3
{
  if (![(CLSInvestigationFeeder *)self allowsInterview]) {
    return 0;
  }
  return [(CLSInvestigationFeeder *)self numberOfItems];
}

- (id)locationClustersWithProgressBlock:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  uint64_t v4 = MEMORY[0x1D2602540]();
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  v38 = (void *)v4;
  if (v4
    && (char v51 = 0,
        (*(void (**)(uint64_t, char *, double))(v4 + 16))(v4, &v51, 0.0),
        char v5 = *((unsigned char *)v53 + 24) | v51,
        (*((unsigned char *)v53 + 24) = v5) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v58 = 501;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    id v6 = 0;
  }
  else
  {
    v7 = [(CLSInvestigationFeeder *)self allItems];
    v36 = self;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1E4F8A930];
          objc_msgSend(v14, "pl_coordinate", v36);
          if (objc_msgSend(v15, "canUseCoordinate:"))
          {
            objc_msgSend(v14, "pl_gpsHorizontalAccuracy");
            double v17 = v16;
            v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
            [v9 addObject:v18];

            if ([MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:v17]) {
              [v8 addObject:v14];
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v11);
    }

    [v9 sortUsingSelector:sel_compare_];
    unint64_t v19 = [v9 count];
    if (v19)
    {
      v20 = [v9 objectAtIndexedSubscript:v19 >> 1];
      [v20 doubleValue];
      double v22 = v21;
    }
    else
    {
      double v22 = *MEMORY[0x1E4F8B7F0];
    }
    id v23 = v10;
    v24 = v23;
    if (([MEMORY[0x1E4F8A930] horizontalAccuracyIsCoarse:v22] & 1) == 0)
    {
      v24 = v23;
      if ([v8 count])
      {
        v25 = (void *)MEMORY[0x1E4F28F60];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke;
        v45[3] = &unk_1E690F5A8;
        id v46 = v8;
        v26 = [v25 predicateWithBlock:v45];
        v24 = [v23 filteredArrayUsingPredicate:v26];
      }
    }
    v27 = (void *)MEMORY[0x1E4F8AB20];
    uint64_t v28 = [(CLSInvestigationFeeder *)v36 locationClusteringAlgorithm];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_2;
    v42[3] = &unk_1E6910648;
    id v29 = v38;
    id v43 = v29;
    v44 = &v52;
    v30 = [v27 performClustering:v28 dataset:v24 progressBlock:v42];
    if (v30)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v30, "count"));
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_3;
      v39[3] = &unk_1E690F5D0;
      double v41 = v22;
      id v32 = v31;
      id v40 = v32;
      [v30 enumerateKeysAndObjectsUsingBlock:v39];
      id v33 = v32;
    }
    else
    {
      id v33 = 0;
    }
    if (v38
      && (char v51 = 0,
          (*((void (**)(id, char *, double))v29 + 2))(v29, &v51, 1.0),
          char v34 = *((unsigned char *)v53 + 24) | v51,
          (*((unsigned char *)v53 + 24) = v34) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v58 = 549;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v6 = 0;
    }
    else
    {
      id v6 = v33;
    }
  }
  _Block_object_dispose(&v52, 8);

  return v6;
}

uint64_t __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __60__CLSInvestigationFeeder_locationClustersWithProgressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(double *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v7 setClsHorizontalAccuracy:v5];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (id)_prepareFeederWithServiceManager:(id)a3 locationCache:(id)a4 progressBlock:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v53 = a4;
  id v9 = a5;
  uint64_t v10 = MEMORY[0x1D2602540]();
  uint64_t v11 = (void *)v10;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x2020000000;
  char v93 = 0;
  if (!v10
    || (LOBYTE(v96) = 0,
        (*(void (**)(uint64_t, int *, double))(v10 + 16))(v10, &v96, 0.0),
        char v12 = *((unsigned char *)v91 + 24) | v96,
        (*((unsigned char *)v91 + 24) = v12) == 0))
  {
    long long v49 = [[CLSClueCollection alloc] initWithServiceManager:v8];
    char v51 = objc_opt_new();
    long long v50 = objc_opt_new();
    id v46 = objc_opt_new();
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    long long v48 = [(CLSInvestigationFeeder *)self allItems];
    double v16 = [(CLSInvestigationFeeder *)self focusPersonLocalIdentifiers];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke;
    v86[3] = &unk_1E690F490;
    id v45 = v16;
    id v87 = v45;
    id v47 = v14;
    id v88 = v47;
    id v17 = v15;
    id v89 = v17;
    uint64_t v52 = (void *)MEMORY[0x1D2602540](v86);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2;
    v83[3] = &unk_1E6910648;
    id v18 = v11;
    id v84 = v18;
    v85 = &v90;
    unint64_t v19 = [(CLSInvestigationFeeder *)self locationClustersWithProgressBlock:v83];
    v20 = v19;
    if (*((unsigned char *)v91 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t buf = 0x12404000100;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
      v13 = 0;
      goto LABEL_30;
    }
    uint64_t buf = 0;
    p_uint64_t buf = &buf;
    uint64_t v100 = 0x2020000000;
    char v101 = 1;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_226;
    v82[3] = &unk_1E690F4E0;
    v82[4] = self;
    v82[5] = &buf;
    [v19 enumerateKeysAndObjectsUsingBlock:v82];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_3;
    v73[3] = &unk_1E690F558;
    v80 = &buf;
    v73[4] = self;
    id v21 = v52;
    id v78 = v21;
    id v42 = v18;
    id v79 = v42;
    v81 = &v90;
    id v74 = v53;
    id v41 = v8;
    id v75 = v41;
    id v22 = v50;
    id v76 = v22;
    id v23 = v51;
    id v77 = v23;
    [(CLSInvestigationFeeder *)self _enumerateLocationClustersWithGaussians:v20 enumerationBlock:v73];
    v44 = v20;
    if (*((unsigned char *)v91 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v96 = 67109120;
        int v97 = 392;
        v24 = MEMORY[0x1E4F14500];
LABEL_27:
        _os_log_impl(&dword_1D2150000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v96, 8u);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    [(CLSClueCollection *)v49 mergeClues:v23];
    if ([v22 count]
      && (!*((unsigned char *)p_buf + 24)
       || ([(CLSInvestigationFeeder *)self focusItems],
           v25 = objc_claimAutoreleasedReturnValue(),
           BOOL v26 = [v25 count] == 0,
           v25,
           v26)))
    {
      [(CLSClueCollection *)v49 mergeClues:v22];
    }
    else
    {
      v27 = [(CLSInvestigationFeeder *)self localStartDateComponents];
      v39 = [(CLSInvestigationFeeder *)self localEndDateComponents];
      if (v27 && v39)
      {
        v95[0] = v27;
        v95[1] = v39;
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
        id v29 = +[CLSInputTimeClue clueWithDates:v28 serviceManager:v41];

        v94 = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
        [(CLSClueCollection *)v49 mergeClues:v30];
      }
    }
    if (*((unsigned char *)p_buf + 24) || ![v47 count])
    {
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_236;
      v69[3] = &unk_1E690F530;
      id v70 = v21;
      id v71 = v42;
      v72 = &v90;
      [v48 enumerateObjectsUsingBlock:v69];
    }
    if (*((unsigned char *)v91 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v96 = 67109120;
        int v97 = 421;
        v24 = MEMORY[0x1E4F14500];
        goto LABEL_27;
      }
LABEL_28:
      v13 = 0;
LABEL_29:

      _Block_object_dispose(&buf, 8);
      v20 = v44;
LABEL_30:

      goto LABEL_31;
    }
    if ([v48 count])
    {
      id v32 = [v48 anyObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = [v32 photoLibrary];
      }
      else
      {
        id v33 = 0;
      }
    }
    else
    {
      id v33 = 0;
    }
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_238;
    v62[3] = &unk_1E690F580;
    id v40 = v33;
    id v63 = v40;
    id v34 = v41;
    id v64 = v34;
    id v35 = v47;
    id v65 = v35;
    id v36 = v46;
    id v66 = v36;
    id v43 = v42;
    id v67 = v43;
    v68 = &v90;
    [(CLSInvestigationFeeder *)self enumeratePersonNames:v35 withGaussiansUsingBlock:v62];
    if (([v17 isEqualToSet:v35] & 1) == 0)
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_241;
      v55[3] = &unk_1E690F580;
      id v56 = v40;
      id v57 = v34;
      id v58 = v17;
      id v59 = v36;
      id v60 = v43;
      v61 = &v90;
      [(CLSInvestigationFeeder *)self enumeratePersonNames:v58 withGaussiansUsingBlock:v55];
    }
    if (*((unsigned char *)v91 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v96 = 67109120;
        int v97 = 485;
        id v37 = MEMORY[0x1E4F14500];
LABEL_45:
        _os_log_impl(&dword_1D2150000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v96, 8u);
      }
    }
    else
    {
      [(CLSClueCollection *)v49 mergeClues:v36];
      if (!v11
        || (char v54 = 0,
            (*((void (**)(id, char *, double))v43 + 2))(v43, &v54, 1.0),
            char v38 = *((unsigned char *)v91 + 24) | v54,
            (*((unsigned char *)v91 + 24) = v38) == 0))
      {
        v13 = v49;
        goto LABEL_52;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v96 = 67109120;
        int v97 = 489;
        id v37 = MEMORY[0x1E4F14500];
        goto LABEL_45;
      }
    }
    v13 = 0;
LABEL_52:

    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0xF104000100;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v13 = 0;
LABEL_31:
  _Block_object_dispose(&v90, 8);

  return v13;
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D2602300]();
  if (([v3 clsIsScreenshotOrScreenRecording] & 1) == 0)
  {
    double v5 = [v3 clsPersonLocalIdentifiers];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
          uint64_t v11 = *(void **)(a1 + 32);
          if (!v11 || [v11 containsObject:*(void *)(*((void *)&v23 + 1) + 8 * v9)]) {
            [*(id *)(a1 + 40) addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
    char v12 = [v3 clsConsolidatedPersonLocalIdentifiers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
          id v18 = *(void **)(a1 + 32);
          if (!v18 || [v18 containsObject:*(void *)(*((void *)&v19 + 1) + 8 * v16)]) {
            [*(id *)(a1 + 48) addObject:v17];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.1);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_226(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) focusItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_227;
  v10[3] = &unk_1E690F4B8;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v8;
  uint64_t v13 = a4;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4, double a5, double a6, double a7)
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  char v48 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  uint64_t v15 = [*(id *)(a1 + 32) focusItems];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_4;
  v42[3] = &unk_1E690F508;
  id v16 = v14;
  id v43 = v16;
  v44 = &v45;
  [v15 enumerateObjectsUsingBlock:v42];

  if (*((unsigned char *)v46 + 24))
  {
    unint64_t v17 = [v16 count];
    id v18 = [v16 sortedArrayUsingComparator:&__block_literal_global_1640];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      id v37 = __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_6;
      char v38 = &unk_1E690F530;
      id v39 = *(id *)(a1 + 72);
      id v19 = *(id *)(a1 + 80);
      uint64_t v20 = *(void *)(a1 + 96);
      id v40 = v19;
      uint64_t v41 = v20;
      [v18 enumerateObjectsUsingBlock:&v35];
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      *a4 = 1;
LABEL_21:

      goto LABEL_22;
    }
    long long v21 = [v18 firstObject];
    uint64_t v33 = objc_msgSend(v21, "cls_localDateComponents");

    long long v22 = [v18 lastObject];
    long long v23 = objc_msgSend(v22, "cls_localDateComponents");

    if (!v33 || !v23)
    {
      uint64_t v28 = +[CLSLogging sharedLogging];
      long long v24 = [v28 loggingConnection];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v29 = [v18 firstObject];
        v30 = [v18 lastObject];
        *(_DWORD *)uint64_t buf = 138412802;
        long long v50 = v18;
        __int16 v51 = 2112;
        id v52 = v29;
        __int16 v53 = 2112;
        char v54 = v30;
        _os_log_error_impl(&dword_1D2150000, v24, OS_LOG_TYPE_ERROR, "sortedObjectsByDate doesn't have any date %@ - [%@, %@]", buf, 0x20u);
      }
      goto LABEL_17;
    }
    long long v24 = +[CLSInputLocationClue clueWithLocation:v13 locationCache:*(void *)(a1 + 40)];
    -[NSObject setNumberOfAssets:](v24, "setNumberOfAssets:", [v16 count]);
    v55[0] = v33;
    v55[1] = v23;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    long long v26 = +[CLSInputTimeClue clueWithDates:v25 serviceManager:*(void *)(a1 + 48)];
    v27 = v26;
    if (a5 != 0.0)
    {
      double v31 = (double)v17;
      if ((double)v17 < a6)
      {
        [v26 setRelevance:(double)(exp(-((v31 - a6) * (v31 - a6)) / (a5 * a5 + a5 * a5)) * 0.99)];
        [v27 relevance];
        -[NSObject setRelevance:](v24, "setRelevance:");
        goto LABEL_16;
      }
      if (v31 < a7)
      {
        [v26 setRelevance:v31 * 0.01 / a7 + 0.99];
        [v27 relevance];
        -[NSObject setRelevance:](v24, "setRelevance:");
        goto LABEL_16;
      }
    }
    objc_msgSend(v26, "setRelevance:", 1.0, v33, v35, v36, v37, v38);
    [v27 relevance];
    -[NSObject setRelevance:](v24, "setRelevance:");
LABEL_16:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v27, v33);
    [*(id *)(a1 + 64) addObject:v24];

LABEL_17:
    uint64_t v32 = *(void *)(a1 + 80);
    if (v32)
    {
      buf[0] = 0;
      (*(void (**)(uint64_t, uint8_t *, double))(v32 + 16))(v32, buf, 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= buf[0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
        *a4 = 1;
      }
    }

    goto LABEL_21;
  }
LABEL_22:

  _Block_object_dispose(&v45, 8);
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_236(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t result = a1[5];
  if (result)
  {
    char v7 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v7, 0.4);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= v7;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_238(uint64_t a1, void *a2, unsigned char *a3, double a4, double a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = a2;
  uint64_t v12 = +[CLSInputPeopleClue clueWithPersonLocalIdentifier:v11 inPhotoLibrary:v9 serviceManager:v10];
  unint64_t v13 = [*(id *)(a1 + 48) countForObject:v11];

  [v12 setNumberOfFaces:v13];
  double v15 = 1.0;
  if (a4 != 0.0)
  {
    double v14 = (double)v13;
    if ((double)v13 < a5) {
      double v15 = exp(-((v14 - a5) * (v14 - a5)) / (a4 * a4 + a4 * a4));
    }
  }
  objc_msgSend(v12, "setRelevance:", v15, v14);
  [*(id *)(a1 + 56) addObject:v12];
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16)
  {
    char v17 = 0;
    (*(void (**)(uint64_t, char *, double))(v16 + 16))(v16, &v17, 0.8);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v17;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      *a3 = 1;
    }
  }
}

void __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_241(uint64_t a1, void *a2, unsigned char *a3, double a4, double a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = a2;
  uint64_t v12 = +[CLSInputPeopleClue clueWithConsolidatedPersonLocalIdentifier:v11 inPhotoLibrary:v9 serviceManager:v10];
  unint64_t v13 = [*(id *)(a1 + 48) countForObject:v11];

  [v12 setNumberOfFaces:v13];
  double v15 = 1.0;
  if (a4 != 0.0)
  {
    double v14 = (double)v13;
    if ((double)v13 < a5) {
      double v15 = exp(-((v14 - a5) * (v14 - a5)) / (a4 * a4 + a4 * a4));
    }
  }
  objc_msgSend(v12, "setRelevance:", v15, v14);
  [*(id *)(a1 + 56) addObject:v12];
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16)
  {
    char v17 = 0;
    (*(void (**)(uint64_t, char *, double))(v16 + 16))(v16, &v17, 0.9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v17;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      *a3 = 1;
    }
  }
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_6(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t result = a1[5];
  if (result)
  {
    char v7 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v7, 0.2);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= v7;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = objc_msgSend(a2, "cls_localDate");
  id v6 = objc_msgSend(v4, "cls_localDate");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __87__CLSInvestigationFeeder__prepareFeederWithServiceManager_locationCache_progressBlock___block_invoke_2_227(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    id v6 = *(unsigned char **)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *id v6 = 1;
    *a3 = 1;
  }
  return result;
}

- (void)enumeratePersonNames:(id)a3 withGaussiansUsingBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v30 = 0;
    double v31 = (double *)&v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke;
    v27[3] = &unk_1E690F440;
    id v29 = &v30;
    id v9 = v5;
    id v28 = v9;
    [v9 enumerateObjectsUsingBlock:v27];
    double v10 = v31[3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v34 count:16];
    double v13 = (double)v8;
    double v14 = v10 / (double)v8;
    if (v12)
    {
      uint64_t v15 = *(void *)v24;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v11);
          }
          unint64_t v18 = [v11 countForObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          double v16 = v16 + ((double)v18 - v14) * ((double)v18 - v14);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v12);
    }
    else
    {
      double v16 = 0.0;
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke_2;
    v19[3] = &unk_1E690F468;
    id v20 = v6;
    double v21 = sqrt(v16 / v13) * 3.0 * 0.25;
    double v22 = v14;
    [v11 enumerateObjectsUsingBlock:v19];

    _Block_object_dispose(&v30, 8);
  }
}

double __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(v4 + 24) + (double)v3;
  *(double *)(v4 + 24) = result;
  return result;
}

uint64_t __71__CLSInvestigationFeeder_enumeratePersonNames_withGaussiansUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_enumerateLocationClustersWithGaussians:(id)a3 enumerationBlock:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void *, char *, double, double, double))a4;
  if ([v5 count])
  {
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    unint64_t v7 = [v5 count];
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    unint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke;
    v36[3] = &unk_1E690F3C8;
    char v38 = &v44;
    id v39 = &v40;
    id v9 = v8;
    id v37 = v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v36];
    double v10 = (double)(unint64_t)v45[3];
    double v11 = (double)v7;
    uint64_t v32 = 0;
    uint64_t v33 = (double *)&v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_2;
    v31[3] = &unk_1E690F3F0;
    double v12 = v10 / (double)v7;
    v31[4] = &v32;
    *(double *)&v31[5] = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v31];
    double v13 = v33[3];
    double v14 = [v5 allKeys];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_3;
    v29[3] = &unk_1E690F418;
    id v23 = v9;
    id v30 = v23;
    uint64_t v15 = [v14 sortedArrayUsingComparator:v29];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v48 count:16];
    if (v17)
    {
      double v18 = sqrt(v13 / v11) * 3.0 * 0.25;
      uint64_t v19 = *(void *)v26;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
        char v24 = 0;
        double v22 = [v5 objectForKeyedSubscript:v21];
        v6[2](v6, v21, v22, &v24, v18, v12, (double)(unint64_t)v41[3]);
        LOBYTE(v21) = v24 == 0;

        if ((v21 & 1) == 0) {
          break;
        }
        if (v17 == ++v20)
        {
          uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v48 count:16];
          if (v17) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
}

void __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 count];
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unint64_t v8 = [v6 count];
  if (v7 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = 0;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "cls_universalDate", (void)v19);
        uint64_t v17 = v16;
        if (v13)
        {
          uint64_t v18 = [v16 earlierDate:v13];

          double v13 = (void *)v18;
        }
        else
        {
          double v13 = v16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  else
  {
    double v13 = 0;
  }

  [*(id *)(a1 + 32) setObject:v13 forKey:v5];
}

double __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = [a3 count];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = ((double)v4 - *(double *)(a1 + 40)) * ((double)v4 - *(double *)(a1 + 40)) + *(double *)(v5 + 24);
  *(double *)(v5 + 24) = result;
  return result;
}

uint64_t __83__CLSInvestigationFeeder__enumerateLocationClustersWithGaussians_enumerationBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 objectForKey:a2];
  unint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (double)behavioralScore
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)numberOfRegularGemItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)numberOfShinyGemItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  CLSAbstractMethodException(self, a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v5 = a3;
  CLSAbstractMethodException(self, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)itemAtIndex:(unint64_t)a3
{
  CLSAbstractMethodException(self, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)sharedItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)privateItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)allItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)approximateLocation
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)localEndDateComponents
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)localStartDateComponents
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)localEndDate
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)localStartDate
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)universalEndDate
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSDate)universalStartDate
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)numberOfItems
{
  CLSAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CLSInvestigationFeeder)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLSInvestigationFeeder;
  id v2 = [(CLSInvestigationFeeder *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_locationClusteringAlgorithm = 0;
    v2->_allowsInterview = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    focusItems = v3->_focusItems;
    v3->_focusItems = (NSMutableSet *)v4;
  }
  return v3;
}

@end