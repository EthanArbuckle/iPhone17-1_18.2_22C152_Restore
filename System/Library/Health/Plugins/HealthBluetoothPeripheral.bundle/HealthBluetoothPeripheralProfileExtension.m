@interface HealthBluetoothPeripheralProfileExtension
- (HDBTLEHeartRateDataCollector)blteHeartRateDataCollector;
- (HDFitnessMachineManager)fitnessManager;
- (HDHealthServiceManager)serviceManager;
- (HDServiceConnectionManager)serviceConnectionManager;
- (HealthBluetoothPeripheralProfileExtension)initWithProfile:(id)a3;
- (HealthBluetoothPeripheralProfileExtension)initWithProfile:(id)a3 centralManager:(id)a4 queue:(id)a5;
- (id)dataCollectorsForProfile:(id)a3;
- (void)terminationCleanup;
- (void)unitTest_setServiceManager:(id)a3;
@end

@implementation HealthBluetoothPeripheralProfileExtension

- (HealthBluetoothPeripheralProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HealthBluetoothPeripheralProfileExtension;
  v5 = [(HealthBluetoothPeripheralProfileExtension *)&v21 init];
  if (v5)
  {
    v6 = [v4 daemon];
    v7 = [v6 behavior];
    unsigned int v8 = [v7 isAppleWatch];

    if (v8)
    {
      v9 = [[HDFitnessMachineManager alloc] initWithProfile:v4];
      fitnessManager = v5->_fitnessManager;
      v5->_fitnessManager = v9;
    }
    v11 = [[HDHealthServiceManager alloc] initWithProfile:v4];
    serviceManager = v5->_serviceManager;
    v5->_serviceManager = v11;

    v13 = +[_HKBehavior sharedBehavior];
    v14 = [v13 features];
    unsigned __int8 v15 = [v14 pulse];

    if ((v15 & 1) == 0)
    {
      v16 = [[HDBTLEHeartRateDataCollector alloc] initWithProfile:v4];
      blteHeartRateDataCollector = v5->_blteHeartRateDataCollector;
      v5->_blteHeartRateDataCollector = v16;
    }
    v18 = [[HDServiceConnectionManager alloc] initWithProfile:v4 serviceManager:v5->_serviceManager btleDataCollector:v5->_blteHeartRateDataCollector];
    serviceConnectionManager = v5->_serviceConnectionManager;
    v5->_serviceConnectionManager = v18;
  }
  return v5;
}

- (void)terminationCleanup
{
}

- (id)dataCollectorsForProfile:(id)a3
{
  id v4 = +[_HKBehavior sharedBehavior];
  v5 = [v4 features];
  unsigned __int8 v6 = [v5 pulse];

  if (v6)
  {
    v7 = &__NSArray0__struct;
  }
  else
  {
    blteHeartRateDataCollector = self->_blteHeartRateDataCollector;
    v7 = +[NSArray arrayWithObjects:&blteHeartRateDataCollector count:1];
  }

  return v7;
}

- (HealthBluetoothPeripheralProfileExtension)initWithProfile:(id)a3 centralManager:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HealthBluetoothPeripheralProfileExtension;
  v11 = [(HealthBluetoothPeripheralProfileExtension *)&v27 init];
  if (v11)
  {
    v12 = [v8 daemon];
    v13 = [v12 behavior];
    unsigned int v14 = [v13 supportsWorkouts];

    if (v14)
    {
      unsigned __int8 v15 = [[HDFitnessMachineManager alloc] initWithProfile:v8];
      fitnessManager = v11->_fitnessManager;
      v11->_fitnessManager = v15;
    }
    v17 = [[HDHealthServiceManager alloc] initWithProfile:v8 centralManager:v9 queue:v10];
    serviceManager = v11->_serviceManager;
    v11->_serviceManager = v17;

    v19 = +[_HKBehavior sharedBehavior];
    v20 = [v19 features];
    unsigned __int8 v21 = [v20 pulse];

    if ((v21 & 1) == 0)
    {
      v22 = [[HDBTLEHeartRateDataCollector alloc] initWithProfile:v8];
      blteHeartRateDataCollector = v11->_blteHeartRateDataCollector;
      v11->_blteHeartRateDataCollector = v22;
    }
    v24 = [[HDServiceConnectionManager alloc] initWithProfile:v8 serviceManager:v11->_serviceManager btleDataCollector:v11->_blteHeartRateDataCollector];
    serviceConnectionManager = v11->_serviceConnectionManager;
    v11->_serviceConnectionManager = v24;
  }
  return v11;
}

- (void)unitTest_setServiceManager:(id)a3
{
}

- (HDFitnessMachineManager)fitnessManager
{
  return self->_fitnessManager;
}

- (HDServiceConnectionManager)serviceConnectionManager
{
  return self->_serviceConnectionManager;
}

- (HDHealthServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (HDBTLEHeartRateDataCollector)blteHeartRateDataCollector
{
  return self->_blteHeartRateDataCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blteHeartRateDataCollector, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_serviceConnectionManager, 0);

  objc_storeStrong((id *)&self->_fitnessManager, 0);
}

@end