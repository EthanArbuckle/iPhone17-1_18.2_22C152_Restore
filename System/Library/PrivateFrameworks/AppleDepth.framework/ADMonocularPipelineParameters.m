@interface ADMonocularPipelineParameters
- (ADMonocularPipelineParameters)init;
@end

@implementation ADMonocularPipelineParameters

- (ADMonocularPipelineParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADMonocularPipelineParameters;
  return [(ADPipelineParameters *)&v3 init];
}

@end