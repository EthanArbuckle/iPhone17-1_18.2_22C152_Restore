@interface GEOChargerPlugsInfo
+ (BOOL)isValid:(id)a3;
+ (Class)suggestedChargerPlugType;
+ (Class)supportedChargerPlugType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOChargerPlugsInfo)init;
- (GEOChargerPlugsInfo)initWithData:(id)a3;
- (GEOChargerPlugsInfo)initWithDictionary:(id)a3;
- (GEOChargerPlugsInfo)initWithJSON:(id)a3;
- (NSMutableArray)suggestedChargerPlugs;
- (NSMutableArray)supportedChargerPlugs;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)suggestedChargerPlugAtIndex:(unint64_t)a3;
- (id)supportedChargerPlugAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestedChargerPlugsCount;
- (unint64_t)supportedChargerPlugsCount;
- (void)_addNoFlagsSuggestedChargerPlug:(uint64_t)a1;
- (void)_addNoFlagsSupportedChargerPlug:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSuggestedChargerPlugs;
- (void)_readSupportedChargerPlugs;
- (void)addSuggestedChargerPlug:(id)a3;
- (void)addSupportedChargerPlug:(id)a3;
- (void)clearSuggestedChargerPlugs;
- (void)clearSupportedChargerPlugs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setSuggestedChargerPlugs:(id)a3;
- (void)setSupportedChargerPlugs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOChargerPlugsInfo

- (GEOChargerPlugsInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOChargerPlugsInfo;
  v2 = [(GEOChargerPlugsInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOChargerPlugsInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOChargerPlugsInfo;
  v3 = [(GEOChargerPlugsInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSuggestedChargerPlugs
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
        GEOChargerPlugsInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestedChargerPlugs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)suggestedChargerPlugs
{
  -[GEOChargerPlugsInfo _readSuggestedChargerPlugs]((uint64_t)self);
  suggestedChargerPlugs = self->_suggestedChargerPlugs;

  return suggestedChargerPlugs;
}

- (void)setSuggestedChargerPlugs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  suggestedChargerPlugs = self->_suggestedChargerPlugs;
  self->_suggestedChargerPlugs = v4;
}

- (void)clearSuggestedChargerPlugs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  suggestedChargerPlugs = self->_suggestedChargerPlugs;

  [(NSMutableArray *)suggestedChargerPlugs removeAllObjects];
}

- (void)addSuggestedChargerPlug:(id)a3
{
  id v4 = a3;
  -[GEOChargerPlugsInfo _readSuggestedChargerPlugs]((uint64_t)self);
  -[GEOChargerPlugsInfo _addNoFlagsSuggestedChargerPlug:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSuggestedChargerPlug:(uint64_t)a1
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

- (unint64_t)suggestedChargerPlugsCount
{
  -[GEOChargerPlugsInfo _readSuggestedChargerPlugs]((uint64_t)self);
  suggestedChargerPlugs = self->_suggestedChargerPlugs;

  return [(NSMutableArray *)suggestedChargerPlugs count];
}

- (id)suggestedChargerPlugAtIndex:(unint64_t)a3
{
  -[GEOChargerPlugsInfo _readSuggestedChargerPlugs]((uint64_t)self);
  suggestedChargerPlugs = self->_suggestedChargerPlugs;

  return (id)[(NSMutableArray *)suggestedChargerPlugs objectAtIndex:a3];
}

+ (Class)suggestedChargerPlugType
{
  return (Class)objc_opt_class();
}

- (void)_readSupportedChargerPlugs
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
        GEOChargerPlugsInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedChargerPlugs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)supportedChargerPlugs
{
  -[GEOChargerPlugsInfo _readSupportedChargerPlugs]((uint64_t)self);
  supportedChargerPlugs = self->_supportedChargerPlugs;

  return supportedChargerPlugs;
}

- (void)setSupportedChargerPlugs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  supportedChargerPlugs = self->_supportedChargerPlugs;
  self->_supportedChargerPlugs = v4;
}

- (void)clearSupportedChargerPlugs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  supportedChargerPlugs = self->_supportedChargerPlugs;

  [(NSMutableArray *)supportedChargerPlugs removeAllObjects];
}

- (void)addSupportedChargerPlug:(id)a3
{
  id v4 = a3;
  -[GEOChargerPlugsInfo _readSupportedChargerPlugs]((uint64_t)self);
  -[GEOChargerPlugsInfo _addNoFlagsSupportedChargerPlug:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSupportedChargerPlug:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)supportedChargerPlugsCount
{
  -[GEOChargerPlugsInfo _readSupportedChargerPlugs]((uint64_t)self);
  supportedChargerPlugs = self->_supportedChargerPlugs;

  return [(NSMutableArray *)supportedChargerPlugs count];
}

- (id)supportedChargerPlugAtIndex:(unint64_t)a3
{
  -[GEOChargerPlugsInfo _readSupportedChargerPlugs]((uint64_t)self);
  supportedChargerPlugs = self->_supportedChargerPlugs;

  return (id)[(NSMutableArray *)supportedChargerPlugs objectAtIndex:a3];
}

+ (Class)supportedChargerPlugType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOChargerPlugsInfo;
  id v4 = [(GEOChargerPlugsInfo *)&v8 description];
  id v5 = [(GEOChargerPlugsInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOChargerPlugsInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"suggestedChargerPlug";
      }
      else {
        v13 = @"suggested_charger_plug";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"supportedChargerPlug";
      }
      else {
        v22 = @"supported_charger_plug";
      }
      [v4 setObject:v14 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __49__GEOChargerPlugsInfo__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOChargerPlugsInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOChargerPlugsInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOChargerPlugsInfo)initWithDictionary:(id)a3
{
  return (GEOChargerPlugsInfo *)-[GEOChargerPlugsInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"suggestedChargerPlug";
      }
      else {
        id v6 = @"suggested_charger_plug";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v29 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOChargerPlug alloc];
                if (a3) {
                  uint64_t v15 = [(GEOChargerPlug *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOChargerPlug *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addSuggestedChargerPlug:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v10);
        }

        id v5 = v29;
      }

      if (a3) {
        uint64_t v17 = @"supportedChargerPlug";
      }
      else {
        uint64_t v17 = @"supported_charger_plug";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = [GEOChargerPlug alloc];
                if (a3) {
                  uint64_t v26 = [(GEOChargerPlug *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOChargerPlug *)v25 initWithDictionary:v24];
                }
                id v27 = (void *)v26;
                [a1 addSupportedChargerPlug:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v21);
        }

        id v5 = v29;
      }
    }
  }

  return a1;
}

- (GEOChargerPlugsInfo)initWithJSON:(id)a3
{
  return (GEOChargerPlugsInfo *)-[GEOChargerPlugsInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_958;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_959;
    }
    GEOChargerPlugsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOChargerPlugsInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOChargerPlugsInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOChargerPlugsInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOChargerPlugsInfo *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_suggestedChargerPlugs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_supportedChargerPlugs;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOChargerPlugsInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOChargerPlugsInfo *)self suggestedChargerPlugsCount])
  {
    [v12 clearSuggestedChargerPlugs];
    unint64_t v4 = [(GEOChargerPlugsInfo *)self suggestedChargerPlugsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOChargerPlugsInfo *)self suggestedChargerPlugAtIndex:i];
        [v12 addSuggestedChargerPlug:v7];
      }
    }
  }
  if ([(GEOChargerPlugsInfo *)self supportedChargerPlugsCount])
  {
    [v12 clearSupportedChargerPlugs];
    unint64_t v8 = [(GEOChargerPlugsInfo *)self supportedChargerPlugsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOChargerPlugsInfo *)self supportedChargerPlugAtIndex:j];
        [v12 addSupportedChargerPlug:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOChargerPlugsInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOChargerPlugsInfo *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_suggestedChargerPlugs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) copyWithZone:a3];
        [v5 addSuggestedChargerPlug:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_supportedChargerPlugs;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (void)v19);
        [v5 addSupportedChargerPlug:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOChargerPlugsInfo *)self readAll:1],
         [v4 readAll:1],
         suggestedChargerPlugs = self->_suggestedChargerPlugs,
         !((unint64_t)suggestedChargerPlugs | v4[3]))
     || -[NSMutableArray isEqual:](suggestedChargerPlugs, "isEqual:")))
  {
    supportedChargerPlugs = self->_supportedChargerPlugs;
    if ((unint64_t)supportedChargerPlugs | v4[4]) {
      char v7 = -[NSMutableArray isEqual:](supportedChargerPlugs, "isEqual:");
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
  [(GEOChargerPlugsInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_suggestedChargerPlugs hash];
  return [(NSMutableArray *)self->_supportedChargerPlugs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOChargerPlugsInfo *)self addSuggestedChargerPlug:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOChargerPlugsInfo addSupportedChargerPlug:](self, "addSupportedChargerPlug:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEOChargerPlugsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_963);
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOChargerPlugsInfo *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_suggestedChargerPlugs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = self->_supportedChargerPlugs;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChargerPlugs, 0);
  objc_storeStrong((id *)&self->_suggestedChargerPlugs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end