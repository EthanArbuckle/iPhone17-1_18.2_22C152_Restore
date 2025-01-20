@interface LACUIScenePresentationRequest
- (LACUIScenePresentationRequest)initWithUserInterfaceRequest:(id)a3;
- (LACUserInterfaceRequest)userInterfaceRequest;
@end

@implementation LACUIScenePresentationRequest

- (LACUIScenePresentationRequest)initWithUserInterfaceRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIScenePresentationRequest;
  v6 = [(LACUIScenePresentationRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userInterfaceRequest, a3);
  }

  return v7;
}

- (LACUserInterfaceRequest)userInterfaceRequest
{
  return self->_userInterfaceRequest;
}

- (void).cxx_destruct
{
}

@end