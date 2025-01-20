@interface GEOMapFeatureBuilding
- (BOOL)hasTerrainElevation;
- (GEOMapFeatureBuilding)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4;
- (GEOMapFeatureBuilding)initWithFeature:(id)a3;
- (NSArray)sections;
- (int)tileSetStyle;
- (unint64_t)buildingID;
- (unint64_t)materialID;
- (void)dealloc;
@end

@implementation GEOMapFeatureBuilding

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureBuilding;
  [(GEOMapFeatureBuilding *)&v2 dealloc];
}

- (NSArray)sections
{
  return self->_sections;
}

- (unint64_t)buildingID
{
  return self->_buildingID;
}

- (int)tileSetStyle
{
  return self->_tileSetStyle;
}

- (BOOL)hasTerrainElevation
{
  return self->_hasTerrainElevation;
}

- (unint64_t)materialID
{
  return self->_materialID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_feature, 0);

  objc_storeStrong((id *)&self->_tile, 0);
}

- (GEOMapFeatureBuilding)initWithFeature:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapFeatureBuilding;
  v6 = [(GEOMapFeatureBuilding *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feature, a3);
    v7->_tileSetStyle = 0;
    v8 = (void *)MEMORY[0x1E4F1CA48];
    v9 = [v5 feature];
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "sectionCount"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

    for (unint64_t i = 0; ; ++i)
    {
      v12 = [v5 feature];
      unint64_t v13 = [v12 sectionCount];

      if (i >= v13) {
        break;
      }
      v14 = [[GEOMapFeatureBuildingSection alloc] initWithFeature:v5 sectionIndex:i];
      [(NSArray *)v10 addObject:v14];
    }
    sections = v7->_sections;
    v7->_sections = v10;

    v7->_hasTerrainElevation = 0;
  }

  return v7;
}

- (GEOMapFeatureBuilding)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOMapFeatureBuilding;
  v8 = [(GEOMapFeatureBuilding *)&v21 init];
  v9 = v8;
  if (v8)
  {
    p_tile = (id *)&v8->_tile;
    objc_storeStrong((id *)&v8->_tile, a3);
    v9->_tileSetStyle = 1;
    if ([v7 daVinciBuildingCount] > a4)
    {
      uint64_t v11 = [v7 daVinciBuildings];
      v12 = *(std::__shared_weak_count **)(v11 + 40 * a4 + 8);
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v13 = v11 + 40 * a4;
      unint64_t v14 = *(void *)(v13 + 16);
      uint64_t v15 = *(unsigned __int16 *)(v13 + 34);
      v9->_buildingID = *(void *)(v13 + 24);
      v9->_materialID = v14;
      v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
      if (v15)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          v18 = [[GEOMapFeatureBuildingSection alloc] initWithDaVinciTile:v7 buildingIndex:a4 sectionIndex:i];
          [(NSArray *)v16 addObject:v18];
        }
      }
      sections = v9->_sections;
      v9->_sections = v16;

      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
    }
    v9->_hasTerrainElevation = [*p_tile buildingsHaveTerrainElevation];
  }

  return v9;
}

@end