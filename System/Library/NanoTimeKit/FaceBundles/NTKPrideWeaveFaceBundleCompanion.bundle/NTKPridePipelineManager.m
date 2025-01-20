@interface NTKPridePipelineManager
- (id)pipeline;
- (void)setPipeline:(id)a3;
@end

@implementation NTKPridePipelineManager

- (id)pipeline
{
  id WeakRetained = objc_loadWeakRetained(&self->_pipeline);

  return WeakRetained;
}

- (void)setPipeline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end