@interface ATXScoreInterpreterFromAssetBuilder
+ (id)assetFilenameForSubType:(unsigned __int8)a3;
+ (id)interpreterFromAssetFilename:(id)a3;
+ (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3;
+ (id)scoreInterpretersForAllSubTypes;
@end

@implementation ATXScoreInterpreterFromAssetBuilder

+ (id)assetFilenameForSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  v5 = [v4 getAssetFileAndSubscoreForConsumerSubType:v3];
  v6 = [v5 first];

  return v6;
}

+ (id)interpreterFromAssetFilename:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F4AF10]);
  v7 = [MEMORY[0x1E4F4AE28] abGroupOverride];
  v8 = (void *)[v6 initWithAssetsForResource:v5 ofType:@"plplist" specifiedABGroup:v7];

  v9 = [v8 abGroupContents];
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"ATXScoreInterpreterFromAssetBuilder.m", 35, @"Nil asset contents (missing prediction model file?): '%@'", v5 object file lineNumber description];
  }
  v10 = [v9 objectForKeyedSubscript:@"Scorer"];
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"ATXScoreInterpreterFromAssetBuilder.m", 37, @"Could not retrieve _ATXAppPredictor information from asset dictionary in '%@'", v5 object file lineNumber description];
  }
  v11 = [[_ATXScoreInterpreter alloc] initWithParseRoot:v10];

  return v11;
}

+ (id)scoreInterpreterForConsumerSubType:(unsigned __int8)a3
{
  v4 = [a1 assetFilenameForSubType:a3];
  id v5 = [a1 interpreterFromAssetFilename:v4];

  return v5;
}

+ (id)scoreInterpretersForAllSubTypes
{
  uint64_t v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1E4F4B680];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke;
  v25[3] = &unk_1E68B5770;
  id v5 = v3;
  id v26 = v5;
  id v27 = a1;
  [v4 iterConsumerSubTypesWithBlock:v25];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v7 = [v5 allValues];
  v8 = (void *)[v6 initWithArray:v7];

  v9 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_2;
  v22[3] = &unk_1E68B5798;
  id v10 = v9;
  id v23 = v10;
  id v24 = a1;
  [v8 enumerateObjectsUsingBlock:v22];
  v11 = objc_opt_new();
  v12 = (void *)MEMORY[0x1E4F4B680];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_3;
  v18[3] = &unk_1E68B57C0;
  id v19 = v5;
  id v20 = v10;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v5;
  [v12 iterConsumerSubTypesWithBlock:v18];
  v16 = (void *)[v13 copy];

  return v16;
}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 40) assetFilenameForSubType:a2];
  v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedChar:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 interpreterFromAssetFilename:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

void __70__ATXScoreInterpreterFromAssetBuilder_scoreInterpretersForAllSubTypes__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedChar:a2];
  id v6 = [v3 objectForKeyedSubscript:v4];

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
  [*(id *)(a1 + 48) addObject:v5];
}

@end