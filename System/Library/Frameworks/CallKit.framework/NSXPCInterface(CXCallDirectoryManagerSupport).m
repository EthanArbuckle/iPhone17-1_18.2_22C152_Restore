@interface NSXPCInterface(CXCallDirectoryManagerSupport)
+ (id)cx_callDirectoryManagerDefaultHostInterface;
+ (uint64_t)cx_callDirectoryManagerMaintenanceHostInterface;
- (id)_cx_callDirectoryManagerAllowedClasses;
- (void)_cx_setAllowedClassesForCallDirectoryManagerDefaultHostProtocol;
@end

@implementation NSXPCInterface(CXCallDirectoryManagerSupport)

+ (id)cx_callDirectoryManagerDefaultHostInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC39558];
  objc_msgSend(v0, "_cx_setAllowedClassesForCallDirectoryManagerDefaultHostProtocol");

  return v0;
}

- (void)_cx_setAllowedClassesForCallDirectoryManagerDefaultHostProtocol
{
  v2 = objc_msgSend(a1, "_cx_callDirectoryManagerAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_reply_ argumentIndex:0 ofReply:1];

  objc_msgSend(a1, "_cx_callDirectoryManagerAllowedClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v3 forSelector:sel_getExtensionsWithReply_ argumentIndex:0 ofReply:1];
}

- (id)_cx_callDirectoryManagerAllowedClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__NSXPCInterface_CXCallDirectoryManagerSupport___cx_callDirectoryManagerAllowedClasses__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = a1;
  if (_cx_callDirectoryManagerAllowedClasses_onceToken != -1) {
    dispatch_once(&_cx_callDirectoryManagerAllowedClasses_onceToken, block);
  }
  return (id)_cx_callDirectoryManagerAllowedClasses_allowedClasses;
}

+ (uint64_t)cx_callDirectoryManagerMaintenanceHostInterface
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC39610];
}

@end