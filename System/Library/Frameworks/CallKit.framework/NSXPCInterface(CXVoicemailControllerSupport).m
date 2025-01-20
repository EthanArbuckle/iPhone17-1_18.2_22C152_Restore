@interface NSXPCInterface(CXVoicemailControllerSupport)
+ (id)cx_voicemailControllerHostInterface;
+ (id)cx_voicemailControllerVendorInterface;
- (id)_cx_voicemailControllerAllowedClasses;
- (void)_cx_setAllowedClassesForVoicemailControllerHostProtocol;
- (void)_cx_setAllowedClassesForVoicemailControllerVendorProtocol;
@end

@implementation NSXPCInterface(CXVoicemailControllerSupport)

+ (id)cx_voicemailControllerHostInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC42CD8];
  objc_msgSend(v0, "_cx_setAllowedClassesForVoicemailControllerHostProtocol");

  return v0;
}

+ (id)cx_voicemailControllerVendorInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC42D38];
  objc_msgSend(v0, "_cx_setAllowedClassesForVoicemailControllerVendorProtocol");

  return v0;
}

- (id)_cx_voicemailControllerAllowedClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__NSXPCInterface_CXVoicemailControllerSupport___cx_voicemailControllerAllowedClasses__block_invoke;
  block[3] = &unk_1E5CADD30;
  block[4] = a1;
  if (_cx_voicemailControllerAllowedClasses_onceToken != -1) {
    dispatch_once(&_cx_voicemailControllerAllowedClasses_onceToken, block);
  }
  return (id)_cx_voicemailControllerAllowedClasses_voicemailControllerAllowedClasses;
}

- (void)_cx_setAllowedClassesForVoicemailControllerHostProtocol
{
  v2 = objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_requestVoicemails_ argumentIndex:0 ofReply:1];

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v3 forSelector:sel_requestTransaction_reply_ argumentIndex:0 ofReply:0];
}

- (void)_cx_setAllowedClassesForVoicemailControllerVendorProtocol
{
  v2 = objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  [a1 setClasses:v2 forSelector:sel_addOrUpdateVoicemails_ argumentIndex:0 ofReply:0];

  objc_msgSend(a1, "_cx_voicemailControllerAllowedClasses");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setClasses:v3 forSelector:sel_removeVoicemails_ argumentIndex:0 ofReply:0];
}

@end