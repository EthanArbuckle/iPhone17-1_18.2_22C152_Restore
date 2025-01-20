@interface _IDSPasswordManager
- (void)setPassword:(id)a3 forUsername:(id)a4 onService:(id)a5 completionBlock:(id)a6;
@end

@implementation _IDSPasswordManager

- (void)setPassword:(id)a3 forUsername:(id)a4 onService:(id)a5 completionBlock:(id)a6
{
  id v16 = a4;
  id v11 = a5;
  v12 = (void (**)(id, id, id, uint64_t))a6;
  id v13 = a3;
  if (_IDSRunningInDaemon())
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_IDSPasswordManager.m" lineNumber:18 description:@"This method should only be run on clients"];
  }
  v14 = +[IDSDaemonController sharedInstance];
  [v14 setPassword:v13 forUsername:v16 onService:v11];

  if (v12) {
    v12[2](v12, v16, v11, 1);
  }
}

@end