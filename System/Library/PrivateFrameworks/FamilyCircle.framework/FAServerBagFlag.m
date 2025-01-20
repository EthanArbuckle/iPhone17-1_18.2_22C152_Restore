@interface FAServerBagFlag
+ (id)megadomeKillSwitch;
+ (id)registerDeviceWithPDS;
- (BOOL)isEnabledWithForceRefresh:(BOOL)a3;
- (BOOL)value;
- (FAServerBagFlag)initWithServerKey:(id)a3;
- (NSString)name;
- (void)grabFromServer;
- (void)setName:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation FAServerBagFlag

+ (id)megadomeKillSwitch
{
  if (megadomeKillSwitch_onceToken[0] != -1) {
    dispatch_once(megadomeKillSwitch_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)megadomeKillSwitch_megadomeKillSwitch;
  return v2;
}

uint64_t __37__FAServerBagFlag_megadomeKillSwitch__block_invoke()
{
  megadomeKillSwitch_megadomeKillSwitch = [[FAServerBagFlag alloc] initWithServerKey:@"megadomeKillSwitch"];
  return MEMORY[0x1F41817F8]();
}

+ (id)registerDeviceWithPDS
{
  if (registerDeviceWithPDS_onceToken[0] != -1) {
    dispatch_once(registerDeviceWithPDS_onceToken, &__block_literal_global_27);
  }
  v2 = (void *)registerDeviceWithPDS_registerDeviceWithPDS;
  return v2;
}

uint64_t __40__FAServerBagFlag_registerDeviceWithPDS__block_invoke()
{
  registerDeviceWithPDS_registerDeviceWithPDS = [[FAServerBagFlag alloc] initWithServerKey:@"usePDS"];
  return MEMORY[0x1F41817F8]();
}

- (FAServerBagFlag)initWithServerKey:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FAServerBagFlag;
  v5 = [(FAServerBagFlag *)&v8 init];
  if (v5)
  {
    v9[0] = @"usePDS";
    v9[1] = @"megadomeKillSwitch";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    if ([v6 containsObject:v4])
    {
      [(FAServerBagFlag *)v5 setName:v4];
      [(FAServerBagFlag *)v5 grabFromServer];
    }
  }
  return v5;
}

- (BOOL)isEnabledWithForceRefresh:(BOOL)a3
{
  if (a3) {
    [(FAServerBagFlag *)self grabFromServer];
  }
  return [(FAServerBagFlag *)self value];
}

- (void)grabFromServer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F179C8] defaultStore];
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v5 = [v4 propertiesForDataclass:@"com.apple.Dataclass.Family"];
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "Server results are %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = [(FAServerBagFlag *)self name];
  objc_super v8 = [v5 objectForKey:v7];

  if (v8)
  {
    -[FAServerBagFlag setValue:](self, "setValue:", [v8 BOOLValue]);
  }
  else
  {
    v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(FAServerBagFlag *)self name];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D252C000, v9, OS_LOG_TYPE_DEFAULT, "No server value for %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end