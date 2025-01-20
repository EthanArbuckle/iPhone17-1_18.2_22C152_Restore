@interface _LSSpringBoardCall
+ (id)springBoardDeadlockPreventionQueue;
+ (id)springBoardQueue;
- (BOOL)callCompletionHandlerWhenFullyComplete;
- (BSServiceConnectionEndpoint)targetServiceConnectionEndpoint;
- (NSDictionary)launchOptions;
- (NSString)bundleIdentifier;
- (NSXPCConnection)clientXPCConnection;
- (_LSSpringBoardCall)callWithCompletionHandler:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)callSpringBoardWithCompletionHandler:(id)a3;
- (void)lieWithCompletionHandler:(id)a3;
- (void)promptAndCallSpringBoardWithCompletionHandler:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCallCompletionHandlerWhenFullyComplete:(BOOL)a3;
- (void)setClientXPCConnection:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setTargetServiceConnectionEndpoint:(id)a3;
@end

@implementation _LSSpringBoardCall

- (NSDictionary)launchOptions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_launchOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLaunchOptions:(id)a3
{
  id v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (NSDictionary *)[v17 mutableCopy];
  schemeIfNotFileURL = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = 0;

  uint64_t FBSOpenApplicationOptionKeyPayloadURL = getFBSOpenApplicationOptionKeyPayloadURL();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSDictionary *)v5 objectForKey:FBSOpenApplicationOptionKeyPayloadURL];
  v10 = (void *)v9;
  if (v8 && v9)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = v10;
      v10 = 0;
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_9;
  }
  if ([v10 isFileURL]) {
    goto LABEL_9;
  }
  v11 = [v10 scheme];
  uint64_t v12 = [v11 copy];
  v13 = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = (NSString *)v12;

LABEL_8:
LABEL_9:
  if (getBSServiceConnectionEndpointClass())
  {
    v14 = [(NSDictionary *)v5 objectForKey:@"LSTargetBSServiceConnectionEndpointKey"];
    if (v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0;
    }
    targetServiceConnectionEndpoint = v4->_targetServiceConnectionEndpoint;
    v4->_targetServiceConnectionEndpoint = (BSServiceConnectionEndpoint *)v14;

    [(NSDictionary *)v5 removeObjectForKey:@"LSTargetBSServiceConnectionEndpointKey"];
  }
  launchOptions = v4->_launchOptions;
  v4->_launchOptions = v5;

  objc_sync_exit(v4);
}

- (_LSSpringBoardCall)callWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall callWithCompletionHandler:]");
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 104, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  if (self->_schemeIfNotFileURL)
  {
    _LSServer_DatabaseExecutionContext();
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v6);

    v7 = [(_LSSpringBoardCall *)self clientXPCConnection];
    uint64_t v8 = [(_LSSpringBoardCall *)self bundleIdentifier];
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48___LSSpringBoardCall_callWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5230A50;
    v12[4] = self;
    id v13 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v7, v8, schemeIfNotFileURL, 0, v12);
  }
  else
  {
    [(_LSSpringBoardCall *)self callSpringBoardWithCompletionHandler:v5];
  }

  return result;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(_LSSpringBoardCall *)self bundleIdentifier];
  v7 = [(_LSSpringBoardCall *)self clientXPCConnection];
  int v8 = [v7 processIdentifier];
  BOOL v9 = [(_LSSpringBoardCall *)self callCompletionHandlerWhenFullyComplete];
  v10 = @"no";
  if (v9) {
    v10 = @"yes";
  }
  v11 = [v3 stringWithFormat:@"<%@ %p> { bundleID = %@, client = %li, blocking = %@ }", v5, self, v6, v8, v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = [(_LSSpringBoardCall *)self bundleIdentifier];
    [v4 setBundleIdentifier:v5];

    v6 = [(_LSSpringBoardCall *)self launchOptions];
    [v4 setLaunchOptions:v6];

    v7 = [(_LSSpringBoardCall *)self clientXPCConnection];
    [v4 setClientXPCConnection:v7];

    objc_msgSend(v4, "setCallCompletionHandlerWhenFullyComplete:", -[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"));
  }
  return v4;
}

- (BSServiceConnectionEndpoint)targetServiceConnectionEndpoint
{
  return (BSServiceConnectionEndpoint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetServiceConnectionEndpoint:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSXPCConnection)clientXPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientXPCConnection:(id)a3
{
}

- (BOOL)callCompletionHandlerWhenFullyComplete
{
  return self->_callCompletionHandlerWhenFullyComplete;
}

- (void)setCallCompletionHandlerWhenFullyComplete:(BOOL)a3
{
  self->_callCompletionHandlerWhenFullyComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientXPCConnection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_targetServiceConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);

  objc_storeStrong((id *)&self->_schemeIfNotFileURL, 0);
}

+ (id)springBoardQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardQueue]::once != -1) {
    dispatch_once(&+[_LSSpringBoardCall(Private) springBoardQueue]::once, &__block_literal_global_73);
  }
  v2 = (void *)+[_LSSpringBoardCall(Private) springBoardQueue]::result;

  return v2;
}

+ (id)springBoardDeadlockPreventionQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken != -1) {
    dispatch_once(&+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken, &__block_literal_global_64);
  }
  v2 = (void *)+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result;

  return v2;
}

- (void)callSpringBoardWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 200, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  v6 = [(_LSSpringBoardCall *)self targetServiceConnectionEndpoint];
  if (v6) {
    [(id)getFBSOpenApplicationServiceClass() serviceWithEndpoint:v6];
  }
  else {
  v7 = [(id)getFBSOpenApplicationServiceClass() serviceWithDefaultShellEndpoint];
  }
  if (v7)
  {
    FBSOpenApplicationOptionsClass = (void *)getFBSOpenApplicationOptionsClass();
    BOOL v9 = [(_LSSpringBoardCall *)self launchOptions];
    v10 = [FBSOpenApplicationOptionsClass optionsWithDictionary:v9];

    v11 = [(_LSSpringBoardCall *)self clientXPCConnection];

    if (v11)
    {
      FBSProcessHandleClass = (void *)getFBSProcessHandleClass();
      id v13 = [(_LSSpringBoardCall *)self clientXPCConnection];
      v14 = [FBSProcessHandleClass processHandleForNSXPCConnection:v13];
    }
    else
    {
      v14 = [(id)getFBSProcessHandleClass() processHandle];
    }
    if ([(_LSSpringBoardCall *)self callCompletionHandlerWhenFullyComplete])
    {
      MEMORY[0x185310450]();
      v15 = [(id)objc_opt_class() springBoardQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke;
      block[3] = &unk_1E52309B8;
      id v29 = v7;
      v30 = self;
      id v31 = v10;
      id v32 = v14;
      id v33 = v5;
      id v16 = v14;
      id v17 = v10;
      dispatch_async(v15, block);

      v18 = v29;
    }
    else
    {
      MEMORY[0x185310450]();
      v19 = [(id)objc_opt_class() springBoardDeadlockPreventionQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_3;
      v23[3] = &unk_1E52309B8;
      v23[4] = self;
      id v24 = v7;
      id v25 = v10;
      id v26 = v14;
      id v27 = v5;
      id v20 = v14;
      id v21 = v10;
      dispatch_async(v19, v23);

      v18 = v24;
    }
  }
  else
  {
    v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 45, (uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]", 300, 0);
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

- (void)lieWithCompletionHandler:(id)a3
{
  v7 = (void (**)(id, uint64_t, void))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) lieWithCompletionHandler:]");
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 308, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  id v5 = (void *)[(_LSSpringBoardCall *)self copy];
  [v5 setCallCompletionHandlerWhenFullyComplete:1];
  [v5 callWithCompletionHandler:&__block_literal_global_74];
  v7[2](v7, 1, 0);
}

- (void)promptAndCallSpringBoardWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) promptAndCallSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 325, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  if ([(_LSSpringBoardCall *)self callCompletionHandlerWhenFullyComplete])
  {
    v6 = [(_LSSpringBoardCall *)self clientXPCConnection];
    v7 = [(_LSSpringBoardCall *)self bundleIdentifier];
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77___LSSpringBoardCall_Private__promptAndCallSpringBoardWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E5230A50;
    v10[4] = self;
    id v11 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v6, v7, schemeIfNotFileURL, 3, v10);
  }
  else
  {
    [(_LSSpringBoardCall *)self lieWithCompletionHandler:v5];
  }
}

@end