@interface CRKLocalDeviceIPAddresses
+ (id)makeIPAddresses;
+ (void)makeIPAddresses;
- (BOOL)containsIPAddress:(id)a3;
- (CRKLocalDeviceIPAddresses)init;
- (NSSet)IPAddresses;
@end

@implementation CRKLocalDeviceIPAddresses

- (CRKLocalDeviceIPAddresses)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKLocalDeviceIPAddresses;
  v2 = [(CRKLocalDeviceIPAddresses *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() makeIPAddresses];
    IPAddresses = v2->_IPAddresses;
    v2->_IPAddresses = (NSSet *)v3;
  }
  return v2;
}

- (BOOL)containsIPAddress:(id)a3
{
  id v4 = a3;
  v5 = [(CRKLocalDeviceIPAddresses *)self IPAddresses];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)makeIPAddresses
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = 0;
  uint64_t v3 = +[CRKIfaddrsEnumerator internetInterfaceEnumeratorWithError:&v19];
  id v4 = v19;
  if (v3)
  {
    v5 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "IPAddress", (void)v15);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    v12 = (void *)[v5 copy];
  }
  else
  {
    if (_CRKLogGeneral_onceToken_44 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_44, &__block_literal_global_119);
    }
    v13 = (void *)_CRKLogGeneral_logObj_44;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_44, OS_LOG_TYPE_ERROR)) {
      +[CRKLocalDeviceIPAddresses makeIPAddresses];
    }
    v12 = objc_opt_new();
  }

  return v12;
}

- (NSSet)IPAddresses
{
  return self->_IPAddresses;
}

- (void).cxx_destruct
{
}

+ (void)makeIPAddresses
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = [a3 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_224C00000, v4, OS_LOG_TYPE_ERROR, "Failed to create ifaddrs enumerator in %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end