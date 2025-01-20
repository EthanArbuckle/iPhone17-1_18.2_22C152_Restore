@interface BiometricKitXPCExportedClientObject
- (BOOL)clientAppIsBackground;
- (BOOL)clientAppIsInactive;
- (BOOL)delegateRegistered;
- (BiometricKitXPCExportedClientObject)initWithClientID:(unint64_t)a3 clientInfo:(id)a4 exportedObject:(id)a5;
- (BiometricKitXPCExportedObject)exportedObject;
- (NSDictionary)clientInfo;
- (id)description;
- (id)name;
- (unint64_t)clientID;
- (void)enrollFeedback:(id)a3;
- (void)enrollResult:(id)a3;
- (void)enrollResult:(id)a3 details:(id)a4;
- (void)enrollUpdate:(id)a3;
- (void)homeButtonPressed;
- (void)matchResult:(id)a3 details:(id)a4;
- (void)setClientAppIsBackground:(BOOL)a3;
- (void)setClientAppIsInactive:(BOOL)a3;
- (void)setDelegateRegistered:(BOOL)a3;
- (void)statusMessage:(unsigned int)a3;
- (void)statusMessage:(unsigned int)a3 details:(id)a4;
- (void)taskResumeStatus:(int)a3;
- (void)templateUpdate:(id)a3 details:(id)a4;
- (void)touchIDButtonPressed:(BOOL)a3;
@end

@implementation BiometricKitXPCExportedClientObject

- (BiometricKitXPCExportedClientObject)initWithClientID:(unint64_t)a3 clientInfo:(id)a4 exportedObject:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitXPCExportedClientObject;
  v10 = [(BiometricKitXPCExportedClientObject *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_clientID = a3;
    uint64_t v12 = [v8 copy];
    clientInfo = v11->_clientInfo;
    v11->_clientInfo = (NSDictionary *)v12;

    objc_storeWeak((id *)&v11->_exportedObject, v9);
  }

  return v11;
}

- (id)name
{
  v3 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"BKClientBundleIdentifier"];
  if (v3) {
    v4 = @"BKClientBundleIdentifier";
  }
  else {
    v4 = @"BKClientProcessName";
  }
  v5 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(BiometricKitXPCExportedClientObject *)self name];
  v7 = [(NSDictionary *)self->_clientInfo objectForKeyedSubscript:@"BKClientConnectionId"];
  id v8 = [v3 stringWithFormat:@"<%@: %p: %@[%@]>", v5, self, v6, v7];

  return v8;
}

- (void)setDelegateRegistered:(BOOL)a3
{
  self->_delegateRegistered = a3;
}

- (void)setClientAppIsBackground:(BOOL)a3
{
  self->_clientAppIsBackground = a3;
}

- (void)setClientAppIsInactive:(BOOL)a3
{
  self->_clientAppIsInactive = a3;
}

- (BiometricKitXPCExportedObject)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  return (BiometricKitXPCExportedObject *)WeakRetained;
}

- (void)enrollResult:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v5 = [WeakRetained isClient:self->_clientID entitled:2 forMethod:"-[BiometricKitXPCExportedClientObject enrollResult:]"];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    v7 = [v6 connection];
    id v8 = [v7 remoteObjectProxy];
    [v8 enrollResult:v9 details:0 client:self->_clientID];
  }
}

- (void)enrollResult:(id)a3 details:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v8 = [WeakRetained isClient:self->_clientID entitled:2 forMethod:"-[BiometricKitXPCExportedClientObject enrollResult:details:]"];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    v10 = [v9 connection];
    v11 = [v10 remoteObjectProxy];
    [v11 enrollResult:v12 details:v6 client:self->_clientID];
  }
}

- (void)enrollUpdate:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v5 = [WeakRetained isClient:self->_clientID entitled:2 forMethod:"-[BiometricKitXPCExportedClientObject enrollUpdate:]"];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    v7 = [v6 connection];
    int v8 = [v7 remoteObjectProxy];
    [v8 enrollUpdate:v9 client:self->_clientID];
  }
}

- (void)enrollFeedback:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v5 = [WeakRetained isClient:self->_clientID entitled:2 forMethod:"-[BiometricKitXPCExportedClientObject enrollFeedback:]"];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    v7 = [v6 connection];
    int v8 = [v7 remoteObjectProxy];
    [v8 enrollFeedback:v9 client:self->_clientID];
  }
}

- (void)matchResult:(id)a3 details:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v8 = [WeakRetained isClient:self->_clientID entitled:4 forMethod:"-[BiometricKitXPCExportedClientObject matchResult:details:]"];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    v10 = [v9 connection];
    v11 = [v10 remoteObjectProxy];
    [v11 matchResult:v12 details:v6 client:self->_clientID];
  }
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_exportedObject = &self->_exportedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v7 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject statusMessage:]"];

  if (v7)
  {
    id v10 = objc_loadWeakRetained((id *)p_exportedObject);
    int v8 = [v10 connection];
    id v9 = [v8 remoteObjectProxy];
    [v9 statusMessage:v3 client:self->_clientID];
  }
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v7 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject statusMessage:details:]"];

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_exportedObject);
    id v9 = [v8 connection];
    id v10 = [v9 remoteObjectProxy];
    [v10 statusMessage:v4 details:v11 client:self->_clientID];
  }
}

- (void)homeButtonPressed
{
  p_exportedObject = &self->_exportedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v5 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject homeButtonPressed]"];

  if (v5)
  {
    id v8 = objc_loadWeakRetained((id *)p_exportedObject);
    id v6 = [v8 connection];
    int v7 = [v6 remoteObjectProxy];
    [v7 homeButtonPressed:self->_clientID];
  }
}

- (void)touchIDButtonPressed:(BOOL)a3
{
  BOOL v3 = a3;
  p_exportedObject = &self->_exportedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v7 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject touchIDButtonPressed:]"];

  if (v7)
  {
    id v10 = objc_loadWeakRetained((id *)p_exportedObject);
    id v8 = [v10 connection];
    id v9 = [v8 remoteObjectProxy];
    [v9 touchIDButtonPressed:v3 client:self->_clientID];
  }
}

- (void)templateUpdate:(id)a3 details:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v8 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject templateUpdate:details:]"];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    id v10 = [v9 connection];
    id v11 = [v10 remoteObjectProxy];
    [v11 templateUpdate:v12 details:v6 client:self->_clientID];
  }
}

- (void)taskResumeStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_exportedObject = &self->_exportedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  int v7 = [WeakRetained isClient:self->_clientID entitled:1 forMethod:"-[BiometricKitXPCExportedClientObject taskResumeStatus:]"];

  if (v7)
  {
    id v10 = objc_loadWeakRetained((id *)p_exportedObject);
    int v8 = [v10 connection];
    id v9 = [v8 remoteObjectProxy];
    [v9 taskResumeStatus:v3 client:self->_clientID];
  }
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)delegateRegistered
{
  return self->_delegateRegistered;
}

- (BOOL)clientAppIsBackground
{
  return self->_clientAppIsBackground;
}

- (BOOL)clientAppIsInactive
{
  return self->_clientAppIsInactive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end