@interface XboxWirelessGamepadHIDServicePlugin
- (XboxWirelessGamepadHIDServicePlugin)initWithService:(unsigned int)a3;
- (void)activate;
- (void)cancel;
- (void)dispatchPowerOnMessageCompletion:(id)a3;
- (void)handleVirtualKeyPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5;
- (void)setupRawReportHandling;
@end

@implementation XboxWirelessGamepadHIDServicePlugin

- (XboxWirelessGamepadHIDServicePlugin)initWithService:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)XboxWirelessGamepadHIDServicePlugin;
  v3 = [(GCGamepadHIDServicePlugin *)&v7 initWithService:*(void *)&a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)activate
{
  v3 = _os_activity_create(&dword_0, "Activate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v6.receiver = self;
  v6.super_class = (Class)XboxWirelessGamepadHIDServicePlugin;
  [(GCGamepadHIDServicePlugin *)&v6 activate];
  v4 = [(GCGamepadHIDServicePlugin *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3394;
  block[3] = &unk_105B0;
  block[4] = self;
  dispatch_async(v4, block);

  os_activity_scope_leave(&state);
}

- (void)cancel
{
  v3 = _os_activity_create(&dword_0, "Cancel", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4.receiver = self;
  v4.super_class = (Class)XboxWirelessGamepadHIDServicePlugin;
  [(GCGamepadHIDServicePlugin *)&v4 cancel];
  os_activity_scope_leave(&state);
}

- (void)setupRawReportHandling
{
  objc_initWeak(&location, self);
  v3 = [(GCGamepadHIDServicePlugin *)self device];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3510;
  v4[3] = &unk_105D8;
  objc_copyWeak(&v5, &location);
  [v3 setInputReportHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleVirtualKeyPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a4;
  v8 = [v7 bytes];
  id v9 = [v7 length];

  if ((unint64_t)v9 <= 5)
  {
    v11 = sub_2178();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_9790();
    }
  }
  else
  {
    [(GCGamepadHIDServicePlugin *)self dispatchHomeButtonEventWithValue:v8[4] != 0 timestamp:a5];
    char v16 = 0;
    uint64_t v15 = 0;
    __int16 v12 = 8193;
    char v13 = v8[2];
    char v14 = 9;
    *(_DWORD *)((char *)&v15 + 1) = 139271;
    sub_3794(self, (unsigned __int8 *)&v12, 13, v10, 0);
  }
}

- (void)dispatchPowerOnMessageCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_2178();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_988C(v5);
  }

  __int16 v9 = 8197;
  unsigned __int8 sequence = self->_sequence;
  do
  {
    unsigned __int8 v8 = sequence;
    unsigned __int8 sequence = 1;
  }
  while (!v8);
  self->_unsigned __int8 sequence = v8 + 1;
  unsigned __int8 v10 = v8;
  __int16 v11 = 1;
  sub_3794(self, (unsigned __int8 *)&v9, 5, v6, v4);
}

@end