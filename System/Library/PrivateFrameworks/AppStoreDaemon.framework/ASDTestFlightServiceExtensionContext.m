@interface ASDTestFlightServiceExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation ASDTestFlightServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_40 != -1) {
    dispatch_once(&_MergedGlobals_40, &__block_literal_global_15);
  }
  v2 = (void *)qword_1EB4D6538;
  return v2;
}

uint64_t __71__ASDTestFlightServiceExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  qword_1EB4D6538 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC619F8];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB4D6540 != -1) {
    dispatch_once(&qword_1EB4D6540, &__block_literal_global_43_0);
  }
  v2 = (void *)qword_1EB4D6548;
  return v2;
}

void __73__ASDTestFlightServiceExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC61490];
  v1 = (void *)qword_1EB4D6548;
  qword_1EB4D6548 = v0;

  v2 = (void *)qword_1EB4D6548;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v5 forSelector:sel_didReceivePushMessages_reply_ argumentIndex:0 ofReply:0];
}

@end