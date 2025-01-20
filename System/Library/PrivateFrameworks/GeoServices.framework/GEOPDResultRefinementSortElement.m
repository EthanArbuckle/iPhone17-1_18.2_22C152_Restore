@interface GEOPDResultRefinementSortElement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementSortElement)init;
- (GEOPDResultRefinementSortElement)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)metadata;
- (unint64_t)hash;
- (void)_readDisplayName;
- (void)_readMetadata;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementSortElement

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 1u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementSortElement readAll:](a1, 0);
      [*(id *)(a1 + 48) clearUnknownFields:1];
      v5 = *(void **)(a1 + 40);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDResultRefinementSortElement)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementSortElement;
  v2 = [(GEOPDResultRefinementSortElement *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementSortElement)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementSortElement;
  v3 = [(GEOPDResultRefinementSortElement *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
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
        GEOPDResultRefinementSortElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_1198);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementSortElement _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 4u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)_readMetadata
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
        GEOPDResultRefinementSortElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_1200);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)metadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementSortElement _readMetadata]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 8u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementSortElement;
  id v4 = [(GEOPDResultRefinementSortElement *)&v8 description];
  v5 = [(GEOPDResultRefinementSortElement *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementSortElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementSortElement readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDResultRefinementSortElement displayName]((id *)a1);
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

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      objc_super v7 = *(void **)(a1 + 8);
      if (v7)
      {
        id v8 = v7;
        objc_sync_enter(v8);
        GEOPDResultRefinementSortElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_1199);
        objc_sync_exit(v8);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v9 = *(id *)(a1 + 48);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"styleAttributes";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"style_attributes";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = -[GEOPDResultRefinementSortElement metadata]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"metadata"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDResultRefinementSortElementReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayNameInBar_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v18 = *(id *)(a1 + 24);
    if (v18)
    {
      if (a2) {
        v19 = @"displayNameInBar";
      }
      else {
        v19 = @"display_name_in_bar";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = *(void **)(a1 + 16);
    if (v20)
    {
      v21 = [v20 dictionaryRepresentation];
      v22 = v21;
      if (a2)
      {
        v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__GEOPDResultRefinementSortElement__dictionaryRepresentation___block_invoke;
        v27[3] = &unk_1E53D8860;
        id v24 = v23;
        id v28 = v24;
        [v22 enumerateKeysAndObjectsUsingBlock:v27];
        id v25 = v24;

        v22 = v25;
      }
      [v4 setObject:v22 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementSortElement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1207;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1208;
      }
      GEOPDResultRefinementSortElementReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 48) readAll:1];
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDResultRefinementSortElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementSortElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementSortElementIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_displayNameInBar)
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
    -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
    id v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    id v12 = [(GEOPDResultRefinementMetadata *)self->_metadata copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    uint64_t v14 = [(NSString *)self->_displayNameInBar copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDResultRefinementSortElementReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 1),
         -[GEOPDResultRefinementSortElement readAll:]((uint64_t)v4, 1),
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[4]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((styleAttributes = self->_styleAttributes, !((unint64_t)styleAttributes | v4[6]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[5]))
     || -[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:")))
  {
    displayNameInBar = self->_displayNameInBar;
    if ((unint64_t)displayNameInBar | v4[3]) {
      char v9 = -[NSString isEqual:](displayNameInBar, "isEqual:");
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
  -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  unint64_t v4 = [(GEOStyleAttributes *)self->_styleAttributes hash] ^ v3;
  unint64_t v5 = [(GEOPDResultRefinementMetadata *)self->_metadata hash];
  return v4 ^ v5 ^ [(NSString *)self->_displayNameInBar hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayNameInBar, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end