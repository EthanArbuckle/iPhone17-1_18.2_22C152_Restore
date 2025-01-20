@interface BTAudioSmartRouteManager
+ (id)sharedInstance;
- (BTAudioSmartRouteManager)init;
- (id).cxx_construct;
- (id)registerDevice:(unsigned int)a3 deviceAddr:(id)a4;
- (id)unRegisterDevice:(id)a3;
- (unsigned)activeClientCount;
- (void)dealloc;
- (void)startIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5 notifyMode:(int *)a6;
- (void)stopIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5;
@end

@implementation BTAudioSmartRouteManager

- (void)dealloc
{
  [(NSMutableDictionary *)self->_btAudioDeviceDict removeAllObjects];

  v3.receiver = self;
  v3.super_class = (Class)BTAudioSmartRouteManager;
  [(BTAudioSmartRouteManager *)&v3 dealloc];
}

- (BTAudioSmartRouteManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)BTAudioSmartRouteManager;
  v2 = [(BTAudioSmartRouteManager *)&v4 init];
  v2->_btAudioDeviceDict = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  return v2;
}

+ (id)sharedInstance
{
  id result = (id)qword_A1AC8;
  if (!qword_A1AC8)
  {
    id result = objc_alloc_init(BTAudioSmartRouteManager);
    qword_A1AC8 = (uint64_t)result;
  }
  return result;
}

- (id)registerDevice:(unsigned int)a3 deviceAddr:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (BTAudioSmartRouteDevice *)[(NSMutableDictionary *)self->_btAudioDeviceDict objectForKey:a4];
  if (!v7)
  {
    v8 = qword_A1AC0;
    if (os_log_type_enabled((os_log_t)qword_A1AC0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = a4;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Create Smart Route Manager Entry for %@ Device ID %d: ", (uint8_t *)&v10, 0x12u);
    }
    v7 = [[BTAudioSmartRouteDevice alloc] initWithBluetoothInfo:v5 deviceAddr:a4];
    [(NSMutableDictionary *)self->_btAudioDeviceDict setObject:v7 forKey:a4];
  }
  return v7;
}

- (id)unRegisterDevice:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:");
  if (v5)
  {
    v6 = v5;
    [(NSMutableDictionary *)self->_btAudioDeviceDict removeObjectForKey:a3];
    v7 = qword_A1AC0;
    if (os_log_type_enabled((os_log_t)qword_A1AC0, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 1024;
      unsigned int v12 = [v6 retainCount];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Release Smart Route Manager Entry for %@ %d", (uint8_t *)&v9, 0x12u);
    }
  }
  return 0;
}

- (void)startIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5 notifyMode:(int *)a6
{
  BOOL v7 = a5;
  __int16 v11 = qword_A1AC0;
  if (os_log_type_enabled((os_log_t)qword_A1AC0, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = a4;
    __int16 v15 = 1024;
    BOOL v16 = v7;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Smart Route Manager StartIO:  %@ Device ID %d: ", (uint8_t *)&v13, 0x12u);
  }
  id v12 = [(NSMutableDictionary *)self->_btAudioDeviceDict objectForKey:a3];
  if (v12) {
    [v12 updateSession:a4 isStart:1 isInput:v7];
  }
  *a6 = 2;
}

- (void)stopIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  int v9 = qword_A1AC0;
  if (os_log_type_enabled((os_log_t)qword_A1AC0, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = a4;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Smart Route Manager StopIO:  %@ Device ID %d: ", (uint8_t *)&v11, 0x12u);
  }
  id v10 = [(NSMutableDictionary *)self->_btAudioDeviceDict objectForKey:a3];
  if (v10) {
    [v10 updateSession:a4 isStart:0 isInput:v5];
  }
}

- (unsigned)activeClientCount
{
  return self->_activeClientCount;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end