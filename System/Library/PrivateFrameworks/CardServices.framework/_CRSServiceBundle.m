@interface _CRSServiceBundle
+ (BOOL)supportsSecureCoding;
- (NSString)serviceIdentifier;
- (id)underlyingService;
- (void)_initializeServiceWithClass:(Class)a3;
@end

@implementation _CRSServiceBundle

- (id)underlyingService
{
  v3 = (void *)[(_CRSServiceBundle *)self principalClass];
  if (!self->_service)
  {
    v4 = v3;
    if ([v3 conformsToProtocol:&unk_26D9269F0]) {
      [(_CRSServiceBundle *)self _initializeServiceWithClass:v4];
    }
  }
  service = self->_service;
  return service;
}

- (void)_initializeServiceWithClass:(Class)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = NSStringFromClass(a3);
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_225997000, v6, OS_LOG_TYPE_INFO, "Initializing a service of class %@", (uint8_t *)&v10, 0xCu);
  }
  v8 = (CRSServing *)objc_alloc_init(a3);
  service = self->_service;
  self->_service = v8;
}

- (NSString)serviceIdentifier
{
  v3 = [(_CRSServiceBundle *)self bundleIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = NSString;
    v7 = [(_CRSServiceBundle *)self underlyingService];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v5 = [v6 stringWithFormat:@"%@%@", @"com.apple.cardservicesbundleservice.", v9];
  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end