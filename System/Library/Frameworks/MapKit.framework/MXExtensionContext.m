@interface MXExtensionContext
@end

@implementation MXExtensionContext

void __54___MXExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9B66D0];
  v1 = (void *)qword_1EB3160E8;
  qword_1EB3160E8 = v0;
}

void __56___MXExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED9C3D48];
  v1 = (void *)qword_1EB3160F8;
  qword_1EB3160F8 = v0;

  v2 = (void *)qword_1EB3160F8;
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA436D0];
  [v2 setInterface:v3 forSelector:sel_startSendingUpdatesForRequest_requestDispatcher_toObserver_ argumentIndex:2 ofReply:0];
}

@end