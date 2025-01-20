@interface NEExtensionAppPushProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendOutgoingCallMessage:(id)a3 completionHandler:(id)a4;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionAppPushProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4595 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4595, &__block_literal_global_72);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_4596;

  return v2;
}

uint64_t __72__NEExtensionAppPushProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_4596 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094C08];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4598 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4598, &__block_literal_global_4599);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4600;

  return v2;
}

uint64_t __74__NEExtensionAppPushProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_4600 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094BA8];

  return MEMORY[0x1F41817F8]();
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didReceivePushToTalkMessageWithUserInfo:v4];
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 didReceiveIncomingCallWithUserInfo:v4];
}

- (void)sendTimerEvent
{
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendTimerEvent];
}

- (void)sendOutgoingCallMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 sendOutgoingCallMessage:v7 completionHandler:v6];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setProviderConfiguration:v4];
}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 stopWithReason:v4 completionHandler:v6];
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 startConnectionWithProviderConfig:v7 completionHandler:v6];
}

- (int)requiredEntitlement
{
  return 32;
}

@end