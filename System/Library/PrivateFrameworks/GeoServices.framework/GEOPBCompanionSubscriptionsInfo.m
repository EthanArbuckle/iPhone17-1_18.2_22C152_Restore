@interface GEOPBCompanionSubscriptionsInfo
+ (BOOL)isValid:(id)a3;
+ (Class)loadedSubscriptionType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOfflineLastUpdatedTimestamp;
- (BOOL)hasOfflineTileMetadata;
- (BOOL)hasPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)padding;
- (BOOL)readFrom:(id)a3;
- (GEOPBCompanionSubscriptionsInfo)init;
- (GEOPBCompanionSubscriptionsInfo)initWithData:(id)a3;
- (GEOPBCompanionSubscriptionsInfo)initWithDictionary:(id)a3;
- (GEOPBCompanionSubscriptionsInfo)initWithJSON:(id)a3;
- (GEOPBOfflineTileMetadata)offlineTileMetadata;
- (NSMutableArray)loadedSubscriptions;
- (PBUnknownFields)unknownFields;
- (double)offlineLastUpdatedTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)loadedSubscriptionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)loadedSubscriptionsCount;
- (void)_addNoFlagsLoadedSubscription:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLoadedSubscriptions;
- (void)_readOfflineTileMetadata;
- (void)addLoadedSubscription:(id)a3;
- (void)clearLoadedSubscriptions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasOfflineLastUpdatedTimestamp:(BOOL)a3;
- (void)setHasPadding:(BOOL)a3;
- (void)setLoadedSubscriptions:(id)a3;
- (void)setOfflineLastUpdatedTimestamp:(double)a3;
- (void)setOfflineTileMetadata:(id)a3;
- (void)setPadding:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBCompanionSubscriptionsInfo

- (GEOPBCompanionSubscriptionsInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  v2 = [(GEOPBCompanionSubscriptionsInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBCompanionSubscriptionsInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  v3 = [(GEOPBCompanionSubscriptionsInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLoadedSubscriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionsInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLoadedSubscriptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)loadedSubscriptions
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  loadedSubscriptions = self->_loadedSubscriptions;

  return loadedSubscriptions;
}

- (void)setLoadedSubscriptions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  loadedSubscriptions = self->_loadedSubscriptions;
  self->_loadedSubscriptions = v4;
}

- (void)clearLoadedSubscriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  loadedSubscriptions = self->_loadedSubscriptions;

  [(NSMutableArray *)loadedSubscriptions removeAllObjects];
}

- (void)addLoadedSubscription:(id)a3
{
  id v4 = a3;
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  -[GEOPBCompanionSubscriptionsInfo _addNoFlagsLoadedSubscription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLoadedSubscription:(uint64_t)a1
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

- (unint64_t)loadedSubscriptionsCount
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  loadedSubscriptions = self->_loadedSubscriptions;

  return [(NSMutableArray *)loadedSubscriptions count];
}

- (id)loadedSubscriptionAtIndex:(unint64_t)a3
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  loadedSubscriptions = self->_loadedSubscriptions;

  return (id)[(NSMutableArray *)loadedSubscriptions objectAtIndex:a3];
}

+ (Class)loadedSubscriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineTileMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionsInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineTileMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOfflineTileMetadata
{
  return self->_offlineTileMetadata != 0;
}

- (GEOPBOfflineTileMetadata)offlineTileMetadata
{
  -[GEOPBCompanionSubscriptionsInfo _readOfflineTileMetadata]((uint64_t)self);
  offlineTileMetadata = self->_offlineTileMetadata;

  return offlineTileMetadata;
}

- (void)setOfflineTileMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_offlineTileMetadata, a3);
}

- (double)offlineLastUpdatedTimestamp
{
  return self->_offlineLastUpdatedTimestamp;
}

- (void)setOfflineLastUpdatedTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_offlineLastUpdatedTimestamp = a3;
}

- (void)setHasOfflineLastUpdatedTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOfflineLastUpdatedTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)padding
{
  return self->_padding;
}

- (void)setPadding:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_padding = a3;
}

- (void)setHasPadding:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPadding
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  id v4 = [(GEOPBCompanionSubscriptionsInfo *)&v8 description];
  id v5 = [(GEOPBCompanionSubscriptionsInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBCompanionSubscriptionsInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v6 = *(id *)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"loadedSubscription";
      }
      else {
        v13 = @"loaded_subscription";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 offlineTileMetadata];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"offlineTileMetadata";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"offline_tile_metadata";
      }
      [v4 setObject:v16 forKey:v17];
    }
    char v18 = *(unsigned char *)(a1 + 64);
    if (v18)
    {
      v19 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      if (a2) {
        v20 = @"offlineLastUpdatedTimestamp";
      }
      else {
        v20 = @"offline_last_updated_timestamp";
      }
      [v4 setObject:v19 forKey:v20];

      char v18 = *(unsigned char *)(a1 + 64);
    }
    if ((v18 & 2) != 0)
    {
      v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      [v4 setObject:v21 forKey:@"padding"];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __61__GEOPBCompanionSubscriptionsInfo__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEOPBCompanionSubscriptionsInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPBCompanionSubscriptionsInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPBCompanionSubscriptionsInfo)initWithDictionary:(id)a3
{
  return (GEOPBCompanionSubscriptionsInfo *)-[GEOPBCompanionSubscriptionsInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"loadedSubscription";
      }
      else {
        id v6 = @"loaded_subscription";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v25 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOPBCompanionSubscription alloc];
                if (a3) {
                  uint64_t v15 = [(GEOPBCompanionSubscription *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOPBCompanionSubscription *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addLoadedSubscription:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v25;
      }

      if (a3) {
        v17 = @"offlineTileMetadata";
      }
      else {
        v17 = @"offline_tile_metadata";
      }
      char v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOPBOfflineTileMetadata alloc];
        if (v19) {
          v20 = (void *)-[GEOPBOfflineTileMetadata _initWithDictionary:isJSON:](v19, v18);
        }
        else {
          v20 = 0;
        }
        [a1 setOfflineTileMetadata:v20];
      }
      if (a3) {
        v21 = @"offlineLastUpdatedTimestamp";
      }
      else {
        v21 = @"offline_last_updated_timestamp";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v22 doubleValue];
        objc_msgSend(a1, "setOfflineLastUpdatedTimestamp:");
      }

      v23 = [v5 objectForKeyedSubscript:@"padding"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPadding:", objc_msgSend(v23, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPBCompanionSubscriptionsInfo)initWithJSON:(id)a3
{
  return (GEOPBCompanionSubscriptionsInfo *)-[GEOPBCompanionSubscriptionsInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_188;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_189;
    }
    GEOPBCompanionSubscriptionsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBCompanionSubscriptionsInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBCompanionSubscriptionsInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBCompanionSubscriptionsInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    uint64_t v11 = self->_reader;
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
    [(GEOPBCompanionSubscriptionsInfo *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_loadedSubscriptions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_offlineTileMetadata) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_loadedSubscriptions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOPBCompanionSubscriptionsInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPBCompanionSubscriptionsInfo *)self loadedSubscriptionsCount])
  {
    [v9 clearLoadedSubscriptions];
    unint64_t v4 = [(GEOPBCompanionSubscriptionsInfo *)self loadedSubscriptionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPBCompanionSubscriptionsInfo *)self loadedSubscriptionAtIndex:i];
        [v9 addLoadedSubscription:v7];
      }
    }
  }
  if (self->_offlineTileMetadata) {
    objc_msgSend(v9, "setOfflineTileMetadata:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v9[4] = *(id *)&self->_offlineLastUpdatedTimestamp;
    *((unsigned char *)v9 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v9 + 60) = self->_padding;
    *((unsigned char *)v9 + 64) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBCompanionSubscriptionsInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBCompanionSubscriptionsInfo *)self readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = self->_loadedSubscriptions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addLoadedSubscription:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPBOfflineTileMetadata *)self->_offlineTileMetadata copyWithZone:a3];
  long long v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 32) = self->_offlineLastUpdatedTimestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 60) = self->_padding;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOPBCompanionSubscriptionsInfo *)self readAll:1];
  [v4 readAll:1];
  loadedSubscriptions = self->_loadedSubscriptions;
  if ((unint64_t)loadedSubscriptions | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](loadedSubscriptions, "isEqual:")) {
      goto LABEL_13;
    }
  }
  offlineTileMetadata = self->_offlineTileMetadata;
  if ((unint64_t)offlineTileMetadata | *((void *)v4 + 5))
  {
    if (!-[GEOPBOfflineTileMetadata isEqual:](offlineTileMetadata, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_offlineLastUpdatedTimestamp != *((double *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_padding)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPBCompanionSubscriptionsInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_loadedSubscriptions hash];
  unint64_t v4 = [(GEOPBOfflineTileMetadata *)self->_offlineTileMetadata hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double offlineLastUpdatedTimestamp = self->_offlineLastUpdatedTimestamp;
    double v8 = -offlineLastUpdatedTimestamp;
    if (offlineLastUpdatedTimestamp >= 0.0) {
      double v8 = self->_offlineLastUpdatedTimestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_padding;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPBCompanionSubscriptionsInfo addLoadedSubscription:](self, "addLoadedSubscription:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  offlineTileMetadata = self->_offlineTileMetadata;
  uint64_t v11 = *((void *)v4 + 5);
  if (offlineTileMetadata)
  {
    if (v11) {
      -[GEOPBOfflineTileMetadata mergeFrom:]((uint64_t)offlineTileMetadata, v11);
    }
  }
  else if (v11)
  {
    [(GEOPBCompanionSubscriptionsInfo *)self setOfflineTileMetadata:*((void *)v4 + 5)];
  }
  char v12 = *((unsigned char *)v4 + 64);
  if (v12)
  {
    self->_double offlineLastUpdatedTimestamp = *((double *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v12 = *((unsigned char *)v4 + 64);
  }
  if ((v12 & 2) != 0)
  {
    self->_padding = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOPBCompanionSubscriptionsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_193);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBCompanionSubscriptionsInfo *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_loadedSubscriptions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineTileMetadata, 0);
  objc_storeStrong((id *)&self->_loadedSubscriptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end