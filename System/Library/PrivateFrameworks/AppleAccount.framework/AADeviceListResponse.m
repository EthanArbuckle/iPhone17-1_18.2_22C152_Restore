@interface AADeviceListResponse
- (AADeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)devices;
@end

@implementation AADeviceListResponse

- (AADeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)AADeviceListResponse;
  v4 = [(AAResponse *)&v27 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    v7 = [v6 objectForKeyedSubscript:@"devices"];

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [AADevice alloc];
              v16 = -[AADevice initWithDictionary:](v15, "initWithDictionary:", v14, (void)v23);
              [(NSArray *)v8 addObject:v16];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v11);
      }

      devices = v5->_devices;
      v5->_devices = v8;
    }
    else
    {
      v18 = [(AAResponse *)v5 responseDictionary];
      devices = [v18 objectForKeyedSubscript:@"status"];

      v19 = [(AAResponse *)v5 responseDictionary];
      v20 = [v19 objectForKeyedSubscript:@"status-message"];

      v21 = _AALogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = devices;
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "Error: Device list not seen in server response data with status=%@ message=%@", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
}

@end