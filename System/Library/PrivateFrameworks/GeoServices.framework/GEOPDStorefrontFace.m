@interface GEOPDStorefrontFace
+ (BOOL)isValid:(id)a3;
+ (Class)featureType;
- (BOOL)hasGeometry;
- (BOOL)hasGroupId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOrientedBoundingBox)geometry;
- (GEOPDStorefrontFace)init;
- (GEOPDStorefrontFace)initWithData:(id)a3;
- (GEOPDStorefrontFace)initWithDictionary:(id)a3;
- (GEOPDStorefrontFace)initWithJSON:(id)a3;
- (NSMutableArray)features;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)featuresCount;
- (unint64_t)groupId;
- (unint64_t)hash;
- (void)_addNoFlagsFeature:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFeatures;
- (void)_readGeometry;
- (void)addFeature:(id)a3;
- (void)clearFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFeatures:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setGroupId:(unint64_t)a3;
- (void)setHasGroupId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDStorefrontFace

- (GEOPDStorefrontFace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontFace;
  v2 = [(GEOPDStorefrontFace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDStorefrontFace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontFace;
  v3 = [(GEOPDStorefrontFace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readGeometry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontFaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeometry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasGeometry
{
  return self->_geometry != 0;
}

- (GEOPDOrientedBoundingBox)geometry
{
  -[GEOPDStorefrontFace _readGeometry]((uint64_t)self);
  geometry = self->_geometry;

  return geometry;
}

- (void)setGeometry:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_geometry, a3);
}

- (void)_readFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontFaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)features
{
  -[GEOPDStorefrontFace _readFeatures]((uint64_t)self);
  features = self->_features;

  return features;
}

- (void)setFeatures:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  features = self->_features;
  self->_features = v4;
}

- (void)clearFeatures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  features = self->_features;

  [(NSMutableArray *)features removeAllObjects];
}

- (void)addFeature:(id)a3
{
  id v4 = a3;
  -[GEOPDStorefrontFace _readFeatures]((uint64_t)self);
  -[GEOPDStorefrontFace _addNoFlagsFeature:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsFeature:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)featuresCount
{
  -[GEOPDStorefrontFace _readFeatures]((uint64_t)self);
  features = self->_features;

  return [(NSMutableArray *)features count];
}

- (id)featureAtIndex:(unint64_t)a3
{
  -[GEOPDStorefrontFace _readFeatures]((uint64_t)self);
  features = self->_features;

  return (id)[(NSMutableArray *)features objectAtIndex:a3];
}

+ (Class)featureType
{
  return (Class)objc_opt_class();
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_groupId = a3;
}

- (void)setHasGroupId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasGroupId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDStorefrontFace;
  id v4 = [(GEOPDStorefrontFace *)&v8 description];
  id v5 = [(GEOPDStorefrontFace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontFace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 geometry];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"geometry"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = *(id *)(a1 + 16);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v19);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v19);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"feature"];
    }
    if (*(unsigned char *)(a1 + 52))
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v17 = @"groupId";
      }
      else {
        v17 = @"group_id";
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v17, (void)v19);
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
  return -[GEOPDStorefrontFace _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontFace)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontFace *)-[GEOPDStorefrontFace _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"geometry"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOPDOrientedBoundingBox alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDOrientedBoundingBox *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDOrientedBoundingBox *)v7 initWithDictionary:v6];
        }
        id v9 = (void *)v8;
        [a1 setGeometry:v8];
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:@"feature"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v5;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEOPDStorefrontFeature alloc];
                if (a3) {
                  uint64_t v18 = [(GEOPDStorefrontFeature *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOPDStorefrontFeature *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addFeature:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v13);
        }

        id v5 = v23;
      }

      if (a3) {
        long long v20 = @"groupId";
      }
      else {
        long long v20 = @"group_id";
      }
      long long v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGroupId:", objc_msgSend(v21, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOPDStorefrontFace)initWithJSON:(id)a3
{
  return (GEOPDStorefrontFace *)-[GEOPDStorefrontFace _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_142;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_143;
    }
    GEOPDStorefrontFaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDStorefrontFaceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontFaceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontFaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDStorefrontFace *)self readAll:0];
    if (self->_geometry) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_features;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDStorefrontFace *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_geometry) {
    objc_msgSend(v8, "setGeometry:");
  }
  if ([(GEOPDStorefrontFace *)self featuresCount])
  {
    [v8 clearFeatures];
    unint64_t v4 = [(GEOPDStorefrontFace *)self featuresCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDStorefrontFace *)self featureAtIndex:i];
        [v8 addFeature:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_groupId;
    *((unsigned char *)v8 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDStorefrontFaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDStorefrontFace *)self readAll:0];
  id v9 = [(GEOPDOrientedBoundingBox *)self->_geometry copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_features;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addFeature:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_groupId;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOPDStorefrontFace *)self readAll:1];
  [v4 readAll:1];
  geometry = self->_geometry;
  if ((unint64_t)geometry | *((void *)v4 + 3))
  {
    if (!-[GEOPDOrientedBoundingBox isEqual:](geometry, "isEqual:")) {
      goto LABEL_10;
    }
  }
  features = self->_features;
  if ((unint64_t)features | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](features, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_groupId == *((void *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPDStorefrontFace *)self readAll:1];
  unint64_t v3 = [(GEOPDOrientedBoundingBox *)self->_geometry hash];
  uint64_t v4 = [(NSMutableArray *)self->_features hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_groupId;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  geometry = self->_geometry;
  uint64_t v6 = *((void *)v4 + 3);
  if (geometry)
  {
    if (v6) {
      -[GEOPDOrientedBoundingBox mergeFrom:](geometry, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPDStorefrontFace setGeometry:](self, "setGeometry:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOPDStorefrontFace addFeature:](self, "addFeature:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 52))
  {
    self->_groupId = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_features, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end