@interface HDFitnessMachineConnectionInitiatorServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_forbidConnectionForFitnessMachineSessionUUID:(id)a3;
- (void)remote_permitConnectionForFitnessMachineSessionUUID:(id)a3 activityType:(unint64_t)a4;
- (void)remote_registerConnectionInitiatorClient:(id)a3;
- (void)remote_simulateAccept;
- (void)remote_simulateTapWithFitnessMachineType:(unint64_t)a3;
@end

@implementation HDFitnessMachineConnectionInitiatorServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 fitnessMachineManager];
  v17 = [v16 connectionInitiatorServer];

  if (v17)
  {
    v18 = [[HDFitnessMachineConnectionInitiatorServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    v19 = v17;
    connectionInitiatorServer = v18->_connectionInitiatorServer;
    v18->_connectionInitiatorServer = v19;
  }
  else
  {
    connectionInitiatorServer = +[NSError hk_featureUnavailableForProfileError];
    if (connectionInitiatorServer)
    {
      if (a7) {
        *a7 = connectionInitiatorServer;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v18 = 0;
  }

  return v18;
}

+ (id)taskIdentifier
{
  return +[_HKFitnessMachineConnectionInitiator taskIdentifier];
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKPrivateHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)exportedInterface
{
  return (id)_HKFitnessMachineConnectionInitiatorServerInterface(self, a2);
}

- (id)remoteInterface
{
  return (id)_HKFitnessMachineConnectionInitiatorClientInterface(self, a2);
}

- (void)remote_forbidConnectionForFitnessMachineSessionUUID:(id)a3
{
  if (self) {
    connectionInitiatorServer = self->_connectionInitiatorServer;
  }
  else {
    connectionInitiatorServer = 0;
  }
  v6 = connectionInitiatorServer;
  id v7 = a3;
  id v8 = [(HDFitnessMachineConnectionInitiatorServer *)self taskUUID];
  [(HDFitnessMachineConnectionInitiatorProtocol *)v6 forbidConnectionForFitnessMachineSessionUUID:v7 withConnectionUUID:v8];
}

- (void)remote_permitConnectionForFitnessMachineSessionUUID:(id)a3 activityType:(unint64_t)a4
{
  if (self) {
    connectionInitiatorServer = self->_connectionInitiatorServer;
  }
  else {
    connectionInitiatorServer = 0;
  }
  id v8 = connectionInitiatorServer;
  id v9 = a3;
  id v10 = [(HDFitnessMachineConnectionInitiatorServer *)self taskUUID];
  [(HDFitnessMachineConnectionInitiatorProtocol *)v8 permitConnectionForFitnessMachineSessionUUID:v9 activityType:a4 withConnectionUUID:v10];
}

- (void)remote_registerConnectionInitiatorClient:(id)a3
{
  if (self) {
    connectionInitiatorServer = self->_connectionInitiatorServer;
  }
  else {
    connectionInitiatorServer = 0;
  }
  v6 = connectionInitiatorServer;
  id v7 = a3;
  id v8 = [(HDFitnessMachineConnectionInitiatorServer *)self taskUUID];
  [(HDFitnessMachineConnectionInitiatorProtocol *)v6 registerConnectionInitiatorClient:v7 withConnectionUUID:v8];
}

- (void)remote_simulateAccept
{
  if (self) {
    self = (HDFitnessMachineConnectionInitiatorServer *)self->_connectionInitiatorServer;
  }
  [(HDFitnessMachineConnectionInitiatorServer *)self simulateAccept];
}

- (void)remote_simulateTapWithFitnessMachineType:(unint64_t)a3
{
  if (self) {
    self = (HDFitnessMachineConnectionInitiatorServer *)self->_connectionInitiatorServer;
  }
  [(HDFitnessMachineConnectionInitiatorServer *)self simulateTapWithFitnessMachineType:a3];
}

- (void).cxx_destruct
{
}

@end