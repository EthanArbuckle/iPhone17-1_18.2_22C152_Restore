@interface PHLibraryScopeRule
+ (BOOL)generateDefaultRulesForLibraryScope:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)_estimatedAssetsForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6;
+ (id)dataFromRules:(id)a3;
+ (id)fetchLibraryScopeRulesForLibraryScope:(id)a3 options:(id)a4;
+ (id)suggestedStartDateForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6;
+ (unint64_t)estimatedAssetCountForRules:(id)a3 autoSharePolicy:(signed __int16)a4 imageCount:(unint64_t *)a5 videoCount:(unint64_t *)a6 audioCount:(unint64_t *)a7 itemCount:(unint64_t *)a8 options:(id)a9 error:(id *)a10;
- (PHLibraryScopeRule)init;
- (PHLibraryScopeRule)initWithProxyObject:(id)a3;
- (PHLibraryScopeRule)initWithQuery:(id)a3;
- (PLLibraryScopeRule)plRepresentation;
- (PLLibraryScopeRule)proxyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateRangeCondition;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)personCondition;
- (id)unknownConditions;
- (void)addCondition:(id)a3;
- (void)removeConditionOfType:(Class)a3;
- (void)setProxyObject:(id)a3;
@end

@implementation PHLibraryScopeRule

- (void).cxx_destruct
{
}

- (void)setProxyObject:(id)a3
{
}

- (PLLibraryScopeRule)proxyObject
{
  return self->_proxyObject;
}

- (id)description
{
  return (id)[(PLLibraryScopeRule *)self->_proxyObject description];
}

- (id)unknownConditions
{
  v3 = [(PLLibraryScopeRule *)self->_proxyObject unknownConditions];
  if (v3)
  {
    v4 = [(PLLibraryScopeRule *)self->_proxyObject unknownConditions];
    v5 = objc_msgSend(v4, "_pl_map:", &__block_literal_global_30089);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

PHLibraryScopeConditionUnknown *__39__PHLibraryScopeRule_unknownConditions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PHLibraryScopeConditionUnknown alloc] initWithProxyObject:v2];

  return v3;
}

- (id)personCondition
{
  v3 = [(PLLibraryScopeRule *)self->_proxyObject personCondition];
  if (v3)
  {
    v4 = [PHLibraryScopeConditionPerson alloc];
    v5 = [(PLLibraryScopeRule *)self->_proxyObject personCondition];
    v6 = [(PHLibraryScopeCondition *)v4 initWithProxyObject:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dateRangeCondition
{
  v3 = [(PLLibraryScopeRule *)self->_proxyObject dateRangeCondition];
  if (v3)
  {
    v4 = [PHLibraryScopeConditionDateRange alloc];
    v5 = [(PLLibraryScopeRule *)self->_proxyObject dateRangeCondition];
    v6 = [(PHLibraryScopeCondition *)v4 initWithProxyObject:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PLLibraryScopeRule)plRepresentation
{
  return self->_proxyObject;
}

- (void)removeConditionOfType:(Class)a3
{
  if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3) {
    uint64_t v5 = objc_opt_class();
  }
  else {
    uint64_t v5 = 0;
  }
  proxyObject = self->_proxyObject;

  [(PLLibraryScopeRule *)proxyObject removeConditionOfType:v5];
}

- (void)addCondition:(id)a3
{
  proxyObject = self->_proxyObject;
  id v4 = [a3 proxyObject];
  [(PLLibraryScopeRule *)proxyObject addCondition:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)[(PLLibraryScopeRule *)self->_proxyObject copyWithZone:a3];
  v7 = (void *)[v5 initWithProxyObject:v6];

  return v7;
}

- (PHLibraryScopeRule)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8A8F8]);
  id v4 = [(PHLibraryScopeRule *)self initWithProxyObject:v3];

  return v4;
}

- (PHLibraryScopeRule)initWithQuery:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F8A8F8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithQuery:v5];

  v7 = [(PHLibraryScopeRule *)self initWithProxyObject:v6];
  return v7;
}

- (PHLibraryScopeRule)initWithProxyObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLibraryScopeRule;
  v6 = [(PHLibraryScopeRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_proxyObject, a3);
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxyObject;
}

+ (BOOL)generateDefaultRulesForLibraryScope:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v8 photoLibrary];
  v10 = [v9 photoAnalysisClient];

  v11 = [v8 localIdentifier];

  LOBYTE(a5) = [v10 requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:v11 withOptions:v7 error:a5];
  return (char)a5;
}

+ (id)_estimatedAssetsForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6
{
  int v8 = a4;
  v55[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (v8 == 1)
  {
    v11 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    if (v11)
    {
LABEL_3:
      v12 = [MEMORY[0x1E4F8A8D8] compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:v11];
      [v10 setShouldPrefetchCount:1];
      [v10 setInternalPredicate:v12];
      v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v50 = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      [v10 setSortDescriptors:v14];

      v15 = +[PHAsset fetchAssetsWithOptions:v10];
      goto LABEL_21;
    }
  }
  else
  {
    v11 = objc_msgSend(v9, "_pl_map:", &__block_literal_global_44);
    uint64_t v16 = [MEMORY[0x1E4F8A8F8] queryForLibraryScopeRules:v11];
    if (!v16)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v12 = [NSString stringWithFormat:@"estimatedAssetCountForRules: query is nil"];
      v55[0] = v12;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
      v41 = [v40 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v39];
      v42 = v41;
      if (a6) {
        *a6 = v41;
      }

      goto LABEL_20;
    }
    v17 = (void *)v16;
    v18 = [PHUserFeedbackCalculator alloc];
    v19 = [v10 photoLibrary];
    v20 = [(PHUserFeedbackCalculator *)v18 initWithPhotoLibrary:v19];

    v45 = v20;
    v21 = [(PHUserFeedbackCalculator *)v20 personUUIDsWithNegativeFeedback];
    if ([v21 count])
    {
      v44 = a6;
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A8]) initWithConjunction:0];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v47 != v26) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend(v22, "addPersonUUIDQuery:comparator:", *(void *)(*((void *)&v46 + 1) + 8 * i), 22, v44);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v53 count:16];
        }
        while (v25);
      }

      v28 = (void *)MEMORY[0x1E4F8B9A8];
      v29 = [v22 query];
      v30 = [v28 notQuery:v29];

      uint64_t v31 = [MEMORY[0x1E4F8B9A8] andCombineFirstQuery:v17 secondQuery:v30];

      v17 = (void *)v31;
      a6 = v44;
    }
    v32 = (void *)MEMORY[0x1E4F8AB08];
    v33 = objc_msgSend(v10, "photoLibrary", v44);
    v34 = [v33 photoLibrary];
    v35 = objc_opt_new();
    uint64_t v36 = [v32 predicateForQuery:v17 inLibrary:v34 changeDetectionCriteria:v35];

    v11 = (void *)v36;
    if (v36) {
      goto LABEL_3;
    }
  }
  v37 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v11 = [NSString stringWithFormat:@"estimatedAssetCountForRules: generated predate is nil"];
  v52 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v38 = [v37 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v12];
  v39 = v38;
  if (a6) {
    *a6 = v38;
  }
LABEL_20:

  v15 = 0;
LABEL_21:

  return v15;
}

uint64_t __77__PHLibraryScopeRule__estimatedAssetsForRules_autoSharePolicy_options_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 plRepresentation];
}

+ (unint64_t)estimatedAssetCountForRules:(id)a3 autoSharePolicy:(signed __int16)a4 imageCount:(unint64_t *)a5 videoCount:(unint64_t *)a6 audioCount:(unint64_t *)a7 itemCount:(unint64_t *)a8 options:(id)a9 error:(id *)a10
{
  v14 = [a1 _estimatedAssetsForRules:a3 autoSharePolicy:a4 options:a9 error:a10];
  v15 = v14;
  if (a5) {
    *a5 = [v14 countOfAssetsWithMediaType:1];
  }
  if (a6) {
    *a6 = [v15 countOfAssetsWithMediaType:2];
  }
  if (a7) {
    *a7 = [v15 countOfAssetsWithMediaType:3];
  }
  if (a8) {
    *a8 = [v15 countOfAssetsWithMediaType:0];
  }
  unint64_t v16 = [v15 count];

  return v16;
}

+ (id)suggestedStartDateForRules:(id)a3 autoSharePolicy:(signed __int16)a4 options:(id)a5 error:(id *)a6
{
  v6 = [a1 _estimatedAssetsForRules:a3 autoSharePolicy:a4 options:a5 error:a6];
  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    int v8 = [v7 creationDate];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (id)fetchLibraryScopeRulesForLibraryScope:(id)a3 options:(id)a4
{
  id v4 = [a3 rulesData];
  id v5 = [MEMORY[0x1E4F8A8F8] libraryScopeRulesForLibraryScopeRulesData:v4];
  v6 = objc_msgSend(v5, "_pl_map:", &__block_literal_global_40);

  return v6;
}

PHLibraryScopeRule *__68__PHLibraryScopeRule_fetchLibraryScopeRulesForLibraryScope_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PHLibraryScopeRule alloc] initWithProxyObject:v2];

  return v3;
}

+ (id)dataFromRules:(id)a3
{
  id v3 = objc_msgSend(a3, "_pl_map:", &__block_literal_global_37_30135);
  id v4 = [MEMORY[0x1E4F8A8F8] dataForLibraryScopeRules:v3];

  return v4;
}

uint64_t __36__PHLibraryScopeRule_dataFromRules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 plRepresentation];
}

@end