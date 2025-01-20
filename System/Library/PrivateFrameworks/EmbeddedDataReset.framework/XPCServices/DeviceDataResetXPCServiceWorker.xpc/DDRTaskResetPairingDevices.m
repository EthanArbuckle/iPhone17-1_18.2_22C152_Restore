@interface DDRTaskResetPairingDevices
- (CUPairingManager)pairingManager;
- (NSArray)pairedDevice;
- (NSError)fetchError;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)configure;
- (void)run;
- (void)setFetchError:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPairingManager:(id)a3;
@end

@implementation DDRTaskResetPairingDevices

- (void)configure
{
  v3 = (CUPairingManager *)objc_alloc_init((Class)CUPairingManager);
  pairingManager = self->_pairingManager;
  self->_pairingManager = v3;

  objc_initWeak(&location, self);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = self->_pairingManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005F50;
  v11[3] = &unk_100010738;
  objc_copyWeak(&v13, &location);
  v7 = v5;
  v12 = v7;
  [(CUPairingManager *)v6 getPairedPeersWithOptions:4 completion:v11];
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = (NSError *)[objc_alloc((Class)NSError) initWithDomain:@"DeviceDataResetError" code:0 userInfo:0];
    fetchError = self->_fetchError;
    self->_fetchError = v9;
  }
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (void)run
{
  if (self->_fetchError || ![(NSArray *)self->_pairedDevice count])
  {
    DDRLogForCategory(0);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      fetchError = self->_fetchError;
      NSUInteger v5 = [(NSArray *)self->_pairedDevice count];
      *(_DWORD *)buf = 138412546;
      v24 = fetchError;
      __int16 v25 = 2048;
      NSUInteger v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, &v3->super, OS_LOG_TYPE_DEFAULT, "Fetch error: %@, pairedDeviceCount = %lu", buf, 0x16u);
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v3 = self->_pairedDevice;
    id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v3);
          }
          v10 = *(NSError **)(*((void *)&v18 + 1) + 8 * (void)v9);
          dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
          pairingManager = self->_pairingManager;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100006294;
          v16[3] = &unk_100010760;
          v16[4] = v10;
          id v13 = v11;
          v17 = v13;
          [(CUPairingManager *)pairingManager removePairedPeer:v10 options:4 completion:v16];
          dispatch_time_t v14 = dispatch_time(0, 5000000000);
          if (dispatch_semaphore_wait(v13, v14))
          {
            v15 = DDRLogForCategory(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed removing pairedpeer %@ due to timeout", buf, 0xCu);
            }
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetPairingDevices";
}

- (double)estimatedTimeOfCompletion
{
  NSUInteger v2 = [(NSArray *)self->_pairedDevice count];
  double result = 1.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (NSArray)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
}

@end