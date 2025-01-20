@interface MTDClientInterface
- (MTDClientInterface)init;
- (NSMutableSet)reverseConnections;
- (void)disable_microphone_activity_detection_with_reply:(id)a3;
- (void)enable_microphone_activity_detection_with_reply:(id)a3;
- (void)listen_for_microphone_activity:(id)a3 reply:(id)a4;
- (void)register_client:(id)a3 reply:(id)a4;
- (void)setReverseConnections:(id)a3;
- (void)stop_listening_for_microphone_activity_with_reply:(id)a3;
@end

@implementation MTDClientInterface

- (void).cxx_destruct
{
}

- (void)setReverseConnections:(id)a3
{
}

- (NSMutableSet)reverseConnections
{
  return self->_reverseConnections;
}

- (void)stop_listening_for_microphone_activity_with_reply:(id)a3
{
}

- (void)register_client:(id)a3 reply:(id)a4
{
}

- (void)listen_for_microphone_activity:(id)a3 reply:(id)a4
{
}

- (void)enable_microphone_activity_detection_with_reply:(id)a3
{
}

- (void)disable_microphone_activity_detection_with_reply:(id)a3
{
}

- (MTDClientInterface)init
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C7208];
  v6.receiver = self;
  v6.super_class = (Class)MTDClientInterface;
  v4 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)&v6 initWithInterface:v3];

  return v4;
}

@end