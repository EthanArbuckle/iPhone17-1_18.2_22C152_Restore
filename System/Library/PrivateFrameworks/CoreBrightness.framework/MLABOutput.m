@interface MLABOutput
- (MLABOutput)initWithIdentity:(id)a3 LTM_output_E:(id)a4 Identity_10:(id)a5 Identity_11:(id)a6 Identity_12:(id)a7 Identity_13:(id)a8 Identity_14:(id)a9 LTM_output_L:(id)a10 LTM_output_S:(id)a11 Identity_4:(id)a12 Identity_5:(id)a13 STM_output_E:(id)a14 STM_output_L:(id)a15 STM_output_S:(id)a16 Identity_9:(id)a17;
- (MLMultiArray)Identity;
- (MLMultiArray)Identity_10;
- (MLMultiArray)Identity_11;
- (MLMultiArray)Identity_12;
- (MLMultiArray)Identity_13;
- (MLMultiArray)Identity_14;
- (MLMultiArray)Identity_4;
- (MLMultiArray)Identity_5;
- (MLMultiArray)Identity_9;
- (MLMultiArray)LTM_output_E;
- (MLMultiArray)LTM_output_L;
- (MLMultiArray)LTM_output_S;
- (MLMultiArray)STM_output_E;
- (MLMultiArray)STM_output_L;
- (MLMultiArray)STM_output_S;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIdentity_10:(id)a3;
- (void)setIdentity_11:(id)a3;
- (void)setIdentity_12:(id)a3;
- (void)setIdentity_13:(id)a3;
- (void)setIdentity_14:(id)a3;
- (void)setIdentity_4:(id)a3;
- (void)setIdentity_5:(id)a3;
- (void)setIdentity_9:(id)a3;
- (void)setLTM_output_E:(id)a3;
- (void)setLTM_output_L:(id)a3;
- (void)setLTM_output_S:(id)a3;
- (void)setSTM_output_E:(id)a3;
- (void)setSTM_output_L:(id)a3;
- (void)setSTM_output_S:(id)a3;
@end

@implementation MLABOutput

- (MLABOutput)initWithIdentity:(id)a3 LTM_output_E:(id)a4 Identity_10:(id)a5 Identity_11:(id)a6 Identity_12:(id)a7 Identity_13:(id)a8 Identity_14:(id)a9 LTM_output_L:(id)a10 LTM_output_S:(id)a11 Identity_4:(id)a12 Identity_5:(id)a13 STM_output_E:(id)a14 STM_output_L:(id)a15 STM_output_S:(id)a16 Identity_9:(id)a17
{
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = 0;
  objc_storeStrong(&v39, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v37 = 0;
  objc_storeStrong(&v37, a6);
  id v36 = 0;
  objc_storeStrong(&v36, a7);
  id v35 = 0;
  objc_storeStrong(&v35, a8);
  id v34 = 0;
  objc_storeStrong(&v34, a9);
  id v33 = 0;
  objc_storeStrong(&v33, a10);
  id v32 = 0;
  objc_storeStrong(&v32, a11);
  id v31 = 0;
  objc_storeStrong(&v31, a12);
  id v30 = 0;
  objc_storeStrong(&v30, a13);
  id v29 = 0;
  objc_storeStrong(&v29, a14);
  id v28 = 0;
  objc_storeStrong(&v28, a15);
  id v27 = 0;
  objc_storeStrong(&v27, a16);
  id v26 = 0;
  objc_storeStrong(&v26, a17);
  v17 = v41;
  v41 = 0;
  v25.receiver = v17;
  v25.super_class = (Class)MLABOutput;
  v41 = [(MLABOutput *)&v25 init];
  objc_storeStrong((id *)&v41, v41);
  if (v41)
  {
    objc_storeStrong((id *)&v41->_Identity, location[0]);
    objc_storeStrong((id *)&v41->_LTM_output_E, v39);
    objc_storeStrong((id *)&v41->_Identity_10, v38);
    objc_storeStrong((id *)&v41->_Identity_11, v37);
    objc_storeStrong((id *)&v41->_Identity_12, v36);
    objc_storeStrong((id *)&v41->_Identity_13, v35);
    objc_storeStrong((id *)&v41->_Identity_14, v34);
    objc_storeStrong((id *)&v41->_LTM_output_L, v33);
    objc_storeStrong((id *)&v41->_LTM_output_S, v32);
    objc_storeStrong((id *)&v41->_Identity_4, v31);
    objc_storeStrong((id *)&v41->_Identity_5, v30);
    objc_storeStrong((id *)&v41->_STM_output_E, v29);
    objc_storeStrong((id *)&v41->_STM_output_L, v28);
    objc_storeStrong((id *)&v41->_STM_output_S, v27);
    objc_storeStrong((id *)&v41->_Identity_9, v26);
  }
  v19 = v41;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v41, 0);
  return v19;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F1418338, a2, self);
}

- (id)featureValueForName:(id)a3
{
  id v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"Identity"])
  {
    id MLFeatureValueClass_1 = getMLFeatureValueClass_1();
    id v34 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(MLFeatureValueClass_1, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"LTM_output_E"])
  {
    id v31 = getMLFeatureValueClass_1();
    id v32 = [(MLABOutput *)v36 LTM_output_E];
    id v37 = (id)objc_msgSend(v31, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_10"])
  {
    id v29 = getMLFeatureValueClass_1();
    id v30 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v29, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_11"])
  {
    id v27 = getMLFeatureValueClass_1();
    id v28 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v27, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_12"])
  {
    id v25 = getMLFeatureValueClass_1();
    id v26 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v25, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_13"])
  {
    id v23 = getMLFeatureValueClass_1();
    v24 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v23, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_14"])
  {
    id v21 = getMLFeatureValueClass_1();
    v22 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v21, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"LTM_output_L"])
  {
    id v19 = getMLFeatureValueClass_1();
    v20 = [(MLABOutput *)v36 LTM_output_L];
    id v37 = (id)objc_msgSend(v19, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"LTM_output_S"])
  {
    id v17 = getMLFeatureValueClass_1();
    v18 = [(MLABOutput *)v36 LTM_output_S];
    id v37 = (id)objc_msgSend(v17, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_4"])
  {
    id v15 = getMLFeatureValueClass_1();
    v16 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v15, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_5"])
  {
    id v13 = getMLFeatureValueClass_1();
    v14 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v13, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"STM_output_E"])
  {
    id v11 = getMLFeatureValueClass_1();
    v12 = [(MLABOutput *)v36 STM_output_E];
    id v37 = (id)objc_msgSend(v11, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"STM_output_L"])
  {
    id v9 = getMLFeatureValueClass_1();
    v10 = [(MLABOutput *)v36 STM_output_L];
    id v37 = (id)objc_msgSend(v9, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"STM_output_S"])
  {
    id v7 = getMLFeatureValueClass_1();
    v8 = [(MLABOutput *)v36 STM_output_S];
    id v37 = (id)objc_msgSend(v7, "featureValueWithMultiArray:");
  }
  else if ([location[0] isEqualToString:@"Identity_9"])
  {
    id v5 = getMLFeatureValueClass_1();
    v6 = [(MLABOutput *)v36 Identity];
    id v37 = (id)objc_msgSend(v5, "featureValueWithMultiArray:");
  }
  else
  {
    id v37 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v37;

  return v3;
}

- (MLMultiArray)Identity
{
  return self->_Identity;
}

- (void)setIdentity:(id)a3
{
}

- (MLMultiArray)LTM_output_E
{
  return self->_LTM_output_E;
}

- (void)setLTM_output_E:(id)a3
{
}

- (MLMultiArray)Identity_10
{
  return self->_Identity_10;
}

- (void)setIdentity_10:(id)a3
{
}

- (MLMultiArray)Identity_11
{
  return self->_Identity_11;
}

- (void)setIdentity_11:(id)a3
{
}

- (MLMultiArray)Identity_12
{
  return self->_Identity_12;
}

- (void)setIdentity_12:(id)a3
{
}

- (MLMultiArray)Identity_13
{
  return self->_Identity_13;
}

- (void)setIdentity_13:(id)a3
{
}

- (MLMultiArray)Identity_14
{
  return self->_Identity_14;
}

- (void)setIdentity_14:(id)a3
{
}

- (MLMultiArray)LTM_output_L
{
  return self->_LTM_output_L;
}

- (void)setLTM_output_L:(id)a3
{
}

- (MLMultiArray)LTM_output_S
{
  return self->_LTM_output_S;
}

- (void)setLTM_output_S:(id)a3
{
}

- (MLMultiArray)Identity_4
{
  return self->_Identity_4;
}

- (void)setIdentity_4:(id)a3
{
}

- (MLMultiArray)Identity_5
{
  return self->_Identity_5;
}

- (void)setIdentity_5:(id)a3
{
}

- (MLMultiArray)STM_output_E
{
  return self->_STM_output_E;
}

- (void)setSTM_output_E:(id)a3
{
}

- (MLMultiArray)STM_output_L
{
  return self->_STM_output_L;
}

- (void)setSTM_output_L:(id)a3
{
}

- (MLMultiArray)STM_output_S
{
  return self->_STM_output_S;
}

- (void)setSTM_output_S:(id)a3
{
}

- (MLMultiArray)Identity_9
{
  return self->_Identity_9;
}

- (void)setIdentity_9:(id)a3
{
}

- (void).cxx_destruct
{
}

@end