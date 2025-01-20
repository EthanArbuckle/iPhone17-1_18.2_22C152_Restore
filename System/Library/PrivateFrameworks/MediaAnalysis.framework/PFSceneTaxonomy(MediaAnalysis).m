@interface PFSceneTaxonomy(MediaAnalysis)
+ (id)mad_audioTaxonomy:()MediaAnalysis useResultsKey:;
+ (id)vcp_sharedTaxonomy;
+ (uint64_t)mad_isExpectedTaxonomy;
- (id)mad_allAncestorsForSceneId:()MediaAnalysis;
- (id)mad_extendedSceneIdFromSceneName:()MediaAnalysis;
- (id)mad_sceneNameFromExtendedSceneId:()MediaAnalysis;
@end

@implementation PFSceneTaxonomy(MediaAnalysis)

+ (id)vcp_sharedTaxonomy
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PFSceneTaxonomy_MediaAnalysis__vcp_sharedTaxonomy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::once != -1) {
    dispatch_once(&+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::once, block);
  }
  v1 = (void *)+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance;
  return v1;
}

+ (uint64_t)mad_isExpectedTaxonomy
{
  if (+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::once != -1) {
    dispatch_once(&+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::once, &__block_literal_global_65);
  }
  return +[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest;
}

+ (id)mad_audioTaxonomy:()MediaAnalysis useResultsKey:
{
  v14[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!a4)
    {
      v7 = &unk_1F15EE8D8;
      goto LABEL_9;
    }
    v13[0] = @"ApplauseResults";
    v13[1] = @"BabbleResults";
    v14[0] = &unk_1F15ED788;
    v14[1] = &unk_1F15ED7A0;
    v13[2] = @"CheeringResults";
    v13[3] = @"LaughterResults";
    v14[2] = &unk_1F15ED7B8;
    v14[3] = &unk_1F15ED7D0;
    v13[4] = @"MusicResults";
    v13[5] = @"VoiceResults";
    v14[4] = &unk_1F15ED7E8;
    v14[5] = &unk_1F15ED800;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = v14;
    v6 = v13;
  }
  else if (a4)
  {
    v11[0] = &unk_1F15ED788;
    v11[1] = &unk_1F15ED7A0;
    v12[0] = @"ApplauseResults";
    v12[1] = @"BabbleResults";
    v11[2] = &unk_1F15ED7B8;
    v11[3] = &unk_1F15ED7D0;
    v12[2] = @"CheeringResults";
    v12[3] = @"LaughterResults";
    v11[4] = &unk_1F15ED7E8;
    v11[5] = &unk_1F15ED800;
    v12[4] = @"MusicResults";
    v12[5] = @"VoiceResults";
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = v12;
    v6 = v11;
  }
  else
  {
    v9[0] = &unk_1F15ED788;
    v9[1] = &unk_1F15ED7A0;
    v10[0] = @"applause";
    v10[1] = @"babble";
    v9[2] = &unk_1F15ED7B8;
    v9[3] = &unk_1F15ED7D0;
    v10[2] = @"cheering";
    v10[3] = @"laughter";
    v9[4] = &unk_1F15ED7E8;
    v9[5] = &unk_1F15ED800;
    v10[4] = @"music";
    v10[5] = @"voice";
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    v5 = v10;
    v6 = v9;
  }
  v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:6];
LABEL_9:
  return v7;
}

- (id)mad_sceneNameFromExtendedSceneId:()MediaAnalysis
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a1, "nodeForExtendedSceneClassId:");
  v5 = v4;
  if (v4)
  {
    v6 = [v4 name];
  }
  else
  {
    v7 = VCPSpecialLabelFromExtendedSceneClassificationID(a3);
    v6 = v7;
    if (v7)
    {
      id v8 = v7;
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        uint64_t v12 = a3;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "[PFSceneTaxonomy(MediaAnalysis)] - Failed find scene name for scene id %llu", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return v6;
}

- (id)mad_extendedSceneIdFromSceneName:()MediaAnalysis
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 nodeForName:v4];
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "sceneClassId"));
  }
  else
  {
    id v8 = VCPSpecialLabelToExtendedSceneClassificationID(v4);
    v7 = v8;
    if (v8)
    {
      id v9 = v8;
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[PFSceneTaxonomy(MediaAnalysis)] - Failed to find scene id for scene name %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v7;
}

- (id)mad_allAncestorsForSceneId:()MediaAnalysis
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = [MEMORY[0x1E4F1CA80] set];
  v5 = [a1 nodeForSceneClassId:a3];
  if (v5)
  {
    id v24 = v5;
    v6 = [v5 parents];
    int v25 = 0;
    while (1)
    {
      v26 = v6;
      if (![v6 count]) {
        break;
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v7 = v26;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v7);
            }
            int v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (([v11 isRoot] & 1) == 0) {
              [v27 addObject:v11];
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v8);
      }

      int v12 = [MEMORY[0x1E4F1CA80] set];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            v18 = [v17 parents];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v29;
              do
              {
                for (uint64_t k = 0; k != v19; ++k)
                {
                  if (*(void *)v29 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  v22 = *(void **)(*((void *)&v28 + 1) + 8 * k);
                  if (([v22 isRoot] & 1) == 0) {
                    [v12 addObject:v22];
                  }
                }
                uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
              }
              while (v19);
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v14);
      }

      v6 = v12;
      if (++v25 == 10) {
        goto LABEL_32;
      }
    }
    int v12 = v26;
LABEL_32:

    v5 = v24;
  }

  return v27;
}

@end