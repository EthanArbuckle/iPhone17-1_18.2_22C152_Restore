@interface GEOAdditionalEnabledMarkets
+ (BOOL)isValid:(id)a3;
+ (Class)offlineMarketType;
+ (Class)transitMarketType;
+ (GEOAdditionalEnabledMarkets)additionalEnabledMarkets;
+ (id)_additionalEnabledTransitMarkets;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdditionalEnabledMarkets)init;
- (GEOAdditionalEnabledMarkets)initWithData:(id)a3;
- (GEOAdditionalEnabledMarkets)initWithDictionary:(id)a3;
- (GEOAdditionalEnabledMarkets)initWithJSON:(id)a3;
- (NSArray)queryItems;
- (NSDictionary)queryParameters;
- (NSMutableArray)offlineMarkets;
- (NSMutableArray)transitMarkets;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)offlineMarketAtIndex:(unint64_t)a3;
- (id)transitMarketAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)offlineMarketsCount;
- (unint64_t)transitMarketsCount;
- (void)_addNoFlagsOfflineMarket:(uint64_t)a1;
- (void)_addNoFlagsTransitMarket:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readOfflineMarkets;
- (void)_readTransitMarkets;
- (void)addOfflineMarket:(id)a3;
- (void)addTransitMarket:(id)a3;
- (void)clearOfflineMarkets;
- (void)clearTransitMarkets;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)reload;
- (void)setOfflineMarkets:(id)a3;
- (void)setTransitMarkets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdditionalEnabledMarkets

+ (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  if (qword_1EB29FE50 != -1) {
    dispatch_once(&qword_1EB29FE50, &__block_literal_global_121);
  }
  v2 = (void *)qword_1EB29FE48;

  return (GEOAdditionalEnabledMarkets *)v2;
}

uint64_t __71__GEOAdditionalEnabledMarkets_GEOProtoExtras__additionalEnabledMarkets__block_invoke_2()
{
  return [(id)qword_1EB29FE48 reload];
}

- (NSMutableArray)transitMarkets
{
  -[GEOAdditionalEnabledMarkets _readTransitMarkets]((uint64_t)self);
  transitMarkets = self->_transitMarkets;

  return transitMarkets;
}

- (void)_readTransitMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdditionalEnabledMarketsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitMarkets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)reload
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(GEOAdditionalEnabledMarkets *)self clearTransitMarkets];
  id v3 = [(id)objc_opt_class() _additionalEnabledTransitMarkets];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(GEOAdditionalEnabledMarkets *)self addTransitMarket:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)clearTransitMarkets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  transitMarkets = self->_transitMarkets;

  [(NSMutableArray *)transitMarkets removeAllObjects];
}

+ (id)_additionalEnabledTransitMarkets
{
  v2 = _getValue(GeoServicesConfig_AdditionalTransitMarkets, (uint64_t)off_1E9114828, 1, 0, 0, 0);
  id v3 = (void *)[v2 count];
  if (v3)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__GEOAdditionalEnabledMarkets_GEOProtoExtras___additionalEnabledTransitMarkets__block_invoke;
  v6[3] = &unk_1E53E5900;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitMarkets, 0);
  objc_storeStrong((id *)&self->_offlineMarkets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAdditionalEnabledMarkets *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_transitMarkets;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v10 = self->_offlineMarkets;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
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
      uint64_t v8 = (int *)&readAll__recursiveTag_52;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_52;
    }
    GEOAdditionalEnabledMarketsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAdditionalEnabledMarketsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAdditionalEnabledMarkets *)self readAll:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_transitMarkets;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v11) copyWithZone:a3];
        [v5 addTransitMarket:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_offlineMarkets;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addOfflineMarket:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

uint64_t __71__GEOAdditionalEnabledMarkets_GEOProtoExtras__additionalEnabledMarkets__block_invoke()
{
  v0 = objc_alloc_init(GEOAdditionalEnabledMarkets);
  v1 = (void *)qword_1EB29FE48;
  qword_1EB29FE48 = (uint64_t)v0;

  [(id)qword_1EB29FE48 reload];
  v2 = MEMORY[0x1E4F14428];

  return notify_register_dispatch("com.apple.GeoServices.additionalEnabledMarketsChanged", (int *)&_MergedGlobals_264, v2, &__block_literal_global_7_0);
}

- (GEOAdditionalEnabledMarkets)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAdditionalEnabledMarkets;
  v2 = [(GEOAdditionalEnabledMarkets *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOAdditionalEnabledMarkets)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAdditionalEnabledMarkets;
  BOOL v3 = [(GEOAdditionalEnabledMarkets *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)setTransitMarkets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  transitMarkets = self->_transitMarkets;
  self->_transitMarkets = v4;
}

- (void)addTransitMarket:(id)a3
{
  id v4 = a3;
  -[GEOAdditionalEnabledMarkets _readTransitMarkets]((uint64_t)self);
  -[GEOAdditionalEnabledMarkets _addNoFlagsTransitMarket:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTransitMarket:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)transitMarketsCount
{
  -[GEOAdditionalEnabledMarkets _readTransitMarkets]((uint64_t)self);
  transitMarkets = self->_transitMarkets;

  return [(NSMutableArray *)transitMarkets count];
}

- (id)transitMarketAtIndex:(unint64_t)a3
{
  -[GEOAdditionalEnabledMarkets _readTransitMarkets]((uint64_t)self);
  transitMarkets = self->_transitMarkets;

  return (id)[(NSMutableArray *)transitMarkets objectAtIndex:a3];
}

+ (Class)transitMarketType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineMarkets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAdditionalEnabledMarketsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineMarkets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)offlineMarkets
{
  -[GEOAdditionalEnabledMarkets _readOfflineMarkets]((uint64_t)self);
  offlineMarkets = self->_offlineMarkets;

  return offlineMarkets;
}

- (void)setOfflineMarkets:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  offlineMarkets = self->_offlineMarkets;
  self->_offlineMarkets = v4;
}

- (void)clearOfflineMarkets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  offlineMarkets = self->_offlineMarkets;

  [(NSMutableArray *)offlineMarkets removeAllObjects];
}

- (void)addOfflineMarket:(id)a3
{
  id v4 = a3;
  -[GEOAdditionalEnabledMarkets _readOfflineMarkets]((uint64_t)self);
  -[GEOAdditionalEnabledMarkets _addNoFlagsOfflineMarket:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsOfflineMarket:(uint64_t)a1
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

- (unint64_t)offlineMarketsCount
{
  -[GEOAdditionalEnabledMarkets _readOfflineMarkets]((uint64_t)self);
  offlineMarkets = self->_offlineMarkets;

  return [(NSMutableArray *)offlineMarkets count];
}

- (id)offlineMarketAtIndex:(unint64_t)a3
{
  -[GEOAdditionalEnabledMarkets _readOfflineMarkets]((uint64_t)self);
  offlineMarkets = self->_offlineMarkets;

  return (id)[(NSMutableArray *)offlineMarkets objectAtIndex:a3];
}

+ (Class)offlineMarketType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdditionalEnabledMarkets;
  id v4 = [(GEOAdditionalEnabledMarkets *)&v8 description];
  id v5 = [(GEOAdditionalEnabledMarkets *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdditionalEnabledMarkets _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[4])
    {
      id v5 = [a1 transitMarkets];
      if (a2) {
        objc_super v6 = @"transitMarket";
      }
      else {
        objc_super v6 = @"transit_market";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (a1[3])
    {
      id v7 = [a1 offlineMarkets];
      if (a2) {
        objc_super v8 = @"offlineMarket";
      }
      else {
        objc_super v8 = @"offline_market";
      }
      [v4 setObject:v7 forKey:v8];
    }
    uint64_t v9 = (void *)a1[2];
    if (v9)
    {
      uint64_t v10 = [v9 dictionaryRepresentation];
      uint64_t v11 = v10;
      if (a2)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __57__GEOAdditionalEnabledMarkets__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        uint64_t v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOAdditionalEnabledMarkets _dictionaryRepresentation:](self, 1);
}

void __57__GEOAdditionalEnabledMarkets__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAdditionalEnabledMarkets)initWithDictionary:(id)a3
{
  return (GEOAdditionalEnabledMarkets *)-[GEOAdditionalEnabledMarkets _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"transitMarket";
      }
      else {
        objc_super v6 = @"transit_market";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = (void *)[v13 copy];
                [a1 addTransitMarket:v14];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        uint64_t v15 = @"offlineMarket";
      }
      else {
        uint64_t v15 = @"offline_market";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * v21);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v23 = objc_msgSend(v22, "copy", (void)v25);
                [a1 addOfflineMarket:v23];
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v19);
        }
      }
    }
  }

  return a1;
}

- (GEOAdditionalEnabledMarkets)initWithJSON:(id)a3
{
  return (GEOAdditionalEnabledMarkets *)-[GEOAdditionalEnabledMarkets _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdditionalEnabledMarketsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdditionalEnabledMarketsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOAdditionalEnabledMarkets *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOAdditionalEnabledMarkets *)self transitMarketsCount])
  {
    [v12 clearTransitMarkets];
    unint64_t v4 = [(GEOAdditionalEnabledMarkets *)self transitMarketsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(GEOAdditionalEnabledMarkets *)self transitMarketAtIndex:i];
        [v12 addTransitMarket:v7];
      }
    }
  }
  if ([(GEOAdditionalEnabledMarkets *)self offlineMarketsCount])
  {
    [v12 clearOfflineMarkets];
    unint64_t v8 = [(GEOAdditionalEnabledMarkets *)self offlineMarketsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOAdditionalEnabledMarkets *)self offlineMarketAtIndex:j];
        [v12 addOfflineMarket:v11];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOAdditionalEnabledMarkets *)self readAll:1],
         [v4 readAll:1],
         transitMarkets = self->_transitMarkets,
         !((unint64_t)transitMarkets | v4[4]))
     || -[NSMutableArray isEqual:](transitMarkets, "isEqual:")))
  {
    offlineMarkets = self->_offlineMarkets;
    if ((unint64_t)offlineMarkets | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](offlineMarkets, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOAdditionalEnabledMarkets *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_transitMarkets hash];
  return [(NSMutableArray *)self->_offlineMarkets hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOAdditionalEnabledMarkets *)self addTransitMarket:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOAdditionalEnabledMarkets addOfflineMarket:](self, "addOfflineMarket:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOAdditionalEnabledMarketsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_10);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAdditionalEnabledMarkets *)self readAll:0];
  }
}

void __79__GEOAdditionalEnabledMarkets_GEOProtoExtras___additionalEnabledTransitMarkets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (NSDictionary)queryParameters
{
  if ([(GEOAdditionalEnabledMarkets *)self transitMarketsCount])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v4 = [(GEOAdditionalEnabledMarkets *)self transitMarkets];
    id v5 = [v4 componentsJoinedByString:@","];
    id v6 = [v3 dictionaryWithObject:v5 forKey:@"atm"];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v6;
}

- (NSArray)queryItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(GEOAdditionalEnabledMarkets *)self queryParameters];
  if ([v2 count])
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v4 = [v2 allKeys];
    id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_15_0];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v2, "objectForKeyedSubscript:", v11, (void)v15);
          uint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:v11 value:v12];
          [v3 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

uint64_t __57__GEOAdditionalEnabledMarkets_GEOProtoExtras__queryItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end