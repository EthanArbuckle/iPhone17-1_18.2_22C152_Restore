@interface FCHealthServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (FCHealthServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInvalidated;
- (void)handleRegisterGoalProgressConfigurationData:(id)a3 service:(id)a4 completion:(id)a5;
- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5;
@end

@implementation FCHealthServer

- (FCHealthServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCHealthServer;
  v12 = [(HDStandardTaskServer *)&v19 initWithUUID:v11 configuration:a4 client:a5 delegate:a6];
  v13 = v12;
  if (v12)
  {
    v14 = [(HDStandardTaskServer *)v12 profile];
    v15 = [v14 profileExtensionsConformingToProtocol:&unk_1F2B4C4F0];
    uint64_t v16 = [v15 firstObject];
    profileExtension = v13->_profileExtension;
    v13->_profileExtension = (FCHealthProfileExtending *)v16;

    objc_storeStrong((id *)&v13->_taskUUID, a3);
    v13->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F4119AA0](self, a2);
}

- (id)remoteInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3B3E000, v3, OS_LOG_TYPE_DEFAULT, "[FCHealthServer] XPC connection invalidated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)FCHealthServer;
  [(HDStandardTaskServer *)&v4 connectionInvalidated];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F62040];
}

- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  v9 = [(FCHealthProfileExtending *)self->_profileExtension fitnessCoachingHealthService];
  if (a3 == 1) {
    [(FCHealthServer *)self handleRegisterGoalProgressConfigurationData:v10 service:v9 completion:v8];
  }
}

- (void)handleRegisterGoalProgressConfigurationData:(id)a3 service:(id)a4 completion:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F620E0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[[v7 alloc] initWithTransportData:v10];

  [v9 registerGoalProgressConfiguration:v11 completion:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskUUID, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_storeStrong((id *)&self->_daemonTransaction, 0);
}

@end