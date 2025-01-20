@interface ADJasperColorV2PipelineParameters
- (ADJasperPointCloudFilterParameters)pointCloudFilter;
- (BOOL)outputHighConfidencePixelsOnly;
- (float)maxDepthThresholdForInvalidUncertainty;
- (float)minDepthThresholdForInvalidUncertainty;
- (float)uncertaintyThreshold;
- (id)initForDevice:(id)a3;
- (unsigned)minRequiredJasperPoints;
- (void)setMaxDepthThresholdForInvalidUncertainty:(float)a3;
- (void)setMinDepthThresholdForInvalidUncertainty:(float)a3;
- (void)setMinRequiredJasperPoints:(unsigned int)a3;
- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3;
- (void)setPointCloudFilter:(id)a3;
- (void)setUncertaintyThreshold:(float)a3;
@end

@implementation ADJasperColorV2PipelineParameters

- (void).cxx_destruct
{
}

- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3
{
  self->_outputHighConfidencePixelsOnly = a3;
}

- (BOOL)outputHighConfidencePixelsOnly
{
  return self->_outputHighConfidencePixelsOnly;
}

- (void)setMinDepthThresholdForInvalidUncertainty:(float)a3
{
  self->_minDepthThresholdForInvalidUncertainty = a3;
}

- (float)minDepthThresholdForInvalidUncertainty
{
  return self->_minDepthThresholdForInvalidUncertainty;
}

- (void)setMaxDepthThresholdForInvalidUncertainty:(float)a3
{
  self->_maxDepthThresholdForInvalidUncertainty = a3;
}

- (float)maxDepthThresholdForInvalidUncertainty
{
  return self->_maxDepthThresholdForInvalidUncertainty;
}

- (void)setMinRequiredJasperPoints:(unsigned int)a3
{
  self->_minRequiredJasperPoints = a3;
}

- (unsigned)minRequiredJasperPoints
{
  return self->_minRequiredJasperPoints;
}

- (void)setUncertaintyThreshold:(float)a3
{
  self->_uncertaintyThreshold = a3;
}

- (float)uncertaintyThreshold
{
  return self->_uncertaintyThreshold;
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
  if (!v4)
  {
    id v4 = +[ADDeviceConfiguration getDeviceName];
  }
  v22.receiver = self;
  v22.super_class = (Class)ADJasperColorV2PipelineParameters;
  id v5 = [(ADPipelineParameters *)&v22 initForDevice:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v6;

    v8 = [v5 deviceName];
    unint64_t v9 = +[ADDeviceConfiguration getLidarType:v8];

    v11 = (void *)*((void *)v5 + 6);
    if (v9 == 2)
    {
      LODWORD(v10) = 1061997773;
      [v11 setConfidenceThreshold:v10];
      [*((id *)v5 + 6) setEchoMode:2];
      LODWORD(v12) = 1184645120;
      [*((id *)v5 + 6) setMaxDistance:v12];
      LODWORD(v13) = 1114636288;
      [*((id *)v5 + 6) setMinDistance:v13];
      [*((id *)v5 + 6) setShortRangeDepthThreshold:0.0];
      [*((id *)v5 + 6) setShortRangeConfidenceThreshold:0.0];
      float v14 = 20.0;
      int v15 = 1031127695;
    }
    else
    {
      LODWORD(v10) = 1063675494;
      [v11 setConfidenceThreshold:v10];
      [*((id *)v5 + 6) setEchoMode:2];
      LODWORD(v16) = 1167867904;
      [*((id *)v5 + 6) setMaxDistance:v16];
      LODWORD(v17) = 1143930880;
      [*((id *)v5 + 6) setMinDistance:v17];
      LODWORD(v18) = 1133903872;
      [*((id *)v5 + 6) setShortRangeDepthThreshold:v18];
      LODWORD(v19) = 0.75;
      [*((id *)v5 + 6) setShortRangeConfidenceThreshold:v19];
      float v14 = 10.0;
      int v15 = 1060320051;
    }
    *((_DWORD *)v5 + 8) = 1;
    *((float *)v5 + 9) = v14;
    *((_DWORD *)v5 + 10) = v15;
    *((unsigned char *)v5 + 24) = 0;
    *((_DWORD *)v5 + 7) = 2143289344;
    id v20 = v5;
  }

  return v5;
}

@end