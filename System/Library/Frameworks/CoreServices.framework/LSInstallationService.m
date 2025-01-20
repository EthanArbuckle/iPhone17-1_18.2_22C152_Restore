@interface LSInstallationService
@end

@implementation LSInstallationService

uint64_t __40___LSInstallationService_beginListening__block_invoke()
{
  v0 = objc_alloc_init(_LSInstallationService);
  v1 = (void *)beginListening_installationServiceDelegate;
  beginListening_installationServiceDelegate = (uint64_t)v0;

  id v2 = objc_alloc(MEMORY[0x1E4F29290]);
  v3 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
  uint64_t v4 = [v2 initWithMachServiceName:v3];
  v5 = (void *)beginListening_listener;
  beginListening_listener = v4;

  [(id)beginListening_listener setDelegate:beginListening_installationServiceDelegate];
  v6 = (void *)beginListening_listener;

  return [v6 resume];
}

@end