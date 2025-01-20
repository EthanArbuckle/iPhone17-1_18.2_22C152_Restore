@interface CLSNewLocationInformant
+ (BOOL)doesRegion:(id)a3 containLocation:(id)a4;
+ (BOOL)doesRegion:(id)a3 intersectOtherRegion:(id)a4;
+ (BOOL)location:(CLLocationCoordinate2D)a3 isCloseToLocation:(CLLocationCoordinate2D)a4;
+ (BOOL)location:(CLLocationCoordinate2D)a3 isFarFromLocation:(CLLocationCoordinate2D)a4;
+ (CLLocationCoordinate2D)shiftedCoordinatesFromOriginalCoordinates:(CLLocationCoordinate2D)a3;
+ (id)allPointOfInterestCategories;
+ (id)areaOfInterestCategories;
+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4;
+ (id)classIdentifier;
+ (id)familyIdentifier;
+ (id)filterBusinessItems:(id)a3 forCategories:(id)a4 blocklistCategories:(id)a5;
+ (id)informantDependenciesIdentifiers;
+ (id)narrowPointOfInterestCategories;
+ (id)natureCategories;
+ (id)regionOfInterestCategories;
+ (id)searchBusinessItemsAtCoordinate:(CLLocationCoordinate2D)a3 forCategories:(id)a4 precision:(double)a5 inCache:(id)a6;
+ (id)shiftedLocationFromOriginalLocation:(id)a3;
+ (id)widePointOfInterestCategories;
- (id)_regionOfInterestCategories;
- (id)_regionOfInterestTraits;
- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4;
- (id)locationAreaOfInterestCluesForInputClue:(id)a3 aoiCache:(id)a4;
- (id)locationRegionOfInterestCluesForInputClue:(id)a3 roiCache:(id)a4 natureCache:(id)a5;
- (id)outputLocationCluesForOuputClueKey:(id)a3 inputClue:(id)a4 region:(id)a5 traits:(id)a6 categories:(id)a7 exactMatch:(BOOL)a8 precision:(double)a9 cache:(id)a10;
@end

@implementation CLSNewLocationInformant

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [v6 clueCollection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke;
  v21[3] = &unk_1E690FD30;
  id v22 = v8;
  id v10 = v8;
  [v9 enumerateTimeClues:v21];

  v11 = [v6 helper];
  v12 = [v6 clueCollection];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2;
  v18[3] = &unk_1E690F8B8;
  v18[4] = self;
  id v19 = v11;
  id v13 = v7;
  id v20 = v13;
  id v14 = v11;
  [v12 enumerateLocationClues:v18];

  v15 = v20;
  id v16 = v13;

  return v16;
}

uint64_t __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __69__CLSNewLocationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ([v13 isDefinite])
  {
    v3 = [v13 placemark];
    v4 = [v3 areasOfInterest];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) aoiCache];
      id v8 = [v6 locationAreaOfInterestCluesForInputClue:v13 aoiCache:v7];

      [*(id *)(a1 + 48) addObjectsFromArray:v8];
    }
  }
  v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) roiCache];
  v11 = [*(id *)(a1 + 40) natureCache];
  v12 = [v9 locationRegionOfInterestCluesForInputClue:v13 roiCache:v10 natureCache:v11];

  [*(id *)(a1 + 48) addObjectsFromArray:v12];
}

- (id)locationRegionOfInterestCluesForInputClue:(id)a3 roiCache:(id)a4 natureCache:(id)a5
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  v12 = objc_opt_class();
  id v13 = [v8 region];
  [v13 center];
  id v14 = objc_msgSend(v12, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", &unk_1F28F2D98, v9);

  if (v14)
  {
    if ((unint64_t)[v14 count] > 0x95)
    {
      v26 = +[CLSOutputClue clueWithValue:@"Urban" forKey:@"Location ROI" confidence:1.0 relevance:1.0];
      v52[0] = v8;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
      [v26 addRelatedInputLocationClues:v27];

      [v11 addObject:v26];
LABEL_18:

      goto LABEL_19;
    }
    v15 = objc_opt_class();
    id v16 = [v8 region];
    [v16 center];
    double v18 = v17;
    double v20 = v19;
    v21 = [(id)objc_opt_class() natureCategories];
    v41 = objc_msgSend(v15, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v21, v10, v18, v20, 20000.0);

    if (!v41) {
      goto LABEL_19;
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 1;
    id v22 = [MEMORY[0x1E4F1CA48] array];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke;
    v42[3] = &unk_1E690F880;
    id v23 = v8;
    id v43 = v23;
    id v24 = v22;
    id v44 = v24;
    v45 = &v46;
    [v41 enumerateObjectsUsingBlock:v42];
    [v11 addObjectsFromArray:v24];
    v40 = v24;
    if (!*((unsigned char *)v47 + 24))
    {
LABEL_15:

      _Block_object_dispose(&v46, 8);
      v26 = [(CLSNewLocationInformant *)self _regionOfInterestTraits];
      v35 = [(CLSNewLocationInformant *)self _regionOfInterestCategories];
      v36 = [v23 region];
      v37 = [(CLSNewLocationInformant *)self outputLocationCluesForOuputClueKey:@"Location ROI" inputClue:v23 region:v36 traits:v26 categories:v35 exactMatch:0 precision:1000.0 cache:v9];

      if (v37) {
        [v11 addObjectsFromArray:v37];
      }

      goto LABEL_18;
    }
    v39 = [v23 placemark];
    if (v39)
    {
      v25 = [v39 inlandWater];
      if (v25)
      {

LABEL_10:
        v30 = +[CLSOutputClue clueWithValue:@"Water" forKey:@"Location ROI" confidence:1.0 relevance:1.0];
        id v51 = v23;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        [v30 addRelatedInputLocationClues:v31];

        [v11 addObject:v30];
        goto LABEL_13;
      }
      v28 = [v39 ocean];
      BOOL v29 = v28 == 0;

      if (!v29) {
        goto LABEL_10;
      }
    }
    v32 = [v39 ISOcountryCode];
    int v33 = [v32 isEqualToString:@"CN"];

    if (v33 != [MEMORY[0x1E4F8AB68] isCurrentRevGeoProviderAutoNavi])
    {
LABEL_14:

      goto LABEL_15;
    }
    v30 = +[CLSOutputClue clueWithValue:@"Nature" forKey:@"Location ROI" confidence:1.0 relevance:1.0];
    id v50 = v23;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v30 addRelatedInputLocationClues:v34];

    [v11 addObject:v30];
LABEL_13:

    goto LABEL_14;
  }
LABEL_19:

  return v11;
}

void __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 categories];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke_2;
  v6[3] = &unk_1E690F858;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __90__CLSNewLocationInformant_locationRegionOfInterestCluesForInputClue_roiCache_natureCache___block_invoke_2(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([a2 unsignedIntegerValue] == 15)
  {
    v3 = +[CLSOutputClue clueWithValue:@"Mountain" forKey:@"Location ROI"];
    v5[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v3 addRelatedInputLocationClues:v4];

    [*(id *)(a1 + 40) addObject:v3];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

- (id)locationAreaOfInterestCluesForInputClue:(id)a3 aoiCache:(id)a4
{
  v41[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v29 = objc_opt_new();
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [(id)objc_opt_class() areaOfInterestCategories];
  id v10 = [v8 setWithArray:v9];

  v40[0] = &unk_1F28F2A98;
  v40[1] = &unk_1F28F2AB0;
  v41[0] = &unk_1F28F2BA0;
  v41[1] = &unk_1F28F2BA0;
  v40[2] = &unk_1F28F2AC8;
  v40[3] = &unk_1F28F2AF8;
  v41[2] = &unk_1F28F2BA0;
  v41[3] = &unk_1F28F2B70;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
  v38[0] = &unk_1F28F2A98;
  v38[1] = &unk_1F28F2AB0;
  v39[0] = @"Entertainment";
  v39[1] = @"Entertainment";
  v38[2] = &unk_1F28F2AC8;
  v38[3] = &unk_1F28F2AF8;
  v39[2] = @"Entertainment";
  v39[3] = @"Park";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
  id v13 = objc_opt_class();
  id v14 = [v6 region];
  [v14 center];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(id)objc_opt_class() areaOfInterestCategories];
  double v20 = objc_msgSend(v13, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v19, v7, v16, v18, 6000.0);

  if (v20)
  {
    v21 = objc_opt_class();
    id v22 = [v6 location];
    id v23 = [v21 shiftedLocationFromOriginalLocation:v22];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__CLSNewLocationInformant_locationAreaOfInterestCluesForInputClue_aoiCache___block_invoke;
    v30[3] = &unk_1E690F820;
    id v31 = v10;
    id v32 = v11;
    int v33 = self;
    id v34 = v23;
    id v35 = v12;
    id v36 = v6;
    id v24 = v29;
    id v37 = v24;
    id v25 = v23;
    [v20 enumerateObjectsUsingBlock:v30];
    v26 = v37;
    id v27 = v24;
  }
  return v29;
}

void __76__CLSNewLocationInformant_locationAreaOfInterestCluesForInputClue_aoiCache___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v5 = [v3 categories];
  id v6 = [v4 setWithArray:v5];

  [v6 intersectSet:*(void *)(a1 + 32)];
  id v7 = [v6 anyObject];
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v3 region];
  [v11 radius];
  double v13 = v12;

  if (v13 >= v10)
  {
    id v14 = objc_opt_class();
    double v15 = [v3 region];
    LODWORD(v14) = [v14 doesRegion:v15 containLocation:*(void *)(a1 + 56)];

    if (v14)
    {
      double v16 = [*(id *)(a1 + 64) objectForKeyedSubscript:v7];
      [*(id *)(a1 + 72) relevance];
      double v18 = +[CLSOutputClue clueWithValue:v16 forKey:@"Location POI" confidence:1.0 relevance:v17];
      v20[0] = *(void *)(a1 + 72);
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v18 addRelatedInputLocationClues:v19];

      [*(id *)(a1 + 80) addObject:v18];
    }
  }
}

- (id)outputLocationCluesForOuputClueKey:(id)a3 inputClue:(id)a4 region:(id)a5 traits:(id)a6 categories:(id)a7 exactMatch:(BOOL)a8 precision:(double)a9 cache:(id)a10
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = [v17 placemark];
  id v23 = [v22 location];

  if (v23)
  {
    id v24 = objc_opt_class();
    [v23 coordinate];
    objc_msgSend(v24, "shiftedCoordinatesFromOriginalCoordinates:");
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    BOOL v29 = objc_opt_class();
    [v18 center];
    objc_msgSend(v29, "shiftedCoordinatesFromOriginalCoordinates:");
    double v31 = v30;
    double v33 = v32;
    id v34 = objc_msgSend((id)objc_opt_class(), "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v20, v21, v30, v32, a9);
    id v35 = v34;
    if (v34 && [v34 count])
    {
      v47 = objc_opt_new();
      id v36 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = 0;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke;
      v54[3] = &unk_1E690F768;
      v54[4] = self;
      id v35 = v35;
      v55 = v35;
      double v62 = v31;
      double v63 = v33;
      id v56 = v18;
      BOOL v66 = a8;
      uint64_t v64 = v26;
      uint64_t v65 = v28;
      id v37 = v36;
      id v57 = v37;
      p_long long buf = &buf;
      id v58 = v49;
      id v59 = v17;
      id v38 = v47;
      id v60 = v38;
      id v39 = v19;
      [v19 enumerateKeysAndObjectsUsingBlock:v54];
      v40 = [MEMORY[0x1E4F1CA48] array];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke_2;
      v50[3] = &unk_1E690F790;
      id v48 = v37;
      id v51 = v48;
      v53 = &buf;
      id v41 = v40;
      id v52 = v41;
      [v38 enumerateKeysAndObjectsUsingBlock:v50];
      uint64_t v46 = v38;
      v42 = v52;
      id v43 = v41;

      id v19 = v39;
      _Block_object_dispose(&buf, 8);

      goto LABEL_8;
    }
  }
  else
  {
    id v44 = +[CLSLogging sharedLogging];
    id v35 = [v44 loggingConnection];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_error_impl(&dword_1D2150000, v35, OS_LOG_TYPE_ERROR, "ERROR: inputLocationCluePlacemarkLocation is nil. %@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v43 = (id)MEMORY[0x1E4F1CBF0];
LABEL_8:

  return v43;
}

void __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"categories"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"blacklist-categories"];
  double v10 = [v7 objectForKeyedSubscript:@"precision"];
  [v10 doubleValue];
  double v12 = v11;

  id v44 = v7;
  double v13 = [v7 objectForKeyedSubscript:@"confidence"];
  [v13 doubleValue];
  double v15 = v14;

  v42 = (void *)v9;
  id v43 = (void *)v8;
  [(id)objc_opt_class() filterBusinessItems:*(void *)(a1 + 40) forCategories:v8 blocklistCategories:v9];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v45 + 1) + 8 * i) region];
        [v21 radius];
        if (v12 == 0.0) {
          double v23 = v22;
        }
        else {
          double v23 = v12;
        }
        [v21 center];
        CLLocationCoordinate2DGetDistanceFrom();
        if (v24 <= v23)
        {
          double v25 = v24;
          [*(id *)(a1 + 48) radius];
          int v27 = *(unsigned __int8 *)(a1 + 128);
          if (*(unsigned char *)(a1 + 128))
          {
            CLLocationCoordinate2DGetDistanceFrom();
            double v26 = v23 + v28;
            int v27 = *(unsigned __int8 *)(a1 + 128);
          }
          double v29 = v23 * v23 / (v26 * v26);
          if (v29 > 1.0) {
            double v29 = 1.0;
          }
          double v30 = v26 / v23;
          if (v26 / v23 > 1.0) {
            double v30 = 1.0;
          }
          double v31 = v25 * v30;
          if (v26 < v23) {
            double v26 = v23;
          }
          double v32 = 1.0 - v31 / v26;
          if (v32 < 0.0) {
            double v32 = 0.0;
          }
          double v33 = v29 * v32;
          BOOL v34 = v27 == 0;
          if (v29 * v32 < v15) {
            BOOL v34 = 0;
          }
          BOOL v35 = v27 && v25 < 5.0;
          if (v35 || v34)
          {
            if (+[CLSNewLocationInformant doesRegion:v21 intersectOtherRegion:*(void *)(a1 + 48)])
            {
              [*(id *)(a1 + 56) addObject:v6];
              ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
            }
            uint64_t v36 = *(void *)(a1 + 64);
            [*(id *)(a1 + 72) relevance];
            id v38 = +[CLSOutputClue clueWithValue:v6 forKey:v36 confidence:v33 relevance:v37];
            uint64_t v49 = *(void *)(a1 + 72);
            id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
            [v38 addRelatedInputLocationClues:v39];

            v40 = [*(id *)(a1 + 80) objectForKeyedSubscript:v6];
            if (!v40)
            {
              v40 = [MEMORY[0x1E4F1CA48] array];
              [*(id *)(a1 + 80) setObject:v40 forKeyedSubscript:v6];
            }
            [v40 addObject:v38];
            if (*(unsigned char *)(a1 + 128))
            {
              *a4 = 1;

              goto LABEL_37;
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_37:
}

void __124__CLSNewLocationInformant_outputLocationCluesForOuputClueKey_inputClue_region_traits_categories_exactMatch_precision_cache___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v9)
        {
          [*(id *)(*((void *)&v19 + 1) + 8 * i) score];
          double v14 = v13;
          [v9 score];
          if (v14 <= v15) {
            continue;
          }
        }
        id v16 = v12;

        uint64_t v9 = v16;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
    if (v9)
    {
      [v9 confidence];
      double v18 = v17;
      if ((unint64_t)[*(id *)(a1 + 32) count] >= 2) {
        double v18 = v18
      }
            * ((double)(unint64_t)[*(id *)(a1 + 32) countForObject:v5]
             / (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            * 0.2
            + v18 * 0.8;
      [v9 setConfidence:v18];
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
}

- (id)_regionOfInterestTraits
{
  if (_regionOfInterestTraits_onceToken != -1) {
    dispatch_once(&_regionOfInterestTraits_onceToken, &__block_literal_global_95);
  }
  v2 = (void *)_regionOfInterestTraits_pointOfInterestsTraits;
  return v2;
}

void __50__CLSNewLocationInformant__regionOfInterestTraits__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"Beach";
  v6[0] = @"categories";
  v6[1] = @"blacklist-categories";
  v7[0] = &unk_1F28F2D50;
  v7[1] = &unk_1F28F2D68;
  v6[2] = @"precision";
  v6[3] = @"confidence";
  v7[2] = &unk_1F28F2B70;
  v7[3] = &unk_1F28F2E58;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v8[1] = @"Mountain";
  v9[0] = v0;
  v4[0] = @"categories";
  v4[1] = @"blacklist-categories";
  v5[0] = &unk_1F28F2D80;
  v5[1] = MEMORY[0x1E4F1CBF0];
  v4[2] = @"precision";
  v4[3] = @"confidence";
  void v5[2] = &unk_1F28F2B88;
  v5[3] = &unk_1F28F2E58;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v9[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v3 = (void *)_regionOfInterestTraits_pointOfInterestsTraits;
  _regionOfInterestTraits_pointOfInterestsTraits = v2;
}

- (id)_regionOfInterestCategories
{
  if (_regionOfInterestCategories_onceToken != -1) {
    dispatch_once(&_regionOfInterestCategories_onceToken, &__block_literal_global_74);
  }
  uint64_t v2 = (void *)_regionOfInterestCategories_regionOfInterestsCategories;
  return v2;
}

void __54__CLSNewLocationInformant__regionOfInterestCategories__block_invoke()
{
  v0 = (void *)_regionOfInterestCategories_regionOfInterestsCategories;
  _regionOfInterestCategories_regionOfInterestsCategories = (uint64_t)&unk_1F28F2D38;
}

+ (BOOL)location:(CLLocationCoordinate2D)a3 isFarFromLocation:(CLLocationCoordinate2D)a4
{
  CLLocationCoordinate2DGetDistanceFrom();
  return v4 >= 111111.11;
}

+ (BOOL)location:(CLLocationCoordinate2D)a3 isCloseToLocation:(CLLocationCoordinate2D)a4
{
  CLLocationCoordinate2DGetDistanceFrom();
  return v4 <= 150.0;
}

+ (id)natureCategories
{
  return &unk_1F28F2DE0;
}

+ (id)regionOfInterestCategories
{
  return &unk_1F28F2DC8;
}

+ (id)areaOfInterestCategories
{
  return &unk_1F28F2DB0;
}

+ (BOOL)doesRegion:(id)a3 containLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 center];
  [v5 coordinate];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  uint64_t v16 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  double v12 = v11;
  objc_msgSend(v6, "radius", v16, v10);
  double v14 = v13;

  return v12 < v14;
}

+ (BOOL)doesRegion:(id)a3 intersectOtherRegion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 center];
  [v5 center];
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  double v10 = v9;
  objc_msgSend(v6, "radius", v16, v17);
  double v12 = v11;

  [v5 radius];
  double v14 = v13;

  return v10 < v12 + v14;
}

+ (CLLocationCoordinate2D)shiftedCoordinatesFromOriginalCoordinates:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = +[CLSLocationShifter sharedLocationShifter];
  objc_msgSend(v5, "shiftedCoordinateForOriginalCoordinate:", latitude, longitude);
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);

  double v9 = v8.latitude;
  double v10 = v8.longitude;
  result.double longitude = v10;
  result.double latitude = v9;
  return result;
}

+ (id)shiftedLocationFromOriginalLocation:(id)a3
{
  [a3 coordinate];
  objc_msgSend(a1, "shiftedCoordinatesFromOriginalCoordinates:");
  CLLocationDegrees v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v4 longitude:v5];
  return v6;
}

+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  CLLocationCoordinate2D v8 = GEOSpatialLookupAllCategories();
  double v9 = [v5 arrayWithArray:v8];

  [v9 removeObject:&unk_1F28F2BB8];
  [v9 removeObject:&unk_1F28F2B40];
  [v9 removeObject:&unk_1F28F2B58];
  double v10 = objc_opt_class();
  [v7 center];
  double v12 = v11;
  double v14 = v13;

  double v15 = objc_msgSend(v10, "searchBusinessItemsAtCoordinate:forCategories:precision:inCache:", v9, v6, v12, v14, 100.0);

  return v15;
}

+ (id)filterBusinessItems:(id)a3 forCategories:(id)a4 blocklistCategories:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v7 array];
  double v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

  double v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __81__CLSNewLocationInformant_filterBusinessItems_forCategories_blocklistCategories___block_invoke;
  v20[3] = &unk_1E690F7E0;
  id v21 = v12;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  id v15 = v13;
  id v16 = v12;
  [v10 enumerateObjectsUsingBlock:v20];

  uint64_t v17 = v23;
  id v18 = v14;

  return v18;
}

void __81__CLSNewLocationInformant_filterBusinessItems_forCategories_blocklistCategories___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = v3;
  double v5 = [v3 categories];
  id v6 = [v4 setWithArray:v5];

  if ((![a1[4] count] || (objc_msgSend(a1[4], "intersectsSet:", v6) & 1) == 0)
    && [a1[5] intersectsSet:v6])
  {
    [a1[6] addObject:v7];
  }
}

+ (id)searchBusinessItemsAtCoordinate:(CLLocationCoordinate2D)a3 forCategories:(id)a4 precision:(double)a5 inCache:(id)a6
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v10 = a4;
  id v11 = a6;
  v30.double latitude = latitude;
  v30.double longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v30))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    double v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v13 UUIDString];
    id v15 = objc_msgSend(v12, "initWithCenter:radius:identifier:", v14, latitude, longitude, a5);

    id v16 = [v11 businessItemsForRegion:v15];
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
      id v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __91__CLSNewLocationInformant_searchBusinessItemsAtCoordinate_forCategories_precision_inCache___block_invoke;
      v25[3] = &unk_1E690F7B8;
      id v26 = v17;
      id v19 = v18;
      id v27 = v19;
      long long v20 = v17;
      [v16 enumerateObjectsUsingBlock:v25];
      id v21 = v27;
      id v22 = v19;
    }
    else
    {
      id v23 = +[CLSLogging sharedLogging];
      long long v20 = [v23 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D2150000, v20, OS_LOG_TYPE_INFO, "Cannot find business items for region", buf, 2u);
      }
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __91__CLSNewLocationInformant_searchBusinessItemsAtCoordinate_forCategories_precision_inCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = v3;
  double v5 = [v3 categories];
  id v6 = [v4 setWithArray:v5];

  if ([v6 intersectsSet:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

+ (id)widePointOfInterestCategories
{
  if (widePointOfInterestCategories_onceToken != -1) {
    dispatch_once(&widePointOfInterestCategories_onceToken, &__block_literal_global_55);
  }
  uint64_t v2 = (void *)widePointOfInterestCategories_widePointOfInterestCategories;
  return v2;
}

void __56__CLSNewLocationInformant_widePointOfInterestCategories__block_invoke()
{
  v0 = (void *)widePointOfInterestCategories_widePointOfInterestCategories;
  widePointOfInterestCategories_widePointOfInterestCategories = (uint64_t)&unk_1F28F2D20;
}

+ (id)narrowPointOfInterestCategories
{
  if (narrowPointOfInterestCategories_onceToken != -1) {
    dispatch_once(&narrowPointOfInterestCategories_onceToken, &__block_literal_global_2446);
  }
  uint64_t v2 = (void *)narrowPointOfInterestCategories_narrowPointOfInterestCategories;
  return v2;
}

void __58__CLSNewLocationInformant_narrowPointOfInterestCategories__block_invoke()
{
  v0 = (void *)narrowPointOfInterestCategories_narrowPointOfInterestCategories;
  narrowPointOfInterestCategories_narrowPointOfInterestCategories = (uint64_t)&unk_1F28F2D08;
}

+ (id)allPointOfInterestCategories
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CLSNewLocationInformant_allPointOfInterestCategories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPointOfInterestCategories_onceToken != -1) {
    dispatch_once(&allPointOfInterestCategories_onceToken, block);
  }
  uint64_t v2 = (void *)allPointOfInterestCategories_pointOfInterestCategories;
  return v2;
}

void __55__CLSNewLocationInformant_allPointOfInterestCategories__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) narrowPointOfInterestCategories];
  uint64_t v2 = [*(id *)(a1 + 32) widePointOfInterestCategories];
  uint64_t v3 = [v5 arrayByAddingObjectsFromArray:v2];
  double v4 = (void *)allPointOfInterestCategories_pointOfInterestCategories;
  allPointOfInterestCategories_pointOfInterestCategories = v3;
}

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)classIdentifier
{
  return @"newlocation";
}

+ (id)familyIdentifier
{
  uint64_t v2 = @"com.apple.mediaminingkit.informant.core";
  return @"com.apple.mediaminingkit.informant.core";
}

@end