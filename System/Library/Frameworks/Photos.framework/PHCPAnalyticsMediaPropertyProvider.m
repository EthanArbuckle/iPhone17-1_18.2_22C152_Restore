@interface PHCPAnalyticsMediaPropertyProvider
+ (id)_syndicationStateDescriptionForSyndicationState:(unsigned __int16)a3;
+ (id)_syndicationValueDescriptionForAssetProcessingValue:(unsigned __int16)a3;
+ (id)_wellKnownPhotoLibraryIdentifierDescription:(int64_t)a3;
+ (id)assetPropertySetsToFetch;
- (BOOL)_hasPeopleForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4;
- (BOOL)_hasPetsForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4;
- (BOOL)_isPeopleSceneIdentifier:(unint64_t)a3;
- (BOOL)_isSceneConfidenceAboveThresholdForSceneClassification:(id)a3 sceneAnalysisVersion:(signed __int16)a4;
- (PFSceneTaxonomy)sceneTaxonomy84;
- (PFSceneTaxonomy)sceneTaxonomy99;
- (PHCPAnalyticsMediaPropertyProvider)init;
- (PHCPAnalyticsMediaPropertyProvider)initWithPhotoLibrary:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)_PHAssetCollectionFromPayload:(id)a3;
- (id)_PHAssetFromPayload:(id)a3;
- (id)_ageDescriptionForMediaDate:(id)a3;
- (id)_cameraTypeFromImportSource:(int64_t)a3;
- (id)_junkConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4;
- (id)_junkConfidenceThresholdVersion40ForIdentifier:(unint64_t)a3;
- (id)_junkConfidenceThresholdVersion81ForIdentifier:(unint64_t)a3;
- (id)_junkConfidenceThresholdVersion86ForIdentifier:(unint64_t)a3;
- (id)_mediaCountFromPayload:(id)a3;
- (id)_mediaProperty:(id)a3 forAsset:(id)a4;
- (id)_mediaProperty:(id)a3 forAssetCollection:(id)a4;
- (id)_sceneConfidenceThresholdByClassificationIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4;
- (id)_sceneForAsset:(id)a3;
- (id)_sceneLabelByClassificationIdentifier:(unint64_t)a3;
- (id)_sceneNetLabelConfidenceForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4;
- (id)_sceneSubjectForAsset:(id)a3;
- (id)_sdConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4;
- (id)_sdConfidenceThresholdVersion33ForIdentifier:(unint64_t)a3;
- (id)_sdConfidenceThresholdVersion51ForIdentifier:(unint64_t)a3;
- (id)_sdConfidenceThresholdVersion85ForIdentifier:(unint64_t)a3;
- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (void)registerSystemProperties:(id)a3;
- (void)setSceneTaxonomy84:(id)a3;
- (void)setSceneTaxonomy99:(id)a3;
@end

@implementation PHCPAnalyticsMediaPropertyProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy99, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy84, 0);

  objc_destroyWeak((id *)&self->_photoLibrary);
}

- (void)setSceneTaxonomy99:(id)a3
{
}

- (PFSceneTaxonomy)sceneTaxonomy99
{
  return self->_sceneTaxonomy99;
}

- (void)setSceneTaxonomy84:(id)a3
{
}

- (PFSceneTaxonomy)sceneTaxonomy84
{
  return self->_sceneTaxonomy84;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

  return (PHPhotoLibrary *)WeakRetained;
}

- (BOOL)_hasPeopleForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (-[PHCPAnalyticsMediaPropertyProvider _isPeopleSceneIdentifier:](self, "_isPeopleSceneIdentifier:", objc_msgSend(v11, "extendedSceneIdentifier", (void)v14))&& -[PHCPAnalyticsMediaPropertyProvider _isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:](self, "_isSceneConfidenceAboveThresholdForSceneClassification:sceneAnalysisVersion:", v11, v4))
        {
          BOOL v12 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)_hasPetsForSceneClassifications:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "extendedSceneIdentifier", (void)v15);
        if ((v12 == 493 || v12 == 114)
          && [(PHCPAnalyticsMediaPropertyProvider *)self _isSceneConfidenceAboveThresholdForSceneClassification:v11 sceneAnalysisVersion:v4])
        {
          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_isPeopleSceneIdentifier:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 - 1736 > 0x17 || ((1 << (a3 + 56)) & 0xC00001) == 0) {
    return a3 == 147 || a3 == 1600;
  }
  return result;
}

- (id)_sceneSubjectForAsset:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PHCPAnalyticsMediaPropertyProvider *)self photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  v38[0] = @"PHFacePropertySetIdentifier";
  v38[1] = @"PHFacePropertySetAnalytics";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v6 setFetchPropertySets:v7];

  v31 = v6;
  uint64_t v8 = +[PHFace fetchFacesInAsset:v4 options:v6];
  uint64_t v9 = [v4 sceneClassifications];
  v10 = [v4 sceneAnalysisProperties];
  uint64_t v11 = [v10 sceneAnalysisVersion];

  v30 = self;
  v32 = (void *)v9;
  unsigned int v29 = v11;
  BOOL v12 = [(PHCPAnalyticsMediaPropertyProvider *)self _hasPetsForSceneClassifications:v9 sceneAnalysisVersion:v11];
  unint64_t v13 = [v8 count];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v34;
    double v20 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v23 = [v22 ageType];
        if (v23 == 1) {
          uint64_t v24 = v17 + 1;
        }
        else {
          uint64_t v24 = v17;
        }
        if (v23 == 2) {
          ++v18;
        }
        else {
          uint64_t v17 = v24;
        }
        [v22 size];
        double v20 = v20 + v25;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    double v20 = 0.0;
  }

  if (v12)
  {
    if (v13) {
      v26 = @"People and pets";
    }
    else {
      v26 = @"Pets";
    }
    goto LABEL_29;
  }
  if (v17 && v17 == v13)
  {
    v26 = @"Baby";
LABEL_29:
    v27 = v32;
    goto LABEL_30;
  }
  if (v18 && v18 == v13)
  {
    v26 = @"Children";
    goto LABEL_29;
  }
  if (v18 + v17 && v13 > v18 + v17)
  {
    v26 = @"People with children";
    goto LABEL_29;
  }
  v27 = v32;
  if (v13 == 1)
  {
    if (v20 >= 0.2) {
      v26 = @"Portrait";
    }
    else {
      v26 = @"Single Person";
    }
  }
  else if (v13 - 1 >= 4)
  {
    if (v13 <= 4)
    {
      if ([(PHCPAnalyticsMediaPropertyProvider *)v30 _hasPeopleForSceneClassifications:v32 sceneAnalysisVersion:v29])
      {
        v26 = @"People (no face info)";
      }
      else
      {
        v26 = @"None";
      }
    }
    else
    {
      v26 = @"Group Shot";
    }
  }
  else
  {
    v26 = @"2-4 People";
  }
LABEL_30:

  return v26;
}

- (id)_sceneLabelByClassificationIdentifier:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1759)
  {
    if ((uint64_t)a3 > 978)
    {
      if ((uint64_t)a3 <= 1268)
      {
        if (a3 == 979) {
          return @"performance";
        }
        if (a3 == 1088) {
          return @"recreation";
        }
      }
      else
      {
        switch(a3)
        {
          case 0x4F5uLL:
            return @"sport";
          case 0x5A7uLL:
            return @"vehicle";
          case 0x681uLL:
            return @"screenshot";
        }
      }
      return @"Other";
    }
    if ((uint64_t)a3 > 116)
    {
      if (a3 != 117 && a3 != 493) {
        return @"Other";
      }
      return @"animal";
    }
    if (a3 != 5)
    {
      if (a3 != 114) {
        return @"Other";
      }
      return @"animal";
    }
    return @"outdoor";
  }
  if ((uint64_t)a3 > 2147483640)
  {
    if (a3 - 2147483641 >= 2)
    {
      if (a3 != 2147483655)
      {
        if (a3 == 2147483653) {
          return @"interior_room";
        }
        return @"Other";
      }
      return @"outdoor";
    }
    return @"references";
  }
  if ((uint64_t)a3 > 2147482622)
  {
    if (a3 == 2147482623) {
      return @"landscape_cityscape";
    }
    if (a3 != 2147483638)
    {
      if (a3 == 2147483640) {
        return @"receipt_or_document";
      }
      return @"Other";
    }
    return @"references";
  }
  if (a3 == 1760) {
    return @"crowd";
  }
  if (a3 == 2147482622) {
    return @"food";
  }
  return @"Other";
}

- (id)_sdConfidenceThresholdVersion85ForIdentifier:(unint64_t)a3
{
  if (a3 == 2147482623) {
    v3 = &unk_1EEB26F30;
  }
  else {
    v3 = 0;
  }
  if (a3 == 2147482622) {
    return &unk_1EEB26F20;
  }
  else {
    return v3;
  }
}

- (id)_sdConfidenceThresholdVersion51ForIdentifier:(unint64_t)a3
{
  if (a3 == 2147482623) {
    v3 = &unk_1EEB26F00;
  }
  else {
    v3 = 0;
  }
  if (a3 == 2147482622) {
    return &unk_1EEB26F10;
  }
  else {
    return v3;
  }
}

- (id)_sdConfidenceThresholdVersion33ForIdentifier:(unint64_t)a3
{
  if (a3 == 2147482623) {
    v3 = &unk_1EEB26F00;
  }
  else {
    v3 = 0;
  }
  if (a3 == 2147482622) {
    return &unk_1EEB26EF0;
  }
  else {
    return v3;
  }
}

- (id)_sdConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  if (a4 < 0x55)
  {
    if (a4 < 0x33)
    {
      if (a4 < 0x21)
      {
        id v4 = 0;
      }
      else
      {
        id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _sdConfidenceThresholdVersion33ForIdentifier:a3];
      }
    }
    else
    {
      id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _sdConfidenceThresholdVersion51ForIdentifier:a3];
    }
  }
  else
  {
    id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _sdConfidenceThresholdVersion85ForIdentifier:a3];
  }

  return v4;
}

- (id)_junkConfidenceThresholdVersion86ForIdentifier:(unint64_t)a3
{
  if (a3 == 2147483640) {
    return &unk_1EEB26EE0;
  }
  else {
    return 0;
  }
}

- (id)_junkConfidenceThresholdVersion81ForIdentifier:(unint64_t)a3
{
  if (a3 - 2147483638 > 4) {
    return 0;
  }
  else {
    return (id)*((void *)&unk_1E5847670 + a3 - 2147483638);
  }
}

- (id)_junkConfidenceThresholdVersion40ForIdentifier:(unint64_t)a3
{
  if (a3 - 2147483638 > 4) {
    return 0;
  }
  else {
    return (id)*((void *)&unk_1E5847648 + a3 - 2147483638);
  }
}

- (id)_junkConfidenceThresholdForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  if (a4 < 0x56)
  {
    if (a4 < 0x51)
    {
      if (a4 < 0x28)
      {
        id v4 = 0;
      }
      else
      {
        id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _junkConfidenceThresholdVersion40ForIdentifier:a3];
      }
    }
    else
    {
      id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _junkConfidenceThresholdVersion81ForIdentifier:a3];
    }
  }
  else
  {
    id v4 = [(PHCPAnalyticsMediaPropertyProvider *)self _junkConfidenceThresholdVersion86ForIdentifier:a3];
  }

  return v4;
}

- (id)_sceneNetLabelConfidenceForIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  if (a4 < 0x63)
  {
    if (a4 < 0x54)
    {
      v5 = 0;
      goto LABEL_8;
    }
    sceneTaxonomy84 = self->_sceneTaxonomy84;
  }
  else
  {
    sceneTaxonomy84 = self->_sceneTaxonomy99;
  }
  v5 = (void *)[(PFSceneTaxonomy *)sceneTaxonomy84 nodeRefForExtendedSceneClassId:a3];
  if (v5)
  {
    id v6 = NSNumber;
    PFSceneTaxonomyNodeSearchThreshold();
    v5 = objc_msgSend(v6, "numberWithDouble:");
  }
LABEL_8:

  return v5;
}

- (id)_sceneConfidenceThresholdByClassificationIdentifier:(unint64_t)a3 sceneAnalysisVersion:(signed __int16)a4
{
  v5 = 0;
  if ((uint64_t)a3 <= 1735)
  {
    if ((uint64_t)a3 <= 978)
    {
      if ((a3 - 114 > 0x21 || ((1 << (a3 - 114)) & 0x200000009) == 0) && a3 != 5 && a3 != 493) {
        goto LABEL_26;
      }
    }
    else if ((uint64_t)a3 > 1446)
    {
      if (a3 != 1447 && a3 != 1600 && a3 != 1665) {
        goto LABEL_26;
      }
    }
    else if (a3 != 979 && a3 != 1088 && a3 != 1269)
    {
      goto LABEL_26;
    }
LABEL_25:
    v5 = -[PHCPAnalyticsMediaPropertyProvider _sceneNetLabelConfidenceForIdentifier:sceneAnalysisVersion:](self, "_sceneNetLabelConfidenceForIdentifier:sceneAnalysisVersion:");
    goto LABEL_26;
  }
  char v6 = a3 + 10;
  if (a3 - 2147483638 <= 0x11)
  {
    if (((1 << v6) & 0x1D) != 0)
    {
      v5 = -[PHCPAnalyticsMediaPropertyProvider _junkConfidenceThresholdForIdentifier:sceneAnalysisVersion:](self, "_junkConfidenceThresholdForIdentifier:sceneAnalysisVersion:");
      goto LABEL_26;
    }
    if (((1 << v6) & 0x28000) != 0) {
      goto LABEL_25;
    }
  }
  if (a3 - 1736 <= 0x18 && ((1 << (a3 + 56)) & 0x1C00001) != 0) {
    goto LABEL_25;
  }
  if (a3 - 2147482622 < 2)
  {
    v5 = -[PHCPAnalyticsMediaPropertyProvider _sdConfidenceThresholdForIdentifier:sceneAnalysisVersion:](self, "_sdConfidenceThresholdForIdentifier:sceneAnalysisVersion:");
  }
LABEL_26:

  return v5;
}

- (BOOL)_isSceneConfidenceAboveThresholdForSceneClassification:(id)a3 sceneAnalysisVersion:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = -[PHCPAnalyticsMediaPropertyProvider _sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:](self, "_sceneConfidenceThresholdByClassificationIdentifier:sceneAnalysisVersion:", [v6 extendedSceneIdentifier], v4);
  if (v7)
  {
    [v6 confidence];
    double v9 = v8;
    [v7 doubleValue];
    BOOL v11 = v9 >= v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_sceneForAsset:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 sceneClassifications];
  id v6 = [v4 sceneAnalysisProperties];
  uint64_t v7 = [v6 sceneAnalysisVersion];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {
    int v23 = @"Other";
    BOOL v11 = v8;
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  BOOL v11 = 0;
  uint64_t v12 = *(void *)v26;
  double v13 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend(v15, "extendedSceneIdentifier", (void)v25);
      if ([(PHCPAnalyticsMediaPropertyProvider *)self _isSceneConfidenceAboveThresholdForSceneClassification:v15 sceneAnalysisVersion:v7])
      {
        uint64_t v17 = [(PHCPAnalyticsMediaPropertyProvider *)self _sceneConfidenceThresholdByClassificationIdentifier:v16 sceneAnalysisVersion:v7];
        [v17 doubleValue];
        double v19 = v18;

        if (v19 > 0.0)
        {
          [v15 confidence];
          double v21 = v20 / v19;
          if (v21 > v13)
          {
            id v22 = v15;

            double v13 = v21;
            BOOL v11 = v22;
          }
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v10);

  if (v11)
  {
    -[PHCPAnalyticsMediaPropertyProvider _sceneLabelByClassificationIdentifier:](self, "_sceneLabelByClassificationIdentifier:", [v11 extendedSceneIdentifier]);
    int v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_17;
  }
  int v23 = @"Other";
LABEL_17:

  return v23;
}

- (id)_cameraTypeFromImportSource:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return @"Unknown Or Legacy";
  }
  else {
    return off_1E58475D0[a3];
  }
}

- (id)_ageDescriptionForMediaDate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    if (v5 <= 60.0)
    {
      double v7 = v5 / -60.0;
      if (v7 >= 3.0)
      {
        if (v7 >= 10.0)
        {
          double v8 = v7 / 60.0;
          if (v8 >= 3.0)
          {
            if (v8 < 24.0)
            {
              id v6 = @"MediaAgeToday";
            }
            else if (v8 < 48.0)
            {
              id v6 = @"MediaAgeYesterday";
            }
            else
            {
              double v9 = v8 / 24.0;
              if (v9 >= 7.0)
              {
                if (v9 < 30.0)
                {
                  id v6 = @"MediaAgeLast30Days";
                }
                else if (v9 < 60.0)
                {
                  id v6 = @"MediaAgeLast60Days";
                }
                else if (v9 >= 90.0)
                {
                  if (v9 >= 180.0)
                  {
                    double v11 = v9 / 365.0;
                    if (v11 >= 1.0)
                    {
                      if (v11 < 2.0)
                      {
                        id v6 = @"MediaAge1Year";
                      }
                      else if (v11 < 3.0)
                      {
                        id v6 = @"MediaAge2Years";
                      }
                      else if (v11 < 4.0)
                      {
                        id v6 = @"MediaAge3Years";
                      }
                      else if (v11 < 5.0)
                      {
                        id v6 = @"MediaAge4Years";
                      }
                      else if (v11 < 6.0)
                      {
                        id v6 = @"MediaAge5Years";
                      }
                      else if (v11 < 10.0)
                      {
                        id v6 = @"MediaAge10Years";
                      }
                      else if (v11 < 20.0)
                      {
                        id v6 = @"MediaAge20Years";
                      }
                      else if (v11 < 30.0)
                      {
                        id v6 = @"MediaAge30Years";
                      }
                      else if (v11 < 40.0)
                      {
                        id v6 = @"MediaAge40Years";
                      }
                      else
                      {
                        id v6 = @"MediaAge40PlusYears";
                      }
                    }
                    else
                    {
                      id v6 = @"MediaAgeLastYear";
                    }
                  }
                  else
                  {
                    id v6 = @"MediaAgeLast180Days";
                  }
                }
                else
                {
                  id v6 = @"MediaAgeLast90Days";
                }
              }
              else
              {
                id v6 = @"MediaAgeThisWeek";
              }
            }
          }
          else
          {
            id v6 = @"MediaAgeNew";
          }
        }
        else
        {
          id v6 = @"MediaAgeVeryNew";
        }
      }
      else
      {
        id v6 = @"MediaAgeJustNow";
      }
    }
    else
    {
      id v6 = @"MediaAgeFuture";
    }
  }
  else
  {
    id v6 = @"MediaAgeUnknown";
  }

  return v6;
}

- (id)_mediaProperty:(id)a3 forAssetCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_30;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F564F8]])
  {
    uint64_t v8 = +[PHAssetCollection descriptionForType:](PHAssetCollection, "descriptionForType:", [v7 assetCollectionType]);
LABEL_4:
    double v9 = (void *)v8;
    goto LABEL_34;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F564F0]])
  {
    if ([v7 assetCollectionType] != 4)
    {
      if ([v7 assetCollectionType] == 10) {
        [v7 projectDocumentType];
      }
      else {
      uint64_t v8 = +[PHAssetCollection descriptionForSubtype:](PHAssetCollection, "descriptionForSubtype:", [v7 assetCollectionSubtype]);
      }
      goto LABEL_4;
    }
    id v10 = v7;
    uint64_t v11 = [v10 category];
    if ([v10 subcategory]) {
      +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:");
    }
    else {
    double v9 = +[PHMemory stringForCategory:v11];
    }
    if (+[PHMemory isTriggeredMemoryCategory:v11])
    {
      uint64_t v16 = [v9 stringByAppendingString:@", Triggered"];

      double v9 = (void *)v16;
    }
    goto LABEL_33;
  }
  if (![v6 isEqualToString:*MEMORY[0x1E4F564D0]])
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F564E8]])
    {
      id v10 = [v7 startDate];
      uint64_t v12 = [v7 endDate];
      double v13 = v12;
      double v9 = 0;
      if (!v10 || !v12) {
        goto LABEL_32;
      }
      id v14 = NSNumber;
      [v12 timeIntervalSinceDate:v10];
      uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
      goto LABEL_27;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564C8]])
    {
      uint64_t v8 = [v7 localIdentifier];
      goto LABEL_4;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56538]])
    {
      uint64_t v8 = [v7 uuid];
      goto LABEL_4;
    }
LABEL_30:
    double v9 = 0;
    goto LABEL_34;
  }
  id v10 = [v7 creationDate];
  if (!v10)
  {
    double v13 = [v7 endDate];
    if (!v13)
    {
      uint64_t v17 = [v7 startDate];
      double v9 = [(PHCPAnalyticsMediaPropertyProvider *)self _ageDescriptionForMediaDate:v17];

      goto LABEL_32;
    }
    uint64_t v15 = [(PHCPAnalyticsMediaPropertyProvider *)self _ageDescriptionForMediaDate:v13];
LABEL_27:
    double v9 = (void *)v15;
LABEL_32:

    goto LABEL_33;
  }
  double v9 = [(PHCPAnalyticsMediaPropertyProvider *)self _ageDescriptionForMediaDate:v10];
LABEL_33:

LABEL_34:

  return v9;
}

- (id)_PHAssetCollectionFromPayload:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F56548]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = v6;
  }
  else
  {
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F56550]];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [(PHCPAnalyticsMediaPropertyProvider *)self photoLibrary];
      double v9 = [v8 librarySpecificFetchOptions];

      v13[0] = v6;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v11 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v10 options:v9];
      id v7 = [v11 firstObject];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_mediaProperty:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F56490]])
    {
      uint64_t v8 = NSNumber;
      uint64_t v9 = [v7 hasAdjustments];
LABEL_10:
      uint64_t v13 = v9;
      id v14 = v8;
LABEL_11:
      uint64_t v15 = [v14 numberWithBool:v13];
LABEL_12:
      uint64_t v12 = v15;
      goto LABEL_63;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56498]])
    {
      [v7 fetchPropertySetsIfNeeded];
      id v10 = [v7 importProperties];
      -[PHCPAnalyticsMediaPropertyProvider _cameraTypeFromImportSource:](self, "_cameraTypeFromImportSource:", [v10 importedBy]);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564A8]])
    {
      uint64_t v8 = NSNumber;
      uint64_t v9 = [v7 isFavorite];
      goto LABEL_10;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564B8]])
    {
      [v7 fetchPropertySetsIfNeeded];
      id v10 = [v7 importProperties];
      unint64_t v16 = [v10 importedBy];
      if (v16 > 0xE) {
        uint64_t v17 = @"Unknown Import Source Value";
      }
      else {
        uint64_t v17 = off_1E5845508[v16];
      }
      uint64_t v11 = v17;
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564F8]])
    {
      +[PHAsset descriptionForMediaType:](PHAsset, "descriptionForMediaType:", [v7 mediaType]);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564F0]])
    {
      +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", [v7 mediaSubtypes]);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564D0]])
    {
      id v10 = [v7 creationDate];
      uint64_t v11 = [(PHCPAnalyticsMediaPropertyProvider *)self _ageDescriptionForMediaDate:v10];
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564E8]])
    {
      double v18 = NSNumber;
      [v7 duration];
LABEL_26:
      objc_msgSend(v18, "numberWithDouble:");
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564C8]])
    {
      uint64_t v15 = [v7 localIdentifier];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564D8]])
    {
      id v10 = [v7 creationDate];
      [v10 timeIntervalSinceNow];
      uint64_t v12 = 0;
      if (!v10 || v19 > 0.0) {
        goto LABEL_7;
      }
      uint64_t v11 = [NSNumber numberWithDouble:v19 / -60.0];
LABEL_6:
      uint64_t v12 = v11;
LABEL_7:

      goto LABEL_63;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56500]])
    {
      objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "exifOrientation"));
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56508]])
    {
      uint64_t v15 = [(PHCPAnalyticsMediaPropertyProvider *)self _sceneForAsset:v7];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56518]])
    {
      uint64_t v15 = [(PHCPAnalyticsMediaPropertyProvider *)self _sceneSubjectForAsset:v7];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56538]])
    {
      uint64_t v15 = [v7 uuid];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564C0]])
    {
      id v10 = [v7 photoLibrary];
      char v20 = [v10 isSystemPhotoLibrary];
      double v21 = objc_opt_class();
      if (v20) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = [v10 wellKnownPhotoLibraryIdentifier];
      }
      uint64_t v11 = [v21 _wellKnownPhotoLibraryIdentifierDescription:v22];
      goto LABEL_6;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56530]])
    {
      objc_msgSend((id)objc_opt_class(), "_syndicationStateDescriptionForSyndicationState:", objc_msgSend(v7, "syndicationState"));
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F564B0]])
    {
      int v23 = [v7 curationProperties];
      uint64_t v24 = [v23 syndicationIdentifier];
      BOOL v25 = v24 != 0;

      id v14 = NSNumber;
      uint64_t v13 = v25;
      goto LABEL_11;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56520]])
    {
      [v7 fetchPropertySetsIfNeeded];
      long long v26 = [v7 mediaAnalysisProperties];
      uint64_t v27 = [v26 syndicationProcessingValue];

      uint64_t v15 = [(id)objc_opt_class() _syndicationValueDescriptionForAssetProcessingValue:v27];
      goto LABEL_12;
    }
    if ([v6 isEqualToString:*MEMORY[0x1E4F56528]])
    {
      [v7 fetchPropertySetsIfNeeded];
      long long v28 = [v7 mediaAnalysisProperties];
      uint64_t v29 = [v28 syndicationProcessingVersion];

      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        PHAssetSyndicationProcessingVersionDescription(v29);
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {
      if ([v6 isEqualToString:*MEMORY[0x1E4F564A0]])
      {
        double v18 = NSNumber;
        [v7 curationScore];
        goto LABEL_26;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4F56510]]
        && CFPreferencesGetAppBooleanValue(@"PhotosSharedLibrarySyncingIsActive", @"com.apple.mobileslideshow", 0))
      {
        int v30 = [v7 participatesInLibraryScope];
        v31 = @"Personal";
        if (v30) {
          v31 = @"Shared";
        }
        uint64_t v15 = v31;
        goto LABEL_12;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_63:

  return v12;
}

- (id)_mediaCountFromPayload:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F56558]];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v4 = &unk_1EEB262F8;
      }
      else {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_PHAssetFromPayload:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F56558]];
  if (!v3)
  {
LABEL_8:
    id v7 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v3;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v4 = v3;
  if ([v4 count] == 1
    && ([v4 firstObject],
        double v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    id v7 = [v4 firstObject];
  }
  else
  {
    id v7 = 0;
  }

LABEL_11:

  return v7;
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (![v7 isEqualToString:*MEMORY[0x1E4F564C8]]
    || ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F56550]],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F56538]]
      && ([v8 objectForKeyedSubscript:*MEMORY[0x1E4F56550]],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = +[PHObject uuidFromLocalIdentifier:v10];
    }
    else
    {
      if ([v7 isEqualToString:*MEMORY[0x1E4F564E0]])
      {
        uint64_t v9 = [(PHCPAnalyticsMediaPropertyProvider *)self _mediaCountFromPayload:v8];
        goto LABEL_12;
      }
      uint64_t v11 = [(PHCPAnalyticsMediaPropertyProvider *)self _PHAssetFromPayload:v8];
      if (!v11)
      {
        id v14 = [(PHCPAnalyticsMediaPropertyProvider *)self _PHAssetCollectionFromPayload:v8];
        if (v14)
        {
          uint64_t v9 = [(PHCPAnalyticsMediaPropertyProvider *)self _mediaProperty:v7 forAssetCollection:v14];
        }
        else
        {
          uint64_t v9 = 0;
        }

        goto LABEL_11;
      }
      uint64_t v12 = [(PHCPAnalyticsMediaPropertyProvider *)self _mediaProperty:v7 forAsset:v11];
    }
    uint64_t v9 = (void *)v12;
LABEL_11:
  }
LABEL_12:

  return v9;
}

- (void)registerSystemProperties:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F56490];
  id v5 = a3;
  [v5 addDynamicProperty:v4 withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56498] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564A8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564B8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564C8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564F8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564F0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564D0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564E0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564E8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564D8] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56500] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56508] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56518] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56538] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564C0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56530] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564B0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56520] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56528] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F564A0] withProvider:self];
  [v5 addDynamicProperty:*MEMORY[0x1E4F56510] withProvider:self];
}

- (PHCPAnalyticsMediaPropertyProvider)initWithPhotoLibrary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHCPAnalyticsMediaPropertyProvider;
  id v5 = [(PHCPAnalyticsMediaPropertyProvider *)&v22 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 84);
    id v21 = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F8CD60]) initWithIdentifier:v7 error:&v21];
    id v9 = v21;
    sceneTaxonomy84 = v6->_sceneTaxonomy84;
    v6->_sceneTaxonomy84 = (PFSceneTaxonomy *)v8;

    if (!v6->_sceneTaxonomy84)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v7;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@. %@", buf, 0x16u);
      }
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F8CD60]) initWithLatestTaxonomy];
      uint64_t v12 = v6->_sceneTaxonomy84;
      v6->_sceneTaxonomy84 = (PFSceneTaxonomy *)v11;
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 99);
    id v20 = v9;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F8CD60]) initWithIdentifier:v13 error:&v20];
    id v15 = v20;

    sceneTaxonomy99 = v6->_sceneTaxonomy99;
    v6->_sceneTaxonomy99 = (PFSceneTaxonomy *)v14;

    if (!v6->_sceneTaxonomy99)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_error_impl(&dword_19B043000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@. %@", buf, 0x16u);
      }
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F8CD60]) initWithLatestTaxonomy];
      double v18 = v6->_sceneTaxonomy99;
      v6->_sceneTaxonomy99 = (PFSceneTaxonomy *)v17;
    }
  }

  return v6;
}

- (PHCPAnalyticsMediaPropertyProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHCPAnalyticsMediaPropertyProvider.m", 127, @"%s is not available as initializer", "-[PHCPAnalyticsMediaPropertyProvider init]");

  abort();
}

+ (id)_wellKnownPhotoLibraryIdentifierDescription:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E58476E0[a3];
  }
}

+ (id)_syndicationValueDescriptionForAssetProcessingValue:(unsigned __int16)a3
{
  int v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = v4;
  if (!v3)
  {
    id v6 = @"none";
LABEL_34:
    [v5 addObject:v6];
    goto LABEL_35;
  }
  if (v3)
  {
    [v4 addObject:@"no moment"];
    v3 ^= 1u;
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v5 addObject:@"time"];
  v3 ^= 2u;
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v5 addObject:@"no location"];
  v3 ^= 4u;
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v5 addObject:@"far location"];
  v3 ^= 8u;
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v5 addObject:@"location"];
  v3 ^= 0x10u;
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v5 addObject:@"owner face"];
  v3 ^= 0x20u;
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v5 addObject:@"face"];
  v3 ^= 0x40u;
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v5 addObject:@"previous moment"];
  v3 ^= 0x80u;
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v5 addObject:@"duplicate"];
  v3 ^= 0x100u;
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v5 addObject:@"pet"];
  v3 ^= 0x200u;
  if ((v3 & 0x400) == 0)
  {
LABEL_13:
    if ((v3 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v5 addObject:@"coreroutine"];
  v3 ^= 0x400u;
  if ((v3 & 0x800) == 0)
  {
LABEL_14:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v5 addObject:@"significant location"];
  v3 ^= 0x800u;
  if ((v3 & 0x1000) == 0)
  {
LABEL_15:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_16;
    }
LABEL_32:
    [v5 addObject:@"sceneprint"];
    if (((v3 ^ 0x2000) & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
LABEL_31:
  [v5 addObject:@"saved guest"];
  v3 ^= 0x1000u;
  if ((v3 & 0x2000) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if ((v3 & 0x4000) != 0)
  {
LABEL_33:
    id v6 = @"child";
    goto LABEL_34;
  }
LABEL_35:
  id v7 = [v5 componentsJoinedByString:@", "];

  return v7;
}

+ (id)_syndicationStateDescriptionForSyndicationState:(unsigned __int16)a3
{
  if (a3 > 8u) {
    return @"Unknown";
  }
  else {
    return off_1E5847698[a3];
  }
}

+ (id)assetPropertySetsToFetch
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PHAssetPropertySetCore";
  v4[1] = @"PHAssetPropertySetSceneAnalysis";
  v4[2] = @"PHAssetPropertySetImport";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

@end