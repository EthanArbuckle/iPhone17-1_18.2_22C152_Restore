@interface ARUIRingsEmptyState
- (BOOL)shouldRunStateForRing:(id)a3;
- (id)name;
- (id)renderPipelineDescriptorFromLibrary:(id)a3;
@end

@implementation ARUIRingsEmptyState

- (id)name
{
  return @"ARUIRingsEmptyState";
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)[v4 newFunctionWithName:@"vertex_shader"];
  [v5 setVertexFunction:v6];

  v7 = (void *)[v4 newFunctionWithName:@"fragment_emptycolor"];
  [v5 setFragmentFunction:v7];

  v8 = [v5 colorAttachments];
  v9 = [v8 objectAtIndexedSubscript:0];
  [v9 setPixelFormat:80];

  [v5 configureForSourceOverBlending];
  v10 = [(ARUIRingsEmptyState *)self name];
  [v5 setLabel:v10];

  return v5;
}

- (BOOL)shouldRunStateForRing:(id)a3
{
  [a3 percentage];
  return v3 == *(float *)&ARUIRingPercentageValueNoRing;
}

@end