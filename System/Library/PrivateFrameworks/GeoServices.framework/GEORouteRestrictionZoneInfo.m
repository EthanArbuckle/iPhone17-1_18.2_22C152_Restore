@interface GEORouteRestrictionZoneInfo
+ (BOOL)supportsSecureCoding;
- (GEORouteRestrictionZoneInfo)init;
- (GEORouteRestrictionZoneInfo)initWithCoder:(id)a3;
- (GEORouteRestrictionZoneInfo)initWithGeoRoute:(id)a3;
- (GEORouteRestrictionZoneInfo)initWithGeoWaypointRoute:(id)a3;
- (NSArray)zoneIDs;
- (int)restrictionZoneImpact;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORouteRestrictionZoneInfo

- (GEORouteRestrictionZoneInfo)init
{
  result = (GEORouteRestrictionZoneInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORouteRestrictionZoneInfo)initWithGeoWaypointRoute:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 restrictionZoneInfo];

  if (v5)
  {
    v20.receiver = self;
    v20.super_class = (Class)GEORouteRestrictionZoneInfo;
    self = [(GEORouteRestrictionZoneInfo *)&v20 init];
    if (self)
    {
      v6 = [v4 restrictionZoneInfo];
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "restrictedZoneIdsCount"));
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v8 = objc_msgSend(v6, "restrictedZoneIds", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[GEORouteRestrictionZoneID alloc] initWithGeoRestrictedZoneId:*(void *)(*((void *)&v16 + 1) + 8 * i)];
            if (v13) {
              [(NSArray *)v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }

      zoneIDs = self->_zoneIDs;
      self->_zoneIDs = v7;

      self->_restrictionZoneImpact = [v6 licensePlateRestrictionImpact];
      self = self;

      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (GEORouteRestrictionZoneInfo)initWithGeoRoute:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 restrictedZoneIds];

  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)GEORouteRestrictionZoneInfo;
    self = [(GEORouteRestrictionZoneInfo *)&v19 init];
    if (self)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "restrictedZoneIdsCount"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v7 = objc_msgSend(v4, "restrictedZoneIds", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [[GEORouteRestrictionZoneID alloc] initWithGeoRestrictedZoneId:*(void *)(*((void *)&v15 + 1) + 8 * i)];
            if (v12) {
              [(NSArray *)v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v9);
      }

      zoneIDs = self->_zoneIDs;
      self->_zoneIDs = v6;

      self = self;
      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteRestrictionZoneInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORouteRestrictionZoneInfo;
  v5 = [(GEORouteRestrictionZoneInfo *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_zoneIDs"];
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSArray *)v6;

    v5->_restrictionZoneImpact = [v4 decodeIntegerForKey:@"_restrictionZoneImpact"];
    uint64_t v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  zoneIDs = self->_zoneIDs;
  id v5 = a3;
  [v5 encodeObject:zoneIDs forKey:@"_zoneIDs"];
  [v5 encodeInteger:self->_restrictionZoneImpact forKey:@"_restrictionZoneImpact"];
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (int)restrictionZoneImpact
{
  return self->_restrictionZoneImpact;
}

- (void).cxx_destruct
{
}

@end