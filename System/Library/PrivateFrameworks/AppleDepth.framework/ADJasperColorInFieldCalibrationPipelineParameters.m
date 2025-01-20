@interface ADJasperColorInFieldCalibrationPipelineParameters
- (ADAggregationParameters)pcAggregationParameters;
- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters;
- (BOOL)disableSDF;
- (BOOL)forceRun;
- (float)coeffX;
- (float)coeffY;
- (float)coeffZ;
- (float)colorCameraNominalEfl;
- (float)maxStdForValidResult;
- (id)initForDevice:(id)a3;
- (unsigned)featuresVectorAggregationSize;
- (void)setDisableSDF:(BOOL)a3;
- (void)setFeaturesVectorAggregationSize:(unsigned int)a3;
- (void)setForceRun:(BOOL)a3;
- (void)setPcAggregationParameters:(id)a3;
- (void)setPointCloudFilterParameters:(id)a3;
@end

@implementation ADJasperColorInFieldCalibrationPipelineParameters

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ADJasperColorInFieldCalibrationPipelineParameters;
  id v5 = [(ADPipelineParameters *)&v18 initForDevice:v4];
  if (v5)
  {
    int v6 = [v4 hasPrefix:@"N301"];
    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v7;

    [*((id *)v5 + 7) setEchoMode:4];
    LODWORD(v9) = 1140457472;
    [*((id *)v5 + 7) setMinDistance:v9];
    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v10;

    [*((id *)v5 + 8) setMaxPointCloudAge:1.0];
    *((_DWORD *)v5 + 10) = 1065353216;
    *((_DWORD *)v5 + 11) = 1065353216;
    *((unsigned char *)v5 + 25) = 0;
    if (v6)
    {
      *((unsigned char *)v5 + 24) = 0;
      *((_DWORD *)v5 + 12) = 0;
      *((_DWORD *)v5 + 7) = 5;
      *((_DWORD *)v5 + 8) = 1135371878;
      *((_DWORD *)v5 + 9) = 1082130432;
      [*((id *)v5 + 8) setAggregationSize:4];
      LODWORD(v12) = 1062836634;
      [*((id *)v5 + 7) setConfidenceThreshold:v12];
      LODWORD(v13) = 1167867904;
      [*((id *)v5 + 7) setMaxDistance:v13];
      uint64_t v14 = 4;
    }
    else
    {
      *((unsigned char *)v5 + 24) = +[ADDeviceConfiguration BOOLForKey:kADDeviceConfigurationKeyJasperColorInFieldForceRun];
      *((unsigned char *)v5 + 25) = +[ADDeviceConfiguration BOOLForKey:kADDeviceConfigurationKeyJasperColorInFieldDisableSDF];
      *((_DWORD *)v5 + 12) = 1056964608;
      *((_DWORD *)v5 + 7) = 10;
      *((_DWORD *)v5 + 8) = 1141490975;
      *((_DWORD *)v5 + 9) = 1092616192;
      [*((id *)v5 + 8) setAggregationSize:2];
      LODWORD(v15) = 1061997773;
      [*((id *)v5 + 7) setConfidenceThreshold:v15];
      LODWORD(v16) = 1181376512;
      [*((id *)v5 + 7) setMaxDistance:v16];
      uint64_t v14 = 2;
    }
    [*((id *)v5 + 7) setEchoMode:v14];
  }

  return v5;
}

- (unsigned)featuresVectorAggregationSize
{
  return self->_featuresVectorAggregationSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcAggregationParameters, 0);
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, 0);
}

- (void)setDisableSDF:(BOOL)a3
{
  self->_disableSDF = a3;
}

- (BOOL)disableSDF
{
  return self->_disableSDF;
}

- (void)setForceRun:(BOOL)a3
{
  self->_forceRun = a3;
}

- (BOOL)forceRun
{
  return self->_forceRun;
}

- (float)coeffZ
{
  return self->_coeffZ;
}

- (float)coeffY
{
  return self->_coeffY;
}

- (float)coeffX
{
  return self->_coeffX;
}

- (float)maxStdForValidResult
{
  return self->_maxStdForValidResult;
}

- (float)colorCameraNominalEfl
{
  return self->_colorCameraNominalEfl;
}

- (void)setFeaturesVectorAggregationSize:(unsigned int)a3
{
  self->_featuresVectorAggregationSize = a3;
}

- (void)setPcAggregationParameters:(id)a3
{
}

- (ADAggregationParameters)pcAggregationParameters
{
  return self->_pcAggregationParameters;
}

- (void)setPointCloudFilterParameters:(id)a3
{
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters
{
  return self->_pointCloudFilterParameters;
}

@end