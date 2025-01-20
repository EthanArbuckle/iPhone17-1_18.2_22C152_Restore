@interface AppleEthernetSettingsConfig
- (AppleEthernetSettingsConfig)init;
- (void)_updatePrivacyProxyFeatureEnabled;
@end

@implementation AppleEthernetSettingsConfig

- (AppleEthernetSettingsConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)AppleEthernetSettingsConfig;
  v2 = [(AppleEthernetSettingsConfig *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AppleEthernetSettingsConfig *)v2 setCurrent:1];
    [(AppleEthernetSettingsConfig *)v3 setForgetable:0];
    [(AppleEthernetSettingsConfig *)v3 setJoinable:0];
    [(AppleEthernetSettingsConfig *)v3 setManageable:0];
    [(AppleEthernetSettingsConfig *)v3 setCloudSyncable:0];
    [(AppleEthernetSettingsConfig *)v3 setAutoJoinConfigurable:0];
    [(AppleEthernetSettingsConfig *)v3 setAutoJoinEnabled:0];
    [(AppleEthernetSettingsConfig *)v3 setAutoLoginConfigurable:0];
    [(AppleEthernetSettingsConfig *)v3 setIpv4Config:0];
    [(AppleEthernetSettingsConfig *)v3 setIpv6Config:0];
    [(AppleEthernetSettingsConfig *)v3 setDnsConfig:0];
    [(AppleEthernetSettingsConfig *)v3 setCanRenewLease:0];
    [(AppleEthernetSettingsConfig *)v3 setHttpProxyConfigurable:1];
    [(AppleEthernetSettingsConfig *)v3 setHttpProxyConfig:0];
    [(AppleEthernetSettingsConfig *)v3 _updatePrivacyProxyFeatureEnabled];
  }
  return v3;
}

- (void)_updatePrivacyProxyFeatureEnabled
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 1;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = dispatch_get_global_queue(33, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5108;
  v18[3] = &unk_C4E8;
  v20 = &v25;
  objc_super v5 = v3;
  v19 = v5;
  +[PrivacyProxyClient getStatus:v4 completionHandler:v18];

  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v5, v6);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_511C;
  v15 = &unk_C510;
  v17 = &v21;
  v7 = v5;
  v16 = v7;
  +[PrivacyProxyClient getUserTier:v4 completionHandler:&v12];

  dispatch_time_t v8 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v7, v8);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = *((unsigned __int8 *)v26 + 24);
    uint64_t v10 = v22[3];
    *(_DWORD *)buf = 136315650;
    v30 = "-[AppleEthernetSettingsConfig _updatePrivacyProxyFeatureEnabled]";
    __int16 v31 = 1024;
    int v32 = v9;
    __int16 v33 = 1024;
    int v34 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: proxyEnabled %d, userTier %d\n", buf, 0x18u);
  }
  if (*((unsigned char *)v26 + 24))
  {
    if (v22[3] == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  -[AppleEthernetSettingsConfig setPrivacyProxyTierStatus:](self, "setPrivacyProxyTierStatus:", v11, v12, v13, v14, v15);
  [(AppleEthernetSettingsConfig *)self setPrivacyProxyEnabled:1];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

@end