@interface NSXPCInterface(CXCallDirectoryProviderSupport)
+ (id)cx_callDirectoryProviderHostInterface;
+ (uint64_t)cx_callDirectoryProviderVendorInterface;
- (id)_cx_callDirectoryProviderAllowedClasses;
- (void)_cx_setAllowedClassesForCallDirectoryProviderHostProtocol;
@end

@implementation NSXPCInterface(CXCallDirectoryProviderSupport)

+ (id)cx_callDirectoryProviderHostInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC3D700];
  objc_msgSend(v0, "_cx_setAllowedClassesForCallDirectoryProviderHostProtocol");

  return v0;
}

+ (uint64_t)cx_callDirectoryProviderVendorInterface
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC44448];
}

- (void)_cx_setAllowedClassesForCallDirectoryProviderHostProtocol
{
  v2 = objc_msgSend(a1, "_cx_callDirectoryProviderAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_addBlockingEntriesWithData_reply_ argumentIndex:0 ofReply:0];

  objc_msgSend(a1, "_cx_callDirectoryProviderAllowedClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v3 forSelector:sel_addIdentificationEntriesWithData_reply_ argumentIndex:0 ofReply:0];
}

- (id)_cx_callDirectoryProviderAllowedClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__NSXPCInterface_CXCallDirectoryProviderSupport___cx_callDirectoryProviderAllowedClasses__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = a1;
  if (_cx_callDirectoryProviderAllowedClasses_onceToken != -1) {
    dispatch_once(&_cx_callDirectoryProviderAllowedClasses_onceToken, block);
  }
  return (id)_cx_callDirectoryProviderAllowedClasses_allowedClasses;
}

@end