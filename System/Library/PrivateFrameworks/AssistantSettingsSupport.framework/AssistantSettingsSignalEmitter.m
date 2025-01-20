@interface AssistantSettingsSignalEmitter
- (void)_emitDiscoverabilitySignalEventForIdentifier:(id)a3;
- (void)emitCallHangUpEnabledSignal;
- (void)emitDidSelectVoiceSignal;
@end

@implementation AssistantSettingsSignalEmitter

- (void)emitDidSelectVoiceSignal
{
}

- (void)emitCallHangUpEnabledSignal
{
}

- (void)_emitDiscoverabilitySignalEventForIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F2A9B8];
  id v4 = a3;
  id v7 = [v3 discoverabilitySignal];
  v5 = [v7 source];
  v6 = (void *)[objc_alloc(MEMORY[0x263F2A780]) initWithIdentifier:v4 bundleID:@"com.apple.siri" context:0];

  [v5 sendEvent:v6];
}

@end