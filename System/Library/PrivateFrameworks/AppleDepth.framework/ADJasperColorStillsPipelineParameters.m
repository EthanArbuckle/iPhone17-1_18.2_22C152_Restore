@interface ADJasperColorStillsPipelineParameters
- (ADJasperColorStillsPipelineParameters)init;
- (ADJasperPointCloudFilterParameters)pointCloudFilter;
- (ADJasperPointCloudFilterParameters)pointCloudFilterForTransformCorrection;
- (id)initForDevice:(id)a3;
- (void)setPointCloudFilter:(id)a3;
- (void)setPointCloudFilterForTransformCorrection:(id)a3;
@end

@implementation ADJasperColorStillsPipelineParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointCloudFilterForTransformCorrection, 0);
  objc_storeStrong((id *)&self->_pointCloudFilter, 0);
}

- (void)setPointCloudFilterForTransformCorrection:(id)a3
{
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterForTransformCorrection
{
  return self->_pointCloudFilterForTransformCorrection;
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
  v30.receiver = self;
  v30.super_class = (Class)ADJasperColorStillsPipelineParameters;
  v5 = [(ADPipelineParameters *)&v30 initForDevice:v4];
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v8 = [v5 deviceName];
    unint64_t v9 = +[ADDeviceConfiguration getLidarType:v8];

    uint64_t v10 = objc_opt_new();
    id v11 = v7[3];
    v7[3] = (id)v10;

    LODWORD(v12) = 1063675494;
    [v7[3] setConfidenceThreshold:v12];
    if (v9 == 2)
    {
      [v7[3] setEchoMode:4];
      LODWORD(v13) = 1176256512;
      [v7[3] setMaxDistance:v13];
      LODWORD(v14) = 1114636288;
      [v7[3] setMinDistance:v14];
      [v7[3] setShortRangeDepthThreshold:0.0];
      [v7[3] setShortRangeConfidenceThreshold:0.0];
      uint64_t v15 = objc_opt_new();
      v16 = v6 + 4;
      id v17 = *v16;
      id *v16 = (id)v15;

      LODWORD(v18) = 1061997773;
      [*v16 setConfidenceThreshold:v18];
      [*v16 setEchoMode:2];
      LODWORD(v19) = 1181376512;
      [*v16 setMaxDistance:v19];
      LODWORD(v20) = 1137180672;
    }
    else
    {
      [v7[3] setEchoMode:2];
      LODWORD(v21) = 1167867904;
      [v7[3] setMaxDistance:v21];
      LODWORD(v22) = 1120403456;
      [v7[3] setMinDistance:v22];
      LODWORD(v23) = 1133903872;
      [v7[3] setShortRangeDepthThreshold:v23];
      LODWORD(v24) = 0.75;
      [v7[3] setShortRangeConfidenceThreshold:v24];
      uint64_t v25 = objc_opt_new();
      v16 = v6 + 4;
      id v26 = *v16;
      id *v16 = (id)v25;

      LODWORD(v27) = 1062836634;
      [*v16 setConfidenceThreshold:v27];
      [*v16 setEchoMode:4];
      LODWORD(v28) = 1167867904;
      [*v16 setMaxDistance:v28];
      LODWORD(v20) = 1128792064;
    }
    [*v16 setMinDistance:v20];
    [*v16 setShortRangeDepthThreshold:0.0];
    [*v16 setShortRangeConfidenceThreshold:0.0];
  }

  return v7;
}

- (ADJasperColorStillsPipelineParameters)init
{
  return (ADJasperColorStillsPipelineParameters *)[(ADJasperColorStillsPipelineParameters *)self initForDevice:0];
}

@end