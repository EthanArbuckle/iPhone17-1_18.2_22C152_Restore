@interface WFPHAssetCollectionPredicate
- (PHAssetCollection)assetCollection;
- (id)initForAssetsInCollection:(id)a3;
- (id)wf_photoLibraryFilteringPredicate;
@end

@implementation WFPHAssetCollectionPredicate

- (void).cxx_destruct
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)wf_photoLibraryFilteringPredicate
{
  v3 = (void *)MEMORY[0x263F087F0];
  v4 = [(WFPHAssetCollectionPredicate *)self rightExpression];
  v5 = [v4 expressionValueWithObject:0 context:0];
  v6 = [v3 expressionForConstantValue:v5];

  v7 = (void *)MEMORY[0x263F08720];
  v8 = [(WFPHAssetCollectionPredicate *)self leftExpression];
  v9 = objc_msgSend(v7, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v8, v6, -[WFPHAssetCollectionPredicate comparisonPredicateModifier](self, "comparisonPredicateModifier"), -[WFPHAssetCollectionPredicate predicateOperatorType](self, "predicateOperatorType"), -[WFPHAssetCollectionPredicate options](self, "options"));

  return v9;
}

- (id)initForAssetsInCollection:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F087F0] expressionForKeyPath:@"localIdentifier"];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__11102;
  v18[4] = __Block_byref_object_dispose__11103;
  id v19 = 0;
  v7 = (void *)MEMORY[0x263F087F0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__WFPHAssetCollectionPredicate_initForAssetsInCollection___block_invoke;
  v15[3] = &unk_264287E08;
  v17 = v18;
  id v8 = v5;
  id v16 = v8;
  v9 = [v7 expressionForBlock:v15 arguments:0];
  v14.receiver = self;
  v14.super_class = (Class)WFPHAssetCollectionPredicate;
  v10 = [(WFPHAssetCollectionPredicate *)&v14 initWithLeftExpression:v6 rightExpression:v9 modifier:0 type:10 options:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    v12 = v11;
  }

  _Block_object_dispose(v18, 8);
  return v11;
}

id __58__WFPHAssetCollectionPredicate_initForAssetsInCollection___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v10)
  {
LABEL_13:
    id v26 = v10;
    goto LABEL_14;
  }
  v11 = getWFPhotoLibraryFilteringLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [*(id *)(a1 + 32) wfName];
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFPHAssetCollectionPredicate initForAssetsInCollection:]_block_invoke";
    __int16 v38 = 2112;
    v39 = v12;
    _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_INFO, "%s Performing non-optimized photo identifier lookup for album %@", buf, 0x16u);
  }
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  id v16 = +[WFSharedPhotoLibrary sharedLibrary];
  id v34 = 0;
  v17 = [v16 fetchOptionsWithError:&v34];
  id v18 = v34;

  if (v17)
  {
    v28 = v18;
    id v29 = v7;
    [v17 setWantsIncrementalChangeDetails:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = [getPHAssetClass_11110() fetchAssetsInAssetCollection:*(void *)(a1 + 32) options:v17];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v25 = [*(id *)(*((void *)&v30 + 1) + 8 * i) localIdentifier];
          [v24 addObject:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v29;
    goto LABEL_13;
  }

  id v26 = 0;
LABEL_14:

  return v26;
}

@end