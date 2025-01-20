@interface GEORPSearchCommonContext
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLastSearchString;
- (BOOL)hasLastUserTypedSearchString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPSearchCommonContext)init;
- (GEORPSearchCommonContext)initWithData:(id)a3;
- (GEORPSearchCommonContext)initWithDictionary:(id)a3;
- (GEORPSearchCommonContext)initWithJSON:(id)a3;
- (NSString)lastSearchString;
- (NSString)lastUserTypedSearchString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLastSearchString;
- (void)_readLastUserTypedSearchString;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLastSearchString:(id)a3;
- (void)setLastUserTypedSearchString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSearchCommonContext

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORPSearchCommonContext setLastSearchString:](self, "setLastSearchString:");
  }
  if (v4[4]) {
    -[GEORPSearchCommonContext setLastUserTypedSearchString:](self, "setLastUserTypedSearchString:");
  }
}

- (void)_readLastSearchString
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
        GEORPSearchCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastSearchString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEORPSearchCommonContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPSearchCommonContext;
  id v3 = [(GEORPSearchCommonContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 lastSearchString];
    if (v5)
    {
      if (a2) {
        v6 = @"lastSearchString";
      }
      else {
        v6 = @"last_search_string";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 lastUserTypedSearchString];
    if (v7)
    {
      if (a2) {
        v8 = @"lastUserTypedSearchString";
      }
      else {
        v8 = @"last_user_typed_search_string";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = (void *)a1[2];
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__GEORPSearchCommonContext__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, 0);
  objc_storeStrong((id *)&self->_lastSearchString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORPSearchCommonContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPSearchCommonContext;
  v2 = [(GEORPSearchCommonContext *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)hasLastSearchString
{
  return self->_lastSearchString != 0;
}

- (NSString)lastSearchString
{
  -[GEORPSearchCommonContext _readLastSearchString]((uint64_t)self);
  lastSearchString = self->_lastSearchString;

  return lastSearchString;
}

- (void)setLastSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_lastSearchString, a3);
}

- (void)_readLastUserTypedSearchString
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
        GEORPSearchCommonContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLastUserTypedSearchString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLastUserTypedSearchString
{
  return self->_lastUserTypedSearchString != 0;
}

- (NSString)lastUserTypedSearchString
{
  -[GEORPSearchCommonContext _readLastUserTypedSearchString]((uint64_t)self);
  lastUserTypedSearchString = self->_lastUserTypedSearchString;

  return lastUserTypedSearchString;
}

- (void)setLastUserTypedSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_lastUserTypedSearchString, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPSearchCommonContext;
  v4 = [(GEORPSearchCommonContext *)&v8 description];
  v5 = [(GEORPSearchCommonContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSearchCommonContext _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPSearchCommonContext _dictionaryRepresentation:](self, 1);
}

void __54__GEORPSearchCommonContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPSearchCommonContext)initWithDictionary:(id)a3
{
  return (GEORPSearchCommonContext *)-[GEORPSearchCommonContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"lastSearchString";
      }
      else {
        objc_super v6 = @"last_search_string";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setLastSearchString:v8];
      }
      if (a3) {
        v9 = @"lastUserTypedSearchString";
      }
      else {
        v9 = @"last_user_typed_search_string";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setLastUserTypedSearchString:v11];
      }
    }
  }

  return a1;
}

- (GEORPSearchCommonContext)initWithJSON:(id)a3
{
  return (GEORPSearchCommonContext *)-[GEORPSearchCommonContext _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3405;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3406;
    }
    GEORPSearchCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSearchCommonContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSearchCommonContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEORPSearchCommonContext *)self readAll:0];
    if (self->_lastSearchString) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_lastUserTypedSearchString)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPSearchCommonContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_lastSearchString) {
    objc_msgSend(v4, "setLastSearchString:");
  }
  if (self->_lastUserTypedSearchString) {
    objc_msgSend(v4, "setLastUserTypedSearchString:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPSearchCommonContext *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_lastSearchString copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_lastUserTypedSearchString copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPSearchCommonContextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPSearchCommonContext *)self readAll:1],
         [v4 readAll:1],
         lastSearchString = self->_lastSearchString,
         !((unint64_t)lastSearchString | v4[3]))
     || -[NSString isEqual:](lastSearchString, "isEqual:")))
  {
    lastUserTypedSearchString = self->_lastUserTypedSearchString;
    if ((unint64_t)lastUserTypedSearchString | v4[4]) {
      char v7 = -[NSString isEqual:](lastUserTypedSearchString, "isEqual:");
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
  [(GEORPSearchCommonContext *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_lastSearchString hash];
  return [(NSString *)self->_lastUserTypedSearchString hash] ^ v3;
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPSearchCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3410);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPSearchCommonContext *)self readAll:0];
  }
}

@end