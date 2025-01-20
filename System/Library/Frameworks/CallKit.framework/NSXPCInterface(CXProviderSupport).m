@interface NSXPCInterface(CXProviderSupport)
+ (id)cx_providerHostInterface;
+ (id)cx_providerVendorInterface;
- (id)_cx_providerAllowedClasses;
- (void)cx_setAllowedClassesForProviderHostProtocol;
- (void)cx_setAllowedClassesForProviderVendorProtocol;
@end

@implementation NSXPCInterface(CXProviderSupport)

+ (id)cx_providerHostInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC38168];
  objc_msgSend(v0, "cx_setAllowedClassesForProviderHostProtocol");

  return v0;
}

+ (id)cx_providerVendorInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC382E8];
  objc_msgSend(v0, "cx_setAllowedClassesForProviderVendorProtocol");

  return v0;
}

- (id)_cx_providerAllowedClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NSXPCInterface_CXProviderSupport___cx_providerAllowedClasses__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = a1;
  if (_cx_providerAllowedClasses_onceToken != -1) {
    dispatch_once(&_cx_providerAllowedClasses_onceToken, block);
  }
  return (id)_cx_providerAllowedClasses_providerAllowedClasses;
}

- (void)cx_setAllowedClassesForProviderHostProtocol
{
  v2 = objc_msgSend(a1, "_cx_providerAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_reportNewIncomingCallWithUUID_update_reply_ argumentIndex:1 ofReply:0];

  v3 = objc_msgSend(a1, "_cx_providerAllowedClasses");
  [a1 setClasses:v3 forSelector:sel_reportCallWithUUID_updated_ argumentIndex:1 ofReply:0];

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v4 forSelector:sel_actionCompleted_completionHandler_ argumentIndex:0 ofReply:0];
}

- (void)cx_setAllowedClassesForProviderVendorProtocol
{
  objc_msgSend(a1, "_cx_providerAllowedClasses");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v2 forSelector:sel_commitTransaction_ argumentIndex:0 ofReply:0];
}

@end