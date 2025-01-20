@interface BLTRemoteGlobalSettingsChangeset
+ (id)remoteGlobalSettingsChangesetWithProvider:(id)a3;
- (BLTPBSetRemoteGlobalSettingsRequest)blt_protobuf;
- (BLTRemoteGlobalSettingsChangeset)initWithProvider:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsSend;
- (BOOL)sendSuccess;
- (NSString)remoteInfoDirectoryLocation;
- (NSString)remoteInfoFileLocation;
- (id)description;
- (id)descriptionForBBSystemSetting:(int64_t)a3;
- (id)globalScheduledDeliverySettingDescription;
- (int64_t)globalScheduledDeliverySetting;
- (int64_t)globalSummarizationSetting;
- (void)needsSend;
- (void)setGlobalScheduledDeliverySetting:(int64_t)a3;
- (void)setGlobalSummarizationSetting:(int64_t)a3;
@end

@implementation BLTRemoteGlobalSettingsChangeset

- (BLTRemoteGlobalSettingsChangeset)initWithProvider:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLTRemoteGlobalSettingsChangeset;
  v5 = [(BLTRemoteGlobalSettingsChangeset *)&v8 init];
  if (v5)
  {
    -[BLTRemoteGlobalSettingsChangeset setGlobalScheduledDeliverySetting:](v5, "setGlobalScheduledDeliverySetting:", [v4 globalScheduledDeliverySetting]);
    -[BLTRemoteGlobalSettingsChangeset setGlobalSummarizationSetting:](v5, "setGlobalSummarizationSetting:", [v4 globalSummarizationSetting]);
    v6 = blt_global_settings_sync_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "%@ initWithProvider: %@", buf, 0x16u);
    }
  }
  return v5;
}

+ (id)remoteGlobalSettingsChangesetWithProvider:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithProvider:v4];

  return v5;
}

- (NSString)remoteInfoDirectoryLocation
{
  v2 = BLTPairingPath();
  v3 = [v2 stringByAppendingPathComponent:@"BulletinDistributor"];

  return (NSString *)v3;
}

- (NSString)remoteInfoFileLocation
{
  v2 = [(BLTRemoteGlobalSettingsChangeset *)self remoteInfoDirectoryLocation];
  v3 = [v2 stringByAppendingPathComponent:@"bb_global_remote_settings.plist"];

  return (NSString *)v3;
}

- (BOOL)needsSend
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting]
    || [(BLTRemoteGlobalSettingsChangeset *)self globalSummarizationSetting])
  {
    v3 = NSDictionary;
    id v4 = [(BLTRemoteGlobalSettingsChangeset *)self remoteInfoFileLocation];
    v5 = [v3 dictionaryWithContentsOfFile:v4];

    if (v5)
    {
      v6 = [v5 objectForKeyedSubscript:@"globalScheduledDeliverySetting"];
      int v7 = [v6 intValue];
      if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting] == v7)
      {
        objc_super v8 = [v5 objectForKeyedSubscript:@"globalSummarizationSetting"];
        int v9 = [v8 intValue];
        int64_t v10 = [(BLTRemoteGlobalSettingsChangeset *)self globalSummarizationSetting];

        if (v10 == v9)
        {
          __int16 v11 = blt_global_settings_sync_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 138412546;
            v18 = self;
            __int16 v19 = 2112;
            v20 = v5;
            _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "%@ needsSend: remoteSettings: %@ SHOULD NOT SEND", (uint8_t *)&v17, 0x16u);
          }
          BOOL v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {
      }
      __int16 v11 = blt_global_settings_sync_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412546;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v5;
        uint64_t v13 = "%@ needsSend: remoteSettings: %@ SHOULD SEND";
        v14 = v11;
        uint32_t v15 = 22;
        goto LABEL_14;
      }
    }
    else
    {
      __int16 v11 = blt_global_settings_sync_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        v18 = self;
        uint64_t v13 = "%@ needsSend: !remoteSettings";
        v14 = v11;
        uint32_t v15 = 12;
LABEL_14:
        _os_log_impl(&dword_222F4C000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
      }
    }
    BOOL v12 = 1;
LABEL_16:

    goto LABEL_17;
  }
  v5 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(BLTRemoteGlobalSettingsChangeset *)(uint64_t)self needsSend];
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)sendSuccess
{
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = @"globalScheduledDeliverySetting";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  v16[1] = @"globalSummarizationSetting";
  v17[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"));
  v17[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v6 = [(BLTRemoteGlobalSettingsChangeset *)self remoteInfoFileLocation];
  int v7 = [v5 writeToFile:v6 atomically:1];

  objc_super v8 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "%@ sendSuccess: infoFile: %@ saveSuccess: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (BLTPBSetRemoteGlobalSettingsRequest)blt_protobuf
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [MEMORY[0x263EFF910] now];
  [v4 timeIntervalSince1970];
  objc_msgSend(v3, "setSettingDate:");

  objc_msgSend(v3, "setGlobalScheduledDeliverySetting:", -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  objc_msgSend(v3, "setGlobalSummarizationSetting:", -[BLTRemoteGlobalSettingsChangeset globalSummarizationSetting](self, "globalSummarizationSetting"));
  v5 = blt_global_settings_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    objc_super v8 = self;
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "%@ blt_protobuf: %@", (uint8_t *)&v7, 0x16u);
  }

  return (BLTPBSetRemoteGlobalSettingsRequest *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [v4 globalScheduledDeliverySetting],
        v5 == [(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting]))
  {
    uint64_t v6 = [v4 globalSummarizationSetting];
    BOOL v7 = v6 == [(BLTRemoteGlobalSettingsChangeset *)self globalSummarizationSetting];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySettingDescription];
  BOOL v7 = [(BLTRemoteGlobalSettingsChangeset *)self descriptionForBBSystemSetting:[(BLTRemoteGlobalSettingsChangeset *)self globalSummarizationSetting]];
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p %@, %@>", v5, self, v6, v7];

  return v8;
}

- (id)globalScheduledDeliverySettingDescription
{
  if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting] == -1)
  {
    v3 = @"BBScheduledDeliverySettingUninitialized";
  }
  else if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting])
  {
    if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting] == 1)
    {
      v3 = @"BBScheduledDeliverySettingDisabled";
    }
    else if ([(BLTRemoteGlobalSettingsChangeset *)self globalScheduledDeliverySetting] == 2)
    {
      v3 = @"BBScheduledDeliverySettingEnabled";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<BBScheduledDeliverySetting: <unknown> %ld>", -[BLTRemoteGlobalSettingsChangeset globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = @"BBScheduledDeliverySettingDefault";
  }
  return v3;
}

- (id)descriptionForBBSystemSetting:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<BBSystemSetting: <unknown> %ld>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646840E0[a3 + 1];
  }
  return v3;
}

- (int64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_globalScheduledDeliverySetting = a3;
}

- (int64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  self->_globalSummarizationSetting = a3;
}

- (void)needsSend
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "%@ needsSend: UNEXPECTED: globalScheduledDeliverySetting == BBScheduledDeliverySettingDefault && globalSummarizationSetting == BBSystemSettingDefault - not sending and this should never happen", (uint8_t *)&v2, 0xCu);
}

@end