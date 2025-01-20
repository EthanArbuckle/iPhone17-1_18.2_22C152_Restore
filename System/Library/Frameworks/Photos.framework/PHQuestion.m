@interface PHQuestion
+ (id)entityKeyMap;
+ (id)fetchAnsweredQuestionCountsWithOptions:(id)a3;
+ (id)fetchAnsweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4;
+ (id)fetchAnsweredYesOrNoQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4;
+ (id)fetchInvalidatedQuestionsWithOptions:(id)a3;
+ (id)fetchQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4 validQuestionsOnly:(BOOL)a5;
+ (id)fetchQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4;
+ (id)fetchType;
+ (id)fetchUnansweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)questionsWithValidEntitiesFromQuestions:(id)a3 photoLibrary:(id)a4;
+ (id)stringForQuestionType:(unsigned __int16)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (Class)changeRequestClass;
- (NSDate)creationDate;
- (NSDictionary)additionalInfo;
- (NSString)entityIdentifier;
- (PHQuestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (double)score;
- (id)description;
- (signed)questionVersion;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PHQuestion

- (unsigned)type
{
  return self->_type;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)displayType
{
  return self->_displayType;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_16_49848;

  return v2;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

id __59__PHQuestion_fetchQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForQuestionsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

void __50__PHQuestion_transformValueExpression_forKeyPath___block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"entityIdentifier";
  v4[1] = @"type";
  v4[2] = @"state";
  v4[3] = @"entityType";
  v4[4] = @"displayType";
  v4[5] = @"score";
  v4[6] = @"additionalInfo";
  v4[7] = @"creationDate";
  v4[8] = @"questionVersion";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_49804;
  transformValueExpression_forKeyPath___passThroughSet_49804 = v2;
}

void __26__PHQuestion_entityKeyMap__block_invoke()
{
  v25[10] = *MEMORY[0x1E4F143B8];
  v12 = [PHEntityKeyMap alloc];
  v23 = @"uuid";
  v24[0] = @"uuid";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25[0] = v13;
  v24[1] = @"entityIdentifier";
  v22 = @"entityIdentifier";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v25[1] = v0;
  v24[2] = @"type";
  v21 = @"type";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v25[2] = v1;
  v24[3] = @"state";
  v20 = @"state";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v25[3] = v2;
  v24[4] = @"entityType";
  v19 = @"entityType";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v25[4] = v3;
  v24[5] = @"displayType";
  v18 = @"displayType";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v25[5] = v4;
  v24[6] = @"score";
  v17 = @"score";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v25[6] = v5;
  v24[7] = @"additionalInfo";
  v16 = @"additionalInfo";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v25[7] = v6;
  v24[8] = @"creationDate";
  v15 = @"creationDate";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v25[8] = v7;
  v24[9] = @"questionVersion";
  v14 = @"questionVersion";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v25[9] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];
  uint64_t v10 = [(PHEntityKeyMap *)v12 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_16_49848;
  entityKeyMap_pl_once_object_16_49848 = v10;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PHQuestion_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_49803 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_49803, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_49804 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)managedEntityName
{
  return @"Question";
}

+ (id)fetchQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_76];
  if (v4)
  {
    id v8 = [v6 photoLibrary];
    uint64_t v9 = [a1 questionsWithValidEntitiesFromQuestions:v7 photoLibrary:v8];

    id v7 = (void *)v9;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (signed)questionVersion
{
  return self->_questionVersion;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)score
{
  return self->_score;
}

- (unsigned)state
{
  return self->_state;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PHQuestion;
  BOOL v4 = [(PHObject *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, entityIdentifier: %@ type: %hu, state: %hu, entityType: %hu, displayType: %hu, score: %f,\nadditionalInfo: %@\ncreationDate: %@", v4, self->_entityIdentifier, self->_type, self->_state, self->_entityType, self->_displayType, *(void *)&self->_score, self->_additionalInfo, self->_creationDate];

  return v5;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHQuestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHQuestion;
  uint64_t v9 = [(PHObject *)&v24 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"entityIdentifier"];
    entityIdentifier = v9->_entityIdentifier;
    v9->_entityIdentifier = (NSString *)v10;

    v12 = [v8 objectForKeyedSubscript:@"type"];
    v9->_type = [v12 unsignedIntegerValue];

    v13 = [v8 objectForKeyedSubscript:@"state"];
    v9->_state = [v13 unsignedIntegerValue];

    v14 = [v8 objectForKeyedSubscript:@"entityType"];
    v9->_entityType = [v14 unsignedIntegerValue];

    v15 = [v8 objectForKeyedSubscript:@"displayType"];
    v9->_displayType = [v15 unsignedIntegerValue];

    v16 = [v8 objectForKeyedSubscript:@"score"];
    [v16 doubleValue];
    v9->_score = v17;

    uint64_t v18 = [v8 objectForKeyedSubscript:@"additionalInfo"];
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)v18;

    uint64_t v20 = [v8 objectForKeyedSubscript:@"creationDate"];
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v20;

    v22 = [v8 objectForKeyedSubscript:@"questionVersion"];
    v9->_questionVersion = [v22 shortValue];
  }
  return v9;
}

+ (id)stringForQuestionType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0x1D) {
    return @"PHQuestionTypeNone";
  }
  else {
    return off_1E5849090[(unsigned __int16)(a3 - 1)];
  }
}

+ (id)questionsWithValidEntitiesFromQuestions:(id)a3 photoLibrary:(id)a4
{
  uint64_t v302 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v192 = a4;
  v205 = [MEMORY[0x1E4F1CA60] dictionary];
  v197 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v207 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v208 = [MEMORY[0x1E4F1CA60] dictionary];
  v206 = [MEMORY[0x1E4F1CA60] dictionary];
  v195 = [MEMORY[0x1E4F1CA48] array];
  v193 = [MEMORY[0x1E4F1CA60] dictionary];
  v213 = [MEMORY[0x1E4F1CA48] array];
  long long v275 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  long long v278 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v275 objects:v301 count:16];
  v198 = v6;
  v194 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v276;
LABEL_3:
    uint64_t v11 = 0;
    while (2)
    {
      if (*(void *)v276 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v275 + 1) + 8 * v11);
      v13 = [v12 entityIdentifier];
      switch([v12 entityType])
      {
        case 0u:
          if ([v12 type] == 18)
          {
            v14 = [v197 objectForKeyedSubscript:v13];

            if (v14)
            {
              v15 = [v197 objectForKeyedSubscript:v13];
              [v15 addObject:v12];
            }
            else
            {
              v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
              [v197 setObject:v15 forKeyedSubscript:v13];
            }
            goto LABEL_34;
          }
          v27 = +[PHObject localIdentifierWithUUID:v13];
          v28 = [v205 objectForKeyedSubscript:v27];

          if (v28)
          {
            v29 = [v205 objectForKeyedSubscript:v27];
            [v29 addObject:v12];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
            [v205 setObject:v29 forKeyedSubscript:v27];
          }

          id v6 = v198;
          goto LABEL_35;
        case 1u:
          v15 = +[PHObject localIdentifierWithUUID:v13];
          double v17 = [v6 objectForKeyedSubscript:v15];

          if (v17)
          {
            uint64_t v18 = v6;
            goto LABEL_24;
          }
          v25 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
          v26 = v6;
          goto LABEL_32;
        case 2u:
          v19 = +[PHObject localIdentifierWithUUID:v13];
          uint64_t v20 = [v207 objectForKeyedSubscript:v19];

          if (v20)
          {
            v21 = [v207 objectForKeyedSubscript:v19];
            [v21 addObject:v12];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
            [v207 setObject:v21 forKeyedSubscript:v19];
          }

          objc_super v7 = v194;
          goto LABEL_35;
        case 3u:
          v15 = +[PHObject localIdentifierWithUUID:v13];
          v22 = [v7 objectForKeyedSubscript:v15];

          if (v22)
          {
            uint64_t v18 = v7;
            goto LABEL_24;
          }
          v25 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
          v26 = v7;
          goto LABEL_32;
        case 4u:
          v16 = v213;
          goto LABEL_18;
        case 5u:
          v16 = v195;
LABEL_18:
          [v16 addObject:v12];
          goto LABEL_35;
        case 6u:
          v15 = +[PHObject localIdentifierWithUUID:v13];
          v23 = v208;
          goto LABEL_22;
        case 7u:
          v15 = +[PHObject localIdentifierWithUUID:v13];
          v23 = v206;
          goto LABEL_22;
        case 8u:
          v15 = +[PHObject localIdentifierWithUUID:v13];
          v23 = v193;
LABEL_22:
          objc_super v24 = [v23 objectForKeyedSubscript:v15];

          if (v24)
          {
            uint64_t v18 = v23;
LABEL_24:
            v25 = [v18 objectForKeyedSubscript:v15];
            [v25 addObject:v12];
          }
          else
          {
            v25 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
            v26 = v23;
LABEL_32:
            [v26 setObject:v25 forKeyedSubscript:v15];
          }

LABEL_34:
LABEL_35:

          if (v9 != ++v11) {
            continue;
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v275 objects:v301 count:16];
          uint64_t v9 = v30;
          if (!v30) {
            goto LABEL_41;
          }
          goto LABEL_3;
        default:
          goto LABEL_35;
      }
    }
  }
LABEL_41:

  if ([v205 count])
  {
    v31 = [v192 librarySpecificFetchOptions];
    v300 = @"PHAssetPropertySetIdentifier";
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v300 count:1];
    [v31 setFetchPropertySets:v32];

    v33 = [v205 allKeys];
    v191 = v31;
    v34 = +[PHAsset fetchAssetsWithLocalIdentifiers:v33 options:v31];

    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v271 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    long long v274 = 0u;
    id v196 = v34;
    uint64_t v202 = [v196 countByEnumeratingWithState:&v271 objects:v299 count:16];
    if (v202)
    {
      uint64_t v200 = *(void *)v272;
      do
      {
        v37 = 0;
        do
        {
          if (*(void *)v272 != v200) {
            objc_enumerationMutation(v196);
          }
          v209 = v37;
          v38 = [*(id *)(*((void *)&v271 + 1) + 8 * (void)v37) localIdentifier];
          v39 = [v205 objectForKeyedSubscript:v38];

          long long v270 = 0u;
          long long v269 = 0u;
          long long v267 = 0u;
          long long v268 = 0u;
          id v40 = v39;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v267 objects:v298 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v268;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v268 != v43) {
                  objc_enumerationMutation(v40);
                }
                v45 = *(void **)(*((void *)&v267 + 1) + 8 * i);
                if ([v45 type] == 29)
                {
                  v46 = [v45 additionalInfo];
                  v47 = [v46 objectForKeyedSubscript:@"momentLocalIdentifiers"];

                  v48 = [v47 allObjects];
                  [v35 addObjectsFromArray:v48];

                  [v36 addObject:v45];
                }
                else
                {
                  [v213 addObject:v45];
                }
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v267 objects:v298 count:16];
            }
            while (v42);
          }

          v37 = v209 + 1;
        }
        while (v209 + 1 != (char *)v202);
        uint64_t v202 = [v196 countByEnumeratingWithState:&v271 objects:v299 count:16];
      }
      while (v202);
    }

    if ([v35 count])
    {
      v203 = [v192 librarySpecificFetchOptions];
      v49 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHMoment, "fetchAssetCollectionsWithLocalIdentifiers:options:", v35);
      id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v263 = 0u;
      long long v264 = 0u;
      long long v265 = 0u;
      long long v266 = 0u;
      id v51 = v49;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v263 objects:v297 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v264;
        do
        {
          for (uint64_t j = 0; j != v53; ++j)
          {
            if (*(void *)v264 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = [*(id *)(*((void *)&v263 + 1) + 8 * j) localIdentifier];
            [v50 addObject:v56];
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v263 objects:v297 count:16];
        }
        while (v53);
      }
      v201 = v51;

      long long v261 = 0u;
      long long v262 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      id v210 = v36;
      uint64_t v57 = [v210 countByEnumeratingWithState:&v259 objects:v296 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v260;
        do
        {
          for (uint64_t k = 0; k != v58; ++k)
          {
            if (*(void *)v260 != v59) {
              objc_enumerationMutation(v210);
            }
            v61 = *(void **)(*((void *)&v259 + 1) + 8 * k);
            v62 = [v61 additionalInfo];
            v63 = [v62 objectForKeyedSubscript:@"momentLocalIdentifiers"];

            if ([v63 isSubsetOfSet:v50]) {
              [v213 addObject:v61];
            }
          }
          uint64_t v58 = [v210 countByEnumeratingWithState:&v259 objects:v296 count:16];
        }
        while (v58);
      }
    }
    id v6 = v198;
    objc_super v7 = v194;
  }
  v64 = v208;
  if ([v197 count])
  {
    id v258 = 0;
    v65 = +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:3 error:&v258];
    id v66 = v258;
    v67 = v66;
    if (v65)
    {
      id v211 = v66;
      v68 = [v65 librarySpecificFetchOptions];
      v295[0] = @"PHAssetPropertySetSceneAnalysis";
      v295[1] = @"PHAssetPropertySetMediaAnalysis";
      v295[2] = @"PHAssetPropertySetCuration";
      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v295 count:3];
      [v68 setFetchPropertySets:v69];

      [v68 setIncludeGuestAssets:1];
      v70 = [v197 allKeys];
      v71 = +[PHAsset fetchAssetsWithSyndicationIdentifiers:v70 options:v68];

      long long v256 = 0u;
      long long v257 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      id v72 = v71;
      uint64_t v73 = [v72 countByEnumeratingWithState:&v254 objects:v294 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v255;
        do
        {
          for (uint64_t m = 0; m != v74; ++m)
          {
            if (*(void *)v255 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*((void *)&v254 + 1) + 8 * m);
            v78 = [v77 curationProperties];
            v79 = [v78 syndicationIdentifier];
            v80 = [v197 objectForKeyedSubscript:v79];

            uint64_t v81 = [v77 syndicationEligibility];
            if ([v80 count]) {
              BOOL v82 = v81 == -6;
            }
            else {
              BOOL v82 = 1;
            }
            if (!v82 && v81 != -5) {
              [v213 addObjectsFromArray:v80];
            }

            id v6 = v198;
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v254 objects:v294 count:16];
        }
        while (v74);
      }

      objc_super v7 = v194;
      v64 = v208;
      v67 = v211;
    }
    else
    {
      v68 = PLBackendGetLog();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v293 = v67;
        _os_log_impl(&dword_19B043000, v68, OS_LOG_TYPE_ERROR, "PHQuestion: Failed to open syndicated library: %@", buf, 0xCu);
      }
    }
  }
  v84 = v207;
  if ([v6 count])
  {
    v85 = [v192 librarySpecificFetchOptions];
    [v85 setIncludedDetectionTypes:&unk_1EEB26E38];
    v86 = [v6 allKeys];
    v87 = +[PHPerson fetchPersonsWithLocalIdentifiers:v86 options:v85];

    long long v252 = 0u;
    long long v253 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    id v88 = v87;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v250 objects:v291 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v251;
      do
      {
        for (uint64_t n = 0; n != v90; ++n)
        {
          if (*(void *)v251 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = [*(id *)(*((void *)&v250 + 1) + 8 * n) localIdentifier];
          v94 = [v6 objectForKeyedSubscript:v93];

          if ([v94 count]) {
            [v213 addObjectsFromArray:v94];
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v250 objects:v291 count:16];
      }
      while (v90);
    }

    v64 = v208;
  }
  if ([v195 count])
  {
    v95 = [v192 librarySpecificFetchOptions];
    [v95 setPersonContext:1];
    v290 = @"PHPersonPropertySetIdentifier";
    v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v290 count:1];
    [v95 setFetchPropertySets:v96];

    id v212 = v95;
    v97 = +[PHPerson fetchPersonsWithOptions:v95];
    v98 = [MEMORY[0x1E4F1CA80] set];
    long long v246 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    long long v249 = 0u;
    id v99 = v97;
    uint64_t v100 = [v99 countByEnumeratingWithState:&v246 objects:v289 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v247;
      do
      {
        for (iuint64_t i = 0; ii != v101; ++ii)
        {
          if (*(void *)v247 != v102) {
            objc_enumerationMutation(v99);
          }
          v104 = *(void **)(*((void *)&v246 + 1) + 8 * ii);
          v105 = [v104 uuid];
          uint64_t v106 = [v105 length];

          if (v106)
          {
            v107 = [v104 uuid];
            [v98 addObject:v107];
          }
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v246 objects:v289 count:16];
      }
      while (v101);
    }
    v204 = v99;

    long long v244 = 0u;
    long long v245 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    id v108 = v195;
    uint64_t v109 = [v108 countByEnumeratingWithState:&v242 objects:v288 count:16];
    if (v109)
    {
      uint64_t v110 = v109;
      uint64_t v111 = *(void *)v243;
      do
      {
        for (juint64_t j = 0; jj != v110; ++jj)
        {
          if (*(void *)v243 != v111) {
            objc_enumerationMutation(v108);
          }
          v113 = *(void **)(*((void *)&v242 + 1) + 8 * jj);
          v114 = [v113 additionalInfo];
          v115 = [v114 objectForKeyedSubscript:@"personUUIDs"];

          v116 = [MEMORY[0x1E4F1CA80] setWithArray:v115];
          [v116 intersectSet:v98];
          uint64_t v117 = [v116 count];
          if (v117 == [v115 count]) {
            [v213 addObject:v113];
          }

          v84 = v207;
        }
        uint64_t v110 = [v108 countByEnumeratingWithState:&v242 objects:v288 count:16];
      }
      while (v110);
    }

    id v6 = v198;
    v64 = v208;
    objc_super v7 = v194;
  }
  if ([v84 count])
  {
    v118 = [v192 librarySpecificFetchOptions];
    v119 = [v84 allKeys];
    v120 = +[PHAssetCollection fetchAssetCollectionsWithType:4 localIdentifiers:v119 options:v118];

    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    id v121 = v120;
    uint64_t v122 = [v121 countByEnumeratingWithState:&v238 objects:v287 count:16];
    if (v122)
    {
      uint64_t v123 = v122;
      uint64_t v124 = *(void *)v239;
      do
      {
        for (kuint64_t k = 0; kk != v123; ++kk)
        {
          if (*(void *)v239 != v124) {
            objc_enumerationMutation(v121);
          }
          v126 = [*(id *)(*((void *)&v238 + 1) + 8 * kk) localIdentifier];
          v127 = [v84 objectForKeyedSubscript:v126];

          if ([v127 count]) {
            [v213 addObjectsFromArray:v127];
          }
        }
        uint64_t v123 = [v121 countByEnumeratingWithState:&v238 objects:v287 count:16];
      }
      while (v123);
    }

    v64 = v208;
  }
  if ([v7 count])
  {
    v128 = [v192 librarySpecificFetchOptions];
    v286 = @"PHAssetPropertySetIdentifier";
    v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v286 count:1];
    [v128 setFetchPropertySets:v129];

    v130 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    long long v237 = 0u;
    id v131 = v7;
    uint64_t v132 = [v131 countByEnumeratingWithState:&v234 objects:v285 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v235;
      do
      {
        for (muint64_t m = 0; mm != v133; ++mm)
        {
          if (*(void *)v235 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v234 + 1) + 8 * mm)];
          if (v136) {
            [v130 addObject:v136];
          }
        }
        uint64_t v133 = [v131 countByEnumeratingWithState:&v234 objects:v285 count:16];
      }
      while (v133);
    }

    v137 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingAssets.type = %d && uuid in %@", 5, v130];
    [v128 setInternalPredicate:v137];

    +[PHAsset fetchAssetsWithOptions:v128];
    long long v230 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    long long v233 = 0u;
    id v138 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v139 = [v138 countByEnumeratingWithState:&v230 objects:v284 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      uint64_t v141 = *(void *)v231;
      do
      {
        for (nuint64_t n = 0; nn != v140; ++nn)
        {
          if (*(void *)v231 != v141) {
            objc_enumerationMutation(v138);
          }
          v143 = [*(id *)(*((void *)&v230 + 1) + 8 * nn) localIdentifier];
          v144 = [v131 objectForKeyedSubscript:v143];

          if ([v144 count]) {
            [v213 addObjectsFromArray:v144];
          }
        }
        uint64_t v140 = [v138 countByEnumeratingWithState:&v230 objects:v284 count:16];
      }
      while (v140);
    }

    id v6 = v198;
    objc_super v7 = v194;
    v64 = v208;
  }
  if ([v64 count])
  {
    v145 = [v192 librarySpecificFetchOptions];
    v146 = [v208 allKeys];
    v147 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v146 options:v145];

    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id v148 = v147;
    uint64_t v149 = [v148 countByEnumeratingWithState:&v226 objects:v283 count:16];
    if (v149)
    {
      uint64_t v150 = v149;
      uint64_t v151 = *(void *)v227;
      do
      {
        for (uint64_t i1 = 0; i1 != v150; ++i1)
        {
          if (*(void *)v227 != v151) {
            objc_enumerationMutation(v148);
          }
          v153 = *(void **)(*((void *)&v226 + 1) + 8 * i1);
          v154 = [v153 localIdentifier];
          v155 = [v208 objectForKeyedSubscript:v154];

          if ([v153 approximateCount] && objc_msgSend(v155, "count")) {
            [v213 addObjectsFromArray:v155];
          }
        }
        uint64_t v150 = [v148 countByEnumeratingWithState:&v226 objects:v283 count:16];
      }
      while (v150);
    }

    id v6 = v198;
  }
  if ([v206 count])
  {
    v156 = [v192 librarySpecificFetchOptions];
    v157 = [v206 allKeys];
    v158 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v157 options:v156];

    long long v224 = 0u;
    long long v225 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    id v159 = v158;
    uint64_t v160 = [v159 countByEnumeratingWithState:&v222 objects:v282 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v223;
      do
      {
        for (uint64_t i2 = 0; i2 != v161; ++i2)
        {
          if (*(void *)v223 != v162) {
            objc_enumerationMutation(v159);
          }
          v164 = [*(id *)(*((void *)&v222 + 1) + 8 * i2) localIdentifier];
          v165 = [v206 objectForKeyedSubscript:v164];

          if ([v165 count]) {
            [v213 addObjectsFromArray:v165];
          }
        }
        uint64_t v161 = [v159 countByEnumeratingWithState:&v222 objects:v282 count:16];
      }
      while (v161);
    }
  }
  v166 = v193;
  if ([v193 count])
  {
    v167 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v193, "count"));
    long long v218 = 0u;
    long long v219 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    id v168 = v193;
    uint64_t v169 = [v168 countByEnumeratingWithState:&v218 objects:v281 count:16];
    if (v169)
    {
      uint64_t v170 = v169;
      uint64_t v171 = *(void *)v219;
      do
      {
        for (uint64_t i3 = 0; i3 != v170; ++i3)
        {
          if (*(void *)v219 != v171) {
            objc_enumerationMutation(v168);
          }
          v173 = +[PHObject uuidFromLocalIdentifier:*(void *)(*((void *)&v218 + 1) + 8 * i3)];
          if (v173) {
            [v167 addObject:v173];
          }
        }
        uint64_t v170 = [v168 countByEnumeratingWithState:&v218 objects:v281 count:16];
      }
      while (v170);
    }

    v174 = [v192 librarySpecificFetchOptions];
    v280 = @"PHAssetPropertySetIdentifier";
    v175 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v280 count:1];
    [v174 setFetchPropertySets:v175];

    v176 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingAssets.kind = %d && uuid in %@", 0, v167];
    [v174 setInternalPredicate:v176];

    +[PHAsset fetchAssetsWithOptions:v174];
    long long v214 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    id v177 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v178 = [v177 countByEnumeratingWithState:&v214 objects:v279 count:16];
    if (v178)
    {
      uint64_t v179 = v178;
      uint64_t v180 = *(void *)v215;
      do
      {
        for (uint64_t i4 = 0; i4 != v179; ++i4)
        {
          if (*(void *)v215 != v180) {
            objc_enumerationMutation(v177);
          }
          v182 = [*(id *)(*((void *)&v214 + 1) + 8 * i4) localIdentifier];
          v183 = [v168 objectForKeyedSubscript:v182];

          if ([v183 count]) {
            [v213 addObjectsFromArray:v183];
          }
        }
        uint64_t v179 = [v177 countByEnumeratingWithState:&v214 objects:v279 count:16];
      }
      while (v179);
    }

    id v6 = v198;
    v166 = v193;
  }
  v184 = [PHManualFetchResult alloc];
  v185 = [obj photoLibrary];
  v186 = [obj fetchType];
  v187 = [obj fetchPropertySets];
  v188 = [(PHManualFetchResult *)v184 initWithObjects:v213 photoLibrary:v185 fetchType:v186 fetchPropertySets:v187 identifier:0 registerIfNeeded:0];

  v189 = v188;
  return v189;
}

+ (id)fetchInvalidatedQuestionsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_85_49837];
}

id __51__PHQuestion_fetchInvalidatedQuestionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForQuestionsWithState:4 options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchUnansweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_83];
  if (v4)
  {
    uint64_t v8 = [v6 photoLibrary];
    uint64_t v9 = [a1 questionsWithValidEntitiesFromQuestions:v7 photoLibrary:v8];

    objc_super v7 = (void *)v9;
  }

  return v7;
}

id __69__PHQuestion_fetchUnansweredQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForQuestionsWithState:0 options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAnsweredQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_81_49840];
  if (v4)
  {
    uint64_t v8 = [v6 photoLibrary];
    uint64_t v9 = [a1 questionsWithValidEntitiesFromQuestions:v7 photoLibrary:v8];

    objc_super v7 = (void *)v9;
  }

  return v7;
}

id __67__PHQuestion_fetchAnsweredQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAnsweredQuestionsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAnsweredYesOrNoQuestionsWithOptions:(id)a3 validQuestionsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:&__block_literal_global_79];
  if (v4)
  {
    uint64_t v8 = [v6 photoLibrary];
    uint64_t v9 = [a1 questionsWithValidEntitiesFromQuestions:v7 photoLibrary:v8];

    objc_super v7 = (void *)v9;
  }

  return v7;
}

id __74__PHQuestion_fetchAnsweredYesOrNoQuestionsWithOptions_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForAnsweredYesOrNoQuestionsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchQuestionsWithLocalIdentifiers:(id)a3 options:(id)a4 validQuestionsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PHQuestion_fetchQuestionsWithLocalIdentifiers_options_validQuestionsOnly___block_invoke;
  v15[3] = &unk_1E5849048;
  id v16 = v8;
  id v10 = v8;
  uint64_t v11 = +[PHObject authorizationAwareFetchResultWithOptions:v9 fetchBlock:v15];
  if (v5)
  {
    v12 = [v9 photoLibrary];
    uint64_t v13 = [a1 questionsWithValidEntitiesFromQuestions:v11 photoLibrary:v12];

    uint64_t v11 = (void *)v13;
  }

  return v11;
}

id __76__PHQuestion_fetchQuestionsWithLocalIdentifiers_options_validQuestionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForQuestionsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAnsweredQuestionCountsWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [a1 fetchAnsweredQuestionsWithOptions:v4 validQuestionsOnly:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[PHQuestion stringForQuestionType:](PHQuestion, "stringForQuestionType:", [*(id *)(*((void *)&v17 + 1) + 8 * i) type]);
        v12 = [v5 objectForKeyedSubscript:v11];

        if (v12)
        {
          uint64_t v13 = NSNumber;
          v14 = [v5 objectForKeyedSubscript:v11];
          v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          [v5 setObject:v15 forKeyedSubscript:v11];
        }
        else
        {
          [v5 setObject:&unk_1EEB26778 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)identifierCode
{
  return @"200";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHQuestion";
  return @"PHQuestion";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  pl_dispatch_once();
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15_49862;

  return v3;
}

void __40__PHQuestion_propertiesToFetchWithHint___block_invoke()
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"entityIdentifier";
  v4[3] = @"type";
  v4[4] = @"state";
  v4[5] = @"entityType";
  v4[6] = @"displayType";
  v4[7] = @"score";
  v4[8] = @"additionalInfo";
  v4[9] = @"creationDate";
  void v4[10] = @"questionVersion";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  uint64_t v2 = [v1 copy];
  v3 = (void *)propertiesToFetchWithHint__pl_once_object_15_49862;
  propertiesToFetchWithHint__pl_once_object_15_49862 = v2;
}

@end