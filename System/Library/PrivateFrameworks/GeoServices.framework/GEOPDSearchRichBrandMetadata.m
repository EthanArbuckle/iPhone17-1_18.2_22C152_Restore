@interface GEOPDSearchRichBrandMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchRichBrandMetadata)init;
- (GEOPDSearchRichBrandMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1;
- (void)_addNoFlagsPreferredCategory:(uint64_t)a1;
- (void)addBrandRelationshipInfo:(uint64_t)a1;
- (void)addPreferredCategory:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchRichBrandMetadata

- (GEOPDSearchRichBrandMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchRichBrandMetadata;
  v2 = [(GEOPDSearchRichBrandMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchRichBrandMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchRichBrandMetadata;
  v3 = [(GEOPDSearchRichBrandMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addBrandRelationshipInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchRichBrandMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandRelationshipInfos_tags_2331);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchRichBrandMetadata _addNoFlagsBrandRelationshipInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1
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

- (void)addPreferredCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchRichBrandMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreferredCategorys_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchRichBrandMetadata _addNoFlagsPreferredCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsPreferredCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchRichBrandMetadata;
  v4 = [(GEOPDSearchRichBrandMetadata *)&v8 description];
  id v5 = [(GEOPDSearchRichBrandMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRichBrandMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchRichBrandMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v7 = *(id *)(a1 + 24);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v6 addObject:v12];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"brandRelationshipInfo";
      }
      else {
        v13 = @"brand_relationship_info";
      }
      [v4 setObject:v6 forKey:v13];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchRichBrandMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandDensity_tags_2332);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v16 = *(id *)(a1 + 16);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"brandDensity";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"brand_density";
      }
      [v4 setObject:v18 forKey:v19];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v21 = *(id *)(a1 + 40);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            if (a2) {
              [v25 jsonRepresentation];
            }
            else {
            v26 = objc_msgSend(v25, "dictionaryRepresentation", (void)v29);
            }
            objc_msgSend(v20, "addObject:", v26, (void)v29);
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v22);
      }

      if (a2) {
        v27 = @"preferredCategory";
      }
      else {
        v27 = @"preferred_category";
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v27, (void)v29);
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
  return -[GEOPDSearchRichBrandMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_2340;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_2341;
      }
      GEOPDSearchRichBrandMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchRichBrandMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRichBrandMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_brandRelationshipInfos;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_brandDensity) {
      PBDataWriterWriteSubmessage();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = self->_preferredCategorys;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOPDSearchRichBrandMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_brandRelationshipInfos;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDSearchRichBrandMetadata addBrandRelationshipInfo:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPDSearchBrandDensity *)self->_brandDensity copyWithZone:a3];
  id v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_preferredCategorys;
  uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v8);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        -[GEOPDSearchRichBrandMetadata addPreferredCategory:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  brandRelationshipInfos = self->_brandRelationshipInfos;
  if ((unint64_t)brandRelationshipInfos | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](brandRelationshipInfos, "isEqual:"))
  {
    goto LABEL_13;
  }
  brandDensity = self->_brandDensity;
  if ((unint64_t)brandDensity | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchBrandDensity isEqual:](brandDensity, "isEqual:")) {
      goto LABEL_13;
    }
  }
  preferredCategorys = self->_preferredCategorys;
  if ((unint64_t)preferredCategorys | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](preferredCategorys, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_brandRelationshipInfos hash] ^ v3;
  unint64_t v5 = [(GEOPDSearchBrandDensity *)self->_brandDensity hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_preferredCategorys hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCategorys, 0);
  objc_storeStrong((id *)&self->_brandRelationshipInfos, 0);
  objc_storeStrong((id *)&self->_brandDensity, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end