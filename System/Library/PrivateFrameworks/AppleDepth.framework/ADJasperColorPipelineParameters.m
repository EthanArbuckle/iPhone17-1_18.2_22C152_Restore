@interface ADJasperColorPipelineParameters
- (ADAggregationParameters)aggregationParameters;
- (ADConfidenceLevelRanges)confidenceLevelRanges;
- (ADJasperPointCloudFilterParameters)pointCloudFilter;
- (float)confidenceBucketingHighThreshold;
- (float)confidenceBucketingLowThreshold;
- (float)defaultAlphaForDepthWarping;
- (id)initForDevice:(id)a3;
- (unint64_t)confidenceUnits;
- (void)setAggregationParameters:(id)a3;
- (void)setConfidenceBucketingHighThreshold:(float)a3;
- (void)setConfidenceBucketingLowThreshold:(float)a3;
- (void)setConfidenceLevelRanges:(id)a3;
- (void)setConfidenceUnits:(unint64_t)a3;
- (void)setDefaultAlphaForDepthWarping:(float)a3;
- (void)setPointCloudFilter:(id)a3;
@end

@implementation ADJasperColorPipelineParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceLevelRanges, 0);
  objc_storeStrong((id *)&self->_aggregationParameters, 0);
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

- (void)setDefaultAlphaForDepthWarping:(float)a3
{
  self->_defaultAlphaForDepthWarping = a3;
}

- (float)defaultAlphaForDepthWarping
{
  return self->_defaultAlphaForDepthWarping;
}

- (void)setConfidenceLevelRanges:(id)a3
{
}

- (ADConfidenceLevelRanges)confidenceLevelRanges
{
  return self->_confidenceLevelRanges;
}

- (void)setConfidenceBucketingHighThreshold:(float)a3
{
  self->_confidenceBucketingHighThreshold = a3;
}

- (float)confidenceBucketingHighThreshold
{
  return self->_confidenceBucketingHighThreshold;
}

- (void)setConfidenceBucketingLowThreshold:(float)a3
{
  self->_confidenceBucketingLowThreshold = a3;
}

- (float)confidenceBucketingLowThreshold
{
  return self->_confidenceBucketingLowThreshold;
}

- (void)setConfidenceUnits:(unint64_t)a3
{
  self->_confidenceUnits = a3;
}

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

- (void)setAggregationParameters:(id)a3
{
}

- (ADAggregationParameters)aggregationParameters
{
  return self->_aggregationParameters;
}

- (void)setPointCloudFilter:(id)a3
{
}

- (ADJasperPointCloudFilterParameters)pointCloudFilter
{
  return self->_pointCloudFilter;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ADJasperColorPipelineParameters;
  id v5 = [(ADPipelineParameters *)&v21 initForDevice:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    LODWORD(v8) = 1063675494;
    [*((id *)v5 + 5) setConfidenceThreshold:v8];
    [*((id *)v5 + 5) setEchoMode:2];
    *((void *)v5 + 7) = 0;
    *((_DWORD *)v5 + 6) = 2143289344;
    *((_DWORD *)v5 + 7) = 2143289344;
    uint64_t v9 = objc_opt_new();
    v10 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v9;

    [*((id *)v5 + 6) setAggregationSize:4];
    [*((id *)v5 + 6) setMaxPointCloudAge:0.5];
    *((_DWORD *)v5 + 8) = 1045220557;
    unint64_t v11 = +[ADDeviceConfiguration getLidarType:v4];
    v13 = (void *)*((void *)v5 + 5);
    if (v11 == 2)
    {
      LODWORD(v12) = 1176256512;
      [v13 setMaxDistance:v12];
      LODWORD(v14) = 1120403456;
      [*((id *)v5 + 5) setMinDistance:v14];
      LODWORD(v15) = 1120403456;
      [*((id *)v5 + 5) setShortRangeDepthThreshold:v15];
      float v17 = 0.9;
    }
    else
    {
      LODWORD(v12) = 1167867904;
      [v13 setMaxDistance:v12];
      LODWORD(v18) = 1120403456;
      [*((id *)v5 + 5) setMinDistance:v18];
      float v17 = 0.75;
      LODWORD(v19) = 1133903872;
      [*((id *)v5 + 5) setShortRangeDepthThreshold:v19];
    }
    *(float *)&double v16 = v17;
    [*((id *)v5 + 5) setShortRangeConfidenceThreshold:v16];
  }

  return v5;
}

@end