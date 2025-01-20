@interface AXTestingRouteDescription
- (NSArray)inputs;
- (NSArray)outputs;
- (void)setInputs:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation AXTestingRouteDescription

- (NSArray)outputs
{
  return self->outputs;
}

- (void)setOutputs:(id)a3
{
}

- (NSArray)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputs, 0);

  objc_storeStrong((id *)&self->outputs, 0);
}

@end