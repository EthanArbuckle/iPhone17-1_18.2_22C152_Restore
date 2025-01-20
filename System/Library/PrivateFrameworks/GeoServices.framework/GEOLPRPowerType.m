@interface GEOLPRPowerType
+ (BOOL)isValid:(id)a3;
+ (Class)subtitleType;
+ (Class)subtypesType;
+ (Class)titleType;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRPowerType)init;
- (GEOLPRPowerType)initWithData:(id)a3;
- (GEOLPRPowerType)initWithDictionary:(id)a3;
- (GEOLPRPowerType)initWithJSON:(id)a3;
- (NSMutableArray)subtitles;
- (NSMutableArray)subtypes;
- (NSMutableArray)titles;
- (NSString)key;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)subtitleAtIndex:(unint64_t)a3;
- (id)subtypesAtIndex:(unint64_t)a3;
- (id)titleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subtitlesCount;
- (unint64_t)subtypesCount;
- (unint64_t)titlesCount;
- (void)_addNoFlagsSubtitle:(uint64_t)a1;
- (void)_addNoFlagsSubtypes:(uint64_t)a1;
- (void)_addNoFlagsTitle:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readKey;
- (void)_readSubtitles;
- (void)_readSubtypes;
- (void)_readTitles;
- (void)addSubtitle:(id)a3;
- (void)addSubtypes:(id)a3;
- (void)addTitle:(id)a3;
- (void)clearSubtitles;
- (void)clearSubtypes;
- (void)clearTitles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSubtitles:(id)a3;
- (void)setSubtypes:(id)a3;
- (void)setTitles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRPowerType

- (GEOLPRPowerType)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRPowerType;
  v2 = [(GEOLPRPowerType *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRPowerType)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRPowerType;
  v3 = [(GEOLPRPowerType *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRPowerTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  -[GEOLPRPowerType _readKey]((uint64_t)self);
  key = self->_key;

  return key;
}

- (void)setKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)_readTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRPowerTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitles_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)titles
{
  -[GEOLPRPowerType _readTitles]((uint64_t)self);
  titles = self->_titles;

  return titles;
}

- (void)setTitles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  titles = self->_titles;
  self->_titles = v4;
}

- (void)clearTitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  titles = self->_titles;

  [(NSMutableArray *)titles removeAllObjects];
}

- (void)addTitle:(id)a3
{
  id v4 = a3;
  -[GEOLPRPowerType _readTitles]((uint64_t)self);
  -[GEOLPRPowerType _addNoFlagsTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)titlesCount
{
  -[GEOLPRPowerType _readTitles]((uint64_t)self);
  titles = self->_titles;

  return [(NSMutableArray *)titles count];
}

- (id)titleAtIndex:(unint64_t)a3
{
  -[GEOLPRPowerType _readTitles]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRPowerTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)subtitles
{
  -[GEOLPRPowerType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return subtitles;
}

- (void)setSubtitles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subtitles = self->_subtitles;
  self->_subtitles = v4;
}

- (void)clearSubtitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subtitles = self->_subtitles;

  [(NSMutableArray *)subtitles removeAllObjects];
}

- (void)addSubtitle:(id)a3
{
  id v4 = a3;
  -[GEOLPRPowerType _readSubtitles]((uint64_t)self);
  -[GEOLPRPowerType _addNoFlagsSubtitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
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
  -[GEOLPRPowerType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return [(NSMutableArray *)subtitles count];
}

- (id)subtitleAtIndex:(unint64_t)a3
{
  -[GEOLPRPowerType _readSubtitles]((uint64_t)self);
  subtitles = self->_subtitles;

  return (id)[(NSMutableArray *)subtitles objectAtIndex:a3];
}

+ (Class)subtitleType
{
  return (Class)objc_opt_class();
}

- (void)_readSubtypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRPowerTypeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)subtypes
{
  -[GEOLPRPowerType _readSubtypes]((uint64_t)self);
  subtypes = self->_subtypes;

  return subtypes;
}

- (void)setSubtypes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subtypes = self->_subtypes;
  self->_subtypes = v4;
}

- (void)clearSubtypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  subtypes = self->_subtypes;

  [(NSMutableArray *)subtypes removeAllObjects];
}

- (void)addSubtypes:(id)a3
{
  id v4 = a3;
  -[GEOLPRPowerType _readSubtypes]((uint64_t)self);
  -[GEOLPRPowerType _addNoFlagsSubtypes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSubtypes:(uint64_t)a1
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

- (unint64_t)subtypesCount
{
  -[GEOLPRPowerType _readSubtypes]((uint64_t)self);
  subtypes = self->_subtypes;

  return [(NSMutableArray *)subtypes count];
}

- (id)subtypesAtIndex:(unint64_t)a3
{
  -[GEOLPRPowerType _readSubtypes]((uint64_t)self);
  subtypes = self->_subtypes;

  return (id)[(NSMutableArray *)subtypes objectAtIndex:a3];
}

+ (Class)subtypesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRPowerType;
  id v4 = [(GEOLPRPowerType *)&v8 description];
  id v5 = [(GEOLPRPowerType *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRPowerType _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 key];
    if (v5) {
      [v4 setObject:v5 forKey:@"key"];
    }

    if ([a1[5] count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v7 = a1[5];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v40 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"title"];
    }
    if ([a1[3] count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v15 = a1[3];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"subtitle"];
    }
    if ([a1[4] count])
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v23 = a1[4];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v32;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v32 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v31 + 1) + 8 * k);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = objc_msgSend(v28, "dictionaryRepresentation", (void)v31);
            }
            objc_msgSend(v22, "addObject:", v29, (void)v31);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v25);
      }

      [v4 setObject:v22 forKey:@"subtypes"];
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
  return -[GEOLPRPowerType _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLPRPowerType)initWithDictionary:(id)a3
{
  return (GEOLPRPowerType *)-[GEOLPRPowerType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
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
      id v39 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
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
            uint64_t v11 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
          }
          while (v11);
        }

        id v5 = v39;
      }

      uint64_t v18 = [v5 objectForKeyedSubscript:@"subtitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v26 = [(GEOLocalizedString *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOLocalizedString *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addSubtitle:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v21);
        }

        id v5 = v39;
      }

      v28 = [v5 objectForKeyedSubscript:@"subtypes"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v41;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v41 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v40 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v35 = [GEOLPRPowerType alloc];
                if (a3) {
                  uint64_t v36 = [(GEOLPRPowerType *)v35 initWithJSON:v34];
                }
                else {
                  uint64_t v36 = [(GEOLPRPowerType *)v35 initWithDictionary:v34];
                }
                long long v37 = (void *)v36;
                [a1 addSubtypes:v36];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v52 count:16];
          }
          while (v31);
        }

        id v5 = v39;
      }
    }
  }

  return a1;
}

- (GEOLPRPowerType)initWithJSON:(id)a3
{
  return (GEOLPRPowerType *)-[GEOLPRPowerType _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_218;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_219;
    }
    GEOLPRPowerTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRPowerTypeCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRPowerTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRPowerTypeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRPowerTypeIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRPowerType *)self readAll:0];
    if (self->_key) {
      PBDataWriterWriteStringField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_titles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_subtitles;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_subtypes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEOLPRPowerType *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_key) {
    objc_msgSend(v16, "setKey:");
  }
  if ([(GEOLPRPowerType *)self titlesCount])
  {
    [v16 clearTitles];
    unint64_t v4 = [(GEOLPRPowerType *)self titlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRPowerType *)self titleAtIndex:i];
        [v16 addTitle:v7];
      }
    }
  }
  if ([(GEOLPRPowerType *)self subtitlesCount])
  {
    [v16 clearSubtitles];
    unint64_t v8 = [(GEOLPRPowerType *)self subtitlesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRPowerType *)self subtitleAtIndex:j];
        [v16 addSubtitle:v11];
      }
    }
  }
  if ([(GEOLPRPowerType *)self subtypesCount])
  {
    [v16 clearSubtypes];
    unint64_t v12 = [(GEOLPRPowerType *)self subtypesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOLPRPowerType *)self subtypesAtIndex:k];
        [v16 addSubtypes:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRPowerTypeReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRPowerType *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = self->_titles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v13) copyWithZone:a3];
        [v5 addTitle:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = self->_subtitles;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addSubtitle:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v20 = self->_subtypes;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23), "copyWithZone:", a3, (void)v26);
        [v5 addSubtypes:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v21);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLPRPowerType *)self readAll:1],
         [v4 readAll:1],
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:"))
    && ((titles = self->_titles, !((unint64_t)titles | v4[5]))
     || -[NSMutableArray isEqual:](titles, "isEqual:"))
    && ((subtitles = self->_subtitles, !((unint64_t)subtitles | v4[3]))
     || -[NSMutableArray isEqual:](subtitles, "isEqual:")))
  {
    subtypes = self->_subtypes;
    if ((unint64_t)subtypes | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](subtypes, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOLPRPowerType *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_key hash];
  uint64_t v4 = [(NSMutableArray *)self->_titles hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_subtitles hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_subtypes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOLPRPowerType setKey:](self, "setKey:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLPRPowerType *)self addTitle:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOLPRPowerType *)self addSubtitle:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[4];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOLPRPowerType addSubtypes:](self, "addSubtypes:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_subtypes, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end