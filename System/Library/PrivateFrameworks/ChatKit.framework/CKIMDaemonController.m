@interface CKIMDaemonController
+ (id)sharedInstance;
+ (void)beginSimulatingDaemon;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3;
- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5;
- (CKIMDaemonController)init;
- (NSArray)listeners;
- (NSProtocolChecker)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)queryController;
- (id)synchronousRemoteDaemon;
- (void)forwardInvocation:(id)a3;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)setListeners:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation CKIMDaemonController

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global_112);
  }
  v2 = (void *)sharedInstance_sInstance_1;

  return v2;
}

void __38__CKIMDaemonController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKIMDaemonController);
  v1 = (void *)sharedInstance_sInstance_1;
  sharedInstance_sInstance_1 = (uint64_t)v0;
}

+ (void)beginSimulatingDaemon
{
  if (beginSimulatingDaemon_onceToken != -1) {
    dispatch_once(&beginSimulatingDaemon_onceToken, &__block_literal_global_36);
  }
}

void __45__CKIMDaemonController_beginSimulatingDaemon__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, sel_sharedInstance);
  v2 = (objc_class *)objc_opt_class();
  v3 = class_getClassMethod(v2, sel_sharedInstance);
  method_exchangeImplementations(ClassMethod, v3);
  id v5 = [MEMORY[0x1E4F6BC98] sharedInstance];
  v4 = [v5 listener];
  [v4 setupComplete:1 info:&unk_1EDF17B18];
}

- (CKIMDaemonController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKIMDaemonController;
  v2 = [(IMDaemonController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28FA8]) initWithProtocol:&unk_1EE10AB50];
    protocol = v2->_protocol;
    v2->_protocol = (NSProtocolChecker *)v3;
  }
  return v2;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(NSProtocolChecker *)self->_protocol methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v3 = (const char *)[a3 selector];
  if (_IMWillLog())
  {
    NSStringFromSelector(v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();
  }
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = [(CKIMDaemonController *)self listeners];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) simulatedDaemon:self willSendBalloonPayload:v10 attachments:v11 messageGUID:v12 bundleID:v13];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  return 1;
}

- (id)synchronousRemoteDaemon
{
  return 0;
}

- (id)queryController
{
  return 0;
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

@end