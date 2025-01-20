@interface CPLDerivativesGenerationStatistics
- (CPLDerivativesGenerationStatistics)initWithSourceResource:(id)a3;
- (CPLResource)sourceResource;
- (double)generationDuration;
- (void)didEndGeneratingDerivatives;
@end

@implementation CPLDerivativesGenerationStatistics

- (void).cxx_destruct
{
}

- (CPLResource)sourceResource
{
  return self->_sourceResource;
}

- (double)generationDuration
{
  return self->_endTime - self->_startTime;
}

- (void)didEndGeneratingDerivatives
{
  double startTime = self->_startTime;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (startTime >= Current) {
    CFAbsoluteTime Current = startTime;
  }
  self->_endTime = Current;
}

- (CPLDerivativesGenerationStatistics)initWithSourceResource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLDerivativesGenerationStatistics;
  v6 = [(CPLDerivativesGenerationStatistics *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceResource, a3);
    v7->_double startTime = CFAbsoluteTimeGetCurrent();
  }

  return v7;
}

@end