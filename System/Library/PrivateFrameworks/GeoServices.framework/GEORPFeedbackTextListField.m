@interface GEORPFeedbackTextListField
+ (BOOL)isValid:(id)a3;
+ (Class)addedType;
+ (Class)originalType;
+ (Class)removedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackTextListField)init;
- (GEORPFeedbackTextListField)initWithData:(id)a3;
- (GEORPFeedbackTextListField)initWithDictionary:(id)a3;
- (GEORPFeedbackTextListField)initWithJSON:(id)a3;
- (NSMutableArray)addeds;
- (NSMutableArray)originals;
- (NSMutableArray)removeds;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)addedAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)originalAtIndex:(unint64_t)a3;
- (id)removedAtIndex:(unint64_t)a3;
- (unint64_t)addedsCount;
- (unint64_t)hash;
- (unint64_t)originalsCount;
- (unint64_t)removedsCount;
- (void)_addNoFlagsAdded:(uint64_t)a1;
- (void)_addNoFlagsOriginal:(uint64_t)a1;
- (void)_addNoFlagsRemoved:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAddeds;
- (void)_readOriginals;
- (void)_readRemoveds;
- (void)addAdded:(id)a3;
- (void)addOriginal:(id)a3;
- (void)addRemoved:(id)a3;
- (void)clearAddeds;
- (void)clearOriginals;
- (void)clearRemoveds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddeds:(id)a3;
- (void)setOriginals:(id)a3;
- (void)setRemoveds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackTextListField

- (GEORPFeedbackTextListField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTextListField;
  v2 = [(GEORPFeedbackTextListField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTextListField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTextListField;
  v3 = [(GEORPFeedbackTextListField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddeds
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
        GEORPFeedbackTextListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddeds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)addeds
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return addeds;
}

- (void)setAddeds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  addeds = self->_addeds;
  self->_addeds = v4;
}

- (void)clearAddeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  addeds = self->_addeds;

  [(NSMutableArray *)addeds removeAllObjects];
}

- (void)addAdded:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsAdded:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsAdded:(uint64_t)a1
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

- (unint64_t)addedsCount
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return [(NSMutableArray *)addeds count];
}

- (id)addedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  addeds = self->_addeds;

  return (id)[(NSMutableArray *)addeds objectAtIndex:a3];
}

+ (Class)addedType
{
  return (Class)objc_opt_class();
}

- (void)_readRemoveds
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
        GEORPFeedbackTextListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemoveds_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)removeds
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return removeds;
}

- (void)setRemoveds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  removeds = self->_removeds;
  self->_removeds = v4;
}

- (void)clearRemoveds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  removeds = self->_removeds;

  [(NSMutableArray *)removeds removeAllObjects];
}

- (void)addRemoved:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsRemoved:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsRemoved:(uint64_t)a1
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

- (unint64_t)removedsCount
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return [(NSMutableArray *)removeds count];
}

- (id)removedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  removeds = self->_removeds;

  return (id)[(NSMutableArray *)removeds objectAtIndex:a3];
}

+ (Class)removedType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginals
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
        GEORPFeedbackTextListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginals_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)originals
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  originals = self->_originals;

  return originals;
}

- (void)setOriginals:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  originals = self->_originals;
  self->_originals = v4;
}

- (void)clearOriginals
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  originals = self->_originals;

  [(NSMutableArray *)originals removeAllObjects];
}

- (void)addOriginal:(id)a3
{
  id v4 = a3;
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsOriginal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsOriginal:(uint64_t)a1
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

- (unint64_t)originalsCount
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  originals = self->_originals;

  return [(NSMutableArray *)originals count];
}

- (id)originalAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  originals = self->_originals;

  return (id)[(NSMutableArray *)originals objectAtIndex:a3];
}

+ (Class)originalType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackTextListField;
  id v4 = [(GEORPFeedbackTextListField *)&v8 description];
  id v5 = [(GEORPFeedbackTextListField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      id v3 = [a1 addeds];
      [v2 setObject:v3 forKey:@"added"];
    }
    if (a1[4])
    {
      id v4 = [a1 removeds];
      [v2 setObject:v4 forKey:@"removed"];
    }
    if (a1[3])
    {
      id v5 = [a1 originals];
      [v2 setObject:v5 forKey:@"original"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackTextListField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTextListField *)-[GEORPFeedbackTextListField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"added"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v38;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v38 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v11 = (void *)[v10 copy];
                [a1 addAdded:v11];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
          }
          while (v7);
        }
      }
      v12 = [v3 objectForKeyedSubscript:@"removed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v34;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v34 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = (void *)[v18 copy];
                [a1 addRemoved:v19];
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v15);
        }
      }
      v20 = [v3 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v30;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v30 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v29 + 1) + 8 * v25);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = objc_msgSend(v26, "copy", (void)v29);
                [a1 addOriginal:v27];
              }
              ++v25;
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v23);
        }
      }
    }
  }

  return a1;
}

- (GEORPFeedbackTextListField)initWithJSON:(id)a3
{
  return (GEORPFeedbackTextListField *)-[GEORPFeedbackTextListField _initWithDictionary:isJSON:](self, a3);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_953;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_954;
    }
    GEORPFeedbackTextListFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTextListFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTextListFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
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
    [(GEORPFeedbackTextListField *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = self->_addeds;
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
    v10 = self->_removeds;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_originals;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v16 = (id *)a3;
  [(GEORPFeedbackTextListField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackTextListField *)self addedsCount])
  {
    [v16 clearAddeds];
    unint64_t v4 = [(GEORPFeedbackTextListField *)self addedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackTextListField *)self addedAtIndex:i];
        [v16 addAdded:v7];
      }
    }
  }
  if ([(GEORPFeedbackTextListField *)self removedsCount])
  {
    [v16 clearRemoveds];
    unint64_t v8 = [(GEORPFeedbackTextListField *)self removedsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORPFeedbackTextListField *)self removedAtIndex:j];
        [v16 addRemoved:v11];
      }
    }
  }
  if ([(GEORPFeedbackTextListField *)self originalsCount])
  {
    [v16 clearOriginals];
    unint64_t v12 = [(GEORPFeedbackTextListField *)self originalsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEORPFeedbackTextListField *)self originalAtIndex:k];
        [v16 addOriginal:v15];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
      GEORPFeedbackTextListFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackTextListField *)self readAll:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v8 = self->_addeds;
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
        [v5 addAdded:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v13 = self->_removeds;
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
        [v5 addRemoved:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v18 = self->_originals;
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
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (void)v24);
        [v5 addOriginal:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackTextListField *)self readAll:1],
         [v4 readAll:1],
         addeds = self->_addeds,
         !((unint64_t)addeds | v4[2]))
     || -[NSMutableArray isEqual:](addeds, "isEqual:"))
    && ((removeds = self->_removeds, !((unint64_t)removeds | v4[4]))
     || -[NSMutableArray isEqual:](removeds, "isEqual:")))
  {
    originals = self->_originals;
    if ((unint64_t)originals | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](originals, "isEqual:");
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
  [(GEORPFeedbackTextListField *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_addeds hash];
  uint64_t v4 = [(NSMutableArray *)self->_removeds hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_originals hash];
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
  id v5 = v4[2];
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
        [(GEORPFeedbackTextListField *)self addAdded:*(void *)(*((void *)&v28 + 1) + 8 * v9++)];
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
  id v10 = v4[4];
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
        [(GEORPFeedbackTextListField *)self addRemoved:*(void *)(*((void *)&v24 + 1) + 8 * v14++)];
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
  id v15 = v4[3];
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
        -[GEORPFeedbackTextListField addOriginal:](self, "addOriginal:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeds, 0);
  objc_storeStrong((id *)&self->_originals, 0);
  objc_storeStrong((id *)&self->_addeds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end