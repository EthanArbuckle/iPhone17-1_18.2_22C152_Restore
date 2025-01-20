@interface GEOPlacecardLayoutData
- (GEOModuleLayoutEntry)currentModuleLayoutEntry;
- (GEOPlacecardLayoutData)initWithPlacecardLayoutData:(id)a3;
- (id)moduleConfigurationForIndex:(unint64_t)a3;
@end

@implementation GEOPlacecardLayoutData

- (GEOPlacecardLayoutData)initWithPlacecardLayoutData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPlacecardLayoutData;
  v6 = [(GEOPlacecardLayoutData *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placecardLayoutData, a3);
    v8 = [GEOPlacecardLayoutConfiguration alloc];
    v9 = -[GEOPDPlacecardLayoutData layoutConfiguration]((id *)&v7->_placecardLayoutData->super.super.isa);
    uint64_t v10 = [(GEOPlacecardLayoutConfiguration *)v8 initWithPlacecardLayoutConfiguration:v9 moduleConfigurationProvider:v7];
    placecardLayoutConfiguration = v7->_placecardLayoutConfiguration;
    v7->_placecardLayoutConfiguration = (GEOPlacecardLayoutConfiguration *)v10;

    v12 = GEOGetPlaceCardLayoutLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "Initializing GEOPlacecardLayoutData with layoutData: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)moduleConfigurationForIndex:(unint64_t)a3
{
  id v5 = -[GEOPDPlacecardLayoutData moduleConfigurations]((id *)&self->_placecardLayoutData->super.super.isa);
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = -[GEOPDPlacecardLayoutData moduleConfigurations]((id *)&self->_placecardLayoutData->super.super.isa);
    v8 = [v7 objectAtIndex:a3];

    v9 = [[GEOModuleConfiguration alloc] initWithModuleConfiguration:v8];
  }

  return v9;
}

- (GEOModuleLayoutEntry)currentModuleLayoutEntry
{
  return [(GEOPlacecardLayoutConfiguration *)self->_placecardLayoutConfiguration currentModuleLayoutEntry];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardLayoutConfiguration, 0);

  objc_storeStrong((id *)&self->_placecardLayoutData, 0);
}

@end