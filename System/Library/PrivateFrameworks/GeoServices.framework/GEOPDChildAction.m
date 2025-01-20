@interface GEOPDChildAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDChildAction)init;
- (GEOPDChildAction)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)childActionGuides;
- (id)childActionSearch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)childActionType;
- (unint64_t)hash;
- (void)_readChildActionGuides;
- (void)_readChildActionSearch;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDChildAction

- (GEOPDChildAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDChildAction;
  v2 = [(GEOPDChildAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDChildAction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDChildAction;
  v3 = [(GEOPDChildAction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)childActionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readChildActionSearch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildActionSearch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)childActionSearch
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDChildAction _readChildActionSearch]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readChildActionGuides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildActionGuides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)childActionGuides
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDChildAction _readChildActionGuides]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDChildAction;
  v4 = [(GEOPDChildAction *)&v8 description];
  v5 = [(GEOPDChildAction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDChildAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDChildAction readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v5 = *(int *)(a1 + 76);
      if (v5 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E4060[v5];
      }
      if (a2) {
        objc_super v7 = @"childActionType";
      }
      else {
        objc_super v7 = @"child_action_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildActionDirections_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v10 = *(id *)(a1 + 24);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"childActionDirections";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"child_action_directions";
      }
      [v4 setObject:v12 forKey:v13];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildActionFlyover_tags);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v16 = *(id *)(a1 + 40);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"childActionFlyover";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"child_action_flyover";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = -[GEOPDChildAction childActionSearch]((id *)a1);
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"childActionSearch";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"child_action_search";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = -[GEOPDChildAction childActionGuides]((id *)a1);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"childActionGuides";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"child_action_guides";
      }
      [v4 setObject:v26 forKey:v27];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v28 = *(void **)(a1 + 8);
      if (v28)
      {
        id v29 = v28;
        objc_sync_enter(v29);
        GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildActionDownloadOfflineMap_tags);
        objc_sync_exit(v29);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v30 = *(id *)(a1 + 32);
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"childActionDownloadOfflineMap";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"child_action_download_offline_map";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = *(void **)(a1 + 16);
    if (v34)
    {
      v35 = [v34 dictionaryRepresentation];
      v36 = v35;
      if (a2)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __46__GEOPDChildAction__dictionaryRepresentation___block_invoke;
        v41[3] = &unk_1E53D8860;
        id v38 = v37;
        id v42 = v38;
        [v36 enumerateKeysAndObjectsUsingBlock:v41];
        id v39 = v38;

        v36 = v39;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
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
  return -[GEOPDChildAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1578;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1579;
      }
      GEOPDChildActionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __46__GEOPDChildAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDChildActionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 3u))
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
    -[GEOPDChildAction readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_childActionDirections)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childActionFlyover)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childActionSearch)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childActionGuides)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_childActionDownloadOfflineMap)
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDChildActionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDChildAction readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_childActionType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v9 = [(GEOPDChildActionDirections *)self->_childActionDirections copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOPDChildActionFlyover *)self->_childActionFlyover copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDChildActionSearch *)self->_childActionSearch copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  id v15 = [(GEOPDChildActionGuides *)self->_childActionGuides copyWithZone:a3];
  id v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  id v17 = [(GEOPDChildActionDownloadOfflineMap *)self->_childActionDownloadOfflineMap copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDChildAction readAll:]((uint64_t)self, 1);
  -[GEOPDChildAction readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_childActionType != *((_DWORD *)v4 + 19)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  childActionDirections = self->_childActionDirections;
  if ((unint64_t)childActionDirections | *((void *)v4 + 3)
    && !-[GEOPDChildActionDirections isEqual:](childActionDirections, "isEqual:"))
  {
    goto LABEL_17;
  }
  childActionFlyover = self->_childActionFlyover;
  if ((unint64_t)childActionFlyover | *((void *)v4 + 5))
  {
    if (!-[GEOPDChildActionFlyover isEqual:](childActionFlyover, "isEqual:")) {
      goto LABEL_17;
    }
  }
  childActionSearch = self->_childActionSearch;
  if ((unint64_t)childActionSearch | *((void *)v4 + 7))
  {
    if (!-[GEOPDChildActionSearch isEqual:](childActionSearch, "isEqual:")) {
      goto LABEL_17;
    }
  }
  childActionGuides = self->_childActionGuides;
  if ((unint64_t)childActionGuides | *((void *)v4 + 6))
  {
    if (!-[GEOPDChildActionGuides isEqual:](childActionGuides, "isEqual:")) {
      goto LABEL_17;
    }
  }
  childActionDownloadOfflineMap = self->_childActionDownloadOfflineMap;
  if ((unint64_t)childActionDownloadOfflineMap | *((void *)v4 + 4)) {
    char v10 = -[GEOPDChildActionDownloadOfflineMap isEqual:](childActionDownloadOfflineMap, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDChildAction readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_childActionType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDChildActionDirections *)self->_childActionDirections hash] ^ v3;
  unint64_t v5 = [(GEOPDChildActionFlyover *)self->_childActionFlyover hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDChildActionSearch *)self->_childActionSearch hash];
  unint64_t v7 = [(GEOPDChildActionGuides *)self->_childActionGuides hash];
  return v6 ^ v7 ^ [(GEOPDChildActionDownloadOfflineMap *)self->_childActionDownloadOfflineMap hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childActionSearch, 0);
  objc_storeStrong((id *)&self->_childActionGuides, 0);
  objc_storeStrong((id *)&self->_childActionFlyover, 0);
  objc_storeStrong((id *)&self->_childActionDownloadOfflineMap, 0);
  objc_storeStrong((id *)&self->_childActionDirections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end