@interface CALNDataAccessExpressSharedConnection
+ (id)sharedConnection;
- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
@end

@implementation CALNDataAccessExpressSharedConnection

+ (id)sharedConnection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CALNDataAccessExpressSharedConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, block);
  }
  v2 = (void *)sharedConnection_sharedConnection;
  return v2;
}

uint64_t __57__CALNDataAccessExpressSharedConnection_sharedConnection__block_invoke()
{
  sharedConnection_sharedConnection = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  v11 = (void *)MEMORY[0x263F38F48];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [v11 sharedConnection];
  [v16 respondToSharedCalendarInvite:a3 forCalendarWithID:v15 accountID:v14 queue:v13 completionBlock:v12];
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  v9 = (void *)MEMORY[0x263F38F48];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 sharedConnection];
  [v14 reportSharedCalendarInviteAsJunkForCalendarWithID:v13 accountID:v12 queue:v11 completionBlock:v10];
}

@end