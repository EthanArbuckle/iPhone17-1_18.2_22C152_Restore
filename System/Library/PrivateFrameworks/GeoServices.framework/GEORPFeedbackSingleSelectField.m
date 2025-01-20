@interface GEORPFeedbackSingleSelectField
+ (BOOL)isValid:(id)a3;
+ (Class)optionsType;
- (BOOL)hasSelected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackFieldOption)selected;
- (GEORPFeedbackSingleSelectField)init;
- (GEORPFeedbackSingleSelectField)initWithData:(id)a3;
- (GEORPFeedbackSingleSelectField)initWithDictionary:(id)a3;
- (GEORPFeedbackSingleSelectField)initWithJSON:(id)a3;
- (NSMutableArray)options;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)optionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)optionsCount;
- (void)_addNoFlagsOptions:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readOptions;
- (void)_readSelected;
- (void)addOptions:(id)a3;
- (void)clearOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setSelected:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackSingleSelectField

- (GEORPFeedbackSingleSelectField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackSingleSelectField;
  v2 = [(GEORPFeedbackSingleSelectField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackSingleSelectField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackSingleSelectField;
  v3 = [(GEORPFeedbackSingleSelectField *)&v7 initWithData:a3];
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
        GEORPFeedbackSingleSelectFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOptions_tags_912);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)options
{
  -[GEORPFeedbackSingleSelectField _readOptions]((uint64_t)self);
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
  -[GEORPFeedbackSingleSelectField _readOptions]((uint64_t)self);
  -[GEORPFeedbackSingleSelectField _addNoFlagsOptions:]((uint64_t)self, v4);

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
  -[GEORPFeedbackSingleSelectField _readOptions]((uint64_t)self);
  options = self->_options;

  return [(NSMutableArray *)options count];
}

- (id)optionsAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackSingleSelectField _readOptions]((uint64_t)self);
  options = self->_options;

  return (id)[(NSMutableArray *)options objectAtIndex:a3];
}

+ (Class)optionsType
{
  return (Class)objc_opt_class();
}

- (void)_readSelected
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
        GEORPFeedbackSingleSelectFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSelected_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSelected
{
  return self->_selected != 0;
}

- (GEORPFeedbackFieldOption)selected
{
  -[GEORPFeedbackSingleSelectField _readSelected]((uint64_t)self);
  selected = self->_selected;

  return selected;
}

- (void)setSelected:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_selected, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackSingleSelectField;
  id v4 = [(GEORPFeedbackSingleSelectField *)&v8 description];
  id v5 = [(GEORPFeedbackSingleSelectField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackSingleSelectField _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
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

      [v4 setObject:v5 forKey:@"options"];
    }
    v13 = objc_msgSend(a1, "selected", (void)v17);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"selected"];
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
  return -[GEORPFeedbackSingleSelectField _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPFeedbackSingleSelectField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackSingleSelectField *)-[GEORPFeedbackSingleSelectField _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"options"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v5;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
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
                v15 = (void *)v14;
                [a1 addOptions:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v9);
        }

        id v5 = v21;
      }

      v16 = [v5 objectForKeyedSubscript:@"selected"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = [GEORPFeedbackFieldOption alloc];
        if (a3) {
          uint64_t v18 = [(GEORPFeedbackFieldOption *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEORPFeedbackFieldOption *)v17 initWithDictionary:v16];
        }
        long long v19 = (void *)v18;
        [a1 setSelected:v18];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackSingleSelectField)initWithJSON:(id)a3
{
  return (GEORPFeedbackSingleSelectField *)-[GEORPFeedbackSingleSelectField _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_913;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_914;
    }
    GEORPFeedbackSingleSelectFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackSingleSelectFieldCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackSingleSelectFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackSingleSelectFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackSingleSelectFieldIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackSingleSelectField *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_options;
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

    if (self->_selected) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPFeedbackSingleSelectField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackSingleSelectField *)self optionsCount])
  {
    [v8 clearOptions];
    unint64_t v4 = [(GEORPFeedbackSingleSelectField *)self optionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackSingleSelectField *)self optionsAtIndex:i];
        [v8 addOptions:v7];
      }
    }
  }
  if (self->_selected) {
    objc_msgSend(v8, "setSelected:");
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
      GEORPFeedbackSingleSelectFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackSingleSelectField *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_options;
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
        [v5 addOptions:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEORPFeedbackFieldOption *)self->_selected copyWithZone:a3];
  long long v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackSingleSelectField *)self readAll:1],
         [v4 readAll:1],
         options = self->_options,
         !((unint64_t)options | v4[2]))
     || -[NSMutableArray isEqual:](options, "isEqual:")))
  {
    selected = self->_selected;
    if ((unint64_t)selected | v4[3]) {
      char v7 = -[GEORPFeedbackFieldOption isEqual:](selected, "isEqual:");
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
  [(GEORPFeedbackSingleSelectField *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_options hash];
  return [(GEORPFeedbackFieldOption *)self->_selected hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackSingleSelectField addOptions:](self, "addOptions:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  selected = self->_selected;
  id v11 = v4[3];
  if (selected)
  {
    if (v11) {
      -[GEORPFeedbackFieldOption mergeFrom:](selected, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackSingleSelectField setSelected:](self, "setSelected:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end