@interface DSAdvertiseManager
- (BOOL)_getAdvertisementFields;
- (DSXPCServer)xpcDaemonServer;
- (OS_dispatch_queue)dispatchQueue;
- (unint64_t)dsAdvertiseFlags;
- (void)_setDSActionFieldsInAdvertiser:(id)a3;
- (void)_setDSInfoFieldsInAdvertiser:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDsAdvertiseFlags:(unint64_t)a3;
- (void)setXpcDaemonServer:(id)a3;
- (void)startAdvertising;
- (void)stopAdvertising;
@end

@implementation DSAdvertiseManager

- (void)startAdvertising
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSAdvertiseManager != -1) {
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  }
  v3 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Start Advertising", buf, 2u);
  }
  v4 = self->_bleAdvertiser;
  if (v4) {
    goto LABEL_12;
  }
  v4 = (CBAdvertiser *)objc_alloc_init(MEMORY[0x263EFEEF8]);
  [(CBAdvertiser *)v4 setDispatchQueue:self->_dispatchQueue];
  if ([(DSAdvertiseManager *)self _getAdvertisementFields])
  {
    [(DSAdvertiseManager *)self _setDSInfoFieldsInAdvertiser:v4];
    [(DSAdvertiseManager *)self _setDSActionFieldsInAdvertiser:v4];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __38__DSAdvertiseManager_startAdvertising__block_invoke;
    v12 = &unk_2646D5060;
    v5 = v4;
    v13 = v5;
    v14 = self;
    [(CBAdvertiser *)v5 activateWithCompletion:&v9];
    objc_storeStrong((id *)&self->_bleAdvertiser, v4);
    if (onceTokenDSAdvertiseManager != -1) {
      dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
    }
    v6 = logObjDSAdvertiseManager;
    if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "Starting Advertiser", buf, 2u);
    }

    v4 = v5;
LABEL_12:
    if ([(DSAdvertiseManager *)self _getAdvertisementFields])
    {
      [(DSAdvertiseManager *)self _setDSInfoFieldsInAdvertiser:v4];
      [(DSAdvertiseManager *)self _setDSActionFieldsInAdvertiser:v4];
    }
    else
    {
      if (onceTokenDSAdvertiseManager != -1) {
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      }
      v7 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "Advertisement fields not set", buf, 2u);
      }
      [(DSAdvertiseManager *)self stopAdvertising];
    }
    goto LABEL_19;
  }
  if (onceTokenDSAdvertiseManager != -1) {
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  }
  v8 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "Advertisement fields not set", buf, 2u);
  }
LABEL_19:
}

void __38__DSAdvertiseManager_startAdvertising__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 8))
  {
    if (v3)
    {
      if (onceTokenDSAdvertiseManager != -1) {
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      }
      v5 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_ERROR, "Failed to activate CBAdvertiser", buf, 2u);
      }
      [*(id *)(a1 + 32) invalidate];
    }
    else
    {
      if (onceTokenDSAdvertiseManager != -1) {
        dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
      }
      v6 = logObjDSAdvertiseManager;
      if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "CBAdvertiser Activated", v7, 2u);
      }
    }
  }
}

- (BOOL)_getAdvertisementFields
{
  id v3 = [(DSXPCServer *)self->_xpcDaemonServer myDeviceContext];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 coordinationStatus];
    unint64_t v6 = 0x100802040100uLL >> (8 * v5);
    if (v5 >= 6) {
      LOBYTE(v6) = 0;
    }
    self->_cbDSActionFlags = v6;
    self->_cbTieBreaker = [v4 tiebreaker];
    int v7 = [v4 vehicleState];
    if (v7 == 2) {
      unsigned __int8 v8 = 2;
    }
    else {
      unsigned __int8 v8 = v7 == 1;
    }
    self->_cbVehicleState = v8;
    int v9 = [v4 vehicleConfidence];
    if (v9 == 15) {
      unsigned __int8 v10 = 15;
    }
    else {
      unsigned __int8 v10 = 0;
    }
    if (v9 == 11) {
      unsigned __int8 v10 = 11;
    }
    if (v9 == 7) {
      char v11 = 7;
    }
    else {
      char v11 = 0;
    }
    if (v9 == 4) {
      char v11 = 4;
    }
    if (v9 <= 10) {
      unsigned __int8 v10 = v11;
    }
    self->_cbVehicleConfidence = v10;
  }

  return v4 != 0;
}

- (void)_setDSActionFieldsInAdvertiser:(id)a3
{
  if ((self->_dsAdvertiseFlags & 4) != 0)
  {
    [a3 setDsActionFlags:self->_cbDSActionFlags];
    uint64_t cbTieBreaker = self->_cbTieBreaker;
    uint64_t v4 = 54;
  }
  else
  {
    [a3 setDsActionFlags:0];
    uint64_t cbTieBreaker = 0;
    uint64_t v4 = 0;
  }
  [a3 setDsActionTieBreaker:cbTieBreaker];
  [a3 setNearbyActionType:v4];
}

- (void)_setDSInfoFieldsInAdvertiser:(id)a3
{
  if ((self->_dsAdvertiseFlags & 2) != 0)
  {
    [a3 setDsInfoVehicleState:self->_cbVehicleState];
    uint64_t cbVehicleConfidence = self->_cbVehicleConfidence;
  }
  else
  {
    [a3 setDsInfoVehicleState:0];
    uint64_t cbVehicleConfidence = 0;
  }
  [a3 setDsInfoVehicleConfidence:cbVehicleConfidence];
}

- (void)stopAdvertising
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSAdvertiseManager != -1) {
    dispatch_once(&onceTokenDSAdvertiseManager, &__block_literal_global_4);
  }
  id v3 = logObjDSAdvertiseManager;
  if (os_log_type_enabled((os_log_t)logObjDSAdvertiseManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Stop Advertising", v5, 2u);
  }
  [(CBAdvertiser *)self->_bleAdvertiser invalidate];
  bleAdvertiser = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (DSXPCServer)xpcDaemonServer
{
  return self->_xpcDaemonServer;
}

- (void)setXpcDaemonServer:(id)a3
{
}

- (unint64_t)dsAdvertiseFlags
{
  return self->_dsAdvertiseFlags;
}

- (void)setDsAdvertiseFlags:(unint64_t)a3
{
  self->_dsAdvertiseFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDaemonServer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

@end