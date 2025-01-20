@interface AATrustedDeviceListResponse
- (AATrustedDeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)devices;
- (NSNumber)defaultNumberOfDevicesToShow;
@end

@implementation AATrustedDeviceListResponse

- (AATrustedDeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)AATrustedDeviceListResponse;
  v4 = [(AAResponse *)&v35 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (!v4)
  {
LABEL_14:
    v24 = v5;
    goto LABEL_18;
  }
  v6 = [(AAResponse *)v4 responseDictionary];
  v7 = [v6 objectForKeyedSubscript:@"manageDevices"];

  v8 = [v7 objectForKeyedSubscript:@"devices"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [MEMORY[0x1E4F1CA48] array];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v32;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [AATrustedDevice alloc];
              v17 = -[AATrustedDevice initWithDictionary:](v16, "initWithDictionary:", v15, (void)v31);
              [(NSArray *)v9 addObject:v17];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v12);
      }

      devices = v5->_devices;
      v5->_devices = v9;

      v19 = NSNumber;
      v20 = [(AAResponse *)v5 responseDictionary];
      v21 = [v20 objectForKeyedSubscript:@"defaultNumberOfDevicesToShow"];
      uint64_t v22 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v21, "intValue"));
      defaultNumberOfDevicesToShow = v5->_defaultNumberOfDevicesToShow;
      v5->_defaultNumberOfDevicesToShow = (NSNumber *)v22;

      goto LABEL_14;
    }
  }
  v25 = [(AAResponse *)v5 responseDictionary];
  v26 = [v25 objectForKeyedSubscript:@"status"];

  v27 = [(AAResponse *)v5 responseDictionary];
  v28 = [v27 objectForKeyedSubscript:@"status-message"];

  v29 = _AALogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    __int16 v38 = 2112;
    v39 = v28;
    _os_log_impl(&dword_1A11D8000, v29, OS_LOG_TYPE_DEFAULT, "Error: Trusted device list not seen in server response data with status=%@ message=%@", buf, 0x16u);
  }

  v24 = 0;
LABEL_18:

  return v24;
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSNumber)defaultNumberOfDevicesToShow
{
  return self->_defaultNumberOfDevicesToShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNumberOfDevicesToShow, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end