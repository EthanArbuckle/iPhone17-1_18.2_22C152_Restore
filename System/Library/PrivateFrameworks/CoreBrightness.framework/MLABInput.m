@interface MLABInput
- (MLABInput)initWithInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6;
- (MLMultiArray)input_x;
- (MLMultiArray)target_lux;
- (MLMultiArray)target_nits;
- (MLMultiArray)target_weight;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setInput_x:(id)a3;
- (void)setTarget_lux:(id)a3;
- (void)setTarget_nits:(id)a3;
- (void)setTarget_weight:(id)a3;
@end

@implementation MLABInput

- (MLABInput)initWithInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  v6 = v17;
  v17 = 0;
  v12.receiver = v6;
  v12.super_class = (Class)MLABInput;
  v17 = [(MLABInput *)&v12 init];
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input_x, location[0]);
    objc_storeStrong((id *)&v17->_target_lux, v15);
    objc_storeStrong((id *)&v17->_target_nits, v14);
    objc_storeStrong((id *)&v17->_target_weight, v13);
  }
  v8 = v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v8;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F1418320, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"input_x"])
  {
    id MLFeatureValueClass_1 = getMLFeatureValueClass_1();
    objc_super v12 = [(MLABInput *)v14 input_x];
    id v15 = (id)objc_msgSend(MLFeatureValueClass_1, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"target_lux"])
  {
    id v9 = getMLFeatureValueClass_1();
    v10 = [(MLABInput *)v14 target_lux];
    id v15 = (id)objc_msgSend(v9, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"target_nits"])
  {
    id v7 = getMLFeatureValueClass_1();
    v8 = [(MLABInput *)v14 target_nits];
    id v15 = (id)objc_msgSend(v7, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"target_weight"])
  {
    id v5 = getMLFeatureValueClass_1();
    v6 = [(MLABInput *)v14 target_weight];
    id v15 = (id)objc_msgSend(v5, "featureValueWithMultiArray:");
  }
  else
  {
    id v15 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v15;

  return v3;
}

- (MLMultiArray)input_x
{
  return self->_input_x;
}

- (void)setInput_x:(id)a3
{
}

- (MLMultiArray)target_lux
{
  return self->_target_lux;
}

- (void)setTarget_lux:(id)a3
{
}

- (MLMultiArray)target_nits
{
  return self->_target_nits;
}

- (void)setTarget_nits:(id)a3
{
}

- (MLMultiArray)target_weight
{
  return self->_target_weight;
}

- (void)setTarget_weight:(id)a3
{
}

- (void).cxx_destruct
{
}

@end