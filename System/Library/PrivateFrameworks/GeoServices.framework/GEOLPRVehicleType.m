@interface GEOLPRVehicleType
+ (BOOL)isValid:(id)a3;
+ (Class)subtitleType;
+ (Class)titleType;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRVehicleType)init;
- (GEOLPRVehicleType)initWithData:(id)a3;
- (GEOLPRVehicleType)initWithDictionary:(id)a3;
- (GEOLPRVehicleType)initWithJSON:(id)a3;
- (NSMutableArray)subtitles;
- (NSMutableArray)titles;
- (NSString)key;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)subtitleAtIndex:(unint64_t)a3;
- (id)titleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subtitlesCount;
- (unint64_t)titlesCount;
- (void)_addNoFlagsSubtitle:(uint64_t)a1;
- (void)_addNoFlagsTitle:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readKey;
- (void)_readSubtitles;
- (void)_readTitles;
- (void)addSubtitle:(id)a3;
- (void)addTitle:(id)a3;
- (void)clearSubtitles;
- (void)clearTitles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSubtitles:(id)a3;
- (void)setTitles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRVehicleType

- (GEOLPRVehicleType)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRVehicleType;
  v2 = [(GEOLPRVehicleType *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRVehicleType)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRVehicleType;
  v3 = [(GEOLPRVehicleType *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_481);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  -[GEOLPRVehicleType _readKey]((uint64_t)self);
  key = self->_key;

  return key;
}

- (void)setKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)_readTitles
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
        GEOLPRVehicleTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitles_tags_482);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)titles
{
  -[GEOLPRVehicleType _readTitles]((uint64_t)self);
  titles = self->_titles;

  return titles;
}

- (void)setTitles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  titles = self->_titles;
  self->_titles = v4;
}

- (void)clearTitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  titles = self->_titles;

  [(NSMutableArray *)titles removeAllObjects];
}

- (void)addTitle:(id)a3
{
  id v4 = a3;
  -[GEOLPRVehicleType _readTitles]((uint64_t)self);
  -[GEOLPRVehicleType _addNoFlagsTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTitle:(uint64_t)a1
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

- (unint64_t)titlesCount
{
  -[GEOLPRVehicleType _readTitles]((uint64_t)self);
  titles = self->_titles;

  return [(NSMutableArray *)titles count];
}

- (id)titleAtIndex:(unint64_t)a3
{
  -[GEOLPRVehicleType _readTitles]((uint64_t)self);
  titles = self->_titles;

  return (id)[(NSMutableArray *)titles objectAtIndex:a3];
}

+ (Class)titleType
{
  return (Class)objc_opt_class();
}

- (void)_readSubtitles
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
        GEOLPRVehicleTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtitles_tags_483);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)subtitles
{
  -[GEOLPRVehicleType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return subtitles;
}

- (void)setSubtitles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  subtitles = self->_subtitles;
  self->_subtitles = v4;
}

- (void)clearSubtitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  subtitles = self->_subtitles;

  [(NSMutableArray *)subtitles removeAllObjects];
}

- (void)addSubtitle:(id)a3
{
  id v4 = a3;
  -[GEOLPRVehicleType _readSubtitles]((uint64_t)self);
  -[GEOLPRVehicleType _addNoFlagsSubtitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsSubtitle:(uint64_t)a1
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

- (unint64_t)subtitlesCount
{
  -[GEOLPRVehicleType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return [(NSMutableArray *)subtitles count];
}

- (id)subtitleAtIndex:(unint64_t)a3
{
  -[GEOLPRVehicleType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return (id)[(NSMutableArray *)subtitles objectAtIndex:a3];
}

+ (Class)subtitleType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRVehicleType;
  id v4 = [(GEOLPRVehicleType *)&v8 description];
  id v5 = [(GEOLPRVehicleType *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRVehicleType _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 key];
    if (v5) {
      [v4 setObject:v5 forKey:@"key"];
    }

    if ([a1[4] count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = a1[4];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"title"];
    }
    if ([a1[3] count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = a1[3];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v23);
            }
            objc_msgSend(v14, "addObject:", v21, (void)v23);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"subtitle"];
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
  return -[GEOLPRVehicleType _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRVehicleType)initWithDictionary:(id)a3
{
  return (GEOLPRVehicleType *)-[GEOLPRVehicleType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"key"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setKey:v7];
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      id v29 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v15 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v16 = [(GEOLocalizedString *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOLocalizedString *)v15 initWithDictionary:v14];
                }
                uint64_t v17 = (void *)v16;
                [a1 addTitle:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v11);
        }

        id v5 = v29;
      }

      uint64_t v18 = [v5 objectForKeyedSubscript:@"subtitle"];
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
                long long v25 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v26 = [(GEOLocalizedString *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOLocalizedString *)v25 initWithDictionary:v24];
                }
                long long v27 = (void *)v26;
                [a1 addSubtitle:v26];
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

- (GEOLPRVehicleType)initWithJSON:(id)a3
{
  return (GEOLPRVehicleType *)-[GEOLPRVehicleType _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_484;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_485;
    }
    GEOLPRVehicleTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRVehicleTypeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRVehicleTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRVehicleTypeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRVehicleTypeIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRVehicleType *)self readAll:0];
    if (self->_key) {
      PBDataWriterWriteStringField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_titles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_subtitles;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOLPRVehicleType *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_key) {
    objc_msgSend(v12, "setKey:");
  }
  if ([(GEOLPRVehicleType *)self titlesCount])
  {
    [v12 clearTitles];
    unint64_t v4 = [(GEOLPRVehicleType *)self titlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRVehicleType *)self titleAtIndex:i];
        [v12 addTitle:v7];
      }
    }
  }
  if ([(GEOLPRVehicleType *)self subtitlesCount])
  {
    [v12 clearSubtitles];
    unint64_t v8 = [(GEOLPRVehicleType *)self subtitlesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRVehicleType *)self subtitleAtIndex:j];
        [v12 addSubtitle:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRVehicleTypeReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRVehicleType *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_titles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v13) copyWithZone:a3];
        [v5 addTitle:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = self->_subtitles;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addSubtitle:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRVehicleType *)self readAll:1],
         [v4 readAll:1],
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:"))
    && ((titles = self->_titles, !((unint64_t)titles | v4[4]))
     || -[NSMutableArray isEqual:](titles, "isEqual:")))
  {
    subtitles = self->_subtitles;
    if ((unint64_t)subtitles | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](subtitles, "isEqual:");
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
  [(GEOLPRVehicleType *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSMutableArray *)self->_titles hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_subtitles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOLPRVehicleType setKey:](self, "setKey:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLPRVehicleType *)self addTitle:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOLPRVehicleType addSubtitle:](self, "addSubtitle:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end