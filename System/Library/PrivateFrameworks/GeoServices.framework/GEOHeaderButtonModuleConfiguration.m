@interface GEOHeaderButtonModuleConfiguration
- (BOOL)shouldSuppressDirections;
- (GEOHeaderButtonModuleConfiguration)initWithHeaderButtonConfiguration:(id)a3;
@end

@implementation GEOHeaderButtonModuleConfiguration

- (GEOHeaderButtonModuleConfiguration)initWithHeaderButtonConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOHeaderButtonModuleConfiguration;
    v6 = [(GEOHeaderButtonModuleConfiguration *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_headerButtonsConfiguration, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldSuppressDirections
{
  headerButtonsConfiguration = self->_headerButtonsConfiguration;
  return headerButtonsConfiguration && headerButtonsConfiguration->_shouldSuppressDirectionsAction;
}

- (void).cxx_destruct
{
}

@end