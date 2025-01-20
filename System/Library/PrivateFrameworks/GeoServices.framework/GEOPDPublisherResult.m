@interface GEOPDPublisherResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPublisherResult)init;
- (GEOPDPublisherResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)components;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)publisherId;
- (unint64_t)hash;
- (void)_addNoFlagsComponent:(uint64_t)a1;
- (void)_readComponents;
- (void)_readPublisherId;
- (void)addComponent:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setPublisherId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPublisherResult

- (GEOPDPublisherResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPublisherResult;
  v2 = [(GEOPDPublisherResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPublisherResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPublisherResult;
  v3 = [(GEOPDPublisherResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPublisherId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPublisherId_tags_7911);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)publisherId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisherResult _readPublisherId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPublisherId:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 56) |= 8u;
  *(unsigned char *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readComponents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComponents_tags_7912);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)components
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPublisherResult _readComponents]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addComponent:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDPublisherResult _readComponents](a1);
    -[GEOPDPublisherResult _addNoFlagsComponent:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsComponent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPublisherResult;
  id v4 = [(GEOPDPublisherResult *)&v8 description];
  id v5 = [(GEOPDPublisherResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisherResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_42;
  }
  -[GEOPDPublisherResult readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = -[GEOPDPublisherResult publisherId]((id *)a1);
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      id v7 = [v5 jsonRepresentation];
      objc_super v8 = @"publisherId";
    }
    else
    {
      id v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"publisher_id";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    int v9 = *(_DWORD *)(a1 + 52);
    if (v9 <= 29)
    {
      v10 = @"STATUS_SUCCESS";
      switch(v9)
      {
        case 0:
          goto LABEL_25;
        case 1:
          v10 = @"STATUS_FAILED";
          break;
        case 2:
          v10 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_20;
        case 5:
          v10 = @"INVALID_REQUEST";
          break;
        default:
          if (v9 != 20) {
            goto LABEL_20;
          }
          v10 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_25;
    }
    if (v9 > 49)
    {
      if (v9 == 50)
      {
        v10 = @"STATUS_DEDUPED";
        goto LABEL_25;
      }
      if (v9 == 60)
      {
        v10 = @"VERSION_MISMATCH";
        goto LABEL_25;
      }
    }
    else
    {
      if (v9 == 30)
      {
        v10 = @"NEEDS_REFINEMENT";
        goto LABEL_25;
      }
      if (v9 == 40)
      {
        v10 = @"FAILED_NOT_AUTHORIZED";
LABEL_25:
        [v4 setObject:v10 forKey:@"status"];

        goto LABEL_26;
      }
    }
LABEL_20:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  if ([*(id *)(a1 + 24) count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = *(id *)(a1 + 24);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (a2) {
            [v17 jsonRepresentation];
          }
          else {
          v18 = [v17 dictionaryRepresentation];
          }
          [v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"component"];
  }
  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    v20 = [v19 dictionaryRepresentation];
    v21 = v20;
    if (a2)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__GEOPDPublisherResult__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v23 = v22;
      id v27 = v23;
      [v21 enumerateKeysAndObjectsUsingBlock:v26];
      id v24 = v23;

      v21 = v24;
    }
    [v4 setObject:v21 forKey:@"Unknown Fields"];
  }
LABEL_42:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPublisherResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7913;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7914;
      }
      GEOPDPublisherResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __50__GEOPDPublisherResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
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
  return GEOPDPublisherResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPublisherResult readAll:]((uint64_t)self, 0);
    if (self->_publisherId) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_components;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPublisherResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPublisherResult readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDMapsIdentifier *)self->_publisherId copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_status;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_components;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        -[GEOPDPublisherResult addComponent:](v5, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDPublisherResult readAll:]((uint64_t)self, 1);
  -[GEOPDPublisherResult readAll:]((uint64_t)v4, 1);
  publisherId = self->_publisherId;
  if ((unint64_t)publisherId | *((void *)v4 + 4))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](publisherId, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_status != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  components = self->_components;
  if ((unint64_t)components | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](components, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDPublisherResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_publisherId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSMutableArray *)self->_components hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end