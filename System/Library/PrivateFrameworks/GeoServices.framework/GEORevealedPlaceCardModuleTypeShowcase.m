@interface GEORevealedPlaceCardModuleTypeShowcase
+ (BOOL)isValid:(id)a3;
+ (Class)buttonsType;
- (BOOL)hasShowcaseId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORevealedPlaceCardModuleTypeShowcase)init;
- (GEORevealedPlaceCardModuleTypeShowcase)initWithData:(id)a3;
- (GEORevealedPlaceCardModuleTypeShowcase)initWithDictionary:(id)a3;
- (GEORevealedPlaceCardModuleTypeShowcase)initWithJSON:(id)a3;
- (NSMutableArray)buttons;
- (NSString)showcaseId;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)buttonsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)buttonsCount;
- (unint64_t)hash;
- (void)_addNoFlagsButtons:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readButtons;
- (void)_readShowcaseId;
- (void)addButtons:(id)a3;
- (void)clearButtons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButtons:(id)a3;
- (void)setShowcaseId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORevealedPlaceCardModuleTypeShowcase

- (void)_readButtons
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
        GEORevealedPlaceCardModuleTypeShowcaseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtons_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (GEORevealedPlaceCardModuleTypeShowcase)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORevealedPlaceCardModuleTypeShowcase;
  v2 = [(GEORevealedPlaceCardModuleTypeShowcase *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORevealedPlaceCardModuleTypeShowcase)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORevealedPlaceCardModuleTypeShowcase;
  id v3 = [(GEORevealedPlaceCardModuleTypeShowcase *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShowcaseId
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
        GEORevealedPlaceCardModuleTypeShowcaseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseId_tags_10916);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasShowcaseId
{
  return self->_showcaseId != 0;
}

- (NSString)showcaseId
{
  -[GEORevealedPlaceCardModuleTypeShowcase _readShowcaseId]((uint64_t)self);
  showcaseId = self->_showcaseId;

  return showcaseId;
}

- (void)setShowcaseId:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_showcaseId, a3);
}

- (NSMutableArray)buttons
{
  -[GEORevealedPlaceCardModuleTypeShowcase _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return buttons;
}

- (void)setButtons:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  buttons = self->_buttons;
  self->_buttons = v4;
}

- (void)clearButtons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  buttons = self->_buttons;

  [(NSMutableArray *)buttons removeAllObjects];
}

- (void)addButtons:(id)a3
{
  id v4 = a3;
  -[GEORevealedPlaceCardModuleTypeShowcase _readButtons]((uint64_t)self);
  -[GEORevealedPlaceCardModuleTypeShowcase _addNoFlagsButtons:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsButtons:(uint64_t)a1
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

- (unint64_t)buttonsCount
{
  -[GEORevealedPlaceCardModuleTypeShowcase _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return [(NSMutableArray *)buttons count];
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  -[GEORevealedPlaceCardModuleTypeShowcase _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return (id)[(NSMutableArray *)buttons objectAtIndex:a3];
}

+ (Class)buttonsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORevealedPlaceCardModuleTypeShowcase;
  id v4 = [(GEORevealedPlaceCardModuleTypeShowcase *)&v8 description];
  id v5 = [(GEORevealedPlaceCardModuleTypeShowcase *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModuleTypeShowcase _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 showcaseId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"showcaseId";
      }
      else {
        objc_super v6 = @"showcase_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([a1[2] count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = a1[2];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v16);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v16);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"buttons"];
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
  return -[GEORevealedPlaceCardModuleTypeShowcase _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORevealedPlaceCardModuleTypeShowcase)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeShowcase *)-[GEORevealedPlaceCardModuleTypeShowcase _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"showcaseId";
      }
      else {
        objc_super v6 = @"showcase_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setShowcaseId:v8];
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:@"buttons"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v20 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v16 = [GEORevealedPlaceCardModuleButton alloc];
                if (a3) {
                  uint64_t v17 = [(GEORevealedPlaceCardModuleButton *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEORevealedPlaceCardModuleButton *)v16 initWithDictionary:v15];
                }
                long long v18 = (void *)v17;
                [a1 addButtons:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v20;
      }
    }
  }

  return a1;
}

- (GEORevealedPlaceCardModuleTypeShowcase)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModuleTypeShowcase *)-[GEORevealedPlaceCardModuleTypeShowcase _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_10917;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_10918;
    }
    GEORevealedPlaceCardModuleTypeShowcaseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORevealedPlaceCardModuleTypeShowcaseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleTypeShowcaseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleTypeShowcaseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORevealedPlaceCardModuleTypeShowcaseIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
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
    [(GEORevealedPlaceCardModuleTypeShowcase *)self readAll:0];
    if (self->_showcaseId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_buttons;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORevealedPlaceCardModuleTypeShowcase *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_showcaseId) {
    objc_msgSend(v8, "setShowcaseId:");
  }
  if ([(GEORevealedPlaceCardModuleTypeShowcase *)self buttonsCount])
  {
    [v8 clearButtons];
    unint64_t v4 = [(GEORevealedPlaceCardModuleTypeShowcase *)self buttonsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORevealedPlaceCardModuleTypeShowcase *)self buttonsAtIndex:i];
        [v8 addButtons:v7];
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
      GEORevealedPlaceCardModuleTypeShowcaseReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORevealedPlaceCardModuleTypeShowcase *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_showcaseId copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_buttons;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [v5 addButtons:v14];

        ++v13;
      }
      while (v11 != v13);
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
    && (([(GEORevealedPlaceCardModuleTypeShowcase *)self readAll:1],
         [v4 readAll:1],
         showcaseId = self->_showcaseId,
         !((unint64_t)showcaseId | v4[3]))
     || -[NSString isEqual:](showcaseId, "isEqual:")))
  {
    buttons = self->_buttons;
    if ((unint64_t)buttons | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](buttons, "isEqual:");
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
  [(GEORevealedPlaceCardModuleTypeShowcase *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_showcaseId hash];
  return [(NSMutableArray *)self->_buttons hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORevealedPlaceCardModuleTypeShowcase setShowcaseId:](self, "setShowcaseId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
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
        -[GEORevealedPlaceCardModuleTypeShowcase addButtons:](self, "addButtons:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end