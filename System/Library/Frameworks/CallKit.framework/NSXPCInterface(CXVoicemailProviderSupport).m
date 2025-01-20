@interface NSXPCInterface(CXVoicemailProviderSupport)
+ (id)cx_voicemailProviderHostInterface;
+ (id)cx_voicemailProviderVendorInterface;
- (id)_cx_voicemailProviderAllowedClasses;
- (void)cx_setAllowedClassesForVoicemailProviderHostProtocol;
- (void)cx_setAllowedClassesForVoicemailProviderVendorProtocol;
@end

@implementation NSXPCInterface(CXVoicemailProviderSupport)

+ (id)cx_voicemailProviderHostInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC411C8];
  objc_msgSend(v0, "cx_setAllowedClassesForVoicemailProviderHostProtocol");

  return v0;
}

+ (id)cx_voicemailProviderVendorInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC41228];
  objc_msgSend(v0, "cx_setAllowedClassesForVoicemailProviderVendorProtocol");

  return v0;
}

- (id)_cx_voicemailProviderAllowedClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__NSXPCInterface_CXVoicemailProviderSupport___cx_voicemailProviderAllowedClasses__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = a1;
  if (_cx_voicemailProviderAllowedClasses_onceToken != -1) {
    dispatch_once(&_cx_voicemailProviderAllowedClasses_onceToken, block);
  }
  return (id)_cx_voicemailProviderAllowedClasses_voicemailProviderAllowedClasses;
}

- (void)cx_setAllowedClassesForVoicemailProviderHostProtocol
{
  v2 = objc_msgSend(a1, "_cx_providerAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_reportNewVoicemailsWithUpdates_ argumentIndex:0 ofReply:0];

  v3 = objc_msgSend(a1, "_cx_providerAllowedClasses");
  [a1 setClasses:v3 forSelector:sel_reportVoicemailsUpdated_ argumentIndex:0 ofReply:0];

  objc_msgSend(a1, "_cx_providerAllowedClasses");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v4 forSelector:sel_reportVoicemailsRemovedWithUUIDs_ argumentIndex:0 ofReply:0];
}

- (void)cx_setAllowedClassesForVoicemailProviderVendorProtocol
{
  objc_msgSend(a1, "_cx_providerAllowedClasses");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v2 forSelector:sel_commitTransaction_ argumentIndex:0 ofReply:0];
}

@end