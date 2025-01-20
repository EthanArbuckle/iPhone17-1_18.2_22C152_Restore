@interface GEOPDResultRefinementOpenOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementOpenOptions)init;
- (GEOPDResultRefinementOpenOptions)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)openAt;
- (id)openNow;
- (unint64_t)hash;
- (void)_readDisplayName;
- (void)_readOpenAt;
- (void)_readOpenNow;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setOpenAt:(uint64_t)a1;
- (void)setOpenNow:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementOpenOptions

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 1u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementOpenOptions readAll:](a1, 0);
      -[GEOPDResultRefinementToggle clearUnknownFields:](*(void *)(a1 + 40), 1);
      uint64_t v5 = *(void *)(a1 + 32);
      -[GEOPDResultRefinementTime clearUnknownFields:](v5, 1);
    }
  }
}

- (GEOPDResultRefinementOpenOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementOpenOptions;
  v2 = [(GEOPDResultRefinementOpenOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementOpenOptions)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementOpenOptions;
  v3 = [(GEOPDResultRefinementOpenOptions *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementOpenOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_896);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementOpenOptions _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readOpenNow
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementOpenOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenNow_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)openNow
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementOpenOptions _readOpenNow]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOpenNow:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readOpenAt
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementOpenOptionsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenAt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)openAt
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementOpenOptions _readOpenAt]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOpenAt:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementOpenOptions;
  id v4 = [(GEOPDResultRefinementOpenOptions *)&v8 description];
  uint64_t v5 = [(GEOPDResultRefinementOpenOptions *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementOpenOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementOpenOptions readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDResultRefinementOpenOptions displayName]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"displayName";
      }
      else {
        objc_super v6 = @"display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = -[GEOPDResultRefinementOpenOptions openNow]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"openNow";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"open_now";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOPDResultRefinementOpenOptions openAt]((id *)a1);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"openAt";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"open_at";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __62__GEOPDResultRefinementOpenOptions__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementOpenOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_910;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_911;
      }
      GEOPDResultRefinementOpenOptionsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDResultRefinementToggle readAll:](*(void *)(a1 + 40), 1);
      -[GEOPDResultRefinementTime readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __62__GEOPDResultRefinementOpenOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementOpenOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementOpenOptionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDResultRefinementOpenOptions readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_openNow)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_openAt)
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
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementOpenOptions readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOPDResultRefinementToggle *)self->_openNow copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEOPDResultRefinementTime *)self->_openAt copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementOpenOptionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDResultRefinementOpenOptions readAll:]((uint64_t)self, 1),
         -[GEOPDResultRefinementOpenOptions readAll:]((uint64_t)v4, 1),
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[3]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((openNow = self->_openNow, !((unint64_t)openNow | v4[5]))
     || -[GEOPDResultRefinementToggle isEqual:](openNow, "isEqual:")))
  {
    openAt = self->_openAt;
    if ((unint64_t)openAt | v4[4]) {
      char v8 = -[GEOPDResultRefinementTime isEqual:](openAt, "isEqual:");
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
  -[GEOPDResultRefinementOpenOptions readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  unint64_t v4 = [(GEOPDResultRefinementToggle *)self->_openNow hash] ^ v3;
  return v4 ^ [(GEOPDResultRefinementTime *)self->_openAt hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openNow, 0);
  objc_storeStrong((id *)&self->_openAt, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end