@interface HDFitnessMachineConnectionServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionInterrupted;
- (void)remote_endFitnessMachineConnection;
- (void)remote_endFitnessMachineConnectionForFitnessMachineSessionUUID:(id)a3;
- (void)remote_markClientReady;
- (void)remote_registerClient:(id)a3;
- (void)remote_simulateDisconnect;
@end

@implementation HDFitnessMachineConnectionServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 fitnessMachineManager];

  if (v16)
  {
    v17 = [[HDFitnessMachineConnectionServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v18 = v16;
    fitnessMachineManager = v17->_fitnessMachineManager;
    v17->_fitnessMachineManager = v18;
  }
  else
  {
    fitnessMachineManager = +[NSError hk_featureUnavailableForProfileError];
    if (fitnessMachineManager)
    {
      if (a7) {
        *a7 = fitnessMachineManager;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

+ (id)taskIdentifier
{
  return +[_HKFitnessMachineConnection taskIdentifier];
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKPrivateHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)exportedInterface
{
  return (id)_HKFitnessMachineConnectionServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKFitnessMachineConnectionClientInterface(self, a2);
}

- (void)connectionInterrupted
{
  fitnessMachineManager = self->_fitnessMachineManager;
  id v3 = [(HDFitnessMachineConnectionServer *)self taskUUID];
  [(HDFitnessMachineManager *)fitnessMachineManager clientInvalidatedWithConnectionUUID:v3];
}

- (void)remote_registerClient:(id)a3
{
  fitnessMachineManager = self->_fitnessMachineManager;
  id v5 = a3;
  id v6 = [(HDFitnessMachineConnectionServer *)self taskUUID];
  [(HDFitnessMachineManager *)fitnessMachineManager registerClient:v5 withConnectionUUID:v6];
}

- (void)remote_endFitnessMachineConnection
{
  fitnessMachineManager = self->_fitnessMachineManager;
  id v3 = [(HDFitnessMachineConnectionServer *)self taskUUID];
  [(HDFitnessMachineManager *)fitnessMachineManager endFitnessMachineConnectionWithUUID:v3];
}

- (void)remote_endFitnessMachineConnectionForFitnessMachineSessionUUID:(id)a3
{
  fitnessMachineManager = self->_fitnessMachineManager;
  id v5 = a3;
  id v6 = [(HDFitnessMachineConnectionServer *)self taskUUID];
  [(HDFitnessMachineManager *)fitnessMachineManager endFitnessMachineConnectionForFitnessMachineSessionUUID:v5 withConnectionUUID:v6];
}

- (void)remote_markClientReady
{
  fitnessMachineManager = self->_fitnessMachineManager;
  id v3 = [(HDFitnessMachineConnectionServer *)self taskUUID];
  [(HDFitnessMachineManager *)fitnessMachineManager markClientReadyWithConnectionUUID:v3];
}

- (void)remote_simulateDisconnect
{
}

- (void).cxx_destruct
{
}

@end