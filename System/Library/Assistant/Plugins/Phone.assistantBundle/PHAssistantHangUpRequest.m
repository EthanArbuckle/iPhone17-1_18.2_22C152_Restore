@interface PHAssistantHangUpRequest
- (void)performWithCompletion:(id)a3;
@end

@implementation PHAssistantHangUpRequest

- (void)performWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_2352C7000, v5, OS_LOG_TYPE_DEFAULT, "Received Siri request to hang up: %@", buf, 0xCu);
  }

  id v6 = [NSString stringWithFormat:@"com.apple.mobilephone.%@", objc_opt_class()];
  v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);

  v8 = [MEMORY[0x263F7E1A0] callCenterWithQueue:v7];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2352C88F4;
  block[3] = &unk_264C4CED0;
  id v12 = v8;
  id v13 = v4;
  id v9 = v4;
  id v10 = v8;
  dispatch_sync(v7, block);
}

@end