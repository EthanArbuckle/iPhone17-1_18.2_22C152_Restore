@interface KMFindMySyncDevicesBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMFindMySyncDevicesBridge)init;
- (KMFindMySyncDevicesBridge)initWithDevicesProvider:(id)a3;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMFindMySyncDevicesBridge

- (void).cxx_destruct
{
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(id, void))a4;
  devicesProvider = self->_devicesProvider;
  id v25 = 0;
  v7 = [(KMFindMySyncDevicesProvider *)devicesProvider getSyncDevices:&v25];
  id v8 = v25;
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x22A6168F0](v14);
          LODWORD(v18) = v5[2](v5, v18);
          if (!v18)
          {
            BOOL v12 = 0;
            goto LABEL_18;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
        uint64_t v15 = v14;
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_18:
  }
  else
  {
    v11 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[KMFindMySyncDevicesBridge enumerateItemsWithError:usingBlock:]";
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_22475B000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch FindMy devices with error: %@.", buf, 0x16u);
    }
    KVSetError();
    BOOL v12 = 0;
  }

  return v12;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51070];
}

- (unsigned)cascadeItemType
{
  return 27122;
}

- (KMFindMySyncDevicesBridge)initWithDevicesProvider:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KMFindMySyncDevicesBridge;
  v6 = [(KMFindMySyncDevicesBridge *)&v11 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_devicesProvider, a3), !v7->_devicesProvider))
  {
    v9 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[KMFindMySyncDevicesBridge initWithDevicesProvider:]";
      _os_log_error_impl(&dword_22475B000, v9, OS_LOG_TYPE_ERROR, "%s nil devicesProvider.", buf, 0xCu);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (KMFindMySyncDevicesBridge)init
{
  v3 = objc_alloc_init(_TtC9KoaMapper27KMFindMySyncDevicesProvider);
  v4 = [(KMFindMySyncDevicesBridge *)self initWithDevicesProvider:v3];

  return v4;
}

@end