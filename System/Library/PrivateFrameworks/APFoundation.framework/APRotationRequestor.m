@interface APRotationRequestor
+ (BOOL)canShareConnection;
+ (id)machService;
- (id)remoteObjectInterface;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)rotate:(id)a3;
@end

@implementation APRotationRequestor

- (void)rotate:(id)a3
{
  id v4 = a3;
  id v5 = [(APXPCActionRequester *)self synchronousRemoteObjectProxyWithErrorHandler:&unk_1F2E9CB30];
  [v5 rotate:v4];

  [(APXPCActionRequester *)self finished];
}

- (id)remoteObjectInterface
{
  return &unk_1F2EAE9E0;
}

- (void)connectionInterrupted
{
  v2 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D70B2000, v2, OS_LOG_TYPE_INFO, "Connection for Promoted Content Rotation in Daemon was interrupted.", v3, 2u);
  }
}

- (void)connectionInvalidated
{
  v2 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D70B2000, v2, OS_LOG_TYPE_INFO, "Connection for Promoted Content Rotation in Daemon was invalidated.", v3, 2u);
  }
}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.signing";
}

@end