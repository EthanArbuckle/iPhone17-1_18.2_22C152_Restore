@interface GEORPScorecard
+ (BOOL)isValid:(id)a3;
+ (Class)categoryRatingsType;
- (BOOL)hasRecommended;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)recommended;
- (GEORPScorecard)init;
- (GEORPScorecard)initWithData:(id)a3;
- (GEORPScorecard)initWithDictionary:(id)a3;
- (GEORPScorecard)initWithJSON:(id)a3;
- (NSMutableArray)categoryRatings;
- (NSString)version;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)categoryRatingsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)categoryRatingsCount;
- (unint64_t)hash;
- (void)_addNoFlagsCategoryRatings:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCategoryRatings;
- (void)_readVersion;
- (void)addCategoryRatings:(id)a3;
- (void)clearCategoryRatings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCategoryRatings:(id)a3;
- (void)setHasRecommended:(BOOL)a3;
- (void)setRecommended:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPScorecard

- (GEORPScorecard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPScorecard;
  v2 = [(GEORPScorecard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPScorecard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPScorecard;
  v3 = [(GEORPScorecard *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPScorecardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPScorecard _readVersion]((uint64_t)self);
  version = self->_version;

  return version;
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_version, a3);
}

- (BOOL)recommended
{
  return self->_recommended;
}

- (void)setRecommended:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_recommended = a3;
}

- (void)setHasRecommended:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasRecommended
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readCategoryRatings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPScorecardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryRatings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)categoryRatings
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  categoryRatings = self->_categoryRatings;

  return categoryRatings;
}

- (void)setCategoryRatings:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  categoryRatings = self->_categoryRatings;
  self->_categoryRatings = v4;
}

- (void)clearCategoryRatings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  categoryRatings = self->_categoryRatings;

  [(NSMutableArray *)categoryRatings removeAllObjects];
}

- (void)addCategoryRatings:(id)a3
{
  id v4 = a3;
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  -[GEORPScorecard _addNoFlagsCategoryRatings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsCategoryRatings:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)categoryRatingsCount
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  categoryRatings = self->_categoryRatings;

  return [(NSMutableArray *)categoryRatings count];
}

- (id)categoryRatingsAtIndex:(unint64_t)a3
{
  -[GEORPScorecard _readCategoryRatings]((uint64_t)self);
  categoryRatings = self->_categoryRatings;

  return (id)[(NSMutableArray *)categoryRatings objectAtIndex:a3];
}

+ (Class)categoryRatingsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPScorecard;
  id v4 = [(GEORPScorecard *)&v8 description];
  id v5 = [(GEORPScorecard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPScorecard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 version];
    if (v5) {
      [v4 setObject:v5 forKey:@"version"];
    }

    if (*(unsigned char *)(a1 + 48))
    {
      objc_super v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
      [v4 setObject:v6 forKey:@"recommended"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = *(id *)(a1 + 16);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"categoryRatings";
      }
      else {
        v15 = @"category_ratings";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v17);
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
  return -[GEORPScorecard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPScorecard)initWithDictionary:(id)a3
{
  return (GEORPScorecard *)-[GEORPScorecard _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = (void *)[v6 copy];
        [a1 setVersion:v7];
      }
      id v8 = [v5 objectForKeyedSubscript:@"recommended"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRecommended:", objc_msgSend(v8, "BOOLValue"));
      }

      if (a3) {
        uint64_t v9 = @"categoryRatings";
      }
      else {
        uint64_t v9 = @"category_ratings";
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [GEORPCategoryRating alloc];
                if (a3) {
                  uint64_t v18 = [(GEORPCategoryRating *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEORPCategoryRating *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addCategoryRatings:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        uint64_t v10 = v21;
      }
    }
  }

  return a1;
}

- (GEORPScorecard)initWithJSON:(id)a3
{
  return (GEORPScorecard *)-[GEORPScorecard _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_433;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_434;
    }
    GEORPScorecardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPScorecardCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPScorecardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPScorecardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPScorecardIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPScorecard *)self readAll:0];
    if (self->_version) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_categoryRatings;
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
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPScorecard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version) {
    objc_msgSend(v8, "setVersion:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v8 + 44) = self->_recommended;
    *((unsigned char *)v8 + 48) |= 1u;
  }
  if ([(GEORPScorecard *)self categoryRatingsCount])
  {
    [v8 clearCategoryRatings];
    unint64_t v4 = [(GEORPScorecard *)self categoryRatingsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPScorecard *)self categoryRatingsAtIndex:i];
        [v8 addCategoryRatings:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPScorecardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPScorecard *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_version copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 44) = self->_recommended;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_categoryRatings;
  uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addCategoryRatings:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEORPScorecard *)self readAll:1];
  [v4 readAll:1];
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_recommended)
      {
        if (*((unsigned char *)v4 + 44)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 44))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 48)) {
    goto LABEL_8;
  }
LABEL_14:
  categoryRatings = self->_categoryRatings;
  if ((unint64_t)categoryRatings | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](categoryRatings, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPScorecard *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_version hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_recommended;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSMutableArray *)self->_categoryRatings hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEORPScorecard setVersion:](self, "setVersion:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_recommended = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPScorecard addCategoryRatings:](self, "addCategoryRatings:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_categoryRatings, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end