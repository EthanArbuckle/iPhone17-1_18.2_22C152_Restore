@interface SGMISaliencyModelConfig
+ (id)defaultConfig;
+ (id)groundTruthVersion;
+ (id)inferenceVersion;
+ (id)rulesFromFeatures:(id)a3 lowerBounds:(id)a4 upperBounds:(id)a5 outputs:(id)a6;
- (NSArray)featureNames;
- (NSArray)groundTruthEstimatorFeatures;
- (NSArray)groundTruthEstimatorRules;
- (NSArray)mean;
- (NSArray)saliencyOverrideRules;
- (NSArray)std;
- (NSNumber)threshold;
- (SGMISaliencyModelConfig)initWithSaliencyOverrideRules:(id)a3 featureNames:(id)a4 mean:(id)a5 std:(id)a6 groundTruthEstimatorRules:(id)a7 threshold:(id)a8 minCountToConsiderATokenAsHighlyDiscriminant:(id)a9 ratioToConsiderATokenAsHighlyDiscriminant:(id)a10 minCountToConsiderATokenAsExtremelyDiscriminant:(id)a11 ratioToConsiderATokenAsExtremelyDiscriminant:(id)a12;
- (double)ratioToConsiderATokenAsExtremelyDiscriminant;
- (double)ratioToConsiderATokenAsHighlyDiscriminant;
- (unint64_t)minCountToConsiderATokenAsExtremelyDiscriminant;
- (unint64_t)minCountToConsiderATokenAsHighlyDiscriminant;
@end

@implementation SGMISaliencyModelConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_groundTruthEstimatorFeatures, 0);
  objc_storeStrong((id *)&self->_groundTruthEstimatorRules, 0);
  objc_storeStrong((id *)&self->_std, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_saliencyOverrideRules, 0);
}

- (double)ratioToConsiderATokenAsExtremelyDiscriminant
{
  return self->_ratioToConsiderATokenAsExtremelyDiscriminant;
}

- (unint64_t)minCountToConsiderATokenAsExtremelyDiscriminant
{
  return self->_minCountToConsiderATokenAsExtremelyDiscriminant;
}

- (double)ratioToConsiderATokenAsHighlyDiscriminant
{
  return self->_ratioToConsiderATokenAsHighlyDiscriminant;
}

- (unint64_t)minCountToConsiderATokenAsHighlyDiscriminant
{
  return self->_minCountToConsiderATokenAsHighlyDiscriminant;
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)groundTruthEstimatorFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)groundTruthEstimatorRules
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)std
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)mean
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)featureNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)saliencyOverrideRules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (SGMISaliencyModelConfig)initWithSaliencyOverrideRules:(id)a3 featureNames:(id)a4 mean:(id)a5 std:(id)a6 groundTruthEstimatorRules:(id)a7 threshold:(id)a8 minCountToConsiderATokenAsHighlyDiscriminant:(id)a9 ratioToConsiderATokenAsHighlyDiscriminant:(id)a10 minCountToConsiderATokenAsExtremelyDiscriminant:(id)a11 ratioToConsiderATokenAsExtremelyDiscriminant:(id)a12
{
  id v35 = a3;
  id v34 = a4;
  id obj = a5;
  id v33 = a5;
  id v32 = a6;
  id v36 = a7;
  id v31 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)SGMISaliencyModelConfig;
  v22 = [(SGMISaliencyModelConfig *)&v37 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_saliencyOverrideRules, a3);
    objc_storeStrong((id *)&v23->_featureNames, a4);
    objc_storeStrong((id *)&v23->_mean, obj);
    objc_storeStrong((id *)&v23->_std, a6);
    objc_storeStrong((id *)&v23->_groundTruthEstimatorRules, a7);
    uint64_t v24 = objc_msgSend(v36, "_pas_mappedArrayWithTransform:", &__block_literal_global_11782);
    groundTruthEstimatorFeatures = v23->_groundTruthEstimatorFeatures;
    v23->_groundTruthEstimatorFeatures = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_threshold, a8);
    v23->_minCountToConsiderATokenAsHighlyDiscriminant = [v18 unsignedIntegerValue];
    [v19 doubleValue];
    v23->_ratioToConsiderATokenAsHighlyDiscriminant = v26;
    v23->_minCountToConsiderATokenAsExtremelyDiscriminant = [v20 unsignedIntegerValue];
    [v21 doubleValue];
    v23->_ratioToConsiderATokenAsExtremelyDiscriminant = v27;
  }

  return v23;
}

uint64_t __295__SGMISaliencyModelConfig_initWithSaliencyOverrideRules_featureNames_mean_std_groundTruthEstimatorRules_threshold_minCountToConsiderATokenAsHighlyDiscriminant_ratioToConsiderATokenAsHighlyDiscriminant_minCountToConsiderATokenAsExtremelyDiscriminant_ratioToConsiderATokenAsExtremelyDiscriminant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureName];
}

+ (id)inferenceVersion
{
  v2 = +[SGMITrialClientWrapper sharedInstance];
  v3 = [v2 modelInferenceVersion];

  return v3;
}

+ (id)groundTruthVersion
{
  v2 = +[SGMITrialClientWrapper sharedInstance];
  v3 = [v2 modelGroundTruthVersion];

  return v3;
}

+ (id)defaultConfig
{
  v3 = +[SGMITrialClientWrapper sharedInstance];
  v4 = [v3 saliencyOverrideFeatureNames];
  v5 = [v3 saliencyOverrideFeatureLowerBounds];
  v6 = [v3 saliencyOverrideFeatureUpperBounds];
  v7 = [v3 saliencyOverrideOutputs];
  v8 = [a1 rulesFromFeatures:v4 lowerBounds:v5 upperBounds:v6 outputs:v7];

  if (v8)
  {
    v9 = [v3 modelFeatureNames];
    v10 = sgMap();

    v11 = [v3 modelFeatureStandardizationMeans];
    if (!v11)
    {
      v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v12, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, mean for feature standardization is nil.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_44;
    }
    v12 = [v3 modelFeatureStandardizationStandardDeviations];
    if (!v12)
    {
      v17 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, mean for feature standardization is nil.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_43;
    }
    v13 = [v3 modelGroundTruthFeatureNames];
    v14 = [v3 modelGroundTruthFeatureLowerBounds];
    v15 = [v3 modelGroundTruthFeatureUpperBounds];
    v16 = [v3 modelGroundTruthOutputs];
    v17 = [a1 rulesFromFeatures:v13 lowerBounds:v14 upperBounds:v15 outputs:v16];

    if (!v17)
    {
      id v18 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v18, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error in processing ground truth estimation rules.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_42;
    }
    id v18 = [v3 classificationThreshold];
    if (!v18)
    {
      id v19 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, classification threshold is nil.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_41;
    }
    id v19 = [v3 minCountToConsiderATokenAsHighlyDiscriminant];
    if (!v19)
    {
      id v21 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v21, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, minCountToConsiderATokenAsHighlyDiscriminant is nil.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_40;
    }
    uint64_t v20 = [v3 ratioToConsiderATokenAsHighlyDiscriminant];
    id v21 = v20;
    if (!v20)
    {
      double v27 = sgMailIntelligenceLogHandle();
      id v31 = v27;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v27, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, ratioToConsiderATokenAsHighlyDiscriminant is nil.", buf, 2u);
      }
      double v26 = 0;
      goto LABEL_39;
    }
    v30 = v20;
    uint64_t v22 = [v3 minCountToConsiderATokenAsExtremelyDiscriminant];
    id v31 = (void *)v22;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = [v3 ratioToConsiderATokenAsExtremelyDiscriminant];
      if (v24)
      {
        v25 = v24;
        double v26 = [[SGMISaliencyModelConfig alloc] initWithSaliencyOverrideRules:v8 featureNames:v10 mean:v11 std:v12 groundTruthEstimatorRules:v17 threshold:v18 minCountToConsiderATokenAsHighlyDiscriminant:v19 ratioToConsiderATokenAsHighlyDiscriminant:v30 minCountToConsiderATokenAsExtremelyDiscriminant:v23 ratioToConsiderATokenAsExtremelyDiscriminant:v24];
LABEL_38:

        id v21 = v30;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      v28 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v28, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, ratioToConsiderATokenAsExtremelyDiscriminant is nil.", buf, 2u);
      }

      v25 = 0;
    }
    else
    {
      v25 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v25, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error, minCountToConsiderATokenAsExtremelyDiscriminant is nil.", buf, 2u);
      }
    }
    double v26 = 0;
    goto LABEL_38;
  }
  v10 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA650000, v10, OS_LOG_TYPE_FAULT, "SGMISaliencyModelConfig: Error in processing outstanding saliency rules.", buf, 2u);
  }
  double v26 = 0;
LABEL_45:

  return v26;
}

id __40__SGMISaliencyModelConfig_defaultConfig__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[SGMIFeature prettyNamesReverseMapping];
  v4 = [v3 objectForKeyedSubscript:v2];

  return v4;
}

+ (id)rulesFromFeatures:(id)a3 lowerBounds:(id)a4 upperBounds:(id)a5 outputs:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (!v9)
  {
    v15 = sgMailIntelligenceLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; name array from Trial is nil.";
LABEL_23:
    _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, v29, buf, 2u);
    goto LABEL_24;
  }
  if (!v10)
  {
    v15 = sgMailIntelligenceLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; lower bounds array from Trial is nil.";
    goto LABEL_23;
  }
  if (!v11)
  {
    v15 = sgMailIntelligenceLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v29 = "SGMISaliencyModelConfig: Could not process rule set; upper bounds array from Trial is nil.";
    goto LABEL_23;
  }
  if (!v12)
  {
    v15 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "SGMISaliencyModelConfig: Could not process rule set; outputs array from Trial is nil.";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  uint64_t v14 = [v9 count];
  if (v14 != [v10 count] || v14 != objc_msgSend(v11, "count") || v14 != objc_msgSend(v13, "count"))
  {
    v15 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v29 = "SGMISaliencyModelConfig: Inconsistent array sizes in Trial asset.";
      goto LABEL_23;
    }
LABEL_24:
    v28 = 0;
    goto LABEL_25;
  }
  id v34 = v13;
  v15 = objc_opt_new();
  if (v14 < 1)
  {
LABEL_12:
    v15 = v15;
    v28 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = off_1E65B4000;
    uint64_t v32 = v14;
    id v33 = v11;
    while (1)
    {
      id v18 = objc_msgSend(v9, "objectAtIndex:", v16, v32);
      id v19 = [(__objc2_class *)v17[103] allFeaturePrettyNames];
      char v20 = [v19 containsObject:v18];

      if ((v20 & 1) == 0) {
        break;
      }
      id v21 = [SGMISaliencyModelConfigRule alloc];
      id v35 = [(__objc2_class *)v17[103] prettyNamesReverseMapping];
      uint64_t v22 = [v35 objectForKeyedSubscript:v18];
      uint64_t v23 = [v10 objectAtIndex:v16];
      uint64_t v24 = [v11 objectAtIndex:v16];
      [v34 objectAtIndex:v16];
      double v26 = v25 = v10;
      double v27 = [(SGMISaliencyModelConfigRule *)v21 initWithFeatureName:v22 strictLowerBound:v23 strictUpperBound:v24 output:v26];
      [v15 addObject:v27];

      id v10 = v25;
      id v11 = v33;

      v17 = off_1E65B4000;
      if (v32 == ++v16) {
        goto LABEL_12;
      }
    }
    id v31 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v37 = v18;
      _os_log_error_impl(&dword_1CA650000, v31, OS_LOG_TYPE_ERROR, "SGMISaliencyModelConfig: Unexpected feature %@", buf, 0xCu);
    }

    v28 = 0;
  }
  v13 = v34;
LABEL_25:

  return v28;
}

@end