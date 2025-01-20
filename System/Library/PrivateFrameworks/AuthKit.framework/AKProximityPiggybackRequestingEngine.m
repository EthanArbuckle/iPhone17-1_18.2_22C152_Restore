@interface AKProximityPiggybackRequestingEngine
- (BOOL)isActivated;
- (void)activate;
- (void)invalidate;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)prepareWithController:(id)a3 queue:(id)a4;
@end

@implementation AKProximityPiggybackRequestingEngine

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AKProximityPiggybackRequestingEngine;
  [(AKProximityPiggybackEngine *)&v9 prepareWithController:a3 queue:a4];
  id v5 = objc_alloc((Class)CBPeripheralManager);
  v6 = [(AKProximityPiggybackEngine *)self queue];
  v7 = (CBPeripheralManager *)[v5 initWithDelegate:self queue:v6 options:0];
  peripheralManager = self->_peripheralManager;
  self->_peripheralManager = v7;
}

- (void)activate
{
  v3 = [(AKProximityPiggybackEngine *)self presenceSID];
  v4 = +[CBUUID UUIDWithNSUUID:v3];

  id v5 = [objc_alloc((Class)CBMutableService) initWithType:v4 primary:1];
  [(CBPeripheralManager *)self->_peripheralManager addService:v5];
  peripheralManager = self->_peripheralManager;
  v12 = CBAdvertisementDataServiceUUIDsKey;
  v7 = [v5 UUID];
  v11 = v7;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  v13 = v8;
  objc_super v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [(CBPeripheralManager *)peripheralManager startAdvertising:v9];

  v10.receiver = self;
  v10.super_class = (Class)AKProximityPiggybackRequestingEngine;
  [(AKProximityPiggybackEngine *)&v10 activate];
}

- (void)invalidate
{
  peripheralManager = self->_peripheralManager;
  if (peripheralManager)
  {
    [(CBPeripheralManager *)peripheralManager stopAdvertising];
    v4 = self->_peripheralManager;
    self->_peripheralManager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AKProximityPiggybackRequestingEngine;
  [(AKProximityPiggybackEngine *)&v5 invalidate];
}

- (BOOL)isActivated
{
  return self->_peripheralManager != 0;
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [(AKProximityPiggybackEngine *)self controller];
  [v5 proximityEngine:self managerDidUpdateState:v4];
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AKLogSystem();
  objc_super v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412802;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@: Peripheral manager (%@) failed to start advertising with error (%@)", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Peripheral manager (%@) started advertising", (uint8_t *)&v10, 0x16u);
  }
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _AKLogSystem();
  __int16 v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138413058;
      __int16 v14 = self;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Peripheral manager (%@) failed to add service (%@) with error (%@)", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Peripheral manager (%@) added service (%@)", (uint8_t *)&v13, 0x20u);
  }
}

- (void).cxx_destruct
{
}

@end