@interface sceneLuxB2DItpMLModelOutput
- (MLMultiArray)anchor_points;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (sceneLuxB2DItpMLModelOutput)initWithAnchor_points:(id)a3;
- (void)setAnchor_points:(id)a3;
@end

@implementation sceneLuxB2DItpMLModelOutput

- (sceneLuxB2DItpMLModelOutput)initWithAnchor_points:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)sceneLuxB2DItpMLModelOutput;
  v6 = [(sceneLuxB2DItpMLModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_anchor_points, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D4B74D0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"anchor_points"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(sceneLuxB2DItpMLModelOutput *)self anchor_points];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)anchor_points
{
  return self->_anchor_points;
}

- (void)setAnchor_points:(id)a3
{
}

- (void).cxx_destruct
{
}

@end