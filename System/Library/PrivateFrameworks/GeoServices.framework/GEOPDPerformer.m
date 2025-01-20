@interface GEOPDPerformer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPerformer)init;
- (GEOPDPerformer)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itunesId;
- (id)itunesUrl;
- (id)jsonRepresentation;
- (id)name;
- (unint64_t)hash;
- (void)_readItunesId;
- (void)_readItunesUrl;
- (void)_readName;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPerformer

- (GEOPDPerformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPerformer;
  v2 = [(GEOPDPerformer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPerformer)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPerformer;
  v3 = [(GEOPDPerformer *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPerformerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_6822);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPerformer _readName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readItunesId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPerformerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItunesId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itunesId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPerformer _readItunesId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readItunesUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPerformerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItunesUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itunesUrl
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPerformer _readItunesUrl]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPerformer;
  v4 = [(GEOPDPerformer *)&v8 description];
  v5 = [(GEOPDPerformer *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPerformer _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPerformer readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDPerformer name]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"name"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDPerformerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPerformerId_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v10 = *(id *)(a1 + 48);
    if (v10)
    {
      if (a2) {
        v11 = @"performerId";
      }
      else {
        v11 = @"performer_id";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = -[GEOPDPerformer itunesId]((id *)a1);
    if (v12)
    {
      if (a2) {
        v13 = @"itunesId";
      }
      else {
        v13 = @"itunes_id";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = -[GEOPDPerformer itunesUrl]((id *)a1);
    if (v14)
    {
      if (a2) {
        v15 = @"itunesUrl";
      }
      else {
        v15 = @"itunes_url";
      }
      [v4 setObject:v14 forKey:v15];
    }

    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __44__GEOPDPerformer__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPDPerformer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6841;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6842;
      }
      GEOPDPerformerReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDPerformer__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDPerformerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPerformerIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPerformer readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_performerId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_itunesId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_itunesUrl)
    {
      PBDataWriterWriteStringField();
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
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPerformer readAll:]((uint64_t)self, 0);
    id v8 = [(GEOLocalizedString *)self->_name copyWithZone:a3];
    id v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSString *)self->_performerId copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_itunesId copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    uint64_t v14 = [(NSString *)self->_itunesUrl copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDPerformerReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDPerformer readAll:]((uint64_t)self, 1),
         -[GEOPDPerformer readAll:]((uint64_t)v4, 1),
         name = self->_name,
         !((unint64_t)name | v4[5]))
     || -[GEOLocalizedString isEqual:](name, "isEqual:"))
    && ((performerId = self->_performerId, !((unint64_t)performerId | v4[6]))
     || -[NSString isEqual:](performerId, "isEqual:"))
    && ((itunesId = self->_itunesId, !((unint64_t)itunesId | v4[3]))
     || -[NSString isEqual:](itunesId, "isEqual:")))
  {
    itunesUrl = self->_itunesUrl;
    if ((unint64_t)itunesUrl | v4[4]) {
      char v9 = -[NSString isEqual:](itunesUrl, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDPerformer readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLocalizedString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_performerId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_itunesId hash];
  return v4 ^ v5 ^ [(NSString *)self->_itunesUrl hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itunesUrl, 0);
  objc_storeStrong((id *)&self->_itunesId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end