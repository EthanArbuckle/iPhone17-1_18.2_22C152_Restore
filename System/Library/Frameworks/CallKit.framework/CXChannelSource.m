@interface CXChannelSource
- (void)handleAudioSessionActivationStateChangedTo:(id)a3;
@end

@implementation CXChannelSource

- (void)handleAudioSessionActivationStateChangedTo:(id)a3
{
  id v4 = a3;
  v5 = [(CXAbstractProviderSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CXChannelSource_handleAudioSessionActivationStateChangedTo___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__CXChannelSource_handleAudioSessionActivationStateChangedTo___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) BOOLValue];
    int v5 = 136315394;
    id v6 = "-[CXChannelSource handleAudioSessionActivationStateChangedTo:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Sending %s %d", (uint8_t *)&v5, 0x12u);
  }

  id v4 = [*(id *)(a1 + 40) vendorProtocolDelegate];
  [v4 handleAudioSessionActivationStateChangedTo:*(void *)(a1 + 32)];
}

@end