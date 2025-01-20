@interface ARUIRingsEndCapShadowState
- (BOOL)shouldRunStateForRing:(id)a3;
- (id)name;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
- (void)didInitialize;
@end

@implementation ARUIRingsEndCapShadowState

- (id)name
{
  return @"ARUIRingsEndCapShadowState";
}

- (void)didInitialize
{
  v3.receiver = self;
  v3.super_class = (Class)ARUIRingsEndCapShadowState;
  [(ARUIRingsRenderState *)&v3 didInitialize];
  [(ARUIRingsRenderState *)self setRenderArea:1];
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)[v4 newFunctionWithName:@"vertex_shader"];
  [v5 setVertexFunction:v6];

  v7 = (void *)[v4 newFunctionWithName:@"fragment_capshadow"];
  [v5 setFragmentFunction:v7];

  v8 = [v5 colorAttachments];
  v9 = [v8 objectAtIndexedSubscript:0];
  [v9 setPixelFormat:80];

  [v5 configureForSourceOverBlending];
  v10 = [(ARUIRingsEndCapShadowState *)self name];
  [v5 setLabel:v10];

  return v5;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  id v3 = a3;
  [v3 percentage];
  if (v4 == *(float *)&ARUIRingPercentageValueNoRing
    || ([v3 percentage],
        float v5 = *(double *)&ARUIRingsRenderPipelineConfigurationOverlappingThreshold,
        !ARUIFloatGreater(v6, v5)))
  {
    BOOL v8 = 0;
  }
  else
  {
    [v3 opacity];
    BOOL v8 = ARUIFloatGreater(v7, 0.0);
  }

  return v8;
}

@end