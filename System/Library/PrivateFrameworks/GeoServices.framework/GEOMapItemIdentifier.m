@interface GEOMapItemIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)mapItemIdentifiersFromMapsIdentifiers:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)hasCoordinate;
- (BOOL)hasMapsIdentifierString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGEOMapItemIdentifier:(id)a3;
- (BOOL)isValid;
- (BOOL)isValidForOfflineUse;
- (GEOMapItemIdentifier)init;
- (GEOMapItemIdentifier)initWithBasemapId:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5;
- (GEOMapItemIdentifier)initWithCoder:(id)a3;
- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3;
- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(id)a4;
- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5;
- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 sourceID:(unsigned int)a4;
- (GEOMapItemIdentifier)initWithMapItem:(id)a3;
- (GEOMapItemIdentifier)initWithMapsIdentifier:(id)a3;
- (GEOMapItemIdentifier)initWithMapsIdentifierString:(id)a3;
- (GEOMapItemIdentifier)initWithPlace:(id)a3;
- (NSData)comparableRepresentation;
- (NSString)mapsIdentifierString;
- (id)debugDescription;
- (id)description;
- (id)mapsIdentifier;
- (id)shortDebugDescription;
- (int)resultProviderID;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOMapItemIdentifier

- (unint64_t)hash
{
  v3 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v4 = [v3 hasMuid];

  v5 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 muid];
LABEL_5:
    unint64_t v10 = v7;

    return v10;
  }
  int v8 = [v5 hasBasemapId];

  v9 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  v6 = v9;
  if (v8)
  {
    uint64_t v7 = [v9 basemapId];
    goto LABEL_5;
  }
  int v12 = [v9 hasCenter];

  mapsIdentifier = self->_mapsIdentifier;
  if (v12)
  {
    v14 = [(GEOPDMapsIdentifier *)mapsIdentifier shardedId];
    v15 = [v14 center];
    unint64_t v16 = [v15 hash];

    return v16;
  }
  else
  {
    return [(GEOPDMapsIdentifier *)mapsIdentifier hash];
  }
}

- (unint64_t)muid
{
  v3 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  if ([v3 hasMuid])
  {
    int v4 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    unint64_t v5 = [v4 muid];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (GEOMapItemIdentifier)initWithPlace:(id)a3
{
  id v4 = a3;
  if (![v4 hasMapsId])
  {
    if ([v4 hasPreferredMuid])
    {
      uint64_t v7 = [v4 preferredMuid];
    }
    else
    {
      if (![v4 hasMuid])
      {
        if ([v4 hasMapsId])
        {
          v23 = [v4 mapsId];
          v24 = [v23 shardedId];
          uint64_t v8 = [v24 muid];
        }
        else
        {
          uint64_t v8 = 0;
        }
        goto LABEL_8;
      }
      uint64_t v7 = [v4 muid];
    }
    uint64_t v8 = v7;
LABEL_8:
    if ([v4 hasResultProviderId]) {
      uint64_t v9 = [v4 resultProviderId];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = +[GEOPDPlaceInfo placeInfoForPlaceData:v4];
    uint64_t v5 = v10;
    if (v10)
    {
      -[GEOPDPlaceInfo _readCenter](v10);
      if (*(void *)(v5 + 40))
      {
        v11 = -[GEOPDPlaceInfo center]((id *)v5);
        [v11 coordinate];
        double v13 = v12;
        double v15 = v14;
LABEL_23:

        v6 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v8, v9, v13, v15);
        goto LABEL_24;
      }
    }
    unint64_t v16 = [v4 mapsId];
    v17 = [v16 shardedId];
    int v18 = [v17 hasCenter];

    if (v18)
    {
      v11 = [v4 mapsId];
      v19 = [v11 shardedId];
      v20 = [v19 center];
      [v20 coordinate];
      double v13 = v21;
      double v15 = v22;
    }
    else
    {
      uint64_t v25 = +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:v4];
      v11 = (void *)v25;
      if (v25)
      {
        -[GEOPDSpatialLookupResult _readCenter](v25);
        if (v11[7])
        {
          v19 = -[GEOPDSpatialLookupResult center]((id *)v11);
          [v19 coordinate];
          double v13 = v26;
          double v15 = v27;
          goto LABEL_22;
        }
      }
      uint64_t v30 = +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:v4];
      v19 = (void *)v30;
      double v13 = -180.0;
      if (!v30 || ![*(id *)(v30 + 16) count])
      {
        double v15 = -180.0;
        goto LABEL_22;
      }
      v31 = -[GEOPDRoadAccessInfo roadAccessPointAtIndex:]((id *)v19, 0);
      v20 = v31;
      if (v31)
      {
        v32 = [v31 location];
        [v32 coordinate];
        double v13 = v33;
        double v15 = v34;
      }
      else
      {
        double v13 = -180.0;
        double v15 = -180.0;
      }
    }

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v5 = [v4 mapsId];
  v6 = [(GEOMapItemIdentifier *)self initWithMapsIdentifier:v5];
LABEL_24:
  v28 = v6;

  return v28;
}

- (GEOMapItemIdentifier)initWithMapsIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOMapItemIdentifier;
    uint64_t v5 = [(GEOMapItemIdentifier *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      mapsIdentifier = v5->_mapsIdentifier;
      v5->_mapsIdentifier = (GEOPDMapsIdentifier *)v6;
    }
    self = v5;
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v7 = *(void *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapItemIdentifier;
  uint64_t v9 = [(GEOMapItemIdentifier *)&v16 init];
  if (v9)
  {
    objc_super v10 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v9->_mapsIdentifier;
    v9->_mapsIdentifier = v10;

    double v12 = objc_alloc_init(GEOPDShardedId);
    double v13 = v12;
    if (a3) {
      [(GEOPDShardedId *)v12 setMuid:a3];
    }
    if (v7) {
      [(GEOPDShardedId *)v13 setResultProviderId:v7];
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      double v14 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      [(GEOPDShardedId *)v13 setCenter:v14];
    }
    [(GEOPDMapsIdentifier *)v9->_mapsIdentifier setShardedId:v13];
  }
  return v9;
}

- (id)mapsIdentifier
{
  v2 = (void *)[(GEOPDMapsIdentifier *)self->_mapsIdentifier copy];

  return v2;
}

- (GEOMapItemIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self)
    {
      uint64_t v7 = objc_msgSend(v5, "geo_decodeXPCDataForKey:", @"identifier");
      if (v7
        && (uint64_t v8 = [[GEOPDMapsIdentifier alloc] initWithData:v7]) != 0)
      {
        uint64_t v9 = v8;
        self = [(GEOMapItemIdentifier *)self initWithMapsIdentifier:v8];
      }
      else
      {
        uint64_t v14 = objc_msgSend(v6, "geo_decodeXPCInt64ForKey:defaultValue:", @"muid", 0);
        uint64_t v15 = objc_msgSend(v6, "geo_decodeXPCInt64ForKey:defaultValue:", @"rpi", 0);
        char v31 = 1;
        objc_msgSend(v6, "geo_decodeXPCDoubleForKey:success:", @"lat", &v31);
        double v17 = v16;
        objc_msgSend(v6, "geo_decodeXPCDoubleForKey:success:", @"lng", &v31);
        if (v31)
        {
          double v19 = v18;
        }
        else
        {
          double v17 = -180.0;
          double v19 = -180.0;
        }
        objc_msgSend(v6, "geo_decodeXPCStringForKey:", @"mis");
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        mapsIdentifierString = self->_mapsIdentifierString;
        self->_mapsIdentifierString = v20;

        self = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v14, v15, v17, v19);
      }
    }
    double v22 = self;
LABEL_28:
    double v12 = v22;
    goto LABEL_29;
  }
  if (![v4 containsValueForKey:@"identifier"]
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v4 containsValueForKey:@"muid"]) {
      uint64_t v13 = [v4 decodeInt64ForKey:@"muid"];
    }
    else {
      uint64_t v13 = 0;
    }
    if ([v4 containsValueForKey:@"rpi"]) {
      uint64_t v23 = [v4 decodeInt32ForKey:@"rpi"];
    }
    else {
      uint64_t v23 = 0;
    }
    double v24 = -180.0;
    if ([v4 containsValueForKey:@"lat"])
    {
      double v25 = -180.0;
      if ([v4 containsValueForKey:@"lng"])
      {
        [v4 decodeDoubleForKey:@"lat"];
        double v24 = v26;
        [v4 decodeDoubleForKey:@"lng"];
        double v25 = v27;
      }
    }
    else
    {
      double v25 = -180.0;
    }
    if ([v4 containsValueForKey:@"mis"])
    {
      v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mis"];
      v29 = self->_mapsIdentifierString;
      self->_mapsIdentifierString = v28;
    }
    double v22 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v13, v23, v24, v25);
    goto LABEL_28;
  }
  v11 = (void *)v10;
  double v12 = [(GEOMapItemIdentifier *)self initWithMapsIdentifier:v10];

LABEL_29:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsIdentifierString, 0);

  objc_storeStrong((id *)&self->_mapsIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v22 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v22;
    if (self)
    {
      id v5 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier data];
      objc_msgSend(v4, "geo_encodeXPCData:forKey:", v5, @"identifier");

      uint64_t v6 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
      int v7 = [v6 hasMuid];

      if (v7) {
        objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", -[GEOMapItemIdentifier muid](self, "muid"), @"muid");
      }
      uint64_t v8 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
      int v9 = [v8 hasResultProviderId];

      if (v9) {
        objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"), @"rpi");
      }
      uint64_t v10 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
      int v11 = [v10 hasCenter];

      if (v11)
      {
        [(GEOMapItemIdentifier *)self coordinate];
        objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", @"lat");
        [(GEOMapItemIdentifier *)self coordinate];
        objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", @"lng", v12);
      }
      mapsIdentifierString = self->_mapsIdentifierString;
      if (mapsIdentifierString) {
        objc_msgSend(v4, "geo_encodeXPCString:forKey:", mapsIdentifierString, @"mis");
      }
    }
  }
  else
  {
    [v22 encodeObject:self->_mapsIdentifier forKey:@"identifier"];
    uint64_t v14 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    int v15 = [v14 hasMuid];

    if (v15) {
      objc_msgSend(v22, "encodeInt64:forKey:", -[GEOMapItemIdentifier muid](self, "muid"), @"muid");
    }
    double v16 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    int v17 = [v16 hasResultProviderId];

    if (v17) {
      objc_msgSend(v22, "encodeInt32:forKey:", -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"), @"rpi");
    }
    double v18 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    int v19 = [v18 hasCenter];

    if (v19)
    {
      [(GEOMapItemIdentifier *)self coordinate];
      objc_msgSend(v22, "encodeDouble:forKey:", @"lat");
      [(GEOMapItemIdentifier *)self coordinate];
      [v22 encodeDouble:@"lng" forKey:v20];
    }
    double v21 = self->_mapsIdentifierString;
    if (v21) {
      [v22 encodeObject:v21 forKey:@"mis"];
    }
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  if ([(GEOMapItemIdentifier *)self hasCoordinate])
  {
    v3 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    id v4 = [v3 center];
    [v4 lat];
    unint64_t v6 = v5;

    int v7 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    uint64_t v8 = [v7 center];
    [v8 lng];
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0xC066800000000000;
    unint64_t v6 = 0xC066800000000000;
  }
  double v11 = *(double *)&v6;
  double v12 = *(double *)&v10;
  result.double var1 = v12;
  result.double var0 = v11;
  return result;
}

- (BOOL)hasCoordinate
{
  v2 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  char v3 = [v2 hasCenter];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (GEOMapItemIdentifier *)a3;
  unint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(GEOMapItemIdentifier *)self isEqualToGEOMapItemIdentifier:v5];

  return v6;
}

- (BOOL)isEqualToGEOMapItemIdentifier:(id)a3
{
  id v4 = (id *)a3;
  if (!v4) {
    goto LABEL_20;
  }
  mapsIdentifierString = self->_mapsIdentifierString;
  if (!mapsIdentifierString || !v4[2])
  {
    int v7 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    if ([v7 hasMuid])
    {
      uint64_t v8 = [v4[1] shardedId];
      int v9 = [v8 hasMuid];

      if (v9)
      {
        unint64_t v10 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
        uint64_t v11 = [v10 muid];
        double v12 = [v4[1] shardedId];
        uint64_t v13 = [v12 muid];
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v14 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    if ([v14 hasBasemapId])
    {
      int v15 = [v4[1] shardedId];
      int v16 = [v15 hasBasemapId];

      if (v16)
      {
        unint64_t v10 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
        uint64_t v11 = [v10 basemapId];
        double v12 = [v4[1] shardedId];
        uint64_t v13 = [v12 basemapId];
LABEL_12:
        uint64_t v17 = v13;

        if (v11 == v17)
        {
          double v18 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
          if ([v18 hasResultProviderId])
          {
            int v19 = [v4[1] shardedId];
            int v20 = [v19 hasResultProviderId];

            if (v20)
            {
              double v21 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
              int v22 = [v21 resultProviderId];
              uint64_t v23 = [v4[1] shardedId];
              char v6 = v22 == [v23 resultProviderId];
LABEL_25:

              goto LABEL_21;
            }
          }
          else
          {
          }
          char v6 = 1;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    double v24 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    if ([v24 hasMuid]) {
      goto LABEL_18;
    }
    double v25 = [v4[1] shardedId];
    char v26 = [v25 hasMuid];

    if (v26) {
      goto LABEL_20;
    }
    double v24 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    if (([v24 hasCenter] & 1) == 0)
    {
LABEL_18:
    }
    else
    {
      v28 = [v4[1] shardedId];
      int v29 = [v28 hasCenter];

      if (v29)
      {
        double v21 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
        uint64_t v23 = [v21 center];
        uint64_t v30 = [v4[1] shardedId];
        char v31 = [v30 center];
        char v6 = [v23 isEqual:v31];

        goto LABEL_25;
      }
    }
LABEL_20:
    char v6 = 0;
    goto LABEL_21;
  }
  char v6 = -[NSString isEqual:](mapsIdentifierString, "isEqual:");
LABEL_21:

  return v6;
}

- (int)resultProviderID
{
  char v3 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  if ([v3 hasResultProviderId])
  {
    id v4 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    int v5 = [v4 resultProviderId];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (BOOL)isValid
{
  return [(GEOPDMapsIdentifier *)self->_mapsIdentifier isValidMapsIdentifier];
}

+ (id)mapItemIdentifiersFromMapsIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [GEOMapItemIdentifier alloc];
          double v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v11, "initWithMapsIdentifier:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (GEOMapItemIdentifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOMapItemIdentifier;

  return 0;
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3
{
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", a3, 0, -180.0, -180.0);
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(id)a4
{
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", a3, 0, a4.var0, a4.var1);
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 sourceID:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    v12.receiver = self;
    v12.super_class = (Class)GEOMapItemIdentifier;
    uint64_t v6 = [(GEOMapItemIdentifier *)&v12 init];
    if (v6)
    {
      uint64_t v7 = objc_alloc_init(GEOPDMapsIdentifier);
      mapsIdentifier = v6->_mapsIdentifier;
      v6->_mapsIdentifier = v7;

      int v9 = objc_alloc_init(GEOPDShardedId);
      [(GEOPDShardedId *)v9 setMuid:a3];
      if (v4) {
        [(GEOPDShardedId *)v9 setSourceId:v4];
      }
      [(GEOPDMapsIdentifier *)v6->_mapsIdentifier setShardedId:v9];
    }
    self = v6;
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (GEOMapItemIdentifier)initWithBasemapId:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  uint64_t v7 = *(void *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapItemIdentifier;
  int v9 = [(GEOMapItemIdentifier *)&v16 init];
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v9->_mapsIdentifier;
    v9->_mapsIdentifier = v10;

    objc_super v12 = objc_alloc_init(GEOPDShardedId);
    uint64_t v13 = v12;
    if (a3) {
      [(GEOPDShardedId *)v12 setBasemapId:a3];
    }
    if (v7) {
      [(GEOPDShardedId *)v13 setResultProviderId:v7];
    }
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      long long v14 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      [(GEOPDShardedId *)v13 setCenter:v14];
    }
    [(GEOPDMapsIdentifier *)v9->_mapsIdentifier setShardedId:v13];
  }
  return v9;
}

- (GEOMapItemIdentifier)initWithMapItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _muid];
  uint64_t v6 = [v4 _resultProviderID];
  [v4 coordinate];
  double v8 = v7;
  double v10 = v9;

  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v5, v6, v8, v10);
}

- (GEOMapItemIdentifier)initWithMapsIdentifierString:(id)a3
{
  id v3 = a3;
  unsigned int v38 = 0;
  uint64_t v37 = 0;
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__GEOMapItemIdentifier_initWithMapsIdentifierString___block_invoke;
  v30[3] = &unk_1E53E2398;
  v32 = &v33;
  id v4 = v3;
  id v31 = v4;
  uint64_t v5 = (void (**)(void))MEMORY[0x18C120660](v30);
  unsigned __int16 v6 = 0;
  char v7 = 0;
  char v8 = 0;
  unint64_t v9 = v34[3];
  while (v9 < [v4 length])
  {
    unsigned int v10 = [v4 characterAtIndex:v34[3]];
    unsigned __int16 v11 = v10;
    if (v10 <= v6) {
      goto LABEL_22;
    }
    switch(v10)
    {
      case 'H':
        ++v34[3];
        long long v14 = v5[2](v5);
        if (![v14 length]
          || ([MEMORY[0x1E4F28FE8] scannerWithString:v14],
              long long v15 = objc_claimAutoreleasedReturnValue(),
              char v16 = [v15 scanHexInt:&v38],
              v15,
              (v16 & 1) == 0))
        {
LABEL_21:

LABEL_22:
          uint64_t v19 = 0;
          int v20 = self;
          goto LABEL_29;
        }
        char v8 = 1;
        goto LABEL_19;
      case 'I':
        ++v34[3];
        long long v14 = v5[2](v5);
        if (![v14 length]) {
          goto LABEL_21;
        }
        long long v17 = [MEMORY[0x1E4F28FE8] scannerWithString:v14];
        char v18 = [v17 scanHexLongLong:&v37];

        if ((v18 & 1) == 0) {
          goto LABEL_21;
        }
        char v7 = 1;
LABEL_19:

        goto LABEL_20;
      case 'G':
        goto LABEL_22;
    }
    if (v10 - 48 < 0xA || (unsigned __int16)(v10 - 65) < 6u) {
      goto LABEL_22;
    }
    ++v34[3];
    id v13 = (id)((uint64_t (*)(void))v5[2])(v5);
LABEL_20:
    unint64_t v9 = v34[3] + 1;
    v34[3] = v9;
    unsigned __int16 v6 = v11;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_22;
  }
  v29.receiver = self;
  v29.super_class = (Class)GEOMapItemIdentifier;
  double v21 = [(GEOMapItemIdentifier *)&v29 init];
  if (v21)
  {
    int v22 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v21->_mapsIdentifier;
    v21->_mapsIdentifier = v22;

    double v24 = objc_alloc_init(GEOPDShardedId);
    [(GEOPDShardedId *)v24 setMuid:v37];
    [(GEOPDShardedId *)v24 setIsExternalVisibleId:1];
    if (v8) {
      [(GEOPDShardedId *)v24 setSourceId:v38];
    }
    [(GEOPDMapsIdentifier *)v21->_mapsIdentifier setShardedId:v24];
    uint64_t v25 = [v4 copy];
    mapsIdentifierString = v21->_mapsIdentifierString;
    v21->_mapsIdentifierString = (NSString *)v25;
  }
  int v20 = v21;
  uint64_t v19 = v20;
LABEL_29:

  _Block_object_dispose(&v33, 8);
  return v19;
}

id __53__GEOMapItemIdentifier_initWithMapsIdentifierString___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 >= [*(id *)(a1 + 32) length]) {
    goto LABEL_9;
  }
  unint64_t v3 = v2;
  do
  {
    int v4 = [*(id *)(a1 + 32) characterAtIndex:v3];
    if ((v4 - 48) >= 0xA && (v4 - 65) > 5) {
      break;
    }
    ++v3;
  }
  while (v3 < [*(id *)(a1 + 32) length]);
  if (v3 == v2)
  {
LABEL_9:
    unsigned __int16 v6 = 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 - 1;
    unsigned __int16 v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v2, v3 - v2);
  }

  return v6;
}

- (BOOL)hasMapsIdentifierString
{
  if (self->_mapsIdentifierString) {
    return 1;
  }
  int v4 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  if ([v4 hasMuid])
  {
    uint64_t v5 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    char v2 = [v5 isExternalVisibleId];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (NSString)mapsIdentifierString
{
  mapsIdentifierString = self->_mapsIdentifierString;
  if (mapsIdentifierString)
  {
    char v16 = mapsIdentifierString;
  }
  else
  {
    int v4 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    if ([v4 hasMuid])
    {
      uint64_t v5 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
      int v6 = [v5 isExternalVisibleId];

      if (v6)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        char v8 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
        if ([v8 hasSourceId])
        {
          unint64_t v9 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
          int v10 = [v9 sourceId];

          if (!v10)
          {
LABEL_8:
            [v7 appendString:@"I"];
            objc_super v12 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
            id v13 = __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke([v12 muid]);
            [v7 appendString:v13];

            long long v14 = (NSString *)[v7 copy];
            long long v15 = self->_mapsIdentifierString;
            self->_mapsIdentifierString = v14;

            char v16 = self->_mapsIdentifierString;
            goto LABEL_12;
          }
          [v7 appendString:@"H"];
          char v8 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
          unsigned __int16 v11 = __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke([v8 sourceId]);
          [v7 appendString:v11];
        }
        goto LABEL_8;
      }
    }
    else
    {
    }
    char v16 = 0;
  }
LABEL_12:

  return v16;
}

id __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%llX", a1);
  if ([v1 length])
  {
    uint64_t v2 = 0;
    while ([v1 characterAtIndex:v2] == 48)
    {
      if (++v2 >= (unint64_t)[v1 length]) {
        goto LABEL_7;
      }
    }
    if (!v2) {
      goto LABEL_8;
    }
LABEL_7:
    id v3 = [v1 substringFromIndex:v2];
  }
  else
  {
LABEL_8:
    id v3 = v1;
  }
  int v4 = v3;

  return v4;
}

- (id)debugDescription
{
  mapsIdentifier = self->_mapsIdentifier;
  if (self->_mapsIdentifierString) {
    [NSString stringWithFormat:@"<GEOMapItemIdentifier %p { %@ : %@ }>", self, self->_mapsIdentifierString, mapsIdentifier];
  }
  else {
  id v3 = [NSString stringWithFormat:@"<GEOMapItemIdentifier %p { %@ }>", self, mapsIdentifier, v5];
  }

  return v3;
}

- (id)shortDebugDescription
{
  id v3 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v4 = [v3 center];
  [v4 coordinate];
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  unint64_t v9 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  LODWORD(v4) = [v9 hasMuid];

  if (v4)
  {
    int v10 = NSString;
    unsigned __int16 v11 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    objc_msgSend(v10, "stringWithFormat:", @"muid: %llu %.04f,%.04f", objc_msgSend(v11, "muid"), v6, v8);
LABEL_5:
    long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_super v12 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v13 = [v12 hasBasemapId];

  if (v13)
  {
    long long v14 = NSString;
    unsigned __int16 v11 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    objc_msgSend(v14, "stringWithFormat:", @"basemap_id: %llu %.04f,%.04f", objc_msgSend(v11, "basemapId"), v6, v8);
    goto LABEL_5;
  }
  long long v15 = &stru_1ED51F370;
LABEL_7:

  return v15;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%@ %p:", objc_opt_class(), self];
  int v4 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v5 = [v4 hasMuid];

  if (v5) {
    objc_msgSend(v3, "appendFormat:", @" muid: %llu", -[GEOMapItemIdentifier muid](self, "muid"));
  }
  uint64_t v6 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v7 = [v6 hasBasemapId];

  if (v7)
  {
    uint64_t v8 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
    objc_msgSend(v3, "appendFormat:", @" bmid: %llu", objc_msgSend(v8, "basemapId"));
  }
  unint64_t v9 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v10 = [v9 hasResultProviderId];

  if (v10) {
    objc_msgSend(v3, "appendFormat:", @" rpi: %d", -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"));
  }
  unsigned __int16 v11 = [(GEOPDMapsIdentifier *)self->_mapsIdentifier shardedId];
  int v12 = [v11 hasCenter];

  if (v12)
  {
    [(GEOMapItemIdentifier *)self coordinate];
    uint64_t v14 = v13;
    [(GEOMapItemIdentifier *)self coordinate];
    objc_msgSend(v3, "appendFormat:", @" lat,lng: %f,%f", v14, v15);
  }
  [v3 appendString:@">"];
  char v16 = (void *)[v3 copy];

  return v16;
}

- (NSData)comparableRepresentation
{
  uint64_t v2 = (void *)[(GEOPDMapsIdentifier *)self->_mapsIdentifier copy];
  id v3 = [v2 shardedId];
  if ([v3 hasMuid])
  {
  }
  else
  {
    int v4 = [v2 shardedId];
    int v5 = [v4 hasBasemapId];

    if (!v5) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = [v2 shardedId];
  [v6 setCenter:0];

LABEL_5:
  int v7 = [v2 data];

  return (NSData *)v7;
}

- (BOOL)isValidForOfflineUse
{
  return [(GEOPDMapsIdentifier *)self->_mapsIdentifier isValidOfflineMapsIdentifier];
}

@end