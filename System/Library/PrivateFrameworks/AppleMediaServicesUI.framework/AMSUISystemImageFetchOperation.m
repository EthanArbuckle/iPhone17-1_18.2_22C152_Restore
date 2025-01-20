@interface AMSUISystemImageFetchOperation
- (AMSUISystemImageFetchOperation)initWithSystemImageName:(id)a3 variableValue:(id)a4 compatibleWithTraitCollection:(id)a5;
- (BOOL)isLowLatency;
- (NSNumber)variableValue;
- (NSString)imageName;
- (UITraitCollection)traitCollection;
- (void)main;
- (void)setImageName:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setVariableValue:(id)a3;
@end

@implementation AMSUISystemImageFetchOperation

- (AMSUISystemImageFetchOperation)initWithSystemImageName:(id)a3 variableValue:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUISystemImageFetchOperation;
  v11 = [(AMSUISystemImageFetchOperation *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [NSString stringWithString:v8];
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_traitCollection, a5);
    objc_storeStrong((id *)&v11->_variableValue, a4);
  }

  return v11;
}

- (BOOL)isLowLatency
{
  return 1;
}

- (void)main
{
  id v3 = objc_alloc(MEMORY[0x263F827F8]);
  v4 = [(AMSUISystemImageFetchOperation *)self traitCollection];
  id v11 = [v3 configurationWithTraitCollection:v4];

  v5 = [(AMSUISystemImageFetchOperation *)self variableValue];

  v6 = (void *)MEMORY[0x263F827E8];
  v7 = [(AMSUISystemImageFetchOperation *)self imageName];
  if (v5)
  {
    id v8 = [(AMSUISystemImageFetchOperation *)self variableValue];
    [v8 doubleValue];
    id v9 = objc_msgSend(v6, "_systemImageNamed:variableValue:withConfiguration:", v7, v11);
  }
  else
  {
    id v9 = [v6 _systemImageNamed:v7 withConfiguration:v11];
  }

  if (v9)
  {
    [(AMSUIAssetFetchOperation *)self _finishWithImage:v9 error:0];
  }
  else
  {
    id v10 = AMSError();
    [(AMSUIAssetFetchOperation *)self _finishWithImage:0 error:v10];
  }
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (NSNumber)variableValue
{
  return self->_variableValue;
}

- (void)setVariableValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableValue, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end