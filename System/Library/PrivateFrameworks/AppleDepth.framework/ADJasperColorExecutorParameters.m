@interface ADJasperColorExecutorParameters
- (ADJasperColorPipelineParameters)pipelineParameters;
- (BOOL)doComputeNormals;
- (BOOL)doTemporalConsistency;
- (BOOL)useAlphaMapForTemporalConsistency;
- (id)initForDevice:(id)a3;
- (unint64_t)temporalConsistencyMethod;
- (void)setDoComputeNormals:(BOOL)a3;
- (void)setDoTemporalConsistency:(BOOL)a3;
- (void)setTemporalConsistencyMethod:(unint64_t)a3;
- (void)setUseAlphaMapForTemporalConsistency:(BOOL)a3;
@end

@implementation ADJasperColorExecutorParameters

- (void).cxx_destruct
{
}

- (void)setTemporalConsistencyMethod:(unint64_t)a3
{
  self->_temporalConsistencyMethod = a3;
}

- (unint64_t)temporalConsistencyMethod
{
  return self->_temporalConsistencyMethod;
}

- (void)setDoComputeNormals:(BOOL)a3
{
  self->_doComputeNormals = a3;
}

- (BOOL)doComputeNormals
{
  return self->_doComputeNormals;
}

- (void)setUseAlphaMapForTemporalConsistency:(BOOL)a3
{
  self->_useAlphaMapForTemporalConsistency = a3;
}

- (BOOL)useAlphaMapForTemporalConsistency
{
  return self->_useAlphaMapForTemporalConsistency;
}

- (BOOL)doTemporalConsistency
{
  return self->_doTemporalConsistency;
}

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setDoTemporalConsistency:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "the doTemporalConsistency property is deprecated. please use temporalConsistencyMethod instead", v6, 2u);
  }
  unint64_t v5 = 2;
  if (!v3) {
    unint64_t v5 = 0;
  }
  self->_temporalConsistencyMethod = v5;
  self->_doTemporalConsistency = v3;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorExecutorParameters;
  unint64_t v5 = [(ADExecutorParameters *)&v9 initForDevice:v4];
  if (v5)
  {
    id v6 = [[ADJasperColorPipelineParameters alloc] initForDevice:v4];
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((unsigned char *)v5 + 48) = 0;
    *((unsigned char *)v5 + 50) = 1;
    *((unsigned char *)v5 + 49) = 1;
    v5[8] = 0;
  }

  return v5;
}

@end