@interface GEOPDSearchKeywordIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchKeywordIntent)init;
- (GEOPDSearchKeywordIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchKeywordIntent

- (GEOPDSearchKeywordIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchKeywordIntent;
  v2 = [(GEOPDSearchKeywordIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchKeywordIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchKeywordIntent;
  v3 = [(GEOPDSearchKeywordIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchKeywordIntent;
  v4 = [(GEOPDSearchKeywordIntent *)&v8 description];
  v5 = [(GEOPDSearchKeywordIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchKeywordIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchKeywordIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchKeywordIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKeyword_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 16);
    if (v7) {
      [v4 setObject:v7 forKey:@"keyword"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchKeywordIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_1033);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v10 = *(id *)(a1 + 24);
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
    if (*(unsigned char *)(a1 + 48))
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      if (a2) {
        v15 = @"isOptionalKeyword";
      }
      else {
        v15 = @"is_optional_keyword";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEOPDSearchKeywordIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1037;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1038;
      }
      GEOPDSearchKeywordIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSearchTokenSet readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKeywordIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSearchKeywordIntentIsDirty((uint64_t)self))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchKeywordIntent readAll:]((uint64_t)self, 0);
    if (self->_keyword) {
      PBDataWriterWriteStringField();
    }
    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchKeywordIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchKeywordIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_keyword copyWithZone:a3];
  id v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 44) = self->_isOptionalKeyword;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  -[GEOPDSearchKeywordIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchKeywordIntent readAll:]((uint64_t)v4, 1);
  keyword = self->_keyword;
  if ((unint64_t)keyword | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](keyword, "isEqual:")) {
      goto LABEL_8;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 3))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_isOptionalKeyword)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchKeywordIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_keyword hash];
  unint64_t v4 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_isOptionalKeyword;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_keyword, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end