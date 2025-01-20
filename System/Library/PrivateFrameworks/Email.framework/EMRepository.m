@interface EMRepository
+ (NSXPCInterface)remoteInterface;
- (EFScheduler)observerScheduler;
- (EMRemoteConnection)connection;
- (EMRepository)initWithRemoteConnection:(id)a3;
- (Protocol)interfaceProtocol;
- (id)initForTesting;
- (id)performQuery:(id)a3 withObserver:(id)a4;
- (id)trampoliningObserverForObserver:(id)a3;
- (void)prepareRepositoryObjects:(id)a3;
- (void)refreshQueryWithObserver:(id)a3;
- (void)setObserverScheduler:(id)a3;
@end

@implementation EMRepository

- (void)prepareRepositoryObjects:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "repository", (void)v11);
        BOOL v10 = v9 == 0;

        if (v10) {
          [v8 setRepository:self];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)trampoliningObserverForObserver:(id)a3
{
  id v4 = a3;
  if (+[EMForceBlankCellsController shouldBlockXPCQueue])
  {
    +[EMForceBlankCellsController blockForRandomDurationWithMessage:@"Block trampolining"];
  }
  uint64_t v5 = [(EMRepository *)self observerScheduler];
  uint64_t v6 = [v5 performWithObject:v4];

  return v6;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (EMRepository)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMRepository;
  uint64_t v6 = [(EMRepository *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = (void *)MEMORY[0x1E4F60F28];
    v9 = [NSString stringWithFormat:@"com.apple.email.%@.observer", objc_opt_class()];
    uint64_t v10 = [v8 serialDispatchQueueSchedulerWithName:v9];
    observerScheduler = v7->_observerScheduler;
    v7->_observerScheduler = (EFScheduler *)v10;
  }
  return v7;
}

+ (NSXPCInterface)remoteInterface
{
}

- (id)initForTesting
{
  return [(EMRepository *)self initWithRemoteConnection:0];
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(EMRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMRepository performQuery:withObserver:]", "EMRepository.m", 45, "0");
}

- (void)refreshQueryWithObserver:(id)a3
{
  id v5 = a3;
  [(EMRepository *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[EMRepository refreshQueryWithObserver:]", "EMRepository.m", 49, "0");
}

- (void)setObserverScheduler:(id)a3
{
}

- (Protocol)interfaceProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceProtocol, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end