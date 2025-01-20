@interface CATNetworkPowerPrimitivesBackedAssertionProvider
- (CATNetworkPowerPrimitives)networkPowerPrimitives;
- (CATNetworkPowerPrimitivesBackedAssertionProvider)initWithNetworkPowerPrimitives:(id)a3;
- (id)acquireAssertion;
@end

@implementation CATNetworkPowerPrimitivesBackedAssertionProvider

- (CATNetworkPowerPrimitivesBackedAssertionProvider)initWithNetworkPowerPrimitives:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATNetworkPowerPrimitivesBackedAssertionProvider;
  v6 = [(CATNetworkPowerPrimitivesBackedAssertionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkPowerPrimitives, a3);
  }

  return v7;
}

- (id)acquireAssertion
{
  v2 = [(CATNetworkPowerPrimitivesBackedAssertionProvider *)self networkPowerPrimitives];
  v3 = [v2 assertNetworkPowerOn];

  return v3;
}

- (CATNetworkPowerPrimitives)networkPowerPrimitives
{
  return self->_networkPowerPrimitives;
}

- (void).cxx_destruct
{
}

@end