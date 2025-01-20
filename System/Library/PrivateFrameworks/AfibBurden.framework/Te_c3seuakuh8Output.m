@interface Te_c3seuakuh8Output
- (MLMultiArray)RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd;
- (NSSet)featureNames;
- (Te_c3seuakuh8Output)initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3;
@end

@implementation Te_c3seuakuh8Output

- (Te_c3seuakuh8Output)initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Te_c3seuakuh8Output;
  v6 = [(Te_c3seuakuh8Output *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26FBC3430];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd"])
  {
    v4 = [MEMORY[0x263F00D50] featureValueWithMultiArray:self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd
{
  return self->_RHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd;
}

- (void)setRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:(id)a3
{
}

- (void).cxx_destruct
{
}

@end