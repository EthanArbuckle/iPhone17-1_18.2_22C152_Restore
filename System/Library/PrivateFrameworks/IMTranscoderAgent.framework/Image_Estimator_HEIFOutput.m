@interface Image_Estimator_HEIFOutput
- (Image_Estimator_HEIFOutput)initWithTarget_Quality_Factor:(double)a3;
- (NSSet)featureNames;
- (double)Target_Quality_Factor;
- (id)featureValueForName:(id)a3;
- (void)setTarget_Quality_Factor:(double)a3;
@end

@implementation Image_Estimator_HEIFOutput

- (Image_Estimator_HEIFOutput)initWithTarget_Quality_Factor:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)Image_Estimator_HEIFOutput;
  result = [(Image_Estimator_HEIFOutput *)&v5 init];
  if (result) {
    result->_Target_Quality_Factor = a3;
  }
  return result;
}

- (NSSet)featureNames
{
  return (NSSet *)((uint64_t (*)(void, char *, void *))MEMORY[0x270F9A6D0])(MEMORY[0x263EFFA08], sel_setWithArray_, &unk_26DE89640);
}

- (id)featureValueForName:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"Target Quality Factor", v3, v4, v5, v6))
  {
    v14 = (void *)MEMORY[0x263F00D50];
    objc_msgSend_Target_Quality_Factor(self, v8, v9, v10, v11, v12, v13);
    v21 = objc_msgSend_featureValueWithDouble_(v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (double)Target_Quality_Factor
{
  return self->_Target_Quality_Factor;
}

- (void)setTarget_Quality_Factor:(double)a3
{
  self->_Target_Quality_Factor = a3;
}

@end