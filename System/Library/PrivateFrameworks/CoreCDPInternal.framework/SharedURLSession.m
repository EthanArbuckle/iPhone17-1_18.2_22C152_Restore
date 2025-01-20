@interface SharedURLSession
@end

@implementation SharedURLSession

void ___SharedURLSession_block_invoke()
{
  id v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  v0 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"CDPSecureBackupURLSession"];
  objc_msgSend(v3, "set_appleIDContext:", v0);

  uint64_t v1 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v3];
  v2 = (void *)_SharedURLSession_sharedURLSession;
  _SharedURLSession_sharedURLSession = v1;
}

@end