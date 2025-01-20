@interface GEORPFeedbackMultiSelectField
+ (BOOL)isValid:(id)a3;
+ (Class)optionsType;
+ (Class)selectedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackMultiSelectField)init;
- (GEORPFeedbackMultiSelectField)initWithData:(id)a3;
- (GEORPFeedbackMultiSelectField)initWithDictionary:(id)a3;
- (GEORPFeedbackMultiSelectField)initWithJSON:(id)a3;
- (NSMutableArray)options;
- (NSMutableArray)selecteds;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)optionsAtIndex:(unint64_t)a3;
- (id)selectedAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)optionsCount;
- (unint64_t)selectedsCount;
- (void)_addNoFlagsOptions:(uint64_t)a1;
- (void)_addNoFlagsSelected:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readOptions;
- (void)_readSelecteds;
- (void)addOptions:(id)a3;
- (void)addSelected:(id)a3;
- (void)clearOptions;
- (void)clearSelecteds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setSelecteds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackMultiSelectField

- (GEORPFeedbackMultiSelectField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackMultiSelectField;
  v2 = [(GEORPFeedbackMultiSelectField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackMultiSelectField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackMultiSelectField;
  v3 = [(GEORPFeedbackMultiSelectField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOptions
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
        GEORPFeedbackMultiSelectFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOptions_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)options
{
  -[GEORPFeedbackMultiSelectField _readOptions]((uint64_t)self);
  options = self->_options;

  return options;
}

- (void)setOptions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  options = self->_options;
  self->_options = v4;
}

- (void)clearOptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  options = self->_options;

  [(NSMutableArray *)options removeAllObjects];
}

- (void)addOptions:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackMultiSelectField _readOptions]((uint64_t)self);
  -[GEORPFeedbackMultiSelectField _addNoFlagsOptions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsOptions:(uint64_t)a1
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

- (unint64_t)optionsCount
{
  -[GEORPFeedbackMultiSelectField _readOptions]((uint64_t)self);
  options = self->_options;

  return [(NSMutableArray *)options count];
}

- (id)optionsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackMultiSelectField _readOptions]((uint64_t)self);
  options = self->_options;

  return (id)[(NSMutableArray *)options objectAtIndex:a3];
}

+ (Class)optionsType
{
  return (Class)objc_opt_class();
}

- (void)_readSelecteds
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
        GEORPFeedbackMultiSelectFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSelecteds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)selecteds
{
  -[GEORPFeedbackMultiSelectField _readSelecteds]((uint64_t)self);
  selecteds = self->_selecteds;

  return selecteds;
}

- (void)setSelecteds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  selecteds = self->_selecteds;
  self->_selecteds = v4;
}

- (void)clearSelecteds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  selecteds = self->_selecteds;

  [(NSMutableArray *)selecteds removeAllObjects];
}

- (void)addSelected:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackMultiSelectField _readSelecteds]((uint64_t)self);
  -[GEORPFeedbackMultiSelectField _addNoFlagsSelected:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsSelected:(uint64_t)a1
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

- (unint64_t)selectedsCount
{
  -[GEORPFeedbackMultiSelectField _readSelecteds]((uint64_t)self);
  selecteds = self->_selecteds;

  return [(NSMutableArray *)selecteds count];
}

- (id)selectedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackMultiSelectField _readSelecteds]((uint64_t)self);
  selecteds = self->_selecteds;

  return (id)[(NSMutableArray *)selecteds objectAtIndex:a3];
}

+ (Class)selectedType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackMultiSelectField;
  id v4 = [(GEORPFeedbackMultiSelectField *)&v8 description];
  id v5 = [(GEORPFeedbackMultiSelectField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackMultiSelectField _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"options"];
    }
    if ([a1[3] count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = a1[3];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = objc_msgSend(v19, "dictionaryRepresentation", (void)v22);
            }
            objc_msgSend(v13, "addObject:", v20, (void)v22);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"selected"];
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
  return -[GEORPFeedbackMultiSelectField _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPFeedbackMultiSelectField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackMultiSelectField *)-[GEORPFeedbackMultiSelectField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"options"];
      objc_opt_class();
      id v27 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v33 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEORPFeedbackFieldOption alloc];
                if (a3) {
                  uint64_t v14 = [(GEORPFeedbackFieldOption *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEORPFeedbackFieldOption *)v13 initWithDictionary:v12];
                }
                uint64_t v15 = (void *)v14;
                [a1 addOptions:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v9);
        }

        id v5 = v27;
      }

      uint64_t v16 = [v5 objectForKeyedSubscript:@"selected"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v23 = [GEORPFeedbackFieldOption alloc];
                if (a3) {
                  uint64_t v24 = [(GEORPFeedbackFieldOption *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEORPFeedbackFieldOption *)v23 initWithDictionary:v22];
                }
                long long v25 = (void *)v24;
                [a1 addSelected:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v19);
        }

        id v5 = v27;
      }
    }
  }

  return a1;
}

- (GEORPFeedbackMultiSelectField)initWithJSON:(id)a3
{
  return (GEORPFeedbackMultiSelectField *)-[GEORPFeedbackMultiSelectField _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_774;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_775;
    }
    GEORPFeedbackMultiSelectFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackMultiSelectFieldCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackMultiSelectFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackMultiSelectFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackMultiSelectFieldIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v14 = self->_reader;
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
    [(GEORPFeedbackMultiSelectField *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_options;
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
    uint64_t v10 = self->_selecteds;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEORPFeedbackMultiSelectField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackMultiSelectField *)self optionsCount])
  {
    [v12 clearOptions];
    unint64_t v4 = [(GEORPFeedbackMultiSelectField *)self optionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackMultiSelectField *)self optionsAtIndex:i];
        [v12 addOptions:v7];
      }
    }
  }
  if ([(GEORPFeedbackMultiSelectField *)self selectedsCount])
  {
    [v12 clearSelecteds];
    unint64_t v8 = [(GEORPFeedbackMultiSelectField *)self selectedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPFeedbackMultiSelectField *)self selectedAtIndex:j];
        [v12 addSelected:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
      GEORPFeedbackMultiSelectFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackMultiSelectField *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_options;
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
        [v5 addOptions:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = self->_selecteds;
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
        [v5 addSelected:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackMultiSelectField *)self readAll:1],
         [v4 readAll:1],
         options = self->_options,
         !((unint64_t)options | v4[2]))
     || -[NSMutableArray isEqual:](options, "isEqual:")))
  {
    selecteds = self->_selecteds;
    if ((unint64_t)selecteds | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](selecteds, "isEqual:");
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
  [(GEORPFeedbackMultiSelectField *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_options hash];
  return [(NSMutableArray *)self->_selecteds hash] ^ v3;
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
  id v5 = v4[2];
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
        [(GEORPFeedbackMultiSelectField *)self addOptions:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
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
  id v10 = v4[3];
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
        -[GEORPFeedbackMultiSelectField addSelected:](self, "addSelected:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selecteds, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end