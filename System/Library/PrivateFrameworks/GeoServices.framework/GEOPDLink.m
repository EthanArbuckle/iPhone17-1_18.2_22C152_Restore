@interface GEOPDLink
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLink)init;
- (GEOPDLink)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appClipParams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extensionParams;
- (id)jsonRepresentation;
- (id)quickLinkParams;
- (id)webLinkParams;
- (uint64_t)linkType;
- (unint64_t)hash;
- (void)_readAppClipParams;
- (void)_readExtensionParams;
- (void)_readQuickLinkParams;
- (void)_readWebLinkParams;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLink

- (GEOPDLink)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLink;
  v2 = [(GEOPDLink *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLink)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLink;
  v3 = [(GEOPDLink *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)linkType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readQuickLinkParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuickLinkParams_tags_6048);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)quickLinkParams
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDLink _readQuickLinkParams]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAppClipParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppClipParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)appClipParams
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDLink _readAppClipParams]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readExtensionParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExtensionParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)extensionParams
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDLink _readExtensionParams]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readWebLinkParams
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebLinkParams_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)webLinkParams
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDLink _readWebLinkParams]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLink;
  v4 = [(GEOPDLink *)&v8 description];
  v5 = [(GEOPDLink *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDLink readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v5 = *(int *)(a1 + 68);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E3B00[v5];
      }
      if (a2) {
        objc_super v7 = @"linkType";
      }
      else {
        objc_super v7 = @"link_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDLink quickLinkParams]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"quickLinkParams";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"quick_link_params";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = -[GEOPDLink appClipParams]((id *)a1);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"appClipParams";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"app_clip_params";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = -[GEOPDLink extensionParams]((id *)a1);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"extensionParams";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"extension_params";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = -[GEOPDLink webLinkParams]((id *)a1);
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"webLinkParams";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"web_link_params";
      }
      [v4 setObject:v22 forKey:v23];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v25 = @"ownerProvidedRank";
      }
      else {
        v25 = @"owner_provided_rank";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = *(void **)(a1 + 16);
    if (v26)
    {
      v27 = [v26 dictionaryRepresentation];
      v28 = v27;
      if (a2)
      {
        v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __39__GEOPDLink__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        v28 = v31;
      }
      [v4 setObject:v28 forKey:@"Unknown Fields"];
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
  return -[GEOPDLink _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_6077;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6078;
      }
      GEOPDLinkReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDLinkCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __39__GEOPDLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDLinkIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDLink readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_quickLinkParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_appClipParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_extensionParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_webLinkParams)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLink readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_linkType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v9 = [(GEOPDQuickLinkActionDataParams *)self->_quickLinkParams copyWithZone:a3];
  id v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(GEOPDAppClipParams *)self->_appClipParams copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOPDExtensionParams *)self->_extensionParams copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEOPDWebLinkParams *)self->_webLinkParams copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_ownerProvidedRank;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDLink readAll:]((uint64_t)self, 1);
  -[GEOPDLink readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 17)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  quickLinkParams = self->_quickLinkParams;
  if ((unint64_t)quickLinkParams | *((void *)v4 + 5)
    && !-[GEOPDQuickLinkActionDataParams isEqual:](quickLinkParams, "isEqual:"))
  {
    goto LABEL_19;
  }
  appClipParams = self->_appClipParams;
  if ((unint64_t)appClipParams | *((void *)v4 + 3))
  {
    if (!-[GEOPDAppClipParams isEqual:](appClipParams, "isEqual:")) {
      goto LABEL_19;
    }
  }
  extensionParams = self->_extensionParams;
  if ((unint64_t)extensionParams | *((void *)v4 + 4))
  {
    if (!-[GEOPDExtensionParams isEqual:](extensionParams, "isEqual:")) {
      goto LABEL_19;
    }
  }
  webLinkParams = self->_webLinkParams;
  if ((unint64_t)webLinkParams | *((void *)v4 + 6))
  {
    if (!-[GEOPDWebLinkParams isEqual:](webLinkParams, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 76) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_ownerProvidedRank != *((_DWORD *)v4 + 18)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDLink readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_linkType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDQuickLinkActionDataParams *)self->_quickLinkParams hash];
  unint64_t v5 = [(GEOPDAppClipParams *)self->_appClipParams hash];
  unint64_t v6 = [(GEOPDExtensionParams *)self->_extensionParams hash];
  unint64_t v7 = [(GEOPDWebLinkParams *)self->_webLinkParams hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_ownerProvidedRank;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webLinkParams, 0);
  objc_storeStrong((id *)&self->_quickLinkParams, 0);
  objc_storeStrong((id *)&self->_extensionParams, 0);
  objc_storeStrong((id *)&self->_appClipParams, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end