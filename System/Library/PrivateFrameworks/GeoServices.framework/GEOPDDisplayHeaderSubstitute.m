@interface GEOPDDisplayHeaderSubstitute
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDisplayHeaderSubstitute)init;
- (GEOPDDisplayHeaderSubstitute)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interpretedQuery;
- (id)jsonRepresentation;
- (id)relatedSearchSuggestion;
- (uint64_t)substituteType;
- (unint64_t)hash;
- (void)_readInterpretedQuery;
- (void)_readRelatedSearchSuggestion;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDisplayHeaderSubstitute

- (GEOPDDisplayHeaderSubstitute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  v2 = [(GEOPDDisplayHeaderSubstitute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDisplayHeaderSubstitute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  v3 = [(GEOPDDisplayHeaderSubstitute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)substituteType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readInterpretedQuery
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInterpretedQuery_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)interpretedQuery
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDisplayHeaderSubstitute _readInterpretedQuery]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readRelatedSearchSuggestion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedSearchSuggestion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)relatedSearchSuggestion
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDDisplayHeaderSubstitute _readRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDisplayHeaderSubstitute;
  v4 = [(GEOPDDisplayHeaderSubstitute *)&v8 description];
  v5 = [(GEOPDDisplayHeaderSubstitute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDisplayHeaderSubstitute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDDisplayHeaderSubstitute readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53DCA98[v5];
      }
      if (a2) {
        objc_super v7 = @"substituteType";
      }
      else {
        objc_super v7 = @"substitute_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDDisplayHeaderSubstitute interpretedQuery]((id *)a1);
    if (v8)
    {
      if (a2) {
        v9 = @"interpretedQuery";
      }
      else {
        v9 = @"interpreted_query";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = -[GEOPDDisplayHeaderSubstitute relatedSearchSuggestion]((id *)a1);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"relatedSearchSuggestion";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"related_search_suggestion";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __58__GEOPDDisplayHeaderSubstitute__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDDisplayHeaderSubstitute _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2821;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2822;
      }
      GEOPDDisplayHeaderSubstituteReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDRelatedSearchSuggestion readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __58__GEOPDDisplayHeaderSubstitute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDDisplayHeaderSubstituteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDDisplayHeaderSubstituteIsDirty((uint64_t)self))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_interpretedQuery)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_relatedSearchSuggestion)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDDisplayHeaderSubstituteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_substituteType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_interpretedQuery copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDRelatedSearchSuggestion *)self->_relatedSearchSuggestion copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 1);
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_substituteType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  interpretedQuery = self->_interpretedQuery;
  if ((unint64_t)interpretedQuery | *((void *)v4 + 3)
    && !-[NSString isEqual:](interpretedQuery, "isEqual:"))
  {
    goto LABEL_11;
  }
  relatedSearchSuggestion = self->_relatedSearchSuggestion;
  if ((unint64_t)relatedSearchSuggestion | *((void *)v4 + 4)) {
    char v7 = -[GEOPDRelatedSearchSuggestion isEqual:](relatedSearchSuggestion, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDDisplayHeaderSubstitute readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_substituteType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_interpretedQuery hash] ^ v3;
  return v4 ^ [(GEOPDRelatedSearchSuggestion *)self->_relatedSearchSuggestion hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_interpretedQuery, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end