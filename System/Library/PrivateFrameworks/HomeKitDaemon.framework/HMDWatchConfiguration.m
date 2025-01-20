@interface HMDWatchConfiguration
- (HMDWatchConfiguration)initWithUniqueID:(id)a3;
- (NSDictionary)homeConfig;
- (NSDictionary)metadataConfig;
- (NSString)uniqueId;
- (NSUUID)primaryHome;
- (id)description;
- (void)setConfigVersion:(id)a3 forHome:(id)a4;
- (void)setHomeConfig:(id)a3;
- (void)setHomeConfiguration:(id)a3;
- (void)setMetadataConfig:(id)a3;
- (void)setPrimaryHome:(id)a3;
- (void)setUniqueId:(id)a3;
@end

@implementation HMDWatchConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryHome, 0);
  objc_storeStrong((id *)&self->_homeConfig, 0);
  objc_storeStrong((id *)&self->_metadataConfig, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

- (void)setPrimaryHome:(id)a3
{
}

- (NSUUID)primaryHome
{
  return self->_primaryHome;
}

- (void)setHomeConfig:(id)a3
{
}

- (NSDictionary)homeConfig
{
  return self->_homeConfig;
}

- (void)setMetadataConfig:(id)a3
{
}

- (NSDictionary)metadataConfig
{
  return self->_metadataConfig;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setConfigVersion:(id)a3 forHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDWatchConfiguration *)self homeConfig];
  id v10 = (id)[v8 mutableCopy];

  [v10 setObject:v7 forKeyedSubscript:v6];
  v9 = (void *)[v10 copy];
  [(HMDWatchConfiguration *)self setHomeConfig:v9];
}

- (void)setHomeConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x263F08C38]);
          v13 = objc_msgSend(v12, "initWithUUIDString:", v11, (void)v16);
          v14 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v14 forKeyedSubscript:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    v15 = (void *)[v5 copy];
    [(HMDWatchConfiguration *)self setHomeConfig:v15];
  }
  else
  {
    v5 = [NSDictionary dictionary];
    [(HMDWatchConfiguration *)self setHomeConfig:v5];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(HMDWatchConfiguration *)self uniqueId];
  v5 = [(HMDWatchConfiguration *)self metadataConfig];
  id v6 = [(HMDWatchConfiguration *)self homeConfig];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<HMDWatchConfiguration: Watch ID: %@, Metadata Config: %@, Homedata Config: %@>", v4, v5, v6];

  return v7;
}

- (HMDWatchConfiguration)initWithUniqueID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDWatchConfiguration;
  v5 = [(HMDWatchConfiguration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSString *)v6;

    uint64_t v8 = [NSDictionary dictionary];
    homeConfig = v5->_homeConfig;
    v5->_homeConfig = (NSDictionary *)v8;
  }
  return v5;
}

@end