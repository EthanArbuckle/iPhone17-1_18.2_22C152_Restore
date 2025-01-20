@interface NFCHardwareManagerInterface
+ (id)interface;
@end

@implementation NFCHardwareManagerInterface

+ (id)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global);
  }
  v2 = (void *)interface_interface;

  return v2;
}

void __40__NFCHardwareManagerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39EED0];
  v1 = (void *)interface_interface;
  interface_interface = v0;

  v2 = (void *)interface_interface;
  v3 = +[NFReaderSessionCallbacks interface];
  [v2 setInterface:v3 forSelector:sel_queueReaderSession_sessionConfig_completion_ argumentIndex:0 ofReply:0];

  v4 = (void *)interface_interface;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_queueReaderSession_sessionConfig_completion_ argumentIndex:1 ofReply:0];

  v6 = (void *)interface_interface;
  v7 = +[NFReaderSessionInterface interface];
  [v6 setInterface:v7 forSelector:sel_queueReaderSession_sessionConfig_completion_ argumentIndex:0 ofReply:1];

  v8 = (void *)interface_interface;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v8 setClasses:v9 forSelector:sel_queueCardSession_sessionConfig_completion_ argumentIndex:1 ofReply:0];

  v10 = (void *)interface_interface;
  v11 = +[NFCCardSessionCallbackInterface interface]();
  [v10 setInterface:v11 forSelector:sel_queueCardSession_sessionConfig_completion_ argumentIndex:0 ofReply:0];

  v12 = (void *)interface_interface;
  v13 = +[NFCCardSessionInterface interface]();
  [v12 setInterface:v13 forSelector:sel_queueCardSession_sessionConfig_completion_ argumentIndex:0 ofReply:1];

  v14 = (void *)interface_interface;
  v15 = +[NFCFieldDetectSessionCallbacksInterface interface];
  [v14 setInterface:v15 forSelector:sel_queueCardFieldDetectSession_completion_ argumentIndex:0 ofReply:0];

  v16 = (void *)interface_interface;
  id v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39EF30];
  [v16 setInterface:v17 forSelector:sel_queueCardFieldDetectSession_completion_ argumentIndex:0 ofReply:1];
}

@end