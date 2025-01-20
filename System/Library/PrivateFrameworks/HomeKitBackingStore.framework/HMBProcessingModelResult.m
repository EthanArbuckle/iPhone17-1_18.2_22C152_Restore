@interface HMBProcessingModelResult
+ (id)alloc;
- (HMBModel)model;
- (HMBProcessingModelResult)initWithModel:(id)a3 options:(id)a4 mirrorOutputFuture:(id)a5;
- (HMBProcessingOptions)options;
- (NAFuture)mirrorOutputFuture;
- (id)attributeDescriptions;
@end

@implementation HMBProcessingModelResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorOutputFuture, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NAFuture)mirrorOutputFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 24, 1);
}

- (HMBProcessingOptions)options
{
  return (HMBProcessingOptions *)objc_getProperty(self, a2, 16, 1);
}

- (HMBModel)model
{
  return (HMBModel *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMBProcessingModelResult *)self model];
  v5 = (void *)[v3 initWithName:@"Model" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMBProcessingModelResult *)self options];
  v8 = (void *)[v6 initWithName:@"Options" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMBProcessingModelResult *)self mirrorOutputFuture];
  if (v10) {
    v11 = @"<not nil>";
  }
  else {
    v11 = @"<nil>";
  }
  v12 = (void *)[v9 initWithName:@"Mirror Output" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMBProcessingModelResult)initWithModel:(id)a3 options:(id)a4 mirrorOutputFuture:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMBProcessingModelResult *)+[HMBProcessingModelResult alloc];
  }
  v12 = v11;
  v18.receiver = self;
  v18.super_class = (Class)HMBProcessingModelResult;
  v13 = [(HMBProcessingModelResult *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeStrong((id *)&v14->_options, a4);
    objc_storeStrong((id *)&v14->_mirrorOutputFuture, a5);
  }

  return v14;
}

+ (id)alloc
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = [NSString stringWithFormat:@"Cannot create a direct instance of %@. Use a subclass instead", objc_opt_class()];
    id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HMBProcessingModelResult;
  return objc_msgSendSuper2(&v9, sel_alloc);
}

@end