@interface ADSessionRemoteServerFull
- (BOOL)sessionRequiresServerConnection;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9;
@end

@implementation ADSessionRemoteServerFull

- (BOOL)sessionRequiresServerConnection
{
  return 1;
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9
{
  v15.receiver = self;
  v15.super_class = (Class)ADSessionRemoteServerFull;
  id v9 = [(ADSessionRemoteServer *)&v15 initOnQueue:a3 withAccount:a4 languageCode:a5 connectionMode:a6 sharedUserIdentifier:a7 loggingSharedUserIdentifier:a8 instanceContext:a9];
  v10 = v9;
  if (v9)
  {
    [v9 setSessionType:0];
    id v11 = objc_alloc((Class)NSString);
    v12 = +[NSNumber numberWithUnsignedInt:arc4random()];
    id v13 = [v11 initWithFormat:@"%@.%@", &off_100523528, v12];
    [v10 _setSessionId:v13];
  }
  return v10;
}

@end