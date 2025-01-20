@interface CCUIModuleInstance
- (CCSModuleMetadata)metadata;
- (CCUIContentModule)module;
- (CCUILayoutSize)prototypeModuleSize;
- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5;
- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5 uniqueIdentifier:(id)a6 displayName:(id)a7;
- (NSString)displayName;
- (NSString)uniqueIdentifier;
@end

@implementation CCUIModuleInstance

- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5
{
  unint64_t height = a5.height;
  unint64_t width = a5.width;
  v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 UUID];
  v13 = [v12 UUIDString];

  v14 = -[CCUIModuleInstance initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:](self, "initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:", v11, v10, width, height, v13, 0);
  return v14;
}

- (CCUIModuleInstance)initWithMetadata:(id)a3 module:(id)a4 prototypeModuleSize:(CCUILayoutSize)a5 uniqueIdentifier:(id)a6 displayName:(id)a7
{
  unint64_t height = a5.height;
  unint64_t width = a5.width;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CCUIModuleInstance;
  v18 = [(CCUIModuleInstance *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_metadata, a3);
    objc_storeStrong((id *)&v19->_module, a4);
    v19->_prototypeModuleSize.unint64_t width = width;
    v19->_prototypeModuleSize.unint64_t height = height;
    uint64_t v20 = [v16 copy];
    uniqueIdentifier = v19->_uniqueIdentifier;
    v19->_uniqueIdentifier = (NSString *)v20;

    uint64_t v22 = [v17 copy];
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v22;
  }
  return v19;
}

- (CCSModuleMetadata)metadata
{
  return self->_metadata;
}

- (CCUIContentModule)module
{
  return self->_module;
}

- (CCUILayoutSize)prototypeModuleSize
{
  unint64_t height = self->_prototypeModuleSize.height;
  unint64_t width = self->_prototypeModuleSize.width;
  result.unint64_t height = height;
  result.unint64_t width = width;
  return result;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end