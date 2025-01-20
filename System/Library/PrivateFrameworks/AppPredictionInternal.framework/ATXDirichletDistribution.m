@interface ATXDirichletDistribution
+ (double)getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:(double)a3 andNormalizationConstant:(double)a4;
+ (id)sharedInstance;
- (ATXDirichletDistribution)init;
- (id)getBlendedLocalAndGlobalScoresWithLocalCounts:(id)a3 andGlobalScores:(id)a4 withSamplingEnabled:(BOOL)a5;
- (id)sampleProbabilitiesFromDirichletWithNormalizedParameters:(id)a3 andNormalizationConstant:(double)a4;
@end

@implementation ATXDirichletDistribution

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_1, &__block_literal_global_88);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_15;
  return v2;
}

void __42__ATXDirichletDistribution_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_15;
  sharedInstance__pasExprOnceResult_15 = v1;
}

- (ATXDirichletDistribution)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDirichletDistribution;
  v2 = [(ATXDirichletDistribution *)&v7 init];
  if (v2)
  {
    v3 = +[_ATXGlobals sharedInstance];
    [v3 appPredictionGlobalScoreMultiplierPerApp];
    v2->kGlobalScoreMultiplier = v4;
    [v3 appPredictionBlendedScoreNormalizationConstant];
    v2->kBlendedScoreNormalizationConstant = v5;
  }
  return v2;
}

- (id)sampleProbabilitiesFromDirichletWithNormalizedParameters:(id)a3 andNormalizationConstant:(double)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  objc_super v7 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __110__ATXDirichletDistribution_sampleProbabilitiesFromDirichletWithNormalizedParameters_andNormalizationConstant___block_invoke;
  v14 = &unk_1E68B0158;
  double v16 = a4;
  id v15 = v7;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];

  v9 = +[ATXGlobalAppScoresUtil normalizeValues:](ATXGlobalAppScoresUtil, "normalizeValues:", v8, v11, v12, v13, v14);

  return v9;
}

void __110__ATXDirichletDistribution_sampleProbabilitiesFromDirichletWithNormalizedParameters_andNormalizationConstant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  +[ATXDirichletDistribution getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:andNormalizationConstant:](ATXDirichletDistribution, "getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:andNormalizationConstant:");
  objc_msgSend(NSNumber, "numberWithDouble:", fmax(ATXSampleFromGammaDistribution(v6, 1.0), 0.0));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

+ (double)getGammaDistributionShapeParameterForComputingGlobalAppScoresWithAlpha:(double)a3 andNormalizationConstant:(double)a4
{
  return fmax(a3 * a4, 2.0);
}

- (id)getBlendedLocalAndGlobalScoresWithLocalCounts:(id)a3 andGlobalScores:(id)a4 withSamplingEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (v5)
  {
    uint64_t v11 = [(ATXDirichletDistribution *)self sampleProbabilitiesFromDirichletWithNormalizedParameters:v9 andNormalizationConstant:self->kBlendedScoreNormalizationConstant];

    id v9 = (id)v11;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__ATXDirichletDistribution_getBlendedLocalAndGlobalScoresWithLocalCounts_andGlobalScores_withSamplingEnabled___block_invoke;
  v16[3] = &unk_1E68B0180;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];
  v14 = +[ATXGlobalAppScoresUtil normalizeValues:v12];

  return v14;
}

void __110__ATXDirichletDistribution_getBlendedLocalAndGlobalScoresWithLocalCounts_andGlobalScores_withSamplingEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v9 = (void *)v8;
  v10 = &unk_1F27F0D80;
  if (v8) {
    v10 = (void *)v8;
  }
  id v11 = v10;

  [v6 doubleValue];
  double v13 = v12;

  double v14 = *(double *)(*(void *)(a1 + 40) + 8);
  [v11 doubleValue];
  double v16 = v15;

  id v17 = [NSNumber numberWithDouble:v13 + v14 * v16];
  [*(id *)(a1 + 48) setObject:v17 forKeyedSubscript:v7];
}

@end