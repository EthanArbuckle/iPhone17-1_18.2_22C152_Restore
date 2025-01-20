@interface GEOPDExternalActionDetail
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDExternalActionDetail)init;
- (GEOPDExternalActionDetail)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExternalActionDetail

- (GEOPDExternalActionDetail)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDExternalActionDetail;
  v2 = [(GEOPDExternalActionDetail *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExternalActionDetail)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDExternalActionDetail;
  v3 = [(GEOPDExternalActionDetail *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDExternalActionDetail;
  v4 = [(GEOPDExternalActionDetail *)&v8 description];
  v5 = [(GEOPDExternalActionDetail *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalActionDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDExternalActionDetail readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDExternalActionDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionLabel_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"actionLabel";
      }
      else {
        objc_super v8 = @"action_label";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDExternalActionDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogoId_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v11 = *(id *)(a1 + 48);
    if (v11)
    {
      if (a2) {
        v12 = @"logoId";
      }
      else {
        v12 = @"logo_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDExternalActionDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionUrlComponent_tags_5086);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v15 = *(id *)(a1 + 32);
    if (v15)
    {
      if (a2) {
        v16 = @"actionUrlComponent";
      }
      else {
        v16 = @"action_url_component";
      }
      [v4 setObject:v15 forKey:v16];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDExternalActionDetailReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionUrlVerb_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v19 = *(id *)(a1 + 40);
    if (v19)
    {
      if (a2) {
        v20 = @"actionUrlVerb";
      }
      else {
        v20 = @"action_url_verb";
      }
      [v4 setObject:v19 forKey:v20];
    }

    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __55__GEOPDExternalActionDetail__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDExternalActionDetail _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_5105;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_5106;
      }
      GEOPDExternalActionDetailReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __55__GEOPDExternalActionDetail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDExternalActionDetailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 0);
    if (self->_actionLabel) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_logoId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_actionUrlComponent)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_actionUrlVerb)
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
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_actionLabel copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_logoId copyWithZone:a3];
    id v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_actionUrlComponent copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    uint64_t v14 = [(NSString *)self->_actionUrlVerb copyWithZone:a3];
    id v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDExternalActionDetailReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDExternalActionDetail readAll:]((uint64_t)self, 1),
         -[GEOPDExternalActionDetail readAll:]((uint64_t)v4, 1),
         actionLabel = self->_actionLabel,
         !((unint64_t)actionLabel | v4[3]))
     || -[NSString isEqual:](actionLabel, "isEqual:"))
    && ((logoId = self->_logoId, !((unint64_t)logoId | v4[6]))
     || -[NSString isEqual:](logoId, "isEqual:"))
    && ((actionUrlComponent = self->_actionUrlComponent, !((unint64_t)actionUrlComponent | v4[4]))
     || -[NSString isEqual:](actionUrlComponent, "isEqual:")))
  {
    actionUrlVerb = self->_actionUrlVerb;
    if ((unint64_t)actionUrlVerb | v4[5]) {
      char v9 = -[NSString isEqual:](actionUrlVerb, "isEqual:");
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
  -[GEOPDExternalActionDetail readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_actionLabel hash];
  NSUInteger v4 = [(NSString *)self->_logoId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_actionUrlComponent hash];
  return v4 ^ v5 ^ [(NSString *)self->_actionUrlVerb hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoId, 0);
  objc_storeStrong((id *)&self->_actionUrlVerb, 0);
  objc_storeStrong((id *)&self->_actionUrlComponent, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end