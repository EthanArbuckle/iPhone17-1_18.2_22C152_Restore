@interface CKConvenienceConfiguration
- (CKConvenienceCallbackWrapperProtocol)convenienceCallbacks;
- (CKConvenienceConfiguration)initWithConfiguration:(id)a3 group:(id)a4;
- (CKConvenienceConfiguration)initWithConfiguration:(id)a3 group:(id)a4 convenienceCallbackWrapper:(id)a5;
- (CKOperationConfiguration)configuration;
- (CKOperationGroup)group;
@end

@implementation CKConvenienceConfiguration

- (CKConvenienceConfiguration)initWithConfiguration:(id)a3 group:(id)a4 convenienceCallbackWrapper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKConvenienceConfiguration;
  v12 = [(CKConvenienceConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_group, a4);
    objc_storeStrong((id *)&v13->_convenienceCallbacks, a5);
  }

  return v13;
}

- (CKConvenienceConfiguration)initWithConfiguration:(id)a3 group:(id)a4
{
  return (CKConvenienceConfiguration *)MEMORY[0x1F4181798](self, sel_initWithConfiguration_group_convenienceCallbackWrapper_, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convenienceCallbacks, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (CKOperationConfiguration)configuration
{
  return self->_configuration;
}

- (CKOperationGroup)group
{
  return self->_group;
}

- (CKConvenienceCallbackWrapperProtocol)convenienceCallbacks
{
  return self->_convenienceCallbacks;
}

@end