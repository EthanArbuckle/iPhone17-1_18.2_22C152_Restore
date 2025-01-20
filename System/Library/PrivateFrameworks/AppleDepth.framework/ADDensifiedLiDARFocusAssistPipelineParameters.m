@interface ADDensifiedLiDARFocusAssistPipelineParameters
- (ADDensifiedLiDARFocusAssistPipelineParameters)init;
- (ADJasperPointCloudFilterParameters)pointCloudFilter;
- (unint64_t)confidenceUnits;
- (void)setConfidenceUnits:(unint64_t)a3;
- (void)setPointCloudFilter:(id)a3;
@end

@implementation ADDensifiedLiDARFocusAssistPipelineParameters

- (void).cxx_destruct
{
}

- (void)setConfidenceUnits:(unint64_t)a3
{
  self->_confidenceUnits = a3;
}

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

- (void)setPointCloudFilter:(id)a3
{
}

- (ADJasperPointCloudFilterParameters)pointCloudFilter
{
  return self->_pointCloudFilter;
}

- (ADDensifiedLiDARFocusAssistPipelineParameters)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADDensifiedLiDARFocusAssistPipelineParameters;
  v2 = [(ADPipelineParameters *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pointCloudFilter = v2->_pointCloudFilter;
    v2->_pointCloudFilter = (ADJasperPointCloudFilterParameters *)v3;

    LODWORD(v5) = 1061997773;
    [(ADJasperPointCloudFilterParameters *)v2->_pointCloudFilter setConfidenceThreshold:v5];
    [(ADJasperPointCloudFilterParameters *)v2->_pointCloudFilter setMinDistance:0.0];
    LODWORD(v6) = 1203982336;
    [(ADJasperPointCloudFilterParameters *)v2->_pointCloudFilter setMaxDistance:v6];
    [(ADJasperPointCloudFilterParameters *)v2->_pointCloudFilter setShortRangeDepthThreshold:0.0];
    [(ADJasperPointCloudFilterParameters *)v2->_pointCloudFilter setEchoMode:2];
    v2->_confidenceUnits = 3;
  }
  return v2;
}

@end