@interface GEORegionalResourceTileData
+ (BOOL)isValid:(id)a3;
+ (Class)attributionType;
+ (Class)filenameType;
+ (Class)iconType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResourceTileData)init;
- (GEORegionalResourceTileData)initWithData:(id)a3;
- (GEORegionalResourceTileData)initWithDictionary:(id)a3;
- (GEORegionalResourceTileData)initWithJSON:(id)a3;
- (NSMutableArray)attributions;
- (NSMutableArray)filenames;
- (NSMutableArray)icons;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filenameAtIndex:(unint64_t)a3;
- (id)iconAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)attributionsCount;
- (unint64_t)filenamesCount;
- (unint64_t)hash;
- (unint64_t)iconsCount;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsFilename:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributions;
- (void)_readFilenames;
- (void)_readIcons;
- (void)addAttribution:(id)a3;
- (void)addFilename:(id)a3;
- (void)addIcon:(id)a3;
- (void)clearAttributions;
- (void)clearFilenames;
- (void)clearIcons;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributions:(id)a3;
- (void)setFilenames:(id)a3;
- (void)setIcons:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORegionalResourceTileData

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceTileDataReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)iconsCount
{
  -[GEORegionalResourceTileData _readIcons]((uint64_t)self);
  icons = self->_icons;

  return [(NSMutableArray *)icons count];
}

- (NSMutableArray)icons
{
  -[GEORegionalResourceTileData _readIcons]((uint64_t)self);
  icons = self->_icons;

  return icons;
}

- (void)addIcon:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTileData _readIcons]((uint64_t)self);
  -[GEORegionalResourceTileData _addNoFlagsIcon:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsIcon:(uint64_t)a1
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

- (void)_readIcons
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
        GEORegionalResourceTileDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags_1341);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEORegionalResourceTileData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceTileData;
  v2 = [(GEORegionalResourceTileData *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_filenames, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORegionalResourceTileData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceTileData;
  id v3 = [(GEORegionalResourceTileData *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORegionalResourceTileData *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_icons;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = self->_attributions;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_filenames;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1346;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1347;
    }
    GEORegionalResourceTileDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORegionalResourceTileDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)setIcons:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  icons = self->_icons;
  self->_icons = v4;
}

- (void)clearIcons
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  icons = self->_icons;

  [(NSMutableArray *)icons removeAllObjects];
}

- (id)iconAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTileData _readIcons]((uint64_t)self);
  icons = self->_icons;

  return (id)[(NSMutableArray *)icons objectAtIndex:a3];
}

+ (Class)iconType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributions
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
        GEORegionalResourceTileDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags_1342);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)attributions
{
  -[GEORegionalResourceTileData _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return attributions;
}

- (void)setAttributions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  attributions = self->_attributions;
  self->_attributions = v4;
}

- (void)clearAttributions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  attributions = self->_attributions;

  [(NSMutableArray *)attributions removeAllObjects];
}

- (void)addAttribution:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTileData _readAttributions]((uint64_t)self);
  -[GEORegionalResourceTileData _addNoFlagsAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
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

- (unint64_t)attributionsCount
{
  -[GEORegionalResourceTileData _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return [(NSMutableArray *)attributions count];
}

- (id)attributionAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTileData _readAttributions]((uint64_t)self);
  attributions = self->_attributions;

  return (id)[(NSMutableArray *)attributions objectAtIndex:a3];
}

+ (Class)attributionType
{
  return (Class)objc_opt_class();
}

- (void)_readFilenames
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
        GEORegionalResourceTileDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilenames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)filenames
{
  -[GEORegionalResourceTileData _readFilenames]((uint64_t)self);
  filenames = self->_filenames;

  return filenames;
}

- (void)setFilenames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  filenames = self->_filenames;
  self->_filenames = v4;
}

- (void)clearFilenames
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  filenames = self->_filenames;

  [(NSMutableArray *)filenames removeAllObjects];
}

- (void)addFilename:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceTileData _readFilenames]((uint64_t)self);
  -[GEORegionalResourceTileData _addNoFlagsFilename:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsFilename:(uint64_t)a1
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

- (unint64_t)filenamesCount
{
  -[GEORegionalResourceTileData _readFilenames]((uint64_t)self);
  filenames = self->_filenames;

  return [(NSMutableArray *)filenames count];
}

- (id)filenameAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceTileData _readFilenames]((uint64_t)self);
  filenames = self->_filenames;

  return (id)[(NSMutableArray *)filenames objectAtIndex:a3];
}

+ (Class)filenameType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResourceTileData;
  id v4 = [(GEORegionalResourceTileData *)&v8 description];
  id v5 = [(GEORegionalResourceTileData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceTileData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 40))
    {
      id v5 = [(id)a1 icons];
      [v4 setObject:v5 forKey:@"icon"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = *(id *)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"attribution"];
    }
    if (*(void *)(a1 + 32))
    {
      v14 = [(id)a1 filenames];
      [v4 setObject:v14 forKey:@"filename"];
    }
    uint64_t v15 = *(void **)(a1 + 16);
    if (v15)
    {
      uint64_t v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __57__GEORegionalResourceTileData__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEORegionalResourceTileData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEORegionalResourceTileData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEORegionalResourceTileData)initWithDictionary:(id)a3
{
  return (GEORegionalResourceTileData *)-[GEORegionalResourceTileData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"icon"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v42 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = (void *)[v12 copy];
                [a1 addIcon:v13];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
          }
          while (v9);
        }
      }
      v14 = [v5 objectForKeyedSubscript:@"attribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v38 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v21 = [GEOAttribution alloc];
                if (a3) {
                  uint64_t v22 = [(GEOAttribution *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOAttribution *)v21 initWithDictionary:v20];
                }
                id v23 = (void *)v22;
                [a1 addAttribution:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v17);
        }
      }
      long long v24 = [v5 objectForKeyedSubscript:@"filename"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v34;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v34 != v28) {
                objc_enumerationMutation(v25);
              }
              long long v30 = *(void **)(*((void *)&v33 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v31 = (void *)[v30 copy];
                [a1 addFilename:v31];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
          }
          while (v27);
        }
      }
    }
  }

  return a1;
}

- (GEORegionalResourceTileData)initWithJSON:(id)a3
{
  return (GEORegionalResourceTileData *)-[GEORegionalResourceTileData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceTileDataIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEORegionalResourceTileData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORegionalResourceTileData *)self iconsCount])
  {
    [v16 clearIcons];
    unint64_t v4 = [(GEORegionalResourceTileData *)self iconsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(GEORegionalResourceTileData *)self iconAtIndex:i];
        [v16 addIcon:v7];
      }
    }
  }
  if ([(GEORegionalResourceTileData *)self attributionsCount])
  {
    [v16 clearAttributions];
    unint64_t v8 = [(GEORegionalResourceTileData *)self attributionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORegionalResourceTileData *)self attributionAtIndex:j];
        [v16 addAttribution:v11];
      }
    }
  }
  if ([(GEORegionalResourceTileData *)self filenamesCount])
  {
    [v16 clearFilenames];
    unint64_t v12 = [(GEORegionalResourceTileData *)self filenamesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        id v15 = [(GEORegionalResourceTileData *)self filenameAtIndex:k];
        [v16 addFilename:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORegionalResourceTileDataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORegionalResourceTileData *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_icons;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        [v5 addIcon:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_attributions;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * j) copyWithZone:a3];
        [v5 addAttribution:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_filenames;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addFilename:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORegionalResourceTileData *)self readAll:1],
         [v4 readAll:1],
         icons = self->_icons,
         !((unint64_t)icons | v4[5]))
     || -[NSMutableArray isEqual:](icons, "isEqual:"))
    && ((attributions = self->_attributions, !((unint64_t)attributions | v4[3]))
     || -[NSMutableArray isEqual:](attributions, "isEqual:")))
  {
    filenames = self->_filenames;
    if ((unint64_t)filenames | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](filenames, "isEqual:");
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
  [(GEORegionalResourceTileData *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_icons hash];
  uint64_t v4 = [(NSMutableArray *)self->_attributions hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_filenames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
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
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORegionalResourceTileData *)self addIcon:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
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
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEORegionalResourceTileData *)self addAttribution:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
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
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEORegionalResourceTileData addFilename:](self, "addFilename:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORegionalResourceTileDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1351);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORegionalResourceTileData *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_attributions;
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

@end