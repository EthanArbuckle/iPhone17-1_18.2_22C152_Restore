@interface GEOPDEnrichmentDataEntity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDEnrichmentDataEntity)init;
- (GEOPDEnrichmentDataEntity)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)adamIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enrichmentInfo;
- (id)enrichmentMetadata;
- (id)html;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAdamId:(uint64_t)a1;
- (void)_readAdamIds;
- (void)_readEnrichmentInfo;
- (void)_readEnrichmentMetadata;
- (void)_readHtml;
- (void)addAdamId:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEnrichmentDataEntity

- (GEOPDEnrichmentDataEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDEnrichmentDataEntity;
  v2 = [(GEOPDEnrichmentDataEntity *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDEnrichmentDataEntity)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDEnrichmentDataEntity;
  v3 = [(GEOPDEnrichmentDataEntity *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEnrichmentInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrichmentInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)enrichmentInfo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentDataEntity _readEnrichmentInfo]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readHtml
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHtml_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)html
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentDataEntity _readHtml]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readEnrichmentMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnrichmentMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)enrichmentMetadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentDataEntity _readEnrichmentMetadata]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAdamIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdamIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)adamIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentDataEntity _readAdamIds]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addAdamId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDEnrichmentDataEntity _readAdamIds](a1);
    -[GEOPDEnrichmentDataEntity _addNoFlagsAdamId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsAdamId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEnrichmentDataEntity;
  v4 = [(GEOPDEnrichmentDataEntity *)&v8 description];
  id v5 = [(GEOPDEnrichmentDataEntity *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnrichmentDataEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDEnrichmentDataEntity readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDEnrichmentDataEntity enrichmentInfo]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"enrichmentInfo";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"enrichment_info";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDEnrichmentDataEntity html]((id *)a1);
    if (v9) {
      [v4 setObject:v9 forKey:@"html"];
    }

    v10 = -[GEOPDEnrichmentDataEntity enrichmentMetadata]((id *)a1);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 base64EncodedStringWithOptions:0];
        [v4 setObject:v12 forKey:@"enrichmentMetadata"];
      }
      else
      {
        [v4 setObject:v10 forKey:@"enrichment_metadata"];
      }
    }

    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v13 = *(int *)(a1 + 68);
      if (v13 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53E38D0[v13];
      }
      if (a2) {
        v15 = @"suppressionReason";
      }
      else {
        v15 = @"suppression_reason";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if (*(void *)(a1 + 24))
    {
      v16 = -[GEOPDEnrichmentDataEntity adamIds]((id *)a1);
      if (a2) {
        v17 = @"adamId";
      }
      else {
        v17 = @"adam_id";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __55__GEOPDEnrichmentDataEntity__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDEnrichmentDataEntity _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_4327;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4328;
      }
      GEOPDEnrichmentDataEntityReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDEnrichmentInfo readAll:](*(void *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __55__GEOPDEnrichmentDataEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDEnrichmentDataEntityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_7;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if (GEOPDEnrichmentInfoIsDirty((uint64_t)self->_enrichmentInfo)) {
      goto LABEL_7;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x34) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_23;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 0);
  if (self->_enrichmentInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_html) {
    PBDataWriterWriteStringField();
  }
  if (self->_enrichmentMetadata) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_adamIds;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDEnrichmentDataEntityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDEnrichmentInfo *)self->_enrichmentInfo copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_html copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSData *)self->_enrichmentMetadata copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_suppressionReason;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = self->_adamIds;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        -[GEOPDEnrichmentDataEntity addAdamId:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 1);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)v4, 1);
  enrichmentInfo = self->_enrichmentInfo;
  if ((unint64_t)enrichmentInfo | *((void *)v4 + 4))
  {
    if (!-[GEOPDEnrichmentInfo isEqual:](enrichmentInfo, "isEqual:")) {
      goto LABEL_15;
    }
  }
  html = self->_html;
  if ((unint64_t)html | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](html, "isEqual:")) {
      goto LABEL_15;
    }
  }
  enrichmentMetadata = self->_enrichmentMetadata;
  if ((unint64_t)enrichmentMetadata | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](enrichmentMetadata, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_suppressionReason != *((_DWORD *)v4 + 17)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  adamIds = self->_adamIds;
  if ((unint64_t)adamIds | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](adamIds, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDEnrichmentInfo *)self->_enrichmentInfo hash];
  NSUInteger v4 = [(NSString *)self->_html hash];
  uint64_t v5 = [(NSData *)self->_enrichmentMetadata hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_suppressionReason;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_adamIds hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_enrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_adamIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end