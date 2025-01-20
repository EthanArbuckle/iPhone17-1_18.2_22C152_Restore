@interface GEORPFeedbackULongListField
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackULongListField)init;
- (GEORPFeedbackULongListField)initWithData:(id)a3;
- (GEORPFeedbackULongListField)initWithDictionary:(id)a3;
- (GEORPFeedbackULongListField)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)addedAtIndex:(unint64_t)a3;
- (unint64_t)addeds;
- (unint64_t)addedsCount;
- (unint64_t)hash;
- (unint64_t)originalAtIndex:(unint64_t)a3;
- (unint64_t)originals;
- (unint64_t)originalsCount;
- (unint64_t)removedAtIndex:(unint64_t)a3;
- (unint64_t)removeds;
- (unint64_t)removedsCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAddeds;
- (void)_readOriginals;
- (void)_readRemoveds;
- (void)addAdded:(unint64_t)a3;
- (void)addOriginal:(unint64_t)a3;
- (void)addRemoved:(unint64_t)a3;
- (void)clearAddeds;
- (void)clearOriginals;
- (void)clearRemoveds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddeds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setOriginals:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRemoveds:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackULongListField

- (GEORPFeedbackULongListField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackULongListField;
  v2 = [(GEORPFeedbackULongListField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackULongListField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackULongListField;
  v3 = [(GEORPFeedbackULongListField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeedbackULongListField;
  [(GEORPFeedbackULongListField *)&v3 dealloc];
}

- (void)_readAddeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddeds_tags_1111);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)addedsCount
{
  return self->_addeds.count;
}

- (unint64_t)addeds
{
  return self->_addeds.list;
}

- (void)clearAddeds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt64Clear();
}

- (void)addAdded:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)addedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readAddeds]((uint64_t)self);
  p_addeds = &self->_addeds;
  unint64_t count = self->_addeds.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_addeds->list[a3];
}

- (void)setAddeds:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147438](&self->_addeds, a3, a4);
}

- (void)_readRemoveds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemoveds_tags_1115);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)removedsCount
{
  return self->_removeds.count;
}

- (unint64_t)removeds
{
  return self->_removeds.list;
}

- (void)clearRemoveds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt64Clear();
}

- (void)addRemoved:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)removedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readRemoveds]((uint64_t)self);
  p_removeds = &self->_removeds;
  unint64_t count = self->_removeds.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_removeds->list[a3];
}

- (void)setRemoveds:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147438](&self->_removeds, a3, a4);
}

- (void)_readOriginals
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackULongListFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginals_tags_1116);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)originalsCount
{
  return self->_originals.count;
}

- (unint64_t)originals
{
  return self->_originals.list;
}

- (void)clearOriginals
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt64Clear();
}

- (void)addOriginal:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)originalAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackULongListField _readOriginals]((uint64_t)self);
  p_originals = &self->_originals;
  unint64_t count = self->_originals.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_originals->list[a3];
}

- (void)setOriginals:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147438](&self->_originals, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackULongListField;
  v4 = [(GEORPFeedbackULongListField *)&v8 description];
  v5 = [(GEORPFeedbackULongListField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      id v3 = PBRepeatedUInt64NSArray();
      [v2 setObject:v3 forKey:@"added"];
    }
    if (a1[9])
    {
      v4 = PBRepeatedUInt64NSArray();
      [v2 setObject:v4 forKey:@"removed"];
    }
    if (a1[6])
    {
      v5 = PBRepeatedUInt64NSArray();
      [v2 setObject:v5 forKey:@"original"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackULongListField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackULongListField *)-[GEORPFeedbackULongListField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"added"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v35;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v35 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addAdded:", objc_msgSend(v10, "unsignedLongLongValue"));
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
          }
          while (v7);
        }
      }
      v11 = [v3 objectForKeyedSubscript:@"removed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRemoved:", objc_msgSend(v17, "unsignedLongLongValue"));
              }
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v14);
        }
      }
      v18 = [v3 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v27;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v27 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v26 + 1) + 8 * v23);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addOriginal:", objc_msgSend(v24, "unsignedLongLongValue", (void)v26));
              }
              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v21);
        }
      }
    }
  }

  return a1;
}

- (GEORPFeedbackULongListField)initWithJSON:(id)a3
{
  return (GEORPFeedbackULongListField *)-[GEORPFeedbackULongListField _initWithDictionary:isJSON:](self, a3);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_1117;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1118;
    }
    GEORPFeedbackULongListFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackULongListFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackULongListFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v12 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    id v5 = v12;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackULongListField *)self readAll:0];
    id v5 = v12;
    if (self->_addeds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v12;
        ++v6;
      }
      while (v6 < self->_addeds.count);
    }
    if (self->_removeds.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v12;
        ++v7;
      }
      while (v7 < self->_removeds.count);
    }
    p_originals = &self->_originals;
    if (p_originals->count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v12;
        ++v9;
      }
      while (v9 < p_originals->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEORPFeedbackULongListField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 22) = self->_readerMarkPos;
  *((_DWORD *)v13 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPFeedbackULongListField *)self addedsCount])
  {
    [v13 clearAddeds];
    unint64_t v4 = [(GEORPFeedbackULongListField *)self addedsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v13, "addAdded:", -[GEORPFeedbackULongListField addedAtIndex:](self, "addedAtIndex:", i));
    }
  }
  if ([(GEORPFeedbackULongListField *)self removedsCount])
  {
    [v13 clearRemoveds];
    unint64_t v7 = [(GEORPFeedbackULongListField *)self removedsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRemoved:", -[GEORPFeedbackULongListField removedAtIndex:](self, "removedAtIndex:", j));
    }
  }
  if ([(GEORPFeedbackULongListField *)self originalsCount])
  {
    [v13 clearOriginals];
    unint64_t v10 = [(GEORPFeedbackULongListField *)self originalsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v13, "addOriginal:", -[GEORPFeedbackULongListField originalAtIndex:](self, "originalAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackULongListField *)self readAll:0];
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackULongListFieldReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPFeedbackULongListField *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt64IsEqual())
    && PBRepeatedUInt64IsEqual())
  {
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEORPFeedbackULongListField *)self readAll:1];
  uint64_t v2 = PBRepeatedUInt64Hash();
  uint64_t v3 = PBRepeatedUInt64Hash() ^ v2;
  return v3 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v13 = a3;
  [v13 readAll:0];
  uint64_t v4 = [v13 addedsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPFeedbackULongListField addAdded:](self, "addAdded:", [v13 addedAtIndex:i]);
  }
  uint64_t v7 = [v13 removedsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEORPFeedbackULongListField addRemoved:](self, "addRemoved:", [v13 removedAtIndex:j]);
  }
  uint64_t v10 = [v13 originalsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[GEORPFeedbackULongListField addOriginal:](self, "addOriginal:", [v13 originalAtIndex:k]);
  }
}

- (void).cxx_destruct
{
}

@end