@interface GEORawRouteGeometry
+ (BOOL)supportsSecureCoding;
- (GEORawRouteGeometry)initWithCoder:(id)a3;
- (GEORawRouteGeometry)initWithGeoWaypointRoute:(id)a3;
- (GEORawRouteGeometry)initWithRawData:(id)a3;
- (NSArray)paths;
- (void)encodeWithCoder:(id)a3;
- (void)pathMatcherNoMatchRangesWithHandler:(id)a3;
@end

@implementation GEORawRouteGeometry

- (GEORawRouteGeometry)initWithGeoWaypointRoute:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEORawRouteGeometry;
  v5 = [(GEORawRouteGeometry *)&v11 init];
  if (v5)
  {
    v6 = [v4 routeLegs];
    uint64_t v7 = objc_msgSend(v6, "_geo_map:", &__block_literal_global_29);
    paths = v5->_paths;
    v5->_paths = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

GEORawPathGeometry *__48__GEORawRouteGeometry_initWithGeoWaypointRoute___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [GEORawPathGeometry alloc];
  id v4 = [v2 pathLeg];
  v5 = [v2 pathMapMatcherInstructions];
  v6 = [(GEORawPathGeometry *)v3 initWithRawData:v4 pathMatcherInstructions:v5];

  return v6;
}

- (GEORawRouteGeometry)initWithRawData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORawRouteGeometry;
  v5 = [(GEORawRouteGeometry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_geo_map:", &__block_literal_global_40);
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

GEORawPathGeometry *__39__GEORawRouteGeometry_initWithRawData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEORawPathGeometry alloc] initWithRawData:v2 pathMatcherInstructions:0];

  return v3;
}

- (void)pathMatcherNoMatchRangesWithHandler:(id)a3
{
  v14 = self;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, unint64_t, double, double))a3;
  if (v3)
  {
    for (unint64_t i = 0; i < [(NSArray *)v14->_paths count]; ++i)
    {
      v5 = [(NSArray *)v14->_paths objectAtIndexedSubscript:i];
      v15 = [v5 pathMatcherInstructions];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v6 = [v15 noMatchs];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v6);
            }
            objc_super v10 = *(void **)(*((void *)&v16 + 1) + 8 * j);
            objc_super v11 = [v10 stretch];
            unsigned int v12 = [v11 startOffsetCm];
            v13 = [v10 stretch];
            v3[2](v3, i, (float)v12 * 0.01, (float)[v13 endOffsetCm] * 0.01);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v7);
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (GEORawRouteGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORawRouteGeometry;
  v5 = [(GEORawRouteGeometry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_paths"];
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (NSArray)paths
{
  return self->_paths;
}

- (void).cxx_destruct
{
}

@end