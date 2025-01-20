@interface PHUserFeedbackCalculator
+ (BOOL)_isUserFeedbackFeatureFlagEnabled;
+ (BOOL)score:(double)a3 meetsScoreThreshold:(double)a4;
+ (id)descriptionForScore:(double)a3;
+ (id)fetchSongIdentifiersWithNegativeFeedbackWithPhotoLibrary:(id)a3;
+ (id)songIdentifiersWithNegativeFeedbackForMemory:(id)a3;
- (BOOL)_anyPersonUUIDs:(id)a3 matchesWithImportantPersonType:(unint64_t)a4;
- (BOOL)_hasNegativeFeedback:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PHUserFeedbackCalculator)initWithDataCache:(id)a3;
- (PHUserFeedbackCalculator)initWithPhotoLibrary:(id)a3;
- (PHUserFeedbackDataCache)dataCache;
- (double)_adjustScore:(double)result shouldDowngrade:(BOOL)a4;
- (double)_scoreForKeyAssetWithPersonUUIDs:(id)a3;
- (double)_scoreForPersonsInAssetsForUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5;
- (double)scoreForAssetUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5 memoryFeatures:(id)a6;
- (double)scoreForAssetUUIDs:(id)a3 personsUUIDsByAssetUUIDs:(id)a4;
- (double)scoreForKeyAssetUUID:(id)a3 personsUUIDsInKeyAsset:(id)a4 memoryFeatures:(id)a5;
- (id)_uniqueFeedbackTypesForPersonUUIDs:(id)a3;
- (id)memoryFeaturesWithNegativeFeedbackForMemoryFeatures:(id)a3;
- (id)personUUIDsWithNegativeFeedback;
- (id)personUUIDsWithUserFeedbackFilterBlock:(id)a3;
- (id)userFeedbackTypeByPersonUUIDForPersonUUIDs:(id)a3;
- (unint64_t)userFeedbackTypeForPersonUUID:(id)a3;
@end

@implementation PHUserFeedbackCalculator

- (void).cxx_destruct
{
}

- (PHUserFeedbackDataCache)dataCache
{
  return self->_dataCache;
}

- (BOOL)_hasNegativeFeedback:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] == 16)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v5 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v5 datesWithNegativeFeedback];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v49;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([v4 collidesWithDate:*(void *)(*((void *)&v48 + 1) + 8 * v9)]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_62;
        }
      }
LABEL_61:
      LOBYTE(v7) = 1;
    }
  }
  else if ([v4 type] == 512)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v10 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v10 dateIntervalsWithNegativeFeedback];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v7)
    {
      uint64_t v11 = *(void *)v45;
LABEL_14:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v6);
        }
        if ([v4 collidesWithDateInterval:*(void *)(*((void *)&v44 + 1) + 8 * v12)]) {
          goto LABEL_61;
        }
        if (v7 == ++v12)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v7) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
  else if ([v4 type] == 32)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v13 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v13 holidayNamesWithNegativeFeedback];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v55 count:16];
    if (v7)
    {
      uint64_t v14 = *(void *)v41;
LABEL_24:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v6);
        }
        if ([v4 collidesWithHolidayWithName:*(void *)(*((void *)&v40 + 1) + 8 * v15)]) {
          goto LABEL_61;
        }
        if (v7 == ++v15)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v55 count:16];
          if (v7) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
  }
  else if ([v4 type] == 4096)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v16 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v16 locationsWithNegativeFeedback];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v54 count:16];
    if (v7)
    {
      uint64_t v17 = *(void *)v37;
LABEL_34:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v18) coordinate];
        if (objc_msgSend(v4, "collidesWithLocationAtCoordinates:")) {
          goto LABEL_61;
        }
        if (v7 == ++v18)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v54 count:16];
          if (v7) {
            goto LABEL_34;
          }
          break;
        }
      }
    }
  }
  else if ([v4 type] == 0x20000)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v19 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v19 areaNamesWithNegativeFeedback];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v53 count:16];
    if (v7)
    {
      uint64_t v20 = *(void *)v33;
LABEL_44:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v6);
        }
        if ([v4 collidesWithAreaWithName:*(void *)(*((void *)&v32 + 1) + 8 * v21)]) {
          goto LABEL_61;
        }
        if (v7 == ++v21)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v53 count:16];
          if (v7) {
            goto LABEL_44;
          }
          break;
        }
      }
    }
  }
  else
  {
    if ([v4 type] != 1)
    {
      LOBYTE(v7) = 0;
      goto LABEL_63;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = [(PHUserFeedbackCalculator *)self dataCache];
    v6 = [v22 userFeedbackTypeByPersonUUID];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v52 count:16];
    if (v7)
    {
      uint64_t v23 = *(void *)v29;
LABEL_54:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v6);
        }
        v25 = +[PHObject localIdentifierWithUUID:*(void *)(*((void *)&v28 + 1) + 8 * v24)];
        char v26 = [v4 collidesWithPersonWithLocalIdentifier:v25];

        if (v26) {
          goto LABEL_61;
        }
        if (v7 == ++v24)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v52 count:16];
          if (v7) {
            goto LABEL_54;
          }
          break;
        }
      }
    }
  }
LABEL_62:

LABEL_63:
  return v7;
}

- (double)_adjustScore:(double)result shouldDowngrade:(BOOL)a4
{
  if (result < 0.0 && a4)
  {
    if (result >= -0.1) {
      result = -0.35;
    }
    else {
      result = -1.0;
    }
  }
  if (result < -1.0) {
    result = -1.0;
  }
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (id)_uniqueFeedbackTypesForPersonUUIDs:(id)a3
{
  v3 = [(PHUserFeedbackCalculator *)self userFeedbackTypeByPersonUUIDForPersonUUIDs:a3];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [v3 allValues];
  v6 = [v4 setWithArray:v5];

  return v6;
}

- (BOOL)_anyPersonUUIDs:(id)a3 matchesWithImportantPersonType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID IN %@", a3];
  uint64_t v7 = [(PHUserFeedbackCalculator *)self dataCache];
  uint64_t v8 = [v7 importantPersons];
  uint64_t v9 = [v8 filteredArrayUsingPredicate:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * i) type] == a4)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (double)_scoreForKeyAssetWithPersonUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [(PHUserFeedbackCalculator *)self _uniqueFeedbackTypesForPersonUUIDs:v4];
  char v6 = [v5 containsObject:&unk_1EEB24948];
  uint64_t v7 = [v5 containsObject:&unk_1EEB24960];
  uint64_t v8 = v7;
  if ((v6 & 1) != 0 || (double v9 = 0.0, v7))
  {
    double v10 = -1.0;
    if ([v4 count] != 1)
    {
      if ([v4 count] == 2)
      {
        if (![(PHUserFeedbackCalculator *)self _anyPersonUUIDs:v4 matchesWithImportantPersonType:1])
        {
          if ([(PHUserFeedbackCalculator *)self _anyPersonUUIDs:v4 matchesWithImportantPersonType:2])
          {
            double v10 = -0.2;
          }
          else
          {
            double v10 = -0.3;
          }
        }
      }
      else if ((unint64_t)[v4 count] >= 4)
      {
        if ((unint64_t)[v4 count] <= 3) {
          double v10 = -1.0;
        }
        else {
          double v10 = -0.1;
        }
      }
      else
      {
        double v10 = -0.2;
      }
    }
    [(PHUserFeedbackCalculator *)self _adjustScore:v8 shouldDowngrade:v10];
    double v9 = v11;
  }

  return v9;
}

- (double)_scoreForPersonsInAssetsForUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v61 = a5;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v9)
  {
    uint64_t v12 = [v61 objectForKeyedSubscript:v9];
    [(PHUserFeedbackCalculator *)self _scoreForKeyAssetWithPersonUUIDs:v12];
    double v14 = v13;

    double v11 = -1.0;
    if (v14 == -1.0) {
      goto LABEL_53;
    }
    double v11 = v14;
  }
  id v49 = v8;
  id v50 = v9;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v15 = v8;
  uint64_t v62 = [v15 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v62)
  {
    char v57 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v51 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v59 = *(void *)v64;
    uint64_t v60 = 0;
    id obj = v15;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v64 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v63 + 1) + 8 * v16);
        long long v18 = (void *)MEMORY[0x19F389B10]();
        long long v19 = [v61 objectForKeyedSubscript:v17];
        long long v20 = [(PHUserFeedbackCalculator *)self _uniqueFeedbackTypesForPersonUUIDs:v19];
        int v21 = [v20 containsObject:&unk_1EEB24948];
        int v22 = [v20 containsObject:&unk_1EEB24960];
        uint64_t v23 = self;
        uint64_t v24 = [(PHUserFeedbackCalculator *)self dataCache];
        v25 = [v24 deniedFeaturedPhotoUUIDs];
        LODWORD(v17) = [v25 containsObject:v17];

        if (v17)
        {
          ++v60;
LABEL_14:
          self = v23;
          goto LABEL_15;
        }
        if ((v21 | v22) != 1) {
          goto LABEL_14;
        }
        double v10 = v10 + 1.0;
        v57 |= v22;
        self = v23;
        if ([v19 count] == 1)
        {
          ++v56;
        }
        else if ([v19 count] == 2)
        {
          if ([(PHUserFeedbackCalculator *)v23 _anyPersonUUIDs:v19 matchesWithImportantPersonType:1])
          {
            ++v51;
          }
          else
          {
            BOOL v26 = [(PHUserFeedbackCalculator *)v23 _anyPersonUUIDs:v19 matchesWithImportantPersonType:2];
            if (v26) {
              uint64_t v27 = v55 + 1;
            }
            else {
              uint64_t v27 = v55;
            }
            uint64_t v28 = v54;
            if (!v26) {
              uint64_t v28 = v54 + 1;
            }
            uint64_t v54 = v28;
            uint64_t v55 = v27;
          }
        }
        else if ((unint64_t)[v19 count] > 3)
        {
          unint64_t v29 = [v19 count];
          uint64_t v30 = v52;
          if (v29 > 3) {
            uint64_t v30 = v52 + 1;
          }
          uint64_t v52 = v30;
        }
        else
        {
          ++v53;
        }
LABEL_15:

        ++v16;
      }
      while (v62 != v16);
      id v15 = obj;
      uint64_t v31 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      uint64_t v62 = v31;
      if (!v31) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v60 = 0;
  char v57 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v51 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
LABEL_34:

  double v32 = v10 + (double)v60;
  if (v32 == 0.0)
  {
    id v8 = v49;
    id v9 = v50;
  }
  else
  {
    unint64_t v33 = [v15 count];
    double v34 = 0.0;
    double v35 = 0.0;
    id v8 = v49;
    id v9 = v50;
    if (v32 > 0.0)
    {
      uint64_t v36 = v56 + v60;
      double v37 = v32 / (double)v33;
      long long v48 = self;
      if (v37 <= 0.2)
      {
        double v34 = -0.1;
      }
      else if (v37 > 0.5)
      {
        double v34 = -0.3;
      }
      else
      {
        double v34 = 0.0;
      }
      long long v38 = [NSNumber numberWithInteger:v36];
      v67[0] = v38;
      long long v39 = [NSNumber numberWithInteger:v54];
      v67[1] = v39;
      long long v40 = [NSNumber numberWithInteger:v55];
      v67[2] = v40;
      long long v41 = [NSNumber numberWithInteger:v51];
      v67[3] = v41;
      long long v42 = [NSNumber numberWithInteger:v53];
      v67[4] = v42;
      long long v43 = [NSNumber numberWithInteger:v52];
      v67[5] = v43;
      long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:6];

      long long v45 = [v44 valueForKeyPath:@"@max.self"];
      double v35 = 2.0;
      if (v36 == [v45 integerValue])
      {
        id v9 = v50;
      }
      else
      {
        id v9 = v50;
        if (v51 != [v45 integerValue])
        {
          double v35 = 1.0;
          if (v55 != [v45 integerValue] && v54 != objc_msgSend(v45, "integerValue"))
          {
            double v35 = 0.5;
            if (v53 != [v45 integerValue])
            {
              if (v52 == [v45 integerValue]) {
                double v35 = 0.1;
              }
              else {
                double v35 = 0.0;
              }
            }
          }
        }
      }

      self = v48;
    }
    [(PHUserFeedbackCalculator *)self _adjustScore:v57 & 1 shouldDowngrade:v11 + v34 * v35];
    double v11 = v46;
  }
LABEL_53:

  return v11;
}

- (id)memoryFeaturesWithNegativeFeedbackForMemoryFeatures:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[PHUserFeedbackCalculator _hasNegativeFeedback:](self, "_hasNegativeFeedback:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)userFeedbackTypeByPersonUUIDForPersonUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(PHUserFeedbackCalculator *)self dataCache];
  id v6 = [v5 userFeedbackTypeByPersonUUID];
  uint64_t v7 = [v6 objectsForKeys:v4 notFoundMarker:&unk_1EEB24930];

  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v4];

  return v8;
}

- (unint64_t)userFeedbackTypeForPersonUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v11 count:1];
  uint64_t v7 = -[PHUserFeedbackCalculator userFeedbackTypeByPersonUUIDForPersonUUIDs:](self, "userFeedbackTypeByPersonUUIDForPersonUUIDs:", v6, v11, v12);

  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  unint64_t v9 = [v8 unsignedIntegerValue];
  return v9;
}

- (id)personUUIDsWithUserFeedbackFilterBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, uint64_t))a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(PHUserFeedbackCalculator *)self dataCache];
  uint64_t v7 = [v6 userFeedbackTypeByPersonUUID];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v17);
        uint64_t v15 = [v14 unsignedIntegerValue];

        if (v4[2](v4, v15)) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)personUUIDsWithNegativeFeedback
{
  return [(PHUserFeedbackCalculator *)self personUUIDsWithUserFeedbackFilterBlock:&__block_literal_global_1008];
}

BOOL __59__PHUserFeedbackCalculator_personUUIDsWithNegativeFeedback__block_invoke(uint64_t a1, uint64_t a2)
{
  return (a2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (double)scoreForAssetUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5 memoryFeatures:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = a6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        if (-[PHUserFeedbackCalculator _hasNegativeFeedback:](self, "_hasNegativeFeedback:", *(void *)(*((void *)&v24 + 1) + 8 * v17), (void)v24))
        {

          double v21 = -1.0;
          goto LABEL_12;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v18 = [(PHUserFeedbackCalculator *)self dataCache];
  long long v19 = [v18 deniedFeaturedPhotoUUIDs];
  char v20 = [v19 containsObject:v11];

  double v21 = -1.0;
  if ((v20 & 1) == 0)
  {
    [(PHUserFeedbackCalculator *)self _scoreForPersonsInAssetsForUUIDs:v10 keyAssetUUID:v11 personsUUIDsByAssetUUIDs:v12];
    double v21 = v22;
  }
LABEL_12:

  return v21;
}

- (double)scoreForKeyAssetUUID:(id)a3 personsUUIDsInKeyAsset:(id)a4 memoryFeatures:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v17[0] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionaryWithObjects:v17 forKeys:&v16 count:1];

  [(PHUserFeedbackCalculator *)self scoreForAssetUUIDs:MEMORY[0x1E4F1CBF0] keyAssetUUID:v11 personsUUIDsByAssetUUIDs:v12 memoryFeatures:v9];
  double v14 = v13;

  return v14;
}

- (double)scoreForAssetUUIDs:(id)a3 personsUUIDsByAssetUUIDs:(id)a4
{
  [(PHUserFeedbackCalculator *)self scoreForAssetUUIDs:a3 keyAssetUUID:0 personsUUIDsByAssetUUIDs:a4 memoryFeatures:0];
  return result;
}

- (PHPhotoLibrary)photoLibrary
{
  return [(PHUserFeedbackDataCache *)self->_dataCache photoLibrary];
}

- (PHUserFeedbackCalculator)initWithDataCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHUserFeedbackCalculator;
  id v6 = [(PHUserFeedbackCalculator *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataCache, a3);
  }

  return v7;
}

- (PHUserFeedbackCalculator)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [[PHUserFeedbackDataCache alloc] initWithPhotoLibrary:v4];

  id v6 = [(PHUserFeedbackCalculator *)self initWithDataCache:v5];
  return v6;
}

+ (BOOL)_isUserFeedbackFeatureFlagEnabled
{
  return 1;
}

+ (id)songIdentifiersWithNegativeFeedbackForMemory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 userFeedbackProperties];
  id v5 = [v4 userFeedback];

  if ([v5 feature] == 6)
  {
    id v12 = 0;
    id v6 = [v5 contextAsListOfSongIdentifiersWithError:&v12];
    id v7 = v12;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      objc_super v9 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v3 localIdentifier];
        *(_DWORD *)buf = 138412546;
        double v14 = v10;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "PHUserFeedbackCalculator: Error parsing song identifiers from feedback for memory %@: %@", buf, 0x16u);
      }
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

+ (id)fetchSongIdentifiersWithNegativeFeedbackWithPhotoLibrary:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 _isUserFeedbackFeatureFlagEnabled])
  {
    id v5 = PLUserFeedbackGetLog();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    id v7 = v5;
    id v8 = v7;
    unint64_t v34 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchSongIdentifiersWithNegativeFeedback", (const char *)&unk_19B30018E, buf, 2u);
    }
    os_signpost_id_t spid = v6;
    unint64_t v33 = v8;

    uint64_t v32 = mach_absolute_time();
    id v36 = v4;
    objc_super v9 = [v4 librarySpecificFetchOptions];
    v48[0] = @"PHMemoryPropertySetUserFeedback";
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    [v9 setFetchPropertySets:v10];

    double v35 = v9;
    id v11 = +[PHMemory fetchMemoriesWithUserFeedbackWithOptions:v9];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v19 = objc_msgSend(v18, "userFeedbackProperties", spid);
          char v20 = [v19 userFeedback];

          if ([v20 feature] == 6)
          {
            id v37 = 0;
            double v21 = [v20 contextAsListOfSongIdentifiersWithError:&v37];
            id v22 = v37;
            if (v21)
            {
              [v12 addObjectsFromArray:v21];
            }
            else
            {
              uint64_t v23 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                long long v24 = [v18 localIdentifier];
                *(_DWORD *)buf = 138412546;
                long long v44 = v24;
                __int16 v45 = 2112;
                double v46 = *(double *)&v22;
                _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "PHUserFeedbackCalculator: Error parsing song identifiers from feedback for memory %@: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v15);
    }

    uint64_t v25 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v28 = v33;
    uint64_t v29 = v28;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v29, OS_SIGNPOST_INTERVAL_END, spid, "FetchSongIdentifiersWithNegativeFeedback", (const char *)&unk_19B30018E, buf, 2u);
    }

    id v4 = v36;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v44 = "FetchSongIdentifiersWithNegativeFeedback";
      __int16 v45 = 2048;
      double v46 = (float)((float)((float)((float)(v25 - v32) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (id)descriptionForScore:(double)a3
{
  if ([a1 score:a3 meetsScoreThreshold:0.0]) {
    return @"Recommended";
  }
  if ([a1 score:a3 meetsScoreThreshold:-0.1]) {
    return @"Acceptable";
  }
  if ([a1 score:a3 meetsScoreThreshold:-1.0]) {
    return @"Unacceptable";
  }
  if ([a1 score:a3 meetsScoreThreshold:-0.35]) {
    return @"Not Recommended";
  }
  return @"Unknown";
}

+ (BOOL)score:(double)a3 meetsScoreThreshold:(double)a4
{
  if (a4 == 0.0)
  {
    BOOL v4 = a3 < 0.0;
    return !v4;
  }
  if (a4 == -0.1)
  {
    BOOL v4 = a3 < -0.1;
    return !v4;
  }
  if (a4 == -0.35)
  {
    BOOL v6 = a3 >= -1.0;
    BOOL v7 = a3 < -0.1;
  }
  else
  {
    if (a4 != -1.0) {
      return 0;
    }
    BOOL v6 = a3 >= -1.0;
    BOOL v7 = a3 < -0.35;
  }
  return v7 && v6;
}

@end