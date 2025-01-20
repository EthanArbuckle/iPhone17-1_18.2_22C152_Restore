@interface GEOWiFiBSS
+ (BOOL)isValid:(id)a3;
+ (Class)qualitiesType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasLatLngE7;
- (BOOL)hasLocation;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)location;
- (GEOLatLngE7)latLngE7;
- (GEOWiFiBSS)init;
- (GEOWiFiBSS)initWithData:(id)a3;
- (GEOWiFiBSS)initWithDictionary:(id)a3;
- (GEOWiFiBSS)initWithJSON:(id)a3;
- (NSMutableArray)qualities;
- (NSString)identifier;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)qualitiesAtIndex:(unint64_t)a3;
- (int)StringAsAttributes:(id)a3;
- (int)attributes;
- (int)attributesAtIndex:(unint64_t)a3;
- (int64_t)uniqueIdentifier;
- (unint64_t)attributesCount;
- (unint64_t)hash;
- (unint64_t)qualitiesCount;
- (void)_addNoFlagsQualities:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributes;
- (void)_readIdentifier;
- (void)_readLatLngE7;
- (void)_readLocation;
- (void)_readQualities;
- (void)addAttributes:(int)a3;
- (void)addQualities:(id)a3;
- (void)clearAttributes;
- (void)clearQualities;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setHasUniqueIdentifier:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLatLngE7:(id)a3;
- (void)setLocation:(id)a3;
- (void)setQualities:(id)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiBSS

- (GEOWiFiBSS)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiBSS;
  v2 = [(GEOWiFiBSS *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiBSS)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiBSS;
  v3 = [(GEOWiFiBSS *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOWiFiBSS;
  [(GEOWiFiBSS *)&v3 dealloc];
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiBSS _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOWiFiBSS _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributes_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)attributesCount
{
  return self->_attributes.count;
}

- (int)attributes
{
  return self->_attributes.list;
}

- (void)clearAttributes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addAttributes:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (int)attributesAtIndex:(unint64_t)a3
{
  -[GEOWiFiBSS _readAttributes]((uint64_t)self);
  p_attributes = &self->_attributes;
  unint64_t count = self->_attributes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_attributes->list[a3];
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147390](&self->_attributes, a3, a4);
}

- (id)attributesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E1E08[a3];
  }

  return v3;
}

- (int)StringAsAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ISEDGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ISTCPGOOD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ISSUSPICIOUS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQualities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQualities_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)qualities
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return qualities;
}

- (void)setQualities:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  qualities = self->_qualities;
  self->_qualities = v4;
}

- (void)clearQualities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  qualities = self->_qualities;

  [(NSMutableArray *)qualities removeAllObjects];
}

- (void)addQualities:(id)a3
{
  id v4 = a3;
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  -[GEOWiFiBSS _addNoFlagsQualities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsQualities:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)qualitiesCount
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return [(NSMutableArray *)qualities count];
}

- (id)qualitiesAtIndex:(unint64_t)a3
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return (id)[(NSMutableArray *)qualities objectAtIndex:a3];
}

+ (Class)qualitiesType
{
  return (Class)objc_opt_class();
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasUniqueIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readLatLngE7
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLngE7_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLatLngE7
{
  return self->_latLngE7 != 0;
}

- (GEOLatLngE7)latLngE7
{
  -[GEOWiFiBSS _readLatLngE7]((uint64_t)self);
  latLngE7 = self->_latLngE7;

  return latLngE7;
}

- (void)setLatLngE7:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_latLngE7, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiBSS;
  id v4 = [(GEOWiFiBSS *)&v8 description];
  id v5 = [(GEOWiFiBSS *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiBSS _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    objc_super v6 = [(id)a1 location];
    id v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"location"];
    }
    if (*(void *)(a1 + 24))
    {
      v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v10 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = *(int *)(*v10 + 4 * v11);
          if (v12 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = off_1E53E1E08[v12];
          }
          [v9 addObject:v13];

          ++v11;
          v10 = (void *)(a1 + 16);
        }
        while (v11 < *(void *)(a1 + 24));
      }
      [v4 setObject:v9 forKey:@"attributes"];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = *(id *)(a1 + 64);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"qualities"];
    }
    if (*(unsigned char *)(a1 + 92))
    {
      v22 = [NSNumber numberWithLongLong:*(void *)(a1 + 72)];
      [v4 setObject:v22 forKey:@"uniqueIdentifier"];
    }
    v23 = [(id)a1 latLngE7];
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"latLngE7"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiBSS _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiBSS)initWithDictionary:(id)a3
{
  return (GEOWiFiBSS *)-[GEOWiFiBSS _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = (void *)[a1 init];
    if (v5)
    {
      objc_super v6 = [v4 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [v5 setIdentifier:v7];
      }
      objc_super v8 = [v4 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v10 = [(GEOLatLng *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOLatLng *)v9 initWithDictionary:v8];
        }
        unint64_t v11 = (void *)v10;
        [v5 setLocation:v10];
      }
      uint64_t v12 = [v4 objectForKeyedSubscript:@"attributes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = v12;
        id v39 = v4;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (!v14) {
          goto LABEL_32;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v46;
        while (1)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v46 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              if ([v19 isEqualToString:@"UNKNOWN"])
              {
                uint64_t v20 = 0;
              }
              else if ([v19 isEqualToString:@"ISEDGE"])
              {
                uint64_t v20 = 1;
              }
              else if ([v19 isEqualToString:@"ISTCPGOOD"])
              {
                uint64_t v20 = 2;
              }
              else if ([v19 isEqualToString:@"ISSUSPICIOUS"])
              {
                uint64_t v20 = 3;
              }
              else
              {
                uint64_t v20 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v20 = [v18 intValue];
            }
            [v5 addAttributes:v20];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (!v15)
          {
LABEL_32:

            uint64_t v12 = v38;
            id v4 = v39;
            break;
          }
        }
      }

      v21 = [v4 objectForKeyedSubscript:@"qualities"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v4;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v23 = v21;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v29 = [GEOWiFiQualityProfile alloc];
                if (a3) {
                  uint64_t v30 = [(GEOWiFiQualityProfile *)v29 initWithJSON:v28];
                }
                else {
                  uint64_t v30 = [(GEOWiFiQualityProfile *)v29 initWithDictionary:v28];
                }
                v31 = (void *)v30;
                [v5 addQualities:v30];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v25);
        }

        id v4 = v22;
      }

      uint64_t v32 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v5, "setUniqueIdentifier:", objc_msgSend(v32, "longLongValue"));
      }

      v33 = [v4 objectForKeyedSubscript:@"latLngE7"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [GEOLatLngE7 alloc];
        if (a3) {
          uint64_t v35 = [(GEOLatLngE7 *)v34 initWithJSON:v33];
        }
        else {
          uint64_t v35 = [(GEOLatLngE7 *)v34 initWithDictionary:v33];
        }
        v36 = (void *)v35;
        [v5 setLatLngE7:v35];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (GEOWiFiBSS)initWithJSON:(id)a3
{
  return (GEOWiFiBSS *)-[GEOWiFiBSS _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_33;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_33;
    }
    GEOWiFiBSSReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiBSSCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiBSSIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiBSSReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
  {
    unint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiBSS *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_attributes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_attributes.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_qualities;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
    if (self->_latLngE7) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWiFiBSS _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLatLng *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOWiFiBSS *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v12, "setIdentifier:");
  }
  if (self->_location) {
    objc_msgSend(v12, "setLocation:");
  }
  if ([(GEOWiFiBSS *)self attributesCount])
  {
    [v12 clearAttributes];
    unint64_t v4 = [(GEOWiFiBSS *)self attributesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v12, "addAttributes:", -[GEOWiFiBSS attributesAtIndex:](self, "attributesAtIndex:", i));
    }
  }
  if ([(GEOWiFiBSS *)self qualitiesCount])
  {
    [v12 clearQualities];
    unint64_t v7 = [(GEOWiFiBSS *)self qualitiesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOWiFiBSS *)self qualitiesAtIndex:j];
        [v12 addQualities:v10];
      }
    }
  }
  unint64_t v11 = v12;
  if (*(unsigned char *)&self->_flags)
  {
    v12[9] = self->_uniqueIdentifier;
    *((unsigned char *)v12 + 92) |= 1u;
  }
  if (self->_latLngE7)
  {
    objc_msgSend(v12, "setLatLngE7:");
    unint64_t v11 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiBSSReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiBSS *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOLatLng *)self->_location copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  PBRepeatedInt32Copy();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_qualities;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addQualities:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 72) = self->_uniqueIdentifier;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  id v18 = -[GEOLatLngE7 copyWithZone:](self->_latLngE7, "copyWithZone:", a3, (void)v20);
  id v8 = *(id *)(v5 + 48);
  *(void *)(v5 + 48) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOWiFiBSS *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_16;
  }
  qualities = self->_qualities;
  if ((unint64_t)qualities | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](qualities, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_uniqueIdentifier != *((void *)v4 + 9)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
LABEL_16:
    char v9 = 0;
    goto LABEL_17;
  }
  latLngE7 = self->_latLngE7;
  if ((unint64_t)latLngE7 | *((void *)v4 + 6)) {
    char v9 = -[GEOLatLngE7 isEqual:](latLngE7, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  [(GEOWiFiBSS *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = [(GEOLatLng *)self->_location hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = [(NSMutableArray *)self->_qualities hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_uniqueIdentifier;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(GEOLatLngE7 *)self->_latLngE7 hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 5)) {
    -[GEOWiFiBSS setIdentifier:](self, "setIdentifier:");
  }
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 7);
  if (location)
  {
    if (v6) {
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWiFiBSS setLocation:](self, "setLocation:");
  }
  uint64_t v7 = [v4 attributesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOWiFiBSS addAttributes:](self, "addAttributes:", [v4 attributesAtIndex:i]);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v4 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOWiFiBSS addQualities:](self, "addQualities:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 92))
  {
    self->_uniqueIdentifier = *((void *)v4 + 9);
    *(unsigned char *)&self->_flags |= 1u;
  }
  latLngE7 = self->_latLngE7;
  uint64_t v16 = *((void *)v4 + 6);
  if (latLngE7)
  {
    if (v16) {
      -[GEOLatLngE7 mergeFrom:](latLngE7, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[GEOWiFiBSS setLatLngE7:](self, "setLatLngE7:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualities, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_latLngE7, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end