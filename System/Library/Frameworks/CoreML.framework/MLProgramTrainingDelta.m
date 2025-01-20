@interface MLProgramTrainingDelta
- (MLProgramTrainingDelta)initWithFlattenedModelUpdate:(id)a3;
- (NSData)flattenedModelUpdate;
@end

@implementation MLProgramTrainingDelta

- (void).cxx_destruct
{
}

- (NSData)flattenedModelUpdate
{
  return self->_flattenedModelUpdate;
}

- (MLProgramTrainingDelta)initWithFlattenedModelUpdate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLProgramTrainingDelta;
  v6 = [(MLProgramTrainingDelta *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_flattenedModelUpdate, a3);
  }

  return v7;
}

@end