@interface PreferencesAssistantSetBluetooth
- (PreferencesAssistantSetBluetooth)init;
- (void)_finish;
- (void)availableChanged:(id)a3;
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
@end

@implementation PreferencesAssistantSetBluetooth

- (PreferencesAssistantSetBluetooth)init
{
  v3 = PALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[PreferencesAssistantSetBluetooth init]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "######## %s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)PreferencesAssistantSetBluetooth;
  v4 = [(PreferencesAssistantSetBluetooth *)&v7 init];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"availableChanged:" name:BluetoothAvailabilityChangedNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = PALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v7 = "-[PreferencesAssistantSetBluetooth dealloc]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "######## %s", buf, 0xCu);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PreferencesAssistantSetBluetooth;
  [(PreferencesAssistantSetBluetooth *)&v5 dealloc];
}

- (void)performWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A5AC;
  v4[3] = &unk_105E0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_finish
{
  id v3 = PALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[PreferencesAssistantSetBluetooth _finish]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "######## %s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v4 setValue:self->_targetEnabledState];
  id v5 = +[NSNumber numberWithBool:!self->_targetEnabledState];
  [v4 setPreviousValue:v5];

  id v6 = objc_alloc_init((Class)SASettingSetBoolResponse);
  [v6 setSetting:v4];
  completion = (void (**)(id, void *))self->_completion;
  v8 = [v6 dictionary];
  completion[2](completion, v8);
}

- (void)availableChanged:(id)a3
{
  id v4 = a3;
  id v5 = PALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 object];
    objc_super v7 = +[BluetoothManager sharedInstance];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = [v7 available];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "######## BT available note: %@; available: %d",
      (uint8_t *)&v11,
      0x12u);
  }
  if (self->_waitingOnBT)
  {
    v8 = [v4 object];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      self->_waitingOnBT = 0;
      v10 = +[BluetoothManager sharedInstance];
      [v10 setEnabled:self->_targetEnabledState];

      [(PreferencesAssistantSetBluetooth *)self _finish];
    }
  }
}

- (void).cxx_destruct
{
}

@end