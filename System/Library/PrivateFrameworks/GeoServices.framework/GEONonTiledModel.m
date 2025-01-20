@interface GEONonTiledModel
+ (BOOL)isValid:(id)a3;
+ (Class)materialMapType;
- (BOOL)hasInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONonTiledInfo)info;
- (GEONonTiledModel)init;
- (GEONonTiledModel)initWithData:(id)a3;
- (GEONonTiledModel)initWithDictionary:(id)a3;
- (GEONonTiledModel)initWithJSON:(id)a3;
- (NSMutableArray)materialMaps;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)materialMapAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)materialMapsCount;
- (void)_addNoFlagsMaterialMap:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readInfo;
- (void)_readMaterialMaps;
- (void)addMaterialMap:(id)a3;
- (void)clearMaterialMaps;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setMaterialMaps:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONonTiledModel

- (GEONonTiledModel)initWithJSON:(id)a3
{
  return (GEONonTiledModel *)-[GEONonTiledModel _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"info"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEONonTiledInfo alloc];
        if (a3) {
          uint64_t v8 = [(GEONonTiledInfo *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEONonTiledInfo *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setInfo:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"materialMap"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v5;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEONonTiledMaterialMap alloc];
                if (a3) {
                  uint64_t v18 = [(GEONonTiledMaterialMap *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEONonTiledMaterialMap *)v17 initWithDictionary:v16];
                }
                v19 = (void *)v18;
                [a1 addMaterialMap:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        id v5 = v21;
      }
    }
  }

  return a1;
}

- (void)setInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_info, a3);
}

- (GEONonTiledModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONonTiledModel;
  v2 = [(GEONonTiledModel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialMaps, 0);
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEONonTiledInfo)info
{
  -[GEONonTiledModel _readInfo]((uint64_t)self);
  info = self->_info;

  return info;
}

- (void)_readInfo
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
        GEONonTiledModelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (GEONonTiledModel)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONonTiledModel;
  id v3 = [(GEONonTiledModel *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (void)_readMaterialMaps
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
        GEONonTiledModelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMaterialMaps_tags_147);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)materialMaps
{
  -[GEONonTiledModel _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return materialMaps;
}

- (void)setMaterialMaps:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  materialMaps = self->_materialMaps;
  self->_materialMaps = v4;
}

- (void)clearMaterialMaps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  materialMaps = self->_materialMaps;

  [(NSMutableArray *)materialMaps removeAllObjects];
}

- (void)addMaterialMap:(id)a3
{
  id v4 = a3;
  -[GEONonTiledModel _readMaterialMaps]((uint64_t)self);
  -[GEONonTiledModel _addNoFlagsMaterialMap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsMaterialMap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)materialMapsCount
{
  -[GEONonTiledModel _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return [(NSMutableArray *)materialMaps count];
}

- (id)materialMapAtIndex:(unint64_t)a3
{
  -[GEONonTiledModel _readMaterialMaps]((uint64_t)self);
  materialMaps = self->_materialMaps;

  return (id)[(NSMutableArray *)materialMaps objectAtIndex:a3];
}

+ (Class)materialMapType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONonTiledModel;
  id v4 = [(GEONonTiledModel *)&v8 description];
  id v5 = [(GEONonTiledModel *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONonTiledModel _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 info];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"info"];
    }
    if ([a1[3] count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = a1[3];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v17);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"materialMap"];
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
  return -[GEONonTiledModel _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEONonTiledModel)initWithDictionary:(id)a3
{
  return (GEONonTiledModel *)-[GEONonTiledModel _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_super v8 = (int *)&readAll__recursiveTag_148;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_149;
    }
    GEONonTiledModelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEONonTiledModelCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONonTiledModelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONonTiledModelReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEONonTiledModel *)self readAll:0];
    if (self->_info) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_materialMaps;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEONonTiledModel *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_info) {
    objc_msgSend(v8, "setInfo:");
  }
  if ([(GEONonTiledModel *)self materialMapsCount])
  {
    [v8 clearMaterialMaps];
    unint64_t v4 = [(GEONonTiledModel *)self materialMapsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEONonTiledModel *)self materialMapAtIndex:i];
        [v8 addMaterialMap:v7];
      }
    }
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
      GEONonTiledModelReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONonTiledModel *)self readAll:0];
  id v8 = [(GEONonTiledInfo *)self->_info copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_materialMaps;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addMaterialMap:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEONonTiledModel *)self readAll:1],
         [v4 readAll:1],
         info = self->_info,
         !((unint64_t)info | v4[2]))
     || -[GEONonTiledInfo isEqual:](info, "isEqual:")))
  {
    materialMaps = self->_materialMaps;
    if ((unint64_t)materialMaps | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](materialMaps, "isEqual:");
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
  [(GEONonTiledModel *)self readAll:1];
  unint64_t v3 = [(GEONonTiledInfo *)self->_info hash];
  return [(NSMutableArray *)self->_materialMaps hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  info = self->_info;
  id v6 = v4[2];
  if (info)
  {
    if (v6) {
      -[GEONonTiledInfo mergeFrom:](info, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEONonTiledModel setInfo:](self, "setInfo:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4[3];
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
        -[GEONonTiledModel addMaterialMap:](self, "addMaterialMap:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

@end