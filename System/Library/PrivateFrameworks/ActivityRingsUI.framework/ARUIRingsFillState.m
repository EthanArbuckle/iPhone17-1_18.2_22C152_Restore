@interface ARUIRingsFillState
- (BOOL)shouldRunStateForRing:(id)a3;
- (id)name;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
@end

@implementation ARUIRingsFillState

- (BOOL)shouldRunStateForRing:(id)a3
{
  id v3 = a3;
  [v3 percentage];
  if (v4 == *(float *)&ARUIRingPercentageValueNoRing || ([v3 thickness], !ARUIFloatGreater(v5, 0.0)))
  {
    BOOL v7 = 0;
  }
  else
  {
    [v3 opacity];
    BOOL v7 = ARUIFloatGreater(v6, 0.0);
  }

  return v7;
}

- (id)name
{
  return @"ARUIRingsFillState";
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4 = a3;
  float v5 = objc_opt_new();
  float v6 = (void *)[v4 newFunctionWithName:@"vertex_shader"];
  [v5 setVertexFunction:v6];

  BOOL v7 = (void *)[v4 newFunctionWithName:@"fragment_fillcolor"];
  [v5 setFragmentFunction:v7];

  v8 = [v5 colorAttachments];
  v9 = [v8 objectAtIndexedSubscript:0];
  [v9 setPixelFormat:80];

  [v5 configureForSourceOverBlending];
  v10 = [(ARUIRingsFillState *)self name];
  [v5 setLabel:v10];

  return v5;
}

@end