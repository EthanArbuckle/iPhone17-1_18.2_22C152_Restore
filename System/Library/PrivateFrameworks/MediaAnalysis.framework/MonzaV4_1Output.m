@interface MonzaV4_1Output
- (MLMultiArray)angle;
- (MonzaV4_1Output)initWithAngle:(id)a3;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setAngle:(id)a3;
@end

@implementation MonzaV4_1Output

- (MonzaV4_1Output)initWithAngle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MonzaV4_1Output;
  v6 = [(MonzaV4_1Output *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_angle, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE820];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"angle"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(MonzaV4_1Output *)self angle];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)angle
{
  return self->_angle;
}

- (void)setAngle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end