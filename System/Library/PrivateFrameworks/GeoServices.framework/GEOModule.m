@interface GEOModule
- (BOOL)hasConfiguration;
- (BOOL)isExpectedToHaveConfiguration;
- (GEOModule)initWithModule:(id)a3 moduleConfigProvider:(id)a4;
- (GEOModuleConfiguration)configuration;
- (id)description;
- (int)configurationExpectation;
- (int)type;
@end

@implementation GEOModule

- (GEOModule)initWithModule:(id)a3 moduleConfigProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOModule;
  v9 = [(GEOModule *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_module, a3);
    objc_storeStrong((id *)&v10->_moduleConfigProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (int)type
{
  int result = [(GEOPDModule *)self->_module hasType];
  if (result)
  {
    int v4 = [(GEOPDModule *)self->_module type] - 1;
    if (v4 > 0x2D) {
      return 0;
    }
    else {
      return dword_18A635EB4[v4];
    }
  }
  return result;
}

- (GEOModuleConfiguration)configuration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOPDModule *)self->_module options];
  int v4 = [v3 hasWebContentUrl];

  if (v4)
  {
    v5 = GEOGetPlaceCardLayoutLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Accessing a layout that is pre-Sky and we notice that there is a web module.  Creating a web module config.", (uint8_t *)&v16, 2u);
    }

    v6 = [(GEOPDModule *)self->_module options];
    id v7 = [v6 webContentUrl];
    id v8 = +[GEOModuleConfiguration moduleConfigurationForURL:v7];

    goto LABEL_22;
  }
  int v9 = [(GEOModule *)self configurationExpectation];
  if (![(GEOPDModule *)self->_module hasModuleConfigurationIndex])
  {
    if (v9 != 2)
    {
      id v8 = 0;
      goto LABEL_23;
    }
    v6 = GEOGetPlaceCardLayoutLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    unsigned int v12 = [(GEOModule *)self type] - 1;
    if (v12 > 0x2C) {
      objc_super v13 = @"MODULE_TYPE_UNKNOWN";
    }
    else {
      objc_super v13 = off_1E53E1B90[v12];
    }
    int v16 = 138412290;
    v17 = v13;
    v14 = "The module configuration %@ is required to to have a configuration and does not have an index.";
    goto LABEL_20;
  }
  id v8 = [(GEOModuleConfigurationProvider *)self->_moduleConfigProvider moduleConfigurationForIndex:[(GEOPDModule *)self->_module moduleConfigurationIndex]];
  if (!v8 && v9 == 2)
  {
    v6 = GEOGetPlaceCardLayoutLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_21:
      id v8 = 0;
LABEL_22:

      goto LABEL_23;
    }
    unsigned int v10 = [(GEOModule *)self type] - 1;
    if (v10 > 0x2C) {
      v11 = @"MODULE_TYPE_UNKNOWN";
    }
    else {
      v11 = off_1E53E1B90[v10];
    }
    int v16 = 138412290;
    v17 = v11;
    v14 = "The module configuration %@ is required to to have a configuration and does not have a matching configuration";
LABEL_20:
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0xCu);
    goto LABEL_21;
  }
LABEL_23:

  return (GEOModuleConfiguration *)v8;
}

- (BOOL)hasConfiguration
{
  return [(GEOPDModule *)self->_module hasModuleConfigurationIndex];
}

- (int)configurationExpectation
{
  unsigned int v2 = [(GEOModule *)self type];
  int v3 = ((1 << v2) & 0x8000001024) != 0;
  if (((1 << v2) & 0x4806000000) != 0) {
    int v3 = 2;
  }
  if (v2 <= 0x27) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)isExpectedToHaveConfiguration
{
  return [(GEOModule *)self configurationExpectation] == 2;
}

- (id)description
{
  return [(GEOPDModule *)self->_module description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfigProvider, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

@end