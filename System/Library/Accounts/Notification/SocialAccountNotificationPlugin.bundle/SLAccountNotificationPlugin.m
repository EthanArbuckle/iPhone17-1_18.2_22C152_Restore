@interface SLAccountNotificationPlugin
- (BOOL)_accountExistsForAccountTypeIdentifier:(id)a3 inStore:(id)a4;
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (SLAccountNotificationPlugin)init;
- (void)cleanupTwitterPushDestinationsForAccount:(id)a3 accountStore:(id)a4;
@end

@implementation SLAccountNotificationPlugin

- (SLAccountNotificationPlugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)SLAccountNotificationPlugin;
  result = [(SLAccountNotificationPlugin *)&v3 init];
  if (result) {
    result->_accountState = 0;
  }
  return result;
}

- (BOOL)_accountExistsForAccountTypeIdentifier:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x263EFB210] accountsWithAccountTypeIdentifierExist:v5];
  if (v7 == 1)
  {
    BOOL v8 = 1;
  }
  else if (v7 == 2)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2405F2D08;
    v12[3] = &unk_2650C6750;
    id v13 = v6;
    v15 = &v16;
    v10 = v9;
    v14 = v10;
    [v13 accountTypeWithIdentifier:v5 handler:v12];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v8 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (void)cleanupTwitterPushDestinationsForAccount:(id)a3 accountStore:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F280F0]);
  id v6 = (void *)[v5 initWithEnvironmentName:*MEMORY[0x263F280D0]];
  int v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v6 scheduleInRunLoop:v7];

  BOOL v8 = [v6 publicToken];
  dispatch_semaphore_t v9 = [v8 base64Encoding];

  v22 = [v4 username];
  _SLLog();

  v10 = (void *)MEMORY[0x263F089E0];
  v11 = objc_msgSend(NSURL, "SLTwitterCleanupPushDestinationsURL", v22);
  v12 = [v10 requestWithURL:v11];

  [v12 setHTTPMethod:@"POST"];
  id v13 = NSString;
  v14 = [v9 _urlEncodedString];
  v15 = [v13 stringWithFormat:@"token=%@", v14];
  uint64_t v16 = [v15 dataUsingEncoding:4];
  [v12 setHTTPBody:v16];

  v17 = (void *)[objc_alloc(MEMORY[0x263EFB260]) initWithAccount:v4];
  uint64_t v18 = v17;
  if (v17)
  {
    char v19 = [v17 signedURLRequestWithURLRequest:v12];
    v20 = dispatch_queue_create("performRequestQueue", 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2405F3070;
    block[3] = &unk_2650C6778;
    id v24 = v19;
    id v25 = v4;
    id v21 = v19;
    dispatch_async(v20, block);
  }
}

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (a4 == 3)
  {
    v12 = [v10 accountType];
    id v13 = [v12 identifier];
    int v14 = [v13 isEqualToString:*MEMORY[0x263EFAFC8]];

    if (v14) {
      [(SLAccountNotificationPlugin *)self cleanupTwitterPushDestinationsForAccount:v11 accountStore:v9];
    }
  }

  return 0;
}

@end