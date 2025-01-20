@interface CBCE2Output
- (CBCE2Output)initWithCBCE2_Q0_output:(id)a3 CBCE2_Q1_output:(id)a4 CBCE2_Q2_output:(id)a5 CBCE2_Q3_output:(id)a6 CBCE2_Q4_output:(id)a7 strength_output:(id)a8 uncertainty:(id)a9;
- (MLMultiArray)CBCE2_Q0_output;
- (MLMultiArray)CBCE2_Q1_output;
- (MLMultiArray)CBCE2_Q2_output;
- (MLMultiArray)CBCE2_Q3_output;
- (MLMultiArray)CBCE2_Q4_output;
- (MLMultiArray)strength_output;
- (MLMultiArray)uncertainty;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setCBCE2_Q0_output:(id)a3;
- (void)setCBCE2_Q1_output:(id)a3;
- (void)setCBCE2_Q2_output:(id)a3;
- (void)setCBCE2_Q3_output:(id)a3;
- (void)setCBCE2_Q4_output:(id)a3;
- (void)setStrength_output:(id)a3;
- (void)setUncertainty:(id)a3;
@end

@implementation CBCE2Output

- (CBCE2Output)initWithCBCE2_Q0_output:(id)a3 CBCE2_Q1_output:(id)a4 CBCE2_Q2_output:(id)a5 CBCE2_Q3_output:(id)a6 CBCE2_Q4_output:(id)a7 strength_output:(id)a8 uncertainty:(id)a9
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  id v20 = 0;
  objc_storeStrong(&v20, a7);
  id v19 = 0;
  objc_storeStrong(&v19, a8);
  id v18 = 0;
  objc_storeStrong(&v18, a9);
  v9 = v25;
  v25 = 0;
  v17.receiver = v9;
  v17.super_class = (Class)CBCE2Output;
  v25 = [(CBCE2Output *)&v17 init];
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_storeStrong((id *)&v25->_CBCE2_Q0_output, location[0]);
    objc_storeStrong((id *)&v25->_CBCE2_Q1_output, v23);
    objc_storeStrong((id *)&v25->_CBCE2_Q2_output, v22);
    objc_storeStrong((id *)&v25->_CBCE2_Q3_output, v21);
    objc_storeStrong((id *)&v25->_CBCE2_Q4_output, v20);
    objc_storeStrong((id *)&v25->_strength_output, v19);
    objc_storeStrong((id *)&v25->_uncertainty, v18);
  }
  v11 = v25;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v11;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F1418278, a2, self);
}

- (id)featureValueForName:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"CBCE2_Q0_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_CBCE2_Q0_output];
  }
  else if ([location[0] isEqualToString:@"CBCE2_Q1_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_CBCE2_Q1_output];
  }
  else if ([location[0] isEqualToString:@"CBCE2_Q2_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_CBCE2_Q2_output];
  }
  else if ([location[0] isEqualToString:@"CBCE2_Q3_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_CBCE2_Q3_output];
  }
  else if ([location[0] isEqualToString:@"CBCE2_Q4_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_CBCE2_Q4_output];
  }
  else if ([location[0] isEqualToString:@"strength_output"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_strength_output];
  }
  else if ([location[0] isEqualToString:@"uncertainty"])
  {
    id v7 = (id)[getMLFeatureValueClass_0() featureValueWithMultiArray:v6->_uncertainty];
  }
  else
  {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v7;

  return v3;
}

- (MLMultiArray)CBCE2_Q0_output
{
  return self->_CBCE2_Q0_output;
}

- (void)setCBCE2_Q0_output:(id)a3
{
}

- (MLMultiArray)CBCE2_Q1_output
{
  return self->_CBCE2_Q1_output;
}

- (void)setCBCE2_Q1_output:(id)a3
{
}

- (MLMultiArray)CBCE2_Q2_output
{
  return self->_CBCE2_Q2_output;
}

- (void)setCBCE2_Q2_output:(id)a3
{
}

- (MLMultiArray)CBCE2_Q3_output
{
  return self->_CBCE2_Q3_output;
}

- (void)setCBCE2_Q3_output:(id)a3
{
}

- (MLMultiArray)CBCE2_Q4_output
{
  return self->_CBCE2_Q4_output;
}

- (void)setCBCE2_Q4_output:(id)a3
{
}

- (MLMultiArray)strength_output
{
  return self->_strength_output;
}

- (void)setStrength_output:(id)a3
{
}

- (MLMultiArray)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(id)a3
{
}

- (void).cxx_destruct
{
}

@end