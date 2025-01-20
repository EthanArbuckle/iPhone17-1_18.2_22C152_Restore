@interface DDSTRIClient
- (DDSTRIClient)initWithClient:(id)a3;
- (TRIClient)client;
- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)experimentIdentifiersWithNamespaceName:(id)a3;
- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4;
- (void)refresh;
- (void)removeUpdateHandlerForToken:(id)a3;
@end

@implementation DDSTRIClient

- (DDSTRIClient)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSTRIClient;
  v6 = [(DDSTRIClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (id)experimentIdentifiersWithNamespaceName:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSTRIClient *)self client];
  v6 = [v5 experimentIdentifiersWithNamespaceName:v4];

  return v6;
}

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(DDSTRIClient *)self client];
  objc_super v9 = [v8 levelForFactor:v7 withNamespaceName:v6];

  return v9;
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(DDSTRIClient *)self client];
  v12 = [v11 addUpdateHandlerForNamespaceName:v10 queue:v9 usingBlock:v8];

  return v12;
}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSTRIClient *)self client];
  [v5 removeUpdateHandlerForToken:v4];
}

- (void)refresh
{
  id v2 = [(DDSTRIClient *)self client];
  [v2 refresh];
}

- (TRIClient)client
{
  return (TRIClient *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end