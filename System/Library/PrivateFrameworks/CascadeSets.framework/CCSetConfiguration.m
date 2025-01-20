@interface CCSetConfiguration
+ (id)setConfigurationForItemType:(unsigned __int16)a3;
+ (id)syncableSetConfigurations;
- (CCSetConfiguration)initWithSetIdentifier:(id)a3 setUUID:(id)a4 resourceDomain:(unint64_t)a5 configuredDescriptors:(id)a6 syncPolicy:(id)a7;
- (CCSetSyncPolicy)syncPolicy;
- (NSArray)configuredDescriptors;
- (NSString)setIdentifier;
- (NSUUID)setUUID;
- (unint64_t)resourceDomain;
- (unsigned)itemType;
@end

@implementation CCSetConfiguration

- (CCSetConfiguration)initWithSetIdentifier:(id)a3 setUUID:(id)a4 resourceDomain:(unint64_t)a5 configuredDescriptors:(id)a6 syncPolicy:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CCSetConfiguration;
  v17 = [(CCSetConfiguration *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_setIdentifier, a3);
    objc_storeStrong((id *)&v18->_setUUID, a4);
    v18->_resourceDomain = a5;
    objc_storeStrong((id *)&v18->_configuredDescriptors, a6);
    objc_storeStrong((id *)&v18->_syncPolicy, a7);
  }

  return v18;
}

- (unsigned)itemType
{
  v3 = CCTypeIdentifierRegistryBridge();
  LOWORD(self) = [v3 itemTypeForSetIdentifier:self->_setIdentifier];

  return (unsigned __int16)self;
}

+ (id)syncableSetConfigurations
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = +[CCSetConfigurationRegistry allSetConfigurations];
  v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "syncPolicy", (void)v15);
        if (v10)
        {
          v11 = (void *)v10;
          v12 = [v9 syncPolicy];
          id v13 = [v12 platformPolicies];

          if (v13) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)setConfigurationForItemType:(unsigned __int16)a3
{
  if ((unsigned __int16)CCTypeIdentifierUnknown == a3)
  {
    v3 = 0;
LABEL_4:
    uint64_t v6 = +[CCSetConfigurationRegistry configurationForSetIdentifier:v3];

    goto LABEL_6;
  }
  uint64_t v4 = a3;
  uint64_t v5 = CCTypeIdentifierRegistryBridge();
  v3 = [v5 setIdentifierForItemType:v4];

  if (v3) {
    goto LABEL_4;
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

- (NSString)setIdentifier
{
  return self->_setIdentifier;
}

- (NSUUID)setUUID
{
  return self->_setUUID;
}

- (unint64_t)resourceDomain
{
  return self->_resourceDomain;
}

- (NSArray)configuredDescriptors
{
  return self->_configuredDescriptors;
}

- (CCSetSyncPolicy)syncPolicy
{
  return self->_syncPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncPolicy, 0);
  objc_storeStrong((id *)&self->_configuredDescriptors, 0);
  objc_storeStrong((id *)&self->_setUUID, 0);

  objc_storeStrong((id *)&self->_setIdentifier, 0);
}

@end