@interface GEOVisualIntelligenceCameraConfiguration
+ (NSArray)unsupportedPOICategories;
+ (int64_t)matchingPolicyForMapItem:(id)a3;
@end

@implementation GEOVisualIntelligenceCameraConfiguration

+ (int64_t)matchingPolicyForMapItem:(id)a3
{
  v113[37] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 _poiCategory];
  v102 = (void *)v5;
  if (!v5)
  {
    int64_t v10 = 0;
    goto LABEL_33;
  }
  uint64_t v112 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
  self;
  v7 = _getValue(GeoServicesConfig_VisualIntelligenceCameraRelaxedPOICategories, (uint64_t)off_1E91150A8, 1, 0, 0, 0);
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v113[0] = @"GEOPOICategoryBakery";
    v113[1] = @"GEOPOICategoryBank";
    v113[2] = @"GEOPOICategoryBeauty";
    v113[3] = @"GEOPOICategoryBrewery";
    v113[4] = @"GEOPOICategoryCafe";
    v113[5] = @"GEOPOICategoryCarRental";
    v113[6] = @"GEOPOICategoryFishing";
    v113[7] = @"GEOPOICategoryFitnessCenter";
    v113[8] = @"GEOPOICategoryFoodMarket";
    v113[9] = @"GEOPOICategoryGasStation";
    v113[10] = @"GEOPOICategoryGoKart";
    v113[11] = @"GEOPOICategoryHotel";
    v113[12] = @"GEOPOICategoryHospital";
    v113[13] = @"GEOPOICategoryLandmark";
    v113[14] = @"GEOPOICategoryLibrary";
    v113[15] = @"GEOPOICategoryMovieTheater";
    v113[16] = @"GEOPOICategoryMusicVenue";
    v113[17] = @"GEOPOICategoryNationalMonument";
    v113[18] = @"GEOPOICategoryNightlife";
    v113[19] = @"GEOPOICategoryPharmacy";
    v113[20] = @"GEOPOICategoryPolice";
    v113[21] = @"GEOPOICategoryPostOffice";
    v113[22] = @"GEOPOICategoryRestaurant";
    v113[23] = @"GEOPOICategoryRockClimbing";
    v113[24] = @"GEOPOICategorySkating";
    v113[25] = @"GEOPOICategoryStore";
    v113[26] = @"GEOPOICategorySchool";
    v113[27] = @"GEOPOICategorySpa";
    v113[28] = @"GEOPOICategoryTheater";
    v113[29] = @"GEOPOICategoryAquarium";
    v113[30] = @"GEOPOICategoryMiniGolf";
    v113[31] = @"GEOPOICategoryMuseum";
    v113[32] = @"GEOPOICategoryPlanetarium";
    v113[33] = @"GEOPOICategoryStadium";
    v113[34] = @"GEOPOICategorySkatePark";
    v113[35] = @"GEOPOICategoryTennis";
    v113[36] = @"GEOPOICategoryZoo";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:37];
  }
  v11 = v9;

  v12 = [a1 unsupportedPOICategories];
  id v13 = v6;
  id v14 = v11;
  id v15 = v12;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v16 = v13;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int64_t v10 = 0;
    uint64_t v19 = *(void *)v107;
    v20 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v107 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v106 + 1) + 8 * i);
        if ([v14 containsObject:v22]) {
          BOOL v23 = v10 == 3;
        }
        else {
          BOOL v23 = 1;
        }
        if (v23)
        {
          if ([v20 containsObject:v22]) {
            BOOL v24 = v10 == 3;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            if ([v20 containsObject:v22])
            {
              int64_t v10 = 3;
            }
            else if ([v15 containsObject:v22])
            {
              int64_t v10 = 4;
              goto LABEL_29;
            }
          }
          else
          {
            int64_t v10 = 2;
          }
        }
        else
        {
          int64_t v10 = 1;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v106 objects:v113 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v10 = 0;
  }
LABEL_29:

  if (!v10)
  {
    int64_t v10 = 2;
    goto LABEL_33;
  }
  if (v10 != 4)
  {
LABEL_33:
    uint64_t v25 = [v4 _mapsCategoryId];
    v26 = (void *)v25;
    v27 = (void *)MEMORY[0x1E4F1CBF0];
    if (v25)
    {
      uint64_t v111 = v25;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v29 = [v4 _alternateMapsCategoryIDs];
    v30 = (void *)v29;
    if (v29) {
      uint64_t v31 = v29;
    }
    else {
      uint64_t v31 = (uint64_t)v27;
    }
    v32 = [v28 arrayByAddingObjectsFromArray:v31];

    v101 = v26;
    if (v26) {

    }
    id v103 = v4;
    self;
    uint64_t v33 = _getValue(GeoServicesConfig_VisualIntelligenceCameraRelaxedMapsCategoryIDs, (uint64_t)off_1E91150C8, 1, 0, 0, 0);
    v34 = (void *)v33;
    if (v33) {
      v35 = (void *)v33;
    }
    else {
      v35 = v27;
    }
    id v36 = v35;

    self;
    uint64_t v37 = _getValue(GeoServicesConfig_VisualIntelligenceCameraStrictMapsCategoryIDs, (uint64_t)off_1E91150D8, 1, 0, 0, 0);
    v38 = (void *)v37;
    if (v37) {
      v39 = (void *)v37;
    }
    else {
      v39 = v27;
    }
    id v40 = v39;

    self;
    uint64_t v41 = _getValue(GeoServicesConfig_VisualIntelligenceCameraSensitiveMapsCategoryIDs, (uint64_t)off_1E91150E8, 1, 0, 0, 0);
    v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = v27;
    }
    id v44 = v43;

    self;
    uint64_t v45 = _getValue(GeoServicesConfig_VisualIntelligenceCameraUnsupportedMapsCategoryIDs, (uint64_t)off_1E91150F8, 1, 0, 0, 0);
    v46 = (void *)v45;
    if (v45) {
      v47 = (void *)v45;
    }
    else {
      v47 = v27;
    }
    id v48 = v47;

    id v49 = v32;
    id v50 = v36;
    id v51 = v40;
    id v52 = v44;
    id v104 = v48;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v53 = v49;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v106 objects:v113 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = 0;
      uint64_t v57 = *(void *)v107;
      while (2)
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v107 != v57) {
            objc_enumerationMutation(v53);
          }
          uint64_t v59 = *(void *)(*((void *)&v106 + 1) + 8 * j);
          if ([v50 containsObject:v59]) {
            BOOL v60 = v56 == 3;
          }
          else {
            BOOL v60 = 1;
          }
          if (v60)
          {
            if ([v51 containsObject:v59]) {
              BOOL v61 = v56 == 3;
            }
            else {
              BOOL v61 = 1;
            }
            if (v61)
            {
              if ([v52 containsObject:v59])
              {
                uint64_t v56 = 3;
              }
              else if ([v104 containsObject:v59])
              {
                uint64_t v56 = 4;
                goto LABEL_76;
              }
            }
            else
            {
              uint64_t v56 = 2;
            }
          }
          else
          {
            uint64_t v56 = 1;
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v106 objects:v113 count:16];
        if (v55) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v56 = 0;
    }
LABEL_76:

    if (v56)
    {
      id v4 = v103;
      if (v56 == 4)
      {
LABEL_130:

        int64_t v10 = v56;
        goto LABEL_131;
      }
      if (v10 != 3) {
        int64_t v10 = v56;
      }
    }
    else
    {
      id v4 = v103;
    }
    uint64_t v62 = [v4 _mapsCategoryMUID];
    v63 = (void *)v62;
    v64 = (void *)MEMORY[0x1E4F1CBF0];
    if (v62)
    {
      uint64_t v110 = v62;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
    }
    else
    {
      v65 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v99 = v53;
    uint64_t v66 = [v4 _alternateMapsCategoryMUIDs];
    v67 = (void *)v66;
    if (v66) {
      uint64_t v68 = v66;
    }
    else {
      uint64_t v68 = (uint64_t)v64;
    }
    v69 = [v65 arrayByAddingObjectsFromArray:v68];

    v100 = v63;
    if (v63) {

    }
    self;
    uint64_t v70 = _getValue(GeoServicesConfig_VisualIntelligenceCameraRelaxedMapsCategoryMUIDs, (uint64_t)off_1E9115108, 1, 0, 0, 0);
    v71 = (void *)v70;
    if (v70) {
      v72 = (void *)v70;
    }
    else {
      v72 = v64;
    }
    id v73 = v72;

    self;
    uint64_t v74 = _getValue(GeoServicesConfig_VisualIntelligenceCameraStrictMapsCategoryMUIDs, (uint64_t)off_1E9115118, 1, 0, 0, 0);
    v75 = (void *)v74;
    v76 = &unk_1ED73EE78;
    if (v74) {
      v76 = (void *)v74;
    }
    id v77 = v76;

    self;
    uint64_t v78 = _getValue(GeoServicesConfig_VisualIntelligenceCameraSensitiveMapsCategoryMUIDs, (uint64_t)off_1E9115128, 1, 0, 0, 0);
    v79 = (void *)v78;
    v80 = &unk_1ED73EE90;
    if (v78) {
      v80 = (void *)v78;
    }
    id v81 = v80;

    self;
    uint64_t v82 = _getValue(GeoServicesConfig_VisualIntelligenceCameraUnsupportedMapsCategoryIDs, (uint64_t)off_1E91150F8, 1, 0, 0, 0);
    v83 = (void *)v82;
    v84 = &unk_1ED73EEA8;
    if (v82) {
      v84 = (void *)v82;
    }
    id v85 = v84;

    id v86 = v69;
    id v87 = v73;
    id v88 = v77;
    id v89 = v81;
    id v105 = v85;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v90 = v86;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v106 objects:v113 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v56 = 0;
      uint64_t v93 = *(void *)v107;
      while (2)
      {
        for (uint64_t k = 0; k != v92; ++k)
        {
          if (*(void *)v107 != v93) {
            objc_enumerationMutation(v90);
          }
          uint64_t v95 = *(void *)(*((void *)&v106 + 1) + 8 * k);
          if ([v87 containsObject:v95]) {
            BOOL v96 = v56 == 3;
          }
          else {
            BOOL v96 = 1;
          }
          if (v96)
          {
            if ([v88 containsObject:v95]) {
              BOOL v97 = v56 == 3;
            }
            else {
              BOOL v97 = 1;
            }
            if (v97)
            {
              if ([v89 containsObject:v95])
              {
                uint64_t v56 = 3;
              }
              else if ([v105 containsObject:v95])
              {
                uint64_t v56 = 4;
                goto LABEL_122;
              }
            }
            else
            {
              uint64_t v56 = 2;
            }
          }
          else
          {
            uint64_t v56 = 1;
          }
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v106 objects:v113 count:16];
        if (v92) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v56 = 0;
    }
LABEL_122:

    if (v56)
    {
      id v4 = v103;
      id v53 = v99;
      if (v56 == 4)
      {
LABEL_129:

        goto LABEL_130;
      }
      if (v10 != 3) {
        int64_t v10 = v56;
      }
    }
    else
    {
      id v4 = v103;
      id v53 = v99;
    }
    uint64_t v56 = v10;
    goto LABEL_129;
  }
LABEL_131:

  return v10;
}

+ (NSArray)unsupportedPOICategories
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v2 = _getValue(GeoServicesConfig_VisualIntelligenceCameraUnsupportedPOICategories, (uint64_t)off_1E91150B8, 1, 0, 0, 0);
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v7[0] = @"GEOPOICategoryAirportGate";
    v7[1] = @"GEOPOICategoryAirportTerminal";
    v7[2] = @"GEOPOICategoryATM";
    v7[3] = @"GEOPOICategoryEVCharger";
    v7[4] = @"GEOPOICategoryMailbox";
    v7[5] = @"GEOPOICategoryPublicTransport";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  }
  uint64_t v5 = v4;

  return (NSArray *)v5;
}

@end