@interface GEOPDSearchQueryCompletionMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryCompletionMetadata)init;
- (GEOPDSearchQueryCompletionMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsTokens:(uint64_t)a1;
- (void)_readTokens;
- (void)addTokens:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryCompletionMetadata

- (GEOPDSearchQueryCompletionMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  v2 = [(GEOPDSearchQueryCompletionMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryCompletionMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  v3 = [(GEOPDSearchQueryCompletionMetadata *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  [(GEOPDSearchQueryCompletionMetadata *)&v3 dealloc];
}

- (void)_readTokens
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokens_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addTokens:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDSearchQueryCompletionMetadata _readTokens](a1);
    -[GEOPDSearchQueryCompletionMetadata _addNoFlagsTokens:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x100u;
  }
}

- (void)_addNoFlagsTokens:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  v4 = [(GEOPDSearchQueryCompletionMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryCompletionMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryCompletionMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryCompletionMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCompletion_tags_0);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v7 = *(id *)(a1 + 64);
    if (v7) {
      [v4 setObject:v7 forKey:@"completion"];
    }

    __int16 v9 = *(_WORD *)(a1 + 112);
    if ((v9 & 2) != 0)
    {
      LODWORD(v8) = *(_DWORD *)(a1 + 100);
      v10 = [NSNumber numberWithFloat:v8];
      [v4 setObject:v10 forKey:@"score"];

      __int16 v9 = *(_WORD *)(a1 + 112);
    }
    if (v9)
    {
      v11 = [NSNumber numberWithLongLong:*(void *)(a1 + 72)];
      [v4 setObject:v11 forKey:@"popularity"];
    }
    if (*(void *)(a1 + 48))
    {
      v12 = PBRepeatedInt32NSArray();
      [v4 setObject:v12 forKey:@"tags"];
    }
    __int16 v13 = *(_WORD *)(a1 + 112);
    if ((v13 & 4) != 0)
    {
      LODWORD(v8) = *(_DWORD *)(a1 + 104);
      v14 = [NSNumber numberWithFloat:v8];
      if (a2) {
        v15 = @"tagConfidence";
      }
      else {
        v15 = @"tag_confidence";
      }
      [v4 setObject:v14 forKey:v15];

      __int16 v13 = *(_WORD *)(a1 + 112);
    }
    if ((v13 & 8) != 0)
    {
      v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      if (a2) {
        v17 = @"isCompletematch";
      }
      else {
        v17 = @"is_completeMatch";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if (*(void *)(a1 + 80))
    {
      -[GEOPDSearchQueryCompletionMetadata _readTokens](a1);
      id v18 = *(id *)(a1 + 80);
      [v4 setObject:v18 forKey:@"tokens"];
    }
    if (*(void *)(a1 + 24))
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v20 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v21 = 0;
        do
        {
          uint64_t v22 = *(int *)(*v20 + 4 * v21);
          if (v22 >= 0xF)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = off_1E53E2AE8[v22];
          }
          [v19 addObject:v23];

          ++v21;
          v20 = (void *)(a1 + 16);
        }
        while (v21 < *(void *)(a1 + 24));
      }
      if (a2) {
        v24 = @"completionSourceTypes";
      }
      else {
        v24 = @"completion_source_types";
      }
      [v4 setObject:v19 forKey:v24];
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
  return -[GEOPDSearchQueryCompletionMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1241;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1242;
      }
      GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryCompletionMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 0);
    if (self->_completion) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt64Field();
    }
    if (self->_tags.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_tags.count);
    }
    __int16 v8 = (__int16)self->_flags;
    if ((v8 & 4) != 0)
    {
      PBDataWriterWriteFloatField();
      __int16 v8 = (__int16)self->_flags;
    }
    if ((v8 & 8) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v9 = self->_tokens;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    p_completionSourceTypes = &self->_completionSourceTypes;
    if (p_completionSourceTypes->count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v14 < p_completionSourceTypes->count);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryCompletionMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_completion copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 100) = self->_score;
    *(_WORD *)(v5 + 112) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 72) = self->_popularity;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  PBRepeatedInt32Copy();
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    *(float *)(v5 + 104) = self->_tagConfidence;
    *(_WORD *)(v5 + 112) |= 4u;
    __int16 v12 = (__int16)self->_flags;
  }
  if ((v12 & 8) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_isCompletematch;
    *(_WORD *)(v5 + 112) |= 8u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  __int16 v13 = self->_tokens;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        -[GEOPDSearchQueryCompletionMetadata addTokens:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)v4, 1);
  completion = self->_completion;
  if ((unint64_t)completion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](completion, "isEqual:")) {
      goto LABEL_31;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_score != *((float *)v4 + 25)) {
      goto LABEL_31;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_31;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_popularity != *((void *)v4 + 9)) {
      goto LABEL_31;
    }
  }
  else if (v7)
  {
    goto LABEL_31;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_31;
  }
  __int16 v8 = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((v8 & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_tagConfidence != *((float *)v4 + 26)) {
      goto LABEL_31;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((v8 & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_isCompletematch)
      {
        if (!*((unsigned char *)v4 + 108)) {
          goto LABEL_31;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_28;
      }
    }
LABEL_31:
    char IsEqual = 0;
    goto LABEL_32;
  }
  if ((v9 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_28:
  tokens = self->_tokens;
  if ((unint64_t)tokens | *((void *)v4 + 10) && !-[NSMutableArray isEqual:](tokens, "isEqual:")) {
    goto LABEL_31;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_32:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_completion hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    float score = self->_score;
    double v7 = score;
    if (score < 0.0) {
      double v7 = -score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (flags) {
    uint64_t v10 = 2654435761 * self->_popularity;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = PBRepeatedInt32Hash();
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    float tagConfidence = self->_tagConfidence;
    double v15 = tagConfidence;
    if (tagConfidence < 0.0) {
      double v15 = -tagConfidence;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((v12 & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_isCompletematch;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v5 ^ v3 ^ v10 ^ v11 ^ v13 ^ v18 ^ [(NSMutableArray *)self->_tokens hash];
  return v19 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_completion, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end