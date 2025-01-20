@interface EKRemoteXPCConnectionFactory
+ (BOOL)_tryRegisterNewConnection;
+ (id)sharedInstance;
+ (void)_unregisterConnection;
- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4;
@end

@implementation EKRemoteXPCConnectionFactory

- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() _tryRegisterNewConnection])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.calaccessd" options:0];
    v9 = GetSharedXPCInterfaceForCADInterface();
    [v8 setRemoteObjectInterface:v9];

    v10 = GetSharedXPCInterfaceForCADClientInterface();
    [v8 setExportedInterface:v10];

    [v8 setExportedObject:v6];
    [v8 setInterruptionHandler:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__EKRemoteXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke;
    v12[3] = &unk_1E5B96E08;
    v12[4] = self;
    [v8 setInvalidationHandler:v12];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

+ (BOOL)_tryRegisterNewConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  unint64_t v2 = sNumberOfOpenConnections;
  if ((unint64_t)sNumberOfOpenConnections <= 9) {
    ++sNumberOfOpenConnections;
  }
  BOOL v3 = v2 < 0xA;
  os_unfair_lock_unlock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  return v3;
}

uint64_t __87__EKRemoteXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke()
{
  v0 = objc_opt_class();

  return [v0 _unregisterConnection];
}

+ (void)_unregisterConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  --sNumberOfOpenConnections;

  os_unfair_lock_unlock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
}

uint64_t __46__EKRemoteXPCConnectionFactory_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end