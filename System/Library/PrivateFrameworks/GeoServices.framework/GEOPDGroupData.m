@interface GEOPDGroupData
+ (BOOL)isValid:(id)a3;
+ (Class)buttonItemType;
+ (Class)titleType;
- (BOOL)hasSymbolImageName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGroupData)init;
- (GEOPDGroupData)initWithData:(id)a3;
- (GEOPDGroupData)initWithDictionary:(id)a3;
- (GEOPDGroupData)initWithJSON:(id)a3;
- (NSMutableArray)buttonItems;
- (NSMutableArray)titles;
- (NSString)symbolImageName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)buttonItemAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)titleAtIndex:(unint64_t)a3;
- (unint64_t)buttonItemsCount;
- (unint64_t)hash;
- (unint64_t)titlesCount;
- (void)_addNoFlagsButtonItem:(uint64_t)a1;
- (void)_addNoFlagsTitle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readButtonItems;
- (void)_readSymbolImageName;
- (void)_readTitles;
- (void)addButtonItem:(id)a3;
- (void)addTitle:(id)a3;
- (void)clearButtonItems;
- (void)clearTitles;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButtonItems:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setTitles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGroupData

- (GEOPDGroupData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroupData;
  v2 = [(GEOPDGroupData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroupData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroupData;
  v3 = [(GEOPDGroupData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
        GEOPDGroupDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitles_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)titles
{
  -[GEOPDGroupData _readTitles]((uint64_t)self);
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
  -[GEOPDGroupData _readTitles]((uint64_t)self);
  -[GEOPDGroupData _addNoFlagsTitle:]((uint64_t)self, v4);

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
  -[GEOPDGroupData _readTitles]((uint64_t)self);
  titles = self->_titles;

  return [(NSMutableArray *)titles count];
}

- (id)titleAtIndex:(unint64_t)a3
{
  -[GEOPDGroupData _readTitles]((uint64_t)self);
  titles = self->_titles;

  return (id)[(NSMutableArray *)titles objectAtIndex:a3];
}

+ (Class)titleType
{
  return (Class)objc_opt_class();
}

- (void)_readSymbolImageName
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
        GEOPDGroupDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolImageName_tags_5381);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSymbolImageName
{
  return self->_symbolImageName != 0;
}

- (NSString)symbolImageName
{
  -[GEOPDGroupData _readSymbolImageName]((uint64_t)self);
  symbolImageName = self->_symbolImageName;

  return symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_symbolImageName, a3);
}

- (void)_readButtonItems
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
        GEOPDGroupDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonItems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)buttonItems
{
  -[GEOPDGroupData _readButtonItems]((uint64_t)self);
  buttonItems = self->_buttonItems;

  return buttonItems;
}

- (void)setButtonItems:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  buttonItems = self->_buttonItems;
  self->_buttonItems = v4;
}

- (void)clearButtonItems
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  buttonItems = self->_buttonItems;

  [(NSMutableArray *)buttonItems removeAllObjects];
}

- (void)addButtonItem:(id)a3
{
  id v4 = a3;
  -[GEOPDGroupData _readButtonItems]((uint64_t)self);
  -[GEOPDGroupData _addNoFlagsButtonItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsButtonItem:(uint64_t)a1
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

- (unint64_t)buttonItemsCount
{
  -[GEOPDGroupData _readButtonItems]((uint64_t)self);
  buttonItems = self->_buttonItems;

  return [(NSMutableArray *)buttonItems count];
}

- (id)buttonItemAtIndex:(unint64_t)a3
{
  -[GEOPDGroupData _readButtonItems]((uint64_t)self);
  buttonItems = self->_buttonItems;

  return (id)[(NSMutableArray *)buttonItems objectAtIndex:a3];
}

+ (Class)buttonItemType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroupData;
  id v4 = [(GEOPDGroupData *)&v8 description];
  id v5 = [(GEOPDGroupData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroupData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v38 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"title"];
    }
    v13 = [(id)a1 symbolImageName];
    if (v13)
    {
      if (a2) {
        v14 = @"symbolImageName";
      }
      else {
        v14 = @"symbol_image_name";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = *(id *)(a1 + 24);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"buttonItem";
      }
      else {
        v23 = @"button_item";
      }
      [v4 setObject:v15 forKey:v23];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __44__GEOPDGroupData__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEOPDGroupData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDGroupData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDGroupData)initWithDictionary:(id)a3
{
  return (GEOPDGroupData *)-[GEOPDGroupData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      id v31 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v37 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v14 = [(GEOLocalizedString *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOLocalizedString *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addTitle:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v9);
        }

        id v5 = v31;
      }

      if (a3) {
        id v16 = @"symbolImageName";
      }
      else {
        id v16 = @"symbol_image_name";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = (void *)[v17 copy];
        [a1 setSymbolImageName:v18];
      }
      if (a3) {
        uint64_t v19 = @"buttonItem";
      }
      else {
        uint64_t v19 = @"button_item";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v33 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = [GEOPDButtonItem alloc];
                if (a3) {
                  uint64_t v28 = [(GEOPDButtonItem *)v27 initWithJSON:v26];
                }
                else {
                  uint64_t v28 = [(GEOPDButtonItem *)v27 initWithDictionary:v26];
                }
                id v29 = (void *)v28;
                [a1 addButtonItem:v28];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v23);
        }

        id v5 = v31;
      }
    }
  }

  return a1;
}

- (GEOPDGroupData)initWithJSON:(id)a3
{
  return (GEOPDGroupData *)-[GEOPDGroupData _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_5382;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_5383;
    }
    GEOPDGroupDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDGroupDataCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDGroupDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroupDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGroupDataIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDGroupData *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_titles;
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

    if (self->_symbolImageName) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_buttonItems;
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
  [(GEOPDGroupData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDGroupData *)self titlesCount])
  {
    [v12 clearTitles];
    unint64_t v4 = [(GEOPDGroupData *)self titlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDGroupData *)self titleAtIndex:i];
        [v12 addTitle:v7];
      }
    }
  }
  if (self->_symbolImageName) {
    objc_msgSend(v12, "setSymbolImageName:");
  }
  if ([(GEOPDGroupData *)self buttonItemsCount])
  {
    [v12 clearButtonItems];
    unint64_t v8 = [(GEOPDGroupData *)self buttonItemsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDGroupData *)self buttonItemAtIndex:j];
        [v12 addButtonItem:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOPDGroupDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDGroupData *)self readAll:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_titles;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTitle:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_symbolImageName copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = self->_buttonItems;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addButtonItem:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDGroupData *)self readAll:1],
         [v4 readAll:1],
         titles = self->_titles,
         !((unint64_t)titles | v4[5]))
     || -[NSMutableArray isEqual:](titles, "isEqual:"))
    && ((symbolImageName = self->_symbolImageName, !((unint64_t)symbolImageName | v4[4]))
     || -[NSString isEqual:](symbolImageName, "isEqual:")))
  {
    buttonItems = self->_buttonItems;
    if ((unint64_t)buttonItems | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](buttonItems, "isEqual:");
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
  [(GEOPDGroupData *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_titles hash];
  NSUInteger v4 = [(NSString *)self->_symbolImageName hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_buttonItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[5];
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
        [(GEOPDGroupData *)self addTitle:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (v4[4]) {
    -[GEOPDGroupData setSymbolImageName:](self, "setSymbolImageName:");
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
        -[GEOPDGroupData addButtonItem:](self, "addButtonItem:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
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
      GEOPDGroupDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5387);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDGroupData *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_titles;
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
    uint64_t v12 = self->_buttonItems;
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
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end