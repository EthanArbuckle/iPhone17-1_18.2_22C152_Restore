@interface GEORPFeedbackTileFeatureInfo
+ (BOOL)isValid:(id)a3;
+ (Class)featureHandleType;
- (BOOL)hasFeatureName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackTileFeatureInfo)init;
- (GEORPFeedbackTileFeatureInfo)initWithData:(id)a3;
- (GEORPFeedbackTileFeatureInfo)initWithDictionary:(id)a3;
- (GEORPFeedbackTileFeatureInfo)initWithJSON:(id)a3;
- (NSMutableArray)featureHandles;
- (NSString)featureName;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureHandleAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)featureHandlesCount;
- (unint64_t)hash;
- (void)_addNoFlagsFeatureHandle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFeatureHandles;
- (void)_readFeatureName;
- (void)addFeatureHandle:(id)a3;
- (void)clearFeatureHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFeatureHandles:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackTileFeatureInfo

- (GEORPFeedbackTileFeatureInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTileFeatureInfo;
  v2 = [(GEORPFeedbackTileFeatureInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTileFeatureInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTileFeatureInfo;
  v3 = [(GEORPFeedbackTileFeatureInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeatureHandles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTileFeatureInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureHandles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)featureHandles
{
  -[GEORPFeedbackTileFeatureInfo _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return featureHandles;
}

- (void)setFeatureHandles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  featureHandles = self->_featureHandles;
  self->_featureHandles = v4;
}

- (void)clearFeatureHandles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  featureHandles = self->_featureHandles;

  [(NSMutableArray *)featureHandles removeAllObjects];
}

- (void)addFeatureHandle:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackTileFeatureInfo _readFeatureHandles]((uint64_t)self);
  -[GEORPFeedbackTileFeatureInfo _addNoFlagsFeatureHandle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsFeatureHandle:(uint64_t)a1
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

- (unint64_t)featureHandlesCount
{
  -[GEORPFeedbackTileFeatureInfo _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return [(NSMutableArray *)featureHandles count];
}

- (id)featureHandleAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTileFeatureInfo _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return (id)[(NSMutableArray *)featureHandles objectAtIndex:a3];
}

+ (Class)featureHandleType
{
  return (Class)objc_opt_class();
}

- (void)_readFeatureName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTileFeatureInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasFeatureName
{
  return self->_featureName != 0;
}

- (NSString)featureName
{
  -[GEORPFeedbackTileFeatureInfo _readFeatureName]((uint64_t)self);
  featureName = self->_featureName;

  return featureName;
}

- (void)setFeatureName:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackTileFeatureInfo;
  id v4 = [(GEORPFeedbackTileFeatureInfo *)&v8 description];
  id v5 = [(GEORPFeedbackTileFeatureInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackTileFeatureInfo _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v17);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"featureHandle";
      }
      else {
        v13 = @"feature_handle";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v17);
    }
    v14 = [a1 featureName];
    if (v14)
    {
      if (a2) {
        v15 = @"featureName";
      }
      else {
        v15 = @"feature_name";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEORPFeedbackTileFeatureInfo _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPFeedbackTileFeatureInfo)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTileFeatureInfo *)-[GEORPFeedbackTileFeatureInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"featureHandle";
      }
      else {
        id v6 = @"feature_handle";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEORPFeatureHandle alloc];
                if (a3) {
                  uint64_t v15 = [(GEORPFeatureHandle *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORPFeatureHandle *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addFeatureHandle:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v21;
      }

      if (a3) {
        long long v17 = @"featureName";
      }
      else {
        long long v17 = @"feature_name";
      }
      long long v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = (void *)[v18 copy];
        [a1 setFeatureName:v19];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackTileFeatureInfo)initWithJSON:(id)a3
{
  return (GEORPFeedbackTileFeatureInfo *)-[GEORPFeedbackTileFeatureInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1005;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1006;
    }
    GEORPFeedbackTileFeatureInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackTileFeatureInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTileFeatureInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTileFeatureInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackTileFeatureInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_featureHandles;
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

    if (self->_featureName) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackTileFeatureInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackTileFeatureInfo *)self featureHandlesCount])
  {
    [v8 clearFeatureHandles];
    unint64_t v4 = [(GEORPFeedbackTileFeatureInfo *)self featureHandlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackTileFeatureInfo *)self featureHandleAtIndex:i];
        [v8 addFeatureHandle:v7];
      }
    }
  }
  if (self->_featureName) {
    objc_msgSend(v8, "setFeatureName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackTileFeatureInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackTileFeatureInfo *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_featureHandles;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addFeatureHandle:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_featureName copyWithZone:a3];
  long long v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackTileFeatureInfo *)self readAll:1],
         [v4 readAll:1],
         featureHandles = self->_featureHandles,
         !((unint64_t)featureHandles | v4[2]))
     || -[NSMutableArray isEqual:](featureHandles, "isEqual:")))
  {
    featureName = self->_featureName;
    if ((unint64_t)featureName | v4[3]) {
      char v7 = -[NSString isEqual:](featureName, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEORPFeedbackTileFeatureInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_featureHandles hash];
  return [(NSString *)self->_featureName hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackTileFeatureInfo addFeatureHandle:](self, "addFeatureHandle:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[GEORPFeedbackTileFeatureInfo setFeatureName:](self, "setFeatureName:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_featureHandles, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end