@interface MagneticCoexIODelegateImpl
- (BOOL)isNr41Enabled;
- (BOOL)isNr7xEnabled;
- (MagneticCoexIODelegateImpl)init;
- (id).cxx_construct;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation MagneticCoexIODelegateImpl

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->iClient, 0);
  fObj = self->queue.fObj.fObj;
  self->queue.fObj.fObj = 0;

  v4 = self->queue.fObj.fObj;
}

- (void)stopObserving
{
  v11 = self;
  v3 = *(id *)sub_32A48(24);
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "MagneticCoexIODelegate.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 80;
    _os_log_impl(&def_1E50E8, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Unregistering WRM_UCMInterface client", buf, 0x12u);
  }

  v10 = &v11;
  fObj = self->queue.fObj.fObj;
  v7 = v6 = fObj;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_293A9C;
  v13 = &unk_632EB8;
  v14 = &v10;
  dispatch_sync(v7, buf);

  v8 = *(id *)sub_32A48(24);
  v9 = v8;
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "MagneticCoexIODelegate.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 82;
    _os_log_impl(&def_1E50E8, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopped magnetic coex mitigation listener", buf, 0x12u);
  }
}

- (void)startObserving
{
  v3 = (WRM_UCMInterface *)objc_alloc_init((Class)WRM_UCMInterface);
  iClient = self->iClient;
  self->iClient = v3;

  v5 = *(id *)sub_32A48(24);
  v6 = v5;
  if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    v21 = "MagneticCoexIODelegate.mm";
    __int16 v22 = 1024;
    int v23 = 63;
    _os_log_impl(&def_1E50E8, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Registering WRM_UCMInterface client", (uint8_t *)&v20, 0x12u);
  }

  v7 = self->iClient;
  v8 = self->queue.fObj.fObj;
  [(WRM_UCMInterface *)v7 registerClient:41 queue:v8];

  v9 = [(WRM_UCMInterface *)self->iClient getWirelessFrequencyBandUpdatesForMIC:sub_293D8C];
  v10 = [v9 objectForKeyedSubscript:@"NRBand41Enabled"];
  self->BOOL nr41Enabled = [v10 BOOLValue];

  v11 = [v9 objectForKeyedSubscript:@"NRBand7xEnabled"];
  self->BOOL nr7xEnabled = [v11 BOOLValue];

  v12 = *(id *)sub_32A48(24);
  v13 = v12;
  if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    v21 = "MagneticCoexIODelegate.mm";
    __int16 v22 = 1024;
    int v23 = 70;
    _os_log_impl(&def_1E50E8, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Started magnetic coex mitigation listener", (uint8_t *)&v20, 0x12u);
  }

  v14 = *(id *)sub_32A48(24);
  v15 = v14;
  if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL nr41Enabled = self->nr41Enabled;
    v17 = "true";
    v21 = "MagneticCoexIODelegate.mm";
    BOOL nr7xEnabled = self->nr7xEnabled;
    if (nr41Enabled) {
      v19 = "true";
    }
    else {
      v19 = "false";
    }
    int v20 = 136315906;
    __int16 v22 = 1024;
    if (!nr7xEnabled) {
      v17 = "false";
    }
    int v23 = 75;
    __int16 v24 = 2080;
    v25 = v19;
    __int16 v26 = 2080;
    v27 = v17;
    _os_log_impl(&def_1E50E8, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d The initial magnetic coex mitigation requirement was set to %s for NRBand41 and %s for NRBand7x", (uint8_t *)&v20, 0x26u);
  }
}

- (BOOL)isNr7xEnabled
{
  return self->nr7xEnabled;
}

- (BOOL)isNr41Enabled
{
  return self->nr41Enabled;
}

- (MagneticCoexIODelegateImpl)init
{
  v7.receiver = self;
  v7.super_class = (Class)MagneticCoexIODelegateImpl;
  v2 = [(MagneticCoexIODelegateImpl *)&v7 init];
  if (v2)
  {
    id v3 = +[NSString stringWithUTF8String:"com.apple.virtualaudio.wirelesscoexmanager"];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    fObj = v2->queue.fObj.fObj;
    v2->queue.fObj.fObj = (OS_dispatch_object *)v4;
  }
  return v2;
}

@end