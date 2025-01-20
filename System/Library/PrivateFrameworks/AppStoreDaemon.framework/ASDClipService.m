@interface ASDClipService
+ (id)interface;
@end

@implementation ASDClipService

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BEB8];
  self;
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EEC65AC0), sel_boostSessionUsingChannel_forRequest_withReplyHandler_, 0, 0);
  return v2;
}

@end