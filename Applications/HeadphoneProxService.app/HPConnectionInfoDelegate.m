@interface HPConnectionInfoDelegate
+ (BOOL)_isAudioProductCertsProtocol:(int)a3;
+ (BOOL)_isBluetoothClassicTransport:(int)a3;
- (NSMutableSet)allowedEndpointUUIDs;
- (id)accessoryAttached;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5;
- (void)setAccessoryAttached:(id)a3;
- (void)setAllowedEndpointUUIDs:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HPConnectionInfoDelegate

- (void)start
{
  v3 = objc_opt_new();
  [(HPConnectionInfoDelegate *)self setAllowedEndpointUUIDs:v3];

  id v4 = +[ACCConnectionInfo sharedInstance];
  [v4 registerDelegate:self];
}

- (void)stop
{
  v3 = +[ACCConnectionInfo sharedInstance];
  [v3 registerDelegate:0];

  [(HPConnectionInfoDelegate *)self setAllowedEndpointUUIDs:0];
}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(HPConnectionInfoDelegate *)self allowedEndpointUUIDs];
  unsigned int v12 = [v11 containsObject:v10];

  if (v12)
  {
    if (dword_1000D4050 <= 30 && (dword_1000D4050 != -1 || _LogCategory_Initialize()))
    {
      id v14 = v8;
      LogPrintF();
    }
    v13 = +[ACCConnectionInfo sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000047E8;
    v15[3] = &unk_1000C1E10;
    id v16 = v8;
    v17 = self;
    [v13 accessoryInfoForConnection:v9 withReply:v15];
  }
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([(id)objc_opt_class() _isAudioProductCertsProtocol:v9]
    && [(id)objc_opt_class() _isBluetoothClassicTransport:v10])
  {
    if (dword_1000D4050 <= 30 && (dword_1000D4050 != -1 || _LogCategory_Initialize()))
    {
      id v17 = v13;
      LogPrintF();
    }
    v15 = [(HPConnectionInfoDelegate *)self allowedEndpointUUIDs];
    [v15 addObject:v12];

    id v16 = +[ACCConnectionInfo sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000049D8;
    v18[3] = &unk_1000C1E10;
    id v19 = v13;
    v20 = self;
    [v16 accessoryInfoForConnection:v14 withReply:v18];
  }
}

+ (BOOL)_isAudioProductCertsProtocol:(int)a3
{
  return a3 == 13;
}

+ (BOOL)_isBluetoothClassicTransport:(int)a3
{
  return a3 == 2;
}

- (id)accessoryAttached
{
  return self->_accessoryAttached;
}

- (void)setAccessoryAttached:(id)a3
{
}

- (NSMutableSet)allowedEndpointUUIDs
{
  return self->_allowedEndpointUUIDs;
}

- (void)setAllowedEndpointUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEndpointUUIDs, 0);

  objc_storeStrong(&self->_accessoryAttached, 0);
}

@end