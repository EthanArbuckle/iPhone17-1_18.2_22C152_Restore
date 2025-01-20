@interface GEORPContainmentCorrection
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPContainmentCorrection)init;
- (GEORPContainmentCorrection)initWithData:(id)a3;
- (GEORPContainmentCorrection)initWithDictionary:(id)a3;
- (GEORPContainmentCorrection)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)addedMuidAtIndex:(unint64_t)a3;
- (unint64_t)addedMuids;
- (unint64_t)addedMuidsCount;
- (unint64_t)hash;
- (unint64_t)originalMuidAtIndex:(unint64_t)a3;
- (unint64_t)originalMuids;
- (unint64_t)originalMuidsCount;
- (unint64_t)removedMuidAtIndex:(unint64_t)a3;
- (unint64_t)removedMuids;
- (unint64_t)removedMuidsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddedMuids;
- (void)_readOriginalMuids;
- (void)_readRemovedMuids;
- (void)addAddedMuid:(unint64_t)a3;
- (void)addOriginalMuid:(unint64_t)a3;
- (void)addRemovedMuid:(unint64_t)a3;
- (void)clearAddedMuids;
- (void)clearOriginalMuids;
- (void)clearRemovedMuids;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddedMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setOriginalMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRemovedMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPContainmentCorrection

- (GEORPContainmentCorrection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPContainmentCorrection;
  v2 = [(GEORPContainmentCorrection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPContainmentCorrection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPContainmentCorrection;
  v3 = [(GEORPContainmentCorrection *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEORPContainmentCorrection;
  [(GEORPContainmentCorrection *)&v3 dealloc];
}

- (void)_readAddedMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddedMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)addedMuidsCount
{
  return self->_addedMuids.count;
}

- (unint64_t)addedMuids
{
  return self->_addedMuids.list;
}

- (void)clearAddedMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt64Clear();
}

- (void)addAddedMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)addedMuidAtIndex:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readAddedMuids]((uint64_t)self);
  p_addedMuids = &self->_addedMuids;
  unint64_t count = self->_addedMuids.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_addedMuids->list[a3];
}

- (void)setAddedMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147438](&self->_addedMuids, a3, a4);
}

- (void)_readRemovedMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRemovedMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)removedMuidsCount
{
  return self->_removedMuids.count;
}

- (unint64_t)removedMuids
{
  return self->_removedMuids.list;
}

- (void)clearRemovedMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt64Clear();
}

- (void)addRemovedMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)removedMuidAtIndex:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readRemovedMuids]((uint64_t)self);
  p_removedMuids = &self->_removedMuids;
  unint64_t count = self->_removedMuids.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_removedMuids->list[a3];
}

- (void)setRemovedMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147438](&self->_removedMuids, a3, a4);
}

- (void)_readOriginalMuids
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPContainmentCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalMuids_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)originalMuidsCount
{
  return self->_originalMuids.count;
}

- (unint64_t)originalMuids
{
  return self->_originalMuids.list;
}

- (void)clearOriginalMuids
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt64Clear();
}

- (void)addOriginalMuid:(unint64_t)a3
{
  if (self) {
    PBRepeatedUInt64Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)originalMuidAtIndex:(unint64_t)a3
{
  -[GEORPContainmentCorrection _readOriginalMuids]((uint64_t)self);
  p_originalMuids = &self->_originalMuids;
  unint64_t count = self->_originalMuids.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_originalMuids->list[a3];
}

- (void)setOriginalMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147438](&self->_originalMuids, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPContainmentCorrection;
  v4 = [(GEORPContainmentCorrection *)&v8 description];
  v5 = [(GEORPContainmentCorrection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPContainmentCorrection _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      v5 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v6 = @"addedMuid";
      }
      else {
        objc_super v6 = @"added_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[10])
    {
      objc_super v7 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v8 = @"removedMuid";
      }
      else {
        objc_super v8 = @"removed_muid";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (a1[7])
    {
      v9 = PBRepeatedUInt64NSArray();
      if (a2) {
        v10 = @"originalMuid";
      }
      else {
        v10 = @"original_muid";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__GEORPContainmentCorrection__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPContainmentCorrection _dictionaryRepresentation:](self, 1);
}

void __56__GEORPContainmentCorrection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPContainmentCorrection)initWithDictionary:(id)a3
{
  return (GEORPContainmentCorrection *)-[GEORPContainmentCorrection _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"addedMuid";
      }
      else {
        objc_super v6 = @"added_muid";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v40;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addAddedMuid:", objc_msgSend(v13, "unsignedLongLongValue"));
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"removedMuid";
      }
      else {
        v14 = @"removed_muid";
      }
      id v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v36;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRemovedMuid:", objc_msgSend(v21, "unsignedLongLongValue"));
              }
              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v18);
        }
      }
      if (a3) {
        v22 = @"originalMuid";
      }
      else {
        v22 = @"original_muid";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v32;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v31 + 1) + 8 * v28);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addOriginalMuid:", objc_msgSend(v29, "unsignedLongLongValue", (void)v31));
              }
              ++v28;
            }
            while (v26 != v28);
            uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
          }
          while (v26);
        }
      }
    }
  }

  return a1;
}

- (GEORPContainmentCorrection)initWithJSON:(id)a3
{
  return (GEORPContainmentCorrection *)-[GEORPContainmentCorrection _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_391;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_392;
    }
    GEORPContainmentCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPContainmentCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPContainmentCorrectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    uint64_t v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPContainmentCorrection *)self readAll:0];
    id v5 = v11;
    if (self->_addedMuids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v11;
        ++v6;
      }
      while (v6 < self->_addedMuids.count);
    }
    if (self->_removedMuids.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v11;
        ++v7;
      }
      while (v7 < self->_removedMuids.count);
    }
    if (self->_originalMuids.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v11;
        ++v8;
      }
      while (v8 < self->_originalMuids.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v13 = (id *)a3;
  [(GEORPContainmentCorrection *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORPContainmentCorrection *)self addedMuidsCount])
  {
    [v13 clearAddedMuids];
    unint64_t v4 = [(GEORPContainmentCorrection *)self addedMuidsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v13, "addAddedMuid:", -[GEORPContainmentCorrection addedMuidAtIndex:](self, "addedMuidAtIndex:", i));
    }
  }
  if ([(GEORPContainmentCorrection *)self removedMuidsCount])
  {
    [v13 clearRemovedMuids];
    unint64_t v7 = [(GEORPContainmentCorrection *)self removedMuidsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRemovedMuid:", -[GEORPContainmentCorrection removedMuidAtIndex:](self, "removedMuidAtIndex:", j));
    }
  }
  if ([(GEORPContainmentCorrection *)self originalMuidsCount])
  {
    [v13 clearOriginalMuids];
    unint64_t v10 = [(GEORPContainmentCorrection *)self originalMuidsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v13, "addOriginalMuid:", -[GEORPContainmentCorrection originalMuidAtIndex:](self, "originalMuidAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPContainmentCorrection *)self readAll:0];
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    PBRepeatedUInt64Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPContainmentCorrectionReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORPContainmentCorrection *)self readAll:1],
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
  [(GEORPContainmentCorrection *)self readAll:1];
  uint64_t v2 = PBRepeatedUInt64Hash();
  uint64_t v3 = PBRepeatedUInt64Hash() ^ v2;
  return v3 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v13 = a3;
  [v13 readAll:0];
  uint64_t v4 = [v13 addedMuidsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPContainmentCorrection addAddedMuid:](self, "addAddedMuid:", [v13 addedMuidAtIndex:i]);
  }
  uint64_t v7 = [v13 removedMuidsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEORPContainmentCorrection addRemovedMuid:](self, "addRemovedMuid:", [v13 removedMuidAtIndex:j]);
  }
  uint64_t v10 = [v13 originalMuidsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[GEORPContainmentCorrection addOriginalMuid:](self, "addOriginalMuid:", [v13 originalMuidAtIndex:k]);
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPContainmentCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_396);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPContainmentCorrection *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end