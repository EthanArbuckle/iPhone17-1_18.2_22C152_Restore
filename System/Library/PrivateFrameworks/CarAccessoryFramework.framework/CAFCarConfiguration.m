@interface CAFCarConfiguration
+ (BOOL)getBoolean:(id)a3 key:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)getType:(id)a3;
+ (id)getTypeString:(id)a3;
+ (id)getUUID:(id)a3 instanceID:(id)a4;
- (BOOL)isConfigured;
- (BOOL)rightHandDrive;
- (BOOL)updateConfiguration:(id)a3;
- (BOOL)updateConfiguration:(id)a3 pluginConfig:(id)a4;
- (CAFCachedDescription)cachedDescription;
- (CAFCarConfiguration)initWithCoder:(id)a3;
- (CAFCarConfiguration)initWithIdentifier:(id)a3 session:(id)a4;
- (CAFCarConfiguration)initWithName:(id)a3 identifier:(id)a4 rightHandDrive:(BOOL)a5 pluginCount:(unint64_t)a6 sessionAnalytics:(id)a7;
- (CAFCarConfigurationDelegate)delegate;
- (CAFSessionAnalytics)sessionAnalytics;
- (NSDictionary)pluginConfigs;
- (NSString)description;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)copyWithoutPlugins;
- (id)currentDescriptionForCache:(id)a3;
- (unint64_t)pluginCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CAFCarConfiguration

- (CAFCarConfiguration)initWithIdentifier:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CAFCarConfiguration;
  v9 = [(CAFCarConfiguration *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueIdentifier, a3);
    v11 = [v8 configuration];
    uint64_t v12 = [v11 name];
    name = v10->_name;
    v10->_name = (NSString *)v12;

    v14 = [v8 configuration];
    v10->_rightHandDrive = [v14 rightHandDrive];

    v15 = [v8 configuration];
    v10->_pluginCount = [v15 vehicleDataPluginCount];

    v16 = [[CAFSessionAnalytics alloc] initWithSession:v8];
    sessionAnalytics = v10->_sessionAnalytics;
    v10->_sessionAnalytics = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pluginConfigs = v10->_pluginConfigs;
    v10->_pluginConfigs = v18;

    v20 = [[CAFCachedDescription alloc] initWithCacheable:v10];
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v20;
  }
  return v10;
}

- (id)copyWithoutPlugins
{
  v3 = [CAFCarConfiguration alloc];
  v4 = [(CAFCarConfiguration *)self name];
  v5 = [(CAFCarConfiguration *)self uniqueIdentifier];
  BOOL v6 = [(CAFCarConfiguration *)self rightHandDrive];
  unint64_t v7 = [(CAFCarConfiguration *)self pluginCount];
  id v8 = [(CAFCarConfiguration *)self sessionAnalytics];
  v9 = [(CAFCarConfiguration *)v3 initWithName:v4 identifier:v5 rightHandDrive:v6 pluginCount:v7 sessionAnalytics:v8];

  return v9;
}

- (CAFCarConfiguration)initWithName:(id)a3 identifier:(id)a4 rightHandDrive:(BOOL)a5 pluginCount:(unint64_t)a6 sessionAnalytics:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CAFCarConfiguration;
  v16 = [(CAFCarConfiguration *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a4);
    v17->_rightHandDrive = a5;
    v17->_pluginCount = a6;
    objc_storeStrong((id *)&v17->_sessionAnalytics, a7);
    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pluginConfigs = v17->_pluginConfigs;
    v17->_pluginConfigs = v18;

    v20 = [[CAFCachedDescription alloc] initWithCacheable:v17];
    cachedDescription = v17->_cachedDescription;
    v17->_cachedDescription = v20;
  }
  return v17;
}

- (BOOL)updateConfiguration:(id)a3 pluginConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAFCarConfiguration *)self pluginConfigs];
  [v8 setObject:v6 forKeyedSubscript:v7];

  v9 = [(CAFCarConfiguration *)self cachedDescription];
  [v9 setNeedsRefreshDescription];

  v10 = [(CAFCarConfiguration *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    v11 = [(CAFCarConfiguration *)self delegate];
    uint64_t v12 = [(CAFCarConfiguration *)self pluginConfigs];
    [v11 car:self didUpdatePluginConfigs:v12];
  }
  return 1;
}

- (BOOL)updateConfiguration:(id)a3
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__CAFCarConfiguration_updateConfiguration___block_invoke;
  v10[3] = &unk_265264730;
  v10[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  v4 = [(CAFCarConfiguration *)self cachedDescription];
  [v4 setNeedsRefreshDescription];

  v5 = [(CAFCarConfiguration *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CAFCarConfiguration *)self delegate];
    id v8 = [(CAFCarConfiguration *)self pluginConfigs];
    [v7 car:self didUpdatePluginConfigs:v8];
  }
  return 1;
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [*(id *)(a1 + 32) pluginConfigs];
      [v9 setObject:v8 forKeyedSubscript:v7];
    }
    else
    {

      id v8 = CAFGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_2((uint64_t)v7, v8);
      }
    }

    v10 = v7;
  }
  else
  {

    v10 = CAFGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_1(v10);
    }
  }
}

- (BOOL)isConfigured
{
  unint64_t pluginCount = self->_pluginCount;
  return pluginCount && pluginCount == [(NSDictionary *)self->_pluginConfigs count];
}

- (NSString)description
{
  v2 = [(CAFCarConfiguration *)self cachedDescription];
  v3 = [v2 description];

  return (NSString *)v3;
}

+ (BOOL)getBoolean:(id)a3 key:(id)a4
{
  v4 = [a3 objectForKeyedSubscript:a4];
  id v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)getType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = [v3 objectForKeyedSubscript:@"type"];

  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = +[CAFCarConfiguration getTypeString:v6];

  return v7;
}

+ (id)getTypeString:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%016llX", objc_msgSend(a3, "unsignedLongLongValue"));
}

+ (id)getUUID:(id)a3 instanceID:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [a3 longLongValue];
  uint64_t v7 = [v5 longLongValue];

  v10[0] = BYTE3(v6);
  v10[1] = BYTE2(v6);
  v10[2] = BYTE1(v6);
  v10[3] = v6;
  v10[4] = BYTE5(v6);
  void v10[5] = BYTE4(v6);
  v10[6] = HIBYTE(v6);
  v10[7] = BYTE6(v6);
  v10[8] = HIBYTE(v7);
  v10[9] = BYTE6(v7);
  v10[10] = BYTE5(v7);
  v10[11] = BYTE4(v7);
  v10[12] = BYTE3(v7);
  v10[13] = BYTE2(v7);
  v10[14] = BYTE1(v7);
  v10[15] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v10];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFCarConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CAFCarConfiguration;
  id v5 = [(CAFCarConfiguration *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFCarConfigurationNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFCarConfigurationUniqueIdentifierKey"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFCarConfigurationPluginCountKey"];
    v5->_unint64_t pluginCount = [v10 unsignedIntValue];

    if ([v4 containsValueForKey:@"CAFCarConfigurationPluginConfigs"])
    {
      uint64_t v11 = (void *)MEMORY[0x263EFFA08];
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
      uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"CAFCarConfigurationPluginConfigs"];
      pluginConfigs = v5->_pluginConfigs;
      v5->_pluginConfigs = (NSDictionary *)v18;
    }
    v5->_rightHandDrive = [v4 decodeBoolForKey:@"CAFCarConfigurationRightHandDrive"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAFCarConfigurationSessionAnalytics"];
    sessionAnalytics = v5->_sessionAnalytics;
    v5->_sessionAnalytics = (CAFSessionAnalytics *)v20;

    v22 = [[CAFCachedDescription alloc] initWithCacheable:v5];
    cachedDescription = v5->_cachedDescription;
    v5->_cachedDescription = v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_name forKey:@"CAFCarConfigurationNameKey"];
  [v6 encodeObject:self->_uniqueIdentifier forKey:@"CAFCarConfigurationUniqueIdentifierKey"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_pluginCount];
  [v6 encodeObject:v4 forKey:@"CAFCarConfigurationPluginCountKey"];

  pluginConfigs = self->_pluginConfigs;
  if (pluginConfigs) {
    [v6 encodeObject:pluginConfigs forKey:@"CAFCarConfigurationPluginConfigs"];
  }
  [v6 encodeBool:self->_rightHandDrive forKey:@"CAFCarConfigurationRightHandDrive"];
  [v6 encodeObject:self->_sessionAnalytics forKey:@"CAFCarConfigurationSessionAnalytics"];
}

- (id)currentDescriptionForCache:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(CAFCarConfiguration *)self name];
  uint64_t v7 = [(CAFCarConfiguration *)self uniqueIdentifier];
  uint64_t v8 = [v7 UUIDString];
  v9 = [(CAFCarConfiguration *)self pluginConfigs];
  v10 = [v4 stringWithFormat:@"<%@: %p name=%@ uniqueIdentifier=%@ pluginCount=%lu/%lu>", v5, self, v6, v8, objc_msgSend(v9, "count"), -[CAFCarConfiguration pluginCount](self, "pluginCount")];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (unint64_t)pluginCount
{
  return self->_pluginCount;
}

- (NSDictionary)pluginConfigs
{
  return self->_pluginConfigs;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (CAFSessionAnalytics)sessionAnalytics
{
  return self->_sessionAnalytics;
}

- (CAFCarConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAFCarConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_pluginConfigs, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "Parsing configuration failed for pluginID", v1, 2u);
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "Parsing configuration from pluginID: %@ failed for pluginConfig", (uint8_t *)&v2, 0xCu);
}

@end