@interface ABPKMLModelConfiguration
- (ABPKMLModelConfiguration)init;
- (id)compiledMLModelPath;
- (id)inputTensorNames;
- (id)outputTensorNames;
@end

@implementation ABPKMLModelConfiguration

- (ABPKMLModelConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABPKMLModelConfiguration;
  return [(ABPKMLModelConfiguration *)&v3 init];
}

- (id)compiledMLModelPath
{
  return 0;
}

- (id)inputTensorNames
{
  return 0;
}

- (id)outputTensorNames
{
  return 0;
}

@end