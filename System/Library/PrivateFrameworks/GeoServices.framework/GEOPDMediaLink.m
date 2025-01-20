@interface GEOPDMediaLink
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDMediaLink)init;
- (GEOPDMediaLink)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)adamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mediaLinkPositionMetaData;
- (id)subId;
- (id)thirdPartyLinks;
- (uint64_t)mediaSubType;
- (uint64_t)mediaType;
- (unint64_t)hash;
- (void)_addNoFlagsThirdPartyLink:(uint64_t)a1;
- (void)_readAdamId;
- (void)_readMediaLinkPositionMetaData;
- (void)_readSubId;
- (void)_readThirdPartyLinks;
- (void)addThirdPartyLink:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMediaLink

- (GEOPDMediaLink)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMediaLink;
  v2 = [(GEOPDMediaLink *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMediaLink)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMediaLink;
  v3 = [(GEOPDMediaLink *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAdamId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMediaLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdamId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)adamId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDMediaLink _readAdamId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSubId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMediaLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)subId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDMediaLink _readSubId]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)mediaType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)mediaSubType
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

- (void)_readThirdPartyLinks
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
        GEOPDMediaLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThirdPartyLinks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)thirdPartyLinks
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDMediaLink _readThirdPartyLinks]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addThirdPartyLink:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDMediaLink _readThirdPartyLinks](a1);
    -[GEOPDMediaLink _addNoFlagsThirdPartyLink:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsThirdPartyLink:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readMediaLinkPositionMetaData
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
        GEOPDMediaLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMediaLinkPositionMetaData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)mediaLinkPositionMetaData
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDMediaLink _readMediaLinkPositionMetaData]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMediaLink;
  v4 = [(GEOPDMediaLink *)&v8 description];
  id v5 = [(GEOPDMediaLink *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMediaLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDMediaLink readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDMediaLink adamId]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"adamId";
      }
      else {
        objc_super v6 = @"adam_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = -[GEOPDMediaLink subId]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"subId";
      }
      else {
        objc_super v8 = @"sub_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    char v9 = *(unsigned char *)(a1 + 76);
    if ((v9 & 2) != 0)
    {
      uint64_t v10 = *(int *)(a1 + 72);
      if (v10 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E3B78[v10];
      }
      if (a2) {
        v12 = @"mediaType";
      }
      else {
        v12 = @"media_type";
      }
      [v4 setObject:v11 forKey:v12];

      char v9 = *(unsigned char *)(a1 + 76);
    }
    if (v9)
    {
      uint64_t v13 = *(int *)(a1 + 68);
      if (v13 >= 0x14)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53E3BA8[v13];
      }
      if (a2) {
        v15 = @"mediaSubType";
      }
      else {
        v15 = @"media_sub_type";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = *(id *)(a1 + 48);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"thirdPartyLink";
      }
      else {
        v24 = @"third_party_link";
      }
      [v4 setObject:v16 forKey:v24];
    }
    v25 = -[GEOPDMediaLink mediaLinkPositionMetaData]((id *)a1);
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"mediaLinkPositionMetaData";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"media_link_position_meta_data";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = *(void **)(a1 + 16);
    if (v29)
    {
      v30 = [v29 dictionaryRepresentation];
      v31 = v30;
      if (a2)
      {
        v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __44__GEOPDMediaLink__dictionaryRepresentation___block_invoke;
        v36[3] = &unk_1E53D8860;
        id v33 = v32;
        id v37 = v33;
        [v31 enumerateKeysAndObjectsUsingBlock:v36];
        id v34 = v33;

        v31 = v34;
      }
      [v4 setObject:v31 forKey:@"Unknown Fields"];
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
  return -[GEOPDMediaLink _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_6338;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6339;
      }
      GEOPDMediaLinkReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDMediaLinkCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDMediaLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
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
  return GEOPDMediaLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMediaLink readAll:]((uint64_t)self, 0);
    if (self->_adamId) {
      PBDataWriterWriteStringField();
    }
    if (self->_subId) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_thirdPartyLinks;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    if (self->_mediaLinkPositionMetaData) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDMediaLinkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMediaLink readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_adamId copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_subId copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_mediaType;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_mediaSubType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = self->_thirdPartyLinks;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        -[GEOPDMediaLink addThirdPartyLink:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  id v19 = [(GEOPDMediaLinkPositionMetaData *)self->_mediaLinkPositionMetaData copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  -[GEOPDMediaLink readAll:]((uint64_t)self, 1);
  -[GEOPDMediaLink readAll:]((uint64_t)v4, 1);
  adamId = self->_adamId;
  if ((unint64_t)adamId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](adamId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  subId = self->_subId;
  if ((unint64_t)subId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](subId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_mediaType != *((_DWORD *)v4 + 18)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_mediaSubType != *((_DWORD *)v4 + 17)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_20;
  }
  thirdPartyLinks = self->_thirdPartyLinks;
  if ((unint64_t)thirdPartyLinks | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](thirdPartyLinks, "isEqual:"))
  {
    goto LABEL_20;
  }
  mediaLinkPositionMetaData = self->_mediaLinkPositionMetaData;
  if ((unint64_t)mediaLinkPositionMetaData | *((void *)v4 + 4)) {
    char v9 = -[GEOPDMediaLinkPositionMetaData isEqual:](mediaLinkPositionMetaData, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDMediaLink readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_adamId hash];
  NSUInteger v4 = [(NSString *)self->_subId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_mediaType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_mediaSubType;
LABEL_6:
  uint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_thirdPartyLinks hash];
  return v7 ^ [(GEOPDMediaLinkPositionMetaData *)self->_mediaLinkPositionMetaData hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_subId, 0);
  objc_storeStrong((id *)&self->_mediaLinkPositionMetaData, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end