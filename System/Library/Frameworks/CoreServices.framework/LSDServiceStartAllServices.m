@interface LSDServiceStartAllServices
@end

@implementation LSDServiceStartAllServices

void ___LSDServiceStartAllServices_block_invoke()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)_LSDServiceStartAllServices::services;
  _LSDServiceStartAllServices::services = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = (void *)_LSDServiceStartAllServices::listeners;
  _LSDServiceStartAllServices::listeners = (uint64_t)v2;

  *(void *)&long long buf = NSClassFromString(&cfstr_Lsdreadservice_0.isa);
  *((void *)&buf + 1) = NSClassFromString(&cfstr_Lsdmodifyservi_0.isa);
  Class v22 = NSClassFromString(&cfstr_Lsdopenservice_0.isa);
  Class v23 = NSClassFromString(&cfstr_Lsddeviceident_0.isa);
  Class v24 = NSClassFromString(&cfstr_Lsdiconservice.isa);
  Class v25 = NSClassFromString(&cfstr_Lsdrebuildserv_0.isa);
  Class v26 = NSClassFromString(&cfstr_Lsdappprotecti_7.isa);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:7];
  if (!v4)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"LSDService.mm", 334, @"Failed to get LSDService subclass list for process %lu", getpid());
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 XPCConnectionIsAlwaysPrivileged])
        {
          SharedInstance = (void *)__LSDefaultsGetSharedInstance();
          if ([SharedInstance proxyUIDForUID:getuid()]) {
            continue;
          }
        }
        if ([v10 isEnabled]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v12 = _LSDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v5 componentsJoinedByString:@", "];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Starting services: %@", (uint8_t *)&buf, 0xCu);
  }
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_37_0];
}

void ___LSDServiceStartAllServices_block_invoke_34(uint64_t a1, void *a2)
{
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  objc_msgSend(SharedInstance, "serviceNameForConnectionType:lightweightSystemService:", objc_msgSend(a2, "connectionType"), objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    [v6 handleFailureInFunction:v7, @"LSDService.mm", 356, @"Failed to create XPC service name for class %@", a2 file lineNumber description];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v11];
  if (v4)
  {
    id v5 = (void *)[objc_alloc((Class)a2) initWithXPCListener:v4];
    if (!v5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
      [v9 handleFailureInFunction:v10, @"LSDService.mm", 365, @"Failed to create XPC service object of class %@", a2 file lineNumber description];
    }
    [v4 setDelegate:v5];
    [v4 resume];
    [(id)_LSDServiceStartAllServices::services addObject:v5];
    [(id)_LSDServiceStartAllServices::listeners addObject:v4];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"void _LSDServiceStartAllServices()_block_invoke"];
    [v5 handleFailureInFunction:v8, @"LSDService.mm", 361, @"Failed to create XPC listener for class %@", a2 file lineNumber description];
  }
}

@end