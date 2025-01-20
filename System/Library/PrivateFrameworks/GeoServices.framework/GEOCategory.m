@interface GEOCategory
+ (BOOL)isValid:(id)a3;
+ (Class)localizedNamesType;
- (BOOL)hasGeoOntologyId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCategory)init;
- (GEOCategory)initWithData:(id)a3;
- (GEOCategory)initWithDictionary:(id)a3;
- (GEOCategory)initWithJSON:(id)a3;
- (GEOCategory)initWithPlaceDataCategory:(id)a3;
- (NSMutableArray)localizedNames;
- (NSString)alias;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedNamesAtIndex:(unint64_t)a3;
- (int)level;
- (int64_t)geoOntologyId;
- (unint64_t)hash;
- (unint64_t)localizedNamesCount;
- (void)_addNoFlagsLocalizedNames:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readLocalizedNames;
- (void)addLocalizedNames:(id)a3;
- (void)clearLocalizedNames;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlias:(id)a3;
- (void)setGeoOntologyId:(int64_t)a3;
- (void)setHasGeoOntologyId:(BOOL)a3;
- (void)setLevel:(int)a3;
- (void)setLocalizedNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCategory

- (GEOCategory)initWithPlaceDataCategory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOCategory;
  v5 = [(GEOCategory *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(GEOCategory *)v5 setAlias:&stru_1ED51F370];
    if ([v4 hasLevel]) {
      -[GEOCategory setLevel:](v6, "setLevel:", [v4 level]);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = objc_msgSend(v4, "localizedNames", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [[GEOLocalizedName alloc] initWithPlaceDataLocalizedString:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
          [(GEOCategory *)v6 addLocalizedNames:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = v6;
  }

  return v6;
}

- (void)setLevel:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_level = a3;
}

- (void)setAlias:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_alias, a3);
}

- (void)addLocalizedNames:(id)a3
{
  id v4 = a3;
  -[GEOCategory _readLocalizedNames]((uint64_t)self);
  -[GEOCategory _addNoFlagsLocalizedNames:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_readLocalizedNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCategoryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedNames_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_addNoFlagsLocalizedNames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCategory;
  v2 = [(GEOCategory *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOCategory)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCategory;
  id v3 = [(GEOCategory *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (NSString)alias
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        id v4 = reader;
        objc_sync_enter(v4);
        GEOCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readAlias_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  alias = self->_alias;

  return alias;
}

- (int)level
{
  return self->_level;
}

- (int64_t)geoOntologyId
{
  return self->_geoOntologyId;
}

- (void)setGeoOntologyId:(int64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_geoOntologyId = a3;
}

- (void)setHasGeoOntologyId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasGeoOntologyId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)localizedNames
{
  -[GEOCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return localizedNames;
}

- (void)setLocalizedNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedNames = self->_localizedNames;
  self->_localizedNames = v4;
}

- (void)clearLocalizedNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedNames = self->_localizedNames;

  [(NSMutableArray *)localizedNames removeAllObjects];
}

- (unint64_t)localizedNamesCount
{
  -[GEOCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return [(NSMutableArray *)localizedNames count];
}

- (id)localizedNamesAtIndex:(unint64_t)a3
{
  -[GEOCategory _readLocalizedNames]((uint64_t)self);
  localizedNames = self->_localizedNames;

  return (id)[(NSMutableArray *)localizedNames objectAtIndex:a3];
}

+ (Class)localizedNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCategory;
  id v4 = [(GEOCategory *)&v8 description];
  id v5 = [(GEOCategory *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCategory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 alias];
    if (v5) {
      [v4 setObject:v5 forKey:@"alias"];
    }

    objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
    [v4 setObject:v6 forKey:@"level"];

    if (*(unsigned char *)(a1 + 64))
    {
      objc_super v7 = [NSNumber numberWithLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v7 forKey:@"geoOntologyId"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            long long v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"localizedNames"];
    }
    long long v16 = *(void **)(a1 + 16);
    if (v16)
    {
      long long v17 = [v16 dictionaryRepresentation];
      long long v18 = v17;
      if (a2)
      {
        objc_super v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __41__GEOCategory__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        long long v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOCategory _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOCategory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCategory)initWithDictionary:(id)a3
{
  return (GEOCategory *)-[GEOCategory _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_super v6 = [v5 objectForKeyedSubscript:@"alias"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setAlias:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"level"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLevel:", objc_msgSend(v8, "intValue"));
      }

      id v9 = [v5 objectForKeyedSubscript:@"geoOntologyId"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGeoOntologyId:", objc_msgSend(v9, "longLongValue"));
      }

      id v10 = [v5 objectForKeyedSubscript:@"localizedNames"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v21 = v10;
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
                long long v17 = [GEOLocalizedName alloc];
                if (a3) {
                  uint64_t v18 = [(GEOLocalizedName *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOLocalizedName *)v17 initWithDictionary:v16];
                }
                objc_super v19 = (void *)v18;
                [a1 addLocalizedNames:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        id v10 = v21;
      }
    }
  }

  return a1;
}

- (GEOCategory)initWithJSON:(id)a3
{
  return (GEOCategory *)-[GEOCategory _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_503_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_504_0;
    }
    GEOCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCategoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCategoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCategoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCategoryIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
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
    [(GEOCategory *)self readAll:0];
    PBDataWriterWriteStringField();
    PBDataWriterWriteInt32Field();
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_localizedNames;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOCategory *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v8 setAlias:self->_alias];
  *((_DWORD *)v8 + 15) = self->_level;
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_geoOntologyId;
    *((unsigned char *)v8 + 64) |= 1u;
  }
  if ([(GEOCategory *)self localizedNamesCount])
  {
    [v8 clearLocalizedNames];
    unint64_t v4 = [(GEOCategory *)self localizedNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOCategory *)self localizedNamesAtIndex:i];
        [v8 addLocalizedNames:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOCategoryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCategory *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_alias copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  *(_DWORD *)(v5 + 60) = self->_level;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_geoOntologyId;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = self->_localizedNames;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addLocalizedNames:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  uint64_t v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOCategory *)self readAll:1];
  [v4 readAll:1];
  alias = self->_alias;
  if ((unint64_t)alias | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](alias, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (self->_level != *((_DWORD *)v4 + 15)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_geoOntologyId != *((void *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_12:
    char v7 = 0;
    goto LABEL_13;
  }
  localizedNames = self->_localizedNames;
  if ((unint64_t)localizedNames | *((void *)v4 + 5)) {
    char v7 = -[NSMutableArray isEqual:](localizedNames, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  [(GEOCategory *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_alias hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_geoOntologyId;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 2654435761 * self->_level;
  return v5 ^ v3 ^ v4 ^ [(NSMutableArray *)self->_localizedNames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOCategory setAlias:](self, "setAlias:");
  }
  self->_level = *((_DWORD *)v4 + 15);
  if (*((unsigned char *)v4 + 64))
  {
    self->_geoOntologyId = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 5);
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
        -[GEOCategory addLocalizedNames:](self, "addLocalizedNames:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOCategoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_508);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCategory *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_localizedNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end