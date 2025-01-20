@interface GEOSpatialLookupRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasMaxResults;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)center;
- (GEOSpatialLookupRequest)init;
- (GEOSpatialLookupRequest)initWithData:(id)a3;
- (GEOSpatialLookupRequest)initWithDictionary:(id)a3;
- (GEOSpatialLookupRequest)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categorysAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsCategorys:(id)a3;
- (int)categoryAtIndex:(unint64_t)a3;
- (int)categorys;
- (int)maxResults;
- (int)radius;
- (unint64_t)categorysCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCategorys;
- (void)_readCenter;
- (void)addCategory:(int)a3;
- (void)clearCategorys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCategorys:(int *)a3 count:(unint64_t)a4;
- (void)setCenter:(id)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setMaxResults:(int)a3;
- (void)setRadius:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSpatialLookupRequest

- (GEOSpatialLookupRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSpatialLookupRequest;
  v2 = [(GEOSpatialLookupRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpatialLookupRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSpatialLookupRequest;
  v3 = [(GEOSpatialLookupRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSpatialLookupRequest;
  [(GEOSpatialLookupRequest *)&v3 dealloc];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOLatLng)center
{
  -[GEOSpatialLookupRequest _readCenter]((uint64_t)self);
  center = self->_center;

  return center;
}

- (void)setCenter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (int)radius
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_radius;
  }
  else {
    return 200;
  }
}

- (void)setRadius:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)maxResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_maxResults;
  }
  else {
    return 200;
  }
}

- (void)setMaxResults:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasMaxResults
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readCategorys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSpatialLookupRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategorys_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
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
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  -[GEOSpatialLookupRequest _readCategorys]((uint64_t)self);
  p_categorys = &self->_categorys;
  unint64_t count = self->_categorys.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_categorys->list[a3];
}

- (void)setCategorys:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_categorys, a3, a4);
}

- (id)categorysAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E5580[a3];
  }

  return v3;
}

- (int)StringAsCategorys:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ENTERTAINMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AMUSEMENTPARK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AQUARIUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ZOO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_STADIUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_SKATE_PARK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_CULTURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_LANDMARK"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_MUSEUM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_RESTAURANT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_NIGHTLIFE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_PARK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AIRPORT"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_SHOPPING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_BEACH"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_MOUNTAIN"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_FITNESS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ACTIVITY"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_DIVING"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_HIKING"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_PERFORMANCE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_HOSPITAL"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSpatialLookupRequest;
  int v4 = [(GEOSpatialLookupRequest *)&v8 description];
  v5 = [(GEOSpatialLookupRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpatialLookupRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 center];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    char v8 = *(unsigned char *)(a1 + 68);
    if ((v8 & 2) != 0)
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
      [v4 setObject:v9 forKey:@"radius"];

      char v8 = *(unsigned char *)(a1 + 68);
    }
    if (v8)
    {
      v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
      if (a2) {
        v11 = @"maxResults";
      }
      else {
        v11 = @"max_results";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if (*(void *)(a1 + 24))
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v13 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v14 = 0;
        do
        {
          uint64_t v15 = *(int *)(*v13 + 4 * v14);
          if (v15 >= 0x17)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = off_1E53E5580[v15];
          }
          [v12 addObject:v16];

          ++v14;
          v13 = (void *)(a1 + 16);
        }
        while (v14 < *(void *)(a1 + 24));
      }
      [v4 setObject:v12 forKey:@"category"];
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
  return -[GEOSpatialLookupRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSpatialLookupRequest)initWithDictionary:(id)a3
{
  return (GEOSpatialLookupRequest *)-[GEOSpatialLookupRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      objc_super v7 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v8 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [v6 setCenter:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"radius"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setRadius:", objc_msgSend(v11, "intValue"));
      }

      if (a3) {
        v12 = @"maxResults";
      }
      else {
        v12 = @"max_results";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setMaxResults:", objc_msgSend(v13, "intValue"));
      }

      unint64_t v14 = [v5 objectForKeyedSubscript:@"category"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = v14;
        id v25 = v5;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (!v16) {
          goto LABEL_75;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        while (1)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v20;
              if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_UNKNOWN"])
              {
                uint64_t v22 = 0;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ENTERTAINMENT"])
              {
                uint64_t v22 = 1;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AMUSEMENTPARK"])
              {
                uint64_t v22 = 2;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AQUARIUM"])
              {
                uint64_t v22 = 3;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ZOO"])
              {
                uint64_t v22 = 4;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_STADIUM"])
              {
                uint64_t v22 = 5;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_SKATE_PARK"])
              {
                uint64_t v22 = 6;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_CULTURE"])
              {
                uint64_t v22 = 7;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_LANDMARK"])
              {
                uint64_t v22 = 8;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_MUSEUM"])
              {
                uint64_t v22 = 9;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_RESTAURANT"])
              {
                uint64_t v22 = 10;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_NIGHTLIFE"])
              {
                uint64_t v22 = 11;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_PARK"])
              {
                uint64_t v22 = 12;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_AIRPORT"])
              {
                uint64_t v22 = 13;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_SHOPPING"])
              {
                uint64_t v22 = 14;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_BEACH"])
              {
                uint64_t v22 = 15;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_MOUNTAIN"])
              {
                uint64_t v22 = 16;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_FITNESS"])
              {
                uint64_t v22 = 17;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_ACTIVITY"])
              {
                uint64_t v22 = 18;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_DIVING"])
              {
                uint64_t v22 = 19;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_HIKING"])
              {
                uint64_t v22 = 20;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_PERFORMANCE"])
              {
                uint64_t v22 = 21;
              }
              else if ([v21 isEqualToString:@"SPATIAL_LOOKUP_CATEGORY_HOSPITAL"])
              {
                uint64_t v22 = 22;
              }
              else
              {
                uint64_t v22 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v22 = [v20 intValue];
            }
            objc_msgSend(v6, "addCategory:", v22, v24, v25, (void)v26);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (!v17)
          {
LABEL_75:

            unint64_t v14 = v24;
            id v5 = v25;
            break;
          }
        }
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOSpatialLookupRequest)initWithJSON:(id)a3
{
  return (GEOSpatialLookupRequest *)-[GEOSpatialLookupRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      char v8 = (int *)&readAll__recursiveTag_160;
    }
    else {
      char v8 = (int *)&readAll__nonRecursiveTag_161;
    }
    GEOSpatialLookupRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_center readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpatialLookupRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpatialLookupRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    uint64_t v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    objc_super v7 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSpatialLookupRequest *)self readAll:0];
    PBDataWriterWriteSubmessage();
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
    p_categorys = &self->_categorys;
    objc_super v7 = v11;
    if (p_categorys->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        objc_super v7 = v11;
        ++v8;
      }
      while (v8 < p_categorys->count);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOSpatialLookupRequest _readCenter]((uint64_t)self);
  center = self->_center;

  return [(GEOLatLng *)center hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  unint64_t v8 = (id *)a3;
  [(GEOSpatialLookupRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v8 setCenter:self->_center];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v8 + 16) = self->_radius;
    *((unsigned char *)v8 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v8 + 15) = self->_maxResults;
    *((unsigned char *)v8 + 68) |= 1u;
  }
  if ([(GEOSpatialLookupRequest *)self categorysCount])
  {
    [v8 clearCategorys];
    unint64_t v5 = [(GEOSpatialLookupRequest *)self categorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addCategory:", -[GEOSpatialLookupRequest categoryAtIndex:](self, "categoryAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSpatialLookupRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSpatialLookupRequest *)self readAll:0];
  id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_radius;
    *(unsigned char *)(v5 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOSpatialLookupRequest *)self readAll:1];
  [v4 readAll:1];
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_radius != *((_DWORD *)v4 + 16)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_15:
    char IsEqual = 0;
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 15)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_15;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_16:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOSpatialLookupRequest *)self readAll:1];
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_radius;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maxResults;
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  v10 = (int *)a3;
  [v10 readAll:0];
  center = self->_center;
  uint64_t v5 = *((void *)v10 + 5);
  if (center)
  {
    if (v5) {
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOSpatialLookupRequest setCenter:](self, "setCenter:");
  }
  char v6 = *((unsigned char *)v10 + 68);
  if ((v6 & 2) != 0)
  {
    self->_radius = v10[16];
    *(unsigned char *)&self->_flags |= 2u;
    char v6 = *((unsigned char *)v10 + 68);
  }
  if (v6)
  {
    self->_maxResults = v10[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v7 = [v10 categorysCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOSpatialLookupRequest addCategory:](self, "addCategory:", [v10 categoryAtIndex:i]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end