@interface GEOModuleConfiguration
+ (id)moduleConfigurationForURL:(id)a3;
- (GEOBusinessInfoModuleConfiguration)businessInfoConfig;
- (GEOButtonModuleConfiguration)actionButtonConfig;
- (GEOHeaderButtonModuleConfiguration)headerButtonConfig;
- (GEOModuleConfiguration)initWithModuleConfiguration:(id)a3;
- (GEOPlaceDetailsModuleConfiguration)placeDetailsConfig;
- (GEOPlaceRibbonConfiguration)placeRibbonConfig;
- (GEORelatedPlaceModuleConfiguration)relatedPlaceConfig;
- (GEOUnifiedActionButtonModuleConfiguration)unifiedActionConfig;
- (GEOWebContentModuleConfiguration)webContentConfig;
- (id)description;
- (int)type;
- (void)_logNoModuleConfigMatchForType;
@end

@implementation GEOModuleConfiguration

- (GEOModuleConfiguration)initWithModuleConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOModuleConfiguration;
  v6 = [(GEOModuleConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_moduleConfig, a3);
  }

  return v7;
}

- (int)type
{
  moduleConfig = self->_moduleConfig;
  if (moduleConfig
    && (*(unsigned char *)&moduleConfig->_flags & 1) != 0
    && (int v3 = moduleConfig->_moduleConfigurationType - 1, v3 <= 8))
  {
    return dword_18A635F6C[v3];
  }
  else
  {
    return 0;
  }
}

- (GEOWebContentModuleConfiguration)webContentConfig
{
  if ([(GEOModuleConfiguration *)self type] == 4)
  {
    int v3 = [GEOWebContentModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue webModuleConfiguration](v4);
    v6 = [(GEOWebContentModuleConfiguration *)v3 initWithWebModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEORelatedPlaceModuleConfiguration)relatedPlaceConfig
{
  if ([(GEOModuleConfiguration *)self type] == 3)
  {
    int v3 = [GEORelatedPlaceModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue templatePlaceModuleConfiguration](v4);
    v6 = [(GEORelatedPlaceModuleConfiguration *)v3 initWithPlaceTemplateModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOPlaceRibbonConfiguration)placeRibbonConfig
{
  if ([(GEOModuleConfiguration *)self type] == 1)
  {
    int v3 = [GEOPlaceRibbonConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue ribbonModuleConfiguration](v4);
    v6 = [(GEOPlaceRibbonConfiguration *)v3 initWithRibbonConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOButtonModuleConfiguration)actionButtonConfig
{
  if ([(GEOModuleConfiguration *)self type] == 2)
  {
    int v3 = [GEOButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue buttonModuleConfiguration](v4);
    v6 = [(GEOButtonModuleConfiguration *)v3 initWithButtonModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOHeaderButtonModuleConfiguration)headerButtonConfig
{
  if ([(GEOModuleConfiguration *)self type] == 5)
  {
    int v3 = [GEOHeaderButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue headerButtonsConfiguration](v4);
    v6 = [(GEOHeaderButtonModuleConfiguration *)v3 initWithHeaderButtonConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOBusinessInfoModuleConfiguration)businessInfoConfig
{
  if ([(GEOModuleConfiguration *)self type] == 7)
  {
    int v3 = [GEOBusinessInfoModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue businessInfosModuleConfiguration](v4);
    v6 = [(GEOBusinessInfoModuleConfiguration *)v3 initWithBusinessInfoModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOPlaceDetailsModuleConfiguration)placeDetailsConfig
{
  if ([(GEOModuleConfiguration *)self type] == 6)
  {
    int v3 = [GEOPlaceDetailsModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue placeInfosModuleConfiguration](v4);
    v6 = [(GEOPlaceDetailsModuleConfiguration *)v3 initWithPlaceInfoModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (GEOUnifiedActionButtonModuleConfiguration)unifiedActionConfig
{
  if ([(GEOModuleConfiguration *)self type] == 8)
  {
    int v3 = [GEOUnifiedActionButtonModuleConfiguration alloc];
    -[GEOPDModuleConfiguration moduleConfigurationValue]((id *)&self->_moduleConfig->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDModuleConfigurationValue unifiedActionModuleConfiguration](v4);
    v6 = [(GEOUnifiedActionButtonModuleConfiguration *)v3 initWithUnifiedActionModuleConfiguration:v5];
  }
  else
  {
    [(GEOModuleConfiguration *)self _logNoModuleConfigMatchForType];
    v6 = 0;
  }

  return v6;
}

- (void)_logNoModuleConfigMatchForType
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = GEOGetPlaceCardLayoutLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    unsigned int v4 = [(GEOModuleConfiguration *)self type] - 1;
    if (v4 > 7) {
      id v5 = @"MODULE_CONFIG_TYPE_UNKNOWN";
    }
    else {
      id v5 = off_1E53E1D10[v4];
    }
    moduleConfig = self->_moduleConfig;
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    v10 = moduleConfig;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Did not have a valid configuration for type %@. Associated module config is %@", (uint8_t *)&v7, 0x16u);
  }
}

+ (id)moduleConfigurationForURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc_init(GEOPDWebModuleConfiguration);
  -[GEOPDWebModuleConfiguration setUrl:]((uint64_t)v4, v3);

  id v5 = objc_alloc_init(GEOPDModuleConfiguration);
  p_isa = (id *)&v5->super.super.isa;
  if (v5)
  {
    *(unsigned char *)&v5->_flags |= 1u;
    v5->_moduleConfigurationType = 4;
  }
  int v7 = objc_alloc_init(GEOPDModuleConfigurationValue);
  -[GEOPDModuleConfiguration setModuleConfigurationValue:]((uint64_t)p_isa, v7);

  v8 = -[GEOPDModuleConfiguration moduleConfigurationValue](p_isa);
  -[GEOPDModuleConfigurationValue setWebModuleConfiguration:]((uint64_t)v8, v4);

  __int16 v9 = [[GEOModuleConfiguration alloc] initWithModuleConfiguration:p_isa];

  return v9;
}

- (id)description
{
  return [(GEOPDModuleConfiguration *)self->_moduleConfig description];
}

- (void).cxx_destruct
{
}

@end