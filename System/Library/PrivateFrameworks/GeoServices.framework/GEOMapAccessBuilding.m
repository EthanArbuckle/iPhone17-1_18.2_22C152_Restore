@interface GEOMapAccessBuilding
- (GEOMapAccessBuilding)initWithBuildingFeature:(id)a3;
- (NSArray)sections;
- (void)dealloc;
@end

@implementation GEOMapAccessBuilding

- (GEOMapAccessBuilding)initWithBuildingFeature:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapAccessBuilding;
  v6 = [(GEOMapAccessBuilding *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buildingFeature, a3);
    v8 = [(GEOBuildingFootprintFeature *)v7->_buildingFeature feature];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "sectionCount"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if ([v8 sectionCount])
    {
      unint64_t v10 = 0;
      do
      {
        v11 = [[GEOMapAccessBuildingSection alloc] initWithFeature:v5 sectionIndex:v10];
        [(NSArray *)v9 addObject:v11];

        ++v10;
      }
      while (v10 < [v8 sectionCount]);
    }
    sections = v7->_sections;
    v7->_sections = v9;

    v13 = v7;
  }

  return v7;
}

- (void)dealloc
{
  buildingFeature = self->_buildingFeature;
  if (buildingFeature)
  {
    self->_buildingFeature = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessBuilding;
  [(GEOMapAccessBuilding *)&v4 dealloc];
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_buildingFeature, 0);
}

@end