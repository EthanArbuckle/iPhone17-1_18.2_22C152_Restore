@interface GEOPDSearchBusinessIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchBusinessIntent)init;
- (GEOPDSearchBusinessIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsKeywordMapping:(uint64_t)a1;
- (void)_readCenter;
- (void)addKeywordMapping:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBusinessIntent

- (GEOPDSearchBusinessIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBusinessIntent;
  v2 = [(GEOPDSearchBusinessIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBusinessIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBusinessIntent;
  v3 = [(GEOPDSearchBusinessIntent *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchBusinessIntent;
  [(GEOPDSearchBusinessIntent *)&v3 dealloc];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addKeywordMapping:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeywordMappings_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchBusinessIntent _addNoFlagsKeywordMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 96) |= 0x80u;
  }
}

- (void)_addNoFlagsKeywordMapping:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBusinessIntent;
  v4 = [(GEOPDSearchBusinessIntent *)&v8 description];
  id v5 = [(GEOPDSearchBusinessIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBusinessIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchBusinessIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x20) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_284);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v7 = *(id *)(a1 + 64);
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x40) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_285);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v10 = *(id *)(a1 + 72);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"tokenSet";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"token_set";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 96))
    {
      v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v15 = @"businessId";
      }
      else {
        v15 = @"business_id";
      }
      [v4 setObject:v14 forKey:v15];
    }
    -[GEOPDSearchBusinessIntent _readCenter](a1);
    id v16 = *(id *)(a1 + 48);
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"center"];
    }
    if ((*(unsigned char *)(a1 + 96) & 2) != 0)
    {
      uint64_t v19 = *(int *)(a1 + 92);
      if (v19 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E53E2598[v19];
      }
      [v4 setObject:v20 forKey:@"businessType"];
    }
    if (*(void *)(a1 + 24))
    {
      v21 = PBRepeatedUInt64NSArray();
      if (a2) {
        v22 = @"keywordMuid";
      }
      else {
        v22 = @"keyword_muid";
      }
      [v4 setObject:v21 forKey:v22];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v24 = *(id *)(a1 + 56);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v33 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v23 addObject:v29];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"keywordMapping";
      }
      else {
        v30 = @"keyword_mapping";
      }
      [v4 setObject:v23 forKey:v30];
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
  return -[GEOPDSearchBusinessIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_309;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_310;
      }
      GEOPDSearchBusinessIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchBusinessIntentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBusinessIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchBusinessIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_keywordMuids.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_keywordMuids.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_keywordMappings;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchBusinessIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  id v11 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_businessId;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v13 = [(GEOLatLng *)self->_center copyWithZone:a3];
  long long v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_businessType;
    *(unsigned char *)(v5 + 96) |= 2u;
  }
  PBRepeatedUInt64Copy();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_keywordMappings;
  uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v8);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[GEOPDSearchBusinessIntent addKeywordMapping:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_22;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 9))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_22;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 96);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_businessId != *((void *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_22;
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v8 = *((unsigned char *)v4 + 96);
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_businessType != *((_DWORD *)v4 + 23)) {
      goto LABEL_22;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_22;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_22:
    char v11 = 0;
    goto LABEL_23;
  }
  keywordMappings = self->_keywordMappings;
  if ((unint64_t)keywordMappings | *((void *)v4 + 7)) {
    char v11 = -[NSMutableArray isEqual:](keywordMappings, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_businessId;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v6 = [(GEOLatLng *)self->_center hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_businessType;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  uint64_t v9 = PBRepeatedUInt64Hash();
  return v8 ^ v9 ^ [(NSMutableArray *)self->_keywordMappings hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_keywordMappings, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end