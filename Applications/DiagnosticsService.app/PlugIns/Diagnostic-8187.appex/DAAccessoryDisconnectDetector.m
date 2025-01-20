@interface DAAccessoryDisconnectDetector
- (DAAccessoryDisconnectDetector)initWithModelNumbers:(id)a3;
- (NSArray)modelNumbers;
- (void)accessoryDidDisconnect:(id)a3;
- (void)setModelNumbers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DAAccessoryDisconnectDetector

- (DAAccessoryDisconnectDetector)initWithModelNumbers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAAccessoryDisconnectDetector;
  v6 = [(DAAccessoryDisconnectDetector *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modelNumbers, a3);
  }

  return v7;
}

- (void)start
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DAAccessoryDisconnectDetector *)self modelNumbers];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector started for accessories: %@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"accessoryDidDisconnect:" name:EAAccessoryDidDisconnectNotification object:0];

  v6 = +[EAAccessoryManager sharedAccessoryManager];
  [v6 registerForLocalNotifications];
}

- (void)accessoryDidDisconnect:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:EAAccessoryKey];
  v6 = [v5 modelNumber];

  int v7 = [(DAAccessoryDisconnectDetector *)self modelNumbers];
  unsigned int v8 = [v7 containsObject:v6];

  objc_super v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector informed that %@ has disconnected. Matches watchlist: %d", buf, 0x12u);
  }

  if (v8)
  {
    v10 = +[NSNotificationCenter defaultCenter];
    CFStringRef v12 = @"accessoryModelNumber";
    v13 = v6;
    v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v10 postNotificationName:@"AccessoryDisconnectedNotification" object:0 userInfo:v11];
  }
}

- (void)stop
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DAAccessoryDisconnectDetector *)self modelNumbers];
    int v7 = 138412290;
    unsigned int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Accessory disconnect detector stopped for accessories: %@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:EAAccessoryDidDisconnectNotification object:0];

  v6 = +[EAAccessoryManager sharedAccessoryManager];
  [v6 unregisterForLocalNotifications];
}

- (NSArray)modelNumbers
{
  return self->_modelNumbers;
}

- (void)setModelNumbers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end