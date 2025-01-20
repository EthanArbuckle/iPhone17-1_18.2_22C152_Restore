@interface GEOPDSpatialPlaceLookupResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBounds;
- (BOOL)hasCenter;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPlaceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOPDBounds)bounds;
- (GEOPDMapsIdentifier)placeId;
- (GEOPDSpatialPlaceLookupResponse)init;
- (GEOPDSpatialPlaceLookupResponse)initWithData:(id)a3;
- (GEOPDSpatialPlaceLookupResponse)initWithDictionary:(id)a3;
- (GEOPDSpatialPlaceLookupResponse)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)categorysAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCategorys:(id)a3;
- (int)categoryAtIndex:(unint64_t)a3;
- (int)categorys;
- (unint64_t)categorysCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBounds;
- (void)_readCategorys;
- (void)_readCenter;
- (void)_readPlaceId;
- (void)addCategory:(int)a3;
- (void)clearCategorys;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBounds:(id)a3;
- (void)setCategorys:(int *)a3 count:(unint64_t)a4;
- (void)setCenter:(id)a3;
- (void)setPlaceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSpatialPlaceLookupResponse

void __61__GEOPDSpatialPlaceLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDSpatialPlaceLookupResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  v2 = [(GEOPDSpatialPlaceLookupResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialPlaceLookupResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  v3 = [(GEOPDSpatialPlaceLookupResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  [(GEOPDSpatialPlaceLookupResponse *)&v3 dealloc];
}

- (void)_readPlaceId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceId_tags_8713);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceId
{
  return self->_placeId != 0;
}

- (GEOPDMapsIdentifier)placeId
{
  -[GEOPDSpatialPlaceLookupResponse _readPlaceId]((uint64_t)self);
  placeId = self->_placeId;

  return placeId;
}

- (void)setPlaceId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_placeId, a3);
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8714);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDSpatialPlaceLookupResponse _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_8715);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)categorysCount
{
  return self->_categorys.count;
}

- (int)categorys
{
  return self->_categorys.list;
}

- (void)clearCategorys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  -[GEOPDSpatialPlaceLookupResponse _readCategorys]((uint64_t)self);
  p_categorys = &self->_categorys;
  unint64_t count = self->_categorys.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_categorys->list[a3];
}

- (void)setCategorys:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_categorys, a3, a4);
}

- (id)categorysAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E4238[a3];
  }

  return v3;
}

- (int)StringAsCategorys:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PARK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readBounds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBounds_tags_8716);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (GEOPDBounds)bounds
{
  -[GEOPDSpatialPlaceLookupResponse _readBounds]((uint64_t)self);
  bounds = self->_bounds;

  return bounds;
}

- (void)setBounds:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSpatialPlaceLookupResponse;
  int v4 = [(GEOPDSpatialPlaceLookupResponse *)&v8 description];
  id v5 = [(GEOPDSpatialPlaceLookupResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialPlaceLookupResponse _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 placeId];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"placeId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"place_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 center];
    id v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"center"];
    }
    if (a1[4])
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v13 = a1 + 3;
      if (a1[4])
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 0x18)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E53E4238[v15];
          }
          [v12 addObject:v16];

          ++v14;
          v13 = a1 + 3;
        }
        while (v14 < a1[4]);
      }
      [v4 setObject:v12 forKey:@"category"];
    }
    v17 = [a1 bounds];
    v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      v19 = [v17 dictionaryRepresentation];
      }
      [v4 setObject:v19 forKey:@"bounds"];
    }
    v20 = (void *)a1[2];
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __61__GEOPDSpatialPlaceLookupResponse__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialPlaceLookupResponse _dictionaryRepresentation:](self, 1);
}

- (GEOPDSpatialPlaceLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDSpatialPlaceLookupResponse *)-[GEOPDSpatialPlaceLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        objc_super v7 = @"placeId";
      }
      else {
        objc_super v7 = @"place_id";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v10 = [(GEOPDMapsIdentifier *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOPDMapsIdentifier *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [v6 setPlaceId:v10];
      }
      v12 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v14 = [(GEOLatLng *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLatLng *)v13 initWithDictionary:v12];
        }
        uint64_t v15 = (void *)v14;
        [v6 setCenter:v14];
      }
      v16 = [v5 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v30 = a3;
        id v31 = v5;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v29 = v16;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (!v18) {
          goto LABEL_78;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        while (1)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v23 = v22;
              if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN"])
              {
                uint64_t v24 = 0;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT"])
              {
                uint64_t v24 = 1;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK"])
              {
                uint64_t v24 = 2;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM"])
              {
                uint64_t v24 = 3;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO"])
              {
                uint64_t v24 = 4;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM"])
              {
                uint64_t v24 = 5;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK"])
              {
                uint64_t v24 = 6;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE"])
              {
                uint64_t v24 = 7;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK"])
              {
                uint64_t v24 = 8;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM"])
              {
                uint64_t v24 = 9;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT"])
              {
                uint64_t v24 = 10;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE"])
              {
                uint64_t v24 = 11;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PARK"])
              {
                uint64_t v24 = 12;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT"])
              {
                uint64_t v24 = 13;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING"])
              {
                uint64_t v24 = 14;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH"])
              {
                uint64_t v24 = 15;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN"])
              {
                uint64_t v24 = 16;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS"])
              {
                uint64_t v24 = 17;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY"])
              {
                uint64_t v24 = 18;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING"])
              {
                uint64_t v24 = 19;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING"])
              {
                uint64_t v24 = 20;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE"])
              {
                uint64_t v24 = 21;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL"])
              {
                uint64_t v24 = 22;
              }
              else if ([v23 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"])
              {
                uint64_t v24 = 23;
              }
              else
              {
                uint64_t v24 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v24 = [v22 intValue];
            }
            [v6 addCategory:v24];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (!v19)
          {
LABEL_78:

            id v5 = v31;
            a3 = v30;
            v16 = v29;
            break;
          }
        }
      }

      id v25 = [v5 objectForKeyedSubscript:@"bounds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [GEOPDBounds alloc];
        if (v26) {
          v27 = (void *)-[GEOPDBounds _initWithDictionary:isJSON:](v26, v25, a3);
        }
        else {
          v27 = 0;
        }
        [v6 setBounds:v27];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOPDSpatialPlaceLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDSpatialPlaceLookupResponse *)-[GEOPDSpatialPlaceLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_8717;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8718;
    }
    GEOPDSpatialPlaceLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDSpatialPlaceLookupResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDSpatialPlaceLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialPlaceLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3A) != 0)
    || (*(unsigned char *)&self->_flags & 4) != 0
    && (GEOPDBoundsIsDirty((os_unfair_lock_s *)self->_bounds) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSpatialPlaceLookupResponse *)self readAll:0];
    if (self->_placeId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_categorys.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_categorys.count);
    }
    if (self->_bounds)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
  else
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPDSpatialPlaceLookupResponse _readBounds]((uint64_t)self);
  if (-[GEOPDBounds hasGreenTeaWithValue:]((uint64_t)self->_bounds, v3)) {
    return 1;
  }
  -[GEOPDSpatialPlaceLookupResponse _readCenter]((uint64_t)self);
  if ([(GEOLatLng *)self->_center hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDSpatialPlaceLookupResponse _readPlaceId]((uint64_t)self);
  placeId = self->_placeId;

  return [(GEOPDMapsIdentifier *)placeId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOPDSpatialPlaceLookupResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 18) = self->_readerMarkPos;
  *((_DWORD *)v7 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_placeId) {
    objc_msgSend(v7, "setPlaceId:");
  }
  if (self->_center) {
    objc_msgSend(v7, "setCenter:");
  }
  if ([(GEOPDSpatialPlaceLookupResponse *)self categorysCount])
  {
    [v7 clearCategorys];
    unint64_t v4 = [(GEOPDSpatialPlaceLookupResponse *)self categorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addCategory:", -[GEOPDSpatialPlaceLookupResponse categoryAtIndex:](self, "categoryAtIndex:", i));
    }
  }
  if (self->_bounds) {
    objc_msgSend(v7, "setBounds:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDSpatialPlaceLookupResponse *)self readAll:0];
    id v8 = [(GEOPDMapsIdentifier *)self->_placeId copyWithZone:a3];
    id v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    id v10 = [(GEOLatLng *)self->_center copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    PBRepeatedInt32Copy();
    id v12 = [(GEOPDBounds *)self->_bounds copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSpatialPlaceLookupResponseReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDSpatialPlaceLookupResponse *)self readAll:1],
         [v4 readAll:1],
         placeId = self->_placeId,
         !((unint64_t)placeId | v4[8]))
     || -[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    && ((center = self->_center, !((unint64_t)center | v4[7])) || -[GEOLatLng isEqual:](center, "isEqual:"))
    && PBRepeatedInt32IsEqual())
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[6]) {
      char v8 = -[GEOPDBounds isEqual:](bounds, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDSpatialPlaceLookupResponse *)self readAll:1];
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_placeId hash];
  unint64_t v4 = [(GEOLatLng *)self->_center hash] ^ v3;
  uint64_t v5 = PBRepeatedInt32Hash();
  return v4 ^ v5 ^ [(GEOPDBounds *)self->_bounds hash];
}

- (void)mergeFrom:(id)a3
{
  long long v34 = a3;
  [v34 readAll:0];
  unint64_t v4 = v34;
  placeId = self->_placeId;
  uint64_t v6 = v34[8];
  if (placeId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDMapsIdentifier mergeFrom:](placeId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDSpatialPlaceLookupResponse setPlaceId:](self, "setPlaceId:");
  }
  unint64_t v4 = v34;
LABEL_7:
  center = self->_center;
  uint64_t v8 = v4[7];
  if (center)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOPDSpatialPlaceLookupResponse setCenter:](self, "setCenter:");
  }
  unint64_t v4 = v34;
LABEL_13:
  uint64_t v9 = [v4 categorysCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
      -[GEOPDSpatialPlaceLookupResponse addCategory:](self, "addCategory:", [v34 categoryAtIndex:i]);
  }
  bounds = self->_bounds;
  v13 = v34;
  uint64_t v14 = (void *)v34[6];
  if (bounds)
  {
    if (!v14) {
      goto LABEL_68;
    }
    id v15 = v14;
    -[GEOPDBounds readAll:]((uint64_t)v15, 0);
    mapRegion = bounds->_mapRegion;
    uint64_t v17 = *((void *)v15 + 4);
    if (mapRegion)
    {
      if (v17) {
        -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
      }
    }
    else if (v17)
    {
      -[GEOPDBounds setMapRegion:]((uint64_t)bounds, *((void **)v15 + 4));
    }
    displayMapRegion = bounds->_displayMapRegion;
    uint64_t v19 = *((void *)v15 + 3);
    if (displayMapRegion)
    {
      if (v19) {
        -[GEOMapRegion mergeFrom:](displayMapRegion, "mergeFrom:");
      }
    }
    else if (v19)
    {
      -[GEOPDBounds setDisplayMapRegion:]((uint64_t)bounds, *((void **)v15 + 3));
    }
    char v20 = *((unsigned char *)v15 + 68);
    if ((v20 & 2) != 0)
    {
      bounds->_minZoom = *((float *)v15 + 16);
      *(unsigned char *)&bounds->_flags |= 2u;
      char v20 = *((unsigned char *)v15 + 68);
    }
    if (v20)
    {
      bounds->_maxZoom = *((float *)v15 + 15);
      *(unsigned char *)&bounds->_flags |= 1u;
    }
    uint64_t viewportFrame = (uint64_t)bounds->_viewportFrame;
    v22 = (void *)*((void *)v15 + 5);
    if (!viewportFrame)
    {
      if (v22) {
        -[GEOPDBounds setViewportFrame:]((uint64_t)bounds, v22);
      }
      goto LABEL_66;
    }
    if (!v22)
    {
LABEL_66:

      goto LABEL_67;
    }
    id v23 = v22;
    -[GEOPDViewportFrame readAll:]((uint64_t)v23, 0);
    uint64_t v24 = *(void **)(viewportFrame + 24);
    uint64_t v25 = *((void *)v23 + 3);
    if (v24)
    {
      if (v25) {
        objc_msgSend(v24, "mergeFrom:");
      }
    }
    else if (v25)
    {
      -[GEOPDViewportFrame setTargetPoint:](viewportFrame, *((void **)v23 + 3));
    }
    char v26 = *((unsigned char *)v23 + 64);
    if ((v26 & 2) != 0)
    {
      *(_DWORD *)(viewportFrame + 56) = *((_DWORD *)v23 + 14);
      *(unsigned char *)(viewportFrame + 64) |= 2u;
      char v26 = *((unsigned char *)v23 + 64);
      if ((v26 & 4) == 0)
      {
LABEL_45:
        if ((v26 & 1) == 0)
        {
LABEL_47:
          uint64_t v27 = *(void *)(viewportFrame + 32);
          id v28 = (void *)*((void *)v23 + 4);
          if (v27)
          {
            if (v28)
            {
              v29 = v28;
              -[GEOPDBoundingCube readAll:]((uint64_t)v29, 0);
              int v30 = *(void **)(v27 + 32);
              id v31 = v29[4];
              if (v30)
              {
                if (v31) {
                  objc_msgSend(v30, "mergeFrom:");
                }
              }
              else if (v31)
              {
                -[GEOPDBoundingCube setMin:](v27, v29[4]);
              }
              long long v32 = *(void **)(v27 + 24);
              long long v33 = v29[3];
              if (v32)
              {
                if (v33) {
                  objc_msgSend(v32, "mergeFrom:");
                }
              }
              else if (v33)
              {
                -[GEOPDBoundingCube setMax:](v27, v29[3]);
              }
            }
          }
          else if (v28)
          {
            -[GEOPDViewportFrame setViewTargetBounds:](viewportFrame, v28);
          }

          goto LABEL_66;
        }
LABEL_46:
        *(_DWORD *)(viewportFrame + 52) = *((_DWORD *)v23 + 13);
        *(unsigned char *)(viewportFrame + 64) |= 1u;
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)v23 + 64) & 4) == 0)
    {
      goto LABEL_45;
    }
    *(_DWORD *)(viewportFrame + 60) = *((_DWORD *)v23 + 15);
    *(unsigned char *)(viewportFrame + 64) |= 4u;
    if ((*((unsigned char *)v23 + 64) & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  if (!v14) {
    goto LABEL_68;
  }
  -[GEOPDSpatialPlaceLookupResponse setBounds:](self, "setBounds:");
LABEL_67:
  v13 = v34;
LABEL_68:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPDSpatialPlaceLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8722);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDSpatialPlaceLookupResponse *)self readAll:0];
    [(GEOPDMapsIdentifier *)self->_placeId clearUnknownFields:1];
    [(GEOLatLng *)self->_center clearUnknownFields:1];
    bounds = self->_bounds;
    -[GEOPDBounds clearUnknownFields:]((uint64_t)bounds);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end