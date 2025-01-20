@interface GEOSnapScoreSegment
+ (BOOL)isValid:(id)a3;
+ (Class)attributeType;
+ (Class)categoryScoreType;
- (BOOL)hasGeoId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOverallScore;
- (BOOL)hasPointOnLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)pointOnLine;
- (GEOSnapScoreSegment)init;
- (GEOSnapScoreSegment)initWithData:(id)a3;
- (GEOSnapScoreSegment)initWithDictionary:(id)a3;
- (GEOSnapScoreSegment)initWithJSON:(id)a3;
- (NSMutableArray)attributes;
- (NSMutableArray)categoryScores;
- (PBUnknownFields)unknownFields;
- (float)overallScore;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributeAtIndex:(unint64_t)a3;
- (id)categoryScoreAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)attributesCount;
- (unint64_t)categoryScoresCount;
- (unint64_t)geoId;
- (unint64_t)hash;
- (void)_addNoFlagsAttribute:(uint64_t)a1;
- (void)_addNoFlagsCategoryScore:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAttributes;
- (void)_readCategoryScores;
- (void)_readPointOnLine;
- (void)addAttribute:(id)a3;
- (void)addCategoryScore:(id)a3;
- (void)clearAttributes;
- (void)clearCategoryScores;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setCategoryScores:(id)a3;
- (void)setGeoId:(unint64_t)a3;
- (void)setHasGeoId:(BOOL)a3;
- (void)setHasOverallScore:(BOOL)a3;
- (void)setOverallScore:(float)a3;
- (void)setPointOnLine:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSnapScoreSegment

- (GEOSnapScoreSegment)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSnapScoreSegment;
  v2 = [(GEOSnapScoreSegment *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSnapScoreSegment)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSnapScoreSegment;
  v3 = [(GEOSnapScoreSegment *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)geoId
{
  return self->_geoId;
}

- (void)setGeoId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_geoId = a3;
}

- (void)setHasGeoId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasGeoId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPointOnLine
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
        GEOSnapScoreSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPointOnLine_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPointOnLine
{
  return self->_pointOnLine != 0;
}

- (GEOLatLng)pointOnLine
{
  -[GEOSnapScoreSegment _readPointOnLine]((uint64_t)self);
  pointOnLine = self->_pointOnLine;

  return pointOnLine;
}

- (void)setPointOnLine:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_pointOnLine, a3);
}

- (float)overallScore
{
  return self->_overallScore;
}

- (void)setOverallScore:(float)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_overallScore = a3;
}

- (void)setHasOverallScore:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOverallScore
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readCategoryScores
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
        GEOSnapScoreSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryScores_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)categoryScores
{
  -[GEOSnapScoreSegment _readCategoryScores]((uint64_t)self);
  categoryScores = self->_categoryScores;

  return categoryScores;
}

- (void)setCategoryScores:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  categoryScores = self->_categoryScores;
  self->_categoryScores = v4;
}

- (void)clearCategoryScores
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  categoryScores = self->_categoryScores;

  [(NSMutableArray *)categoryScores removeAllObjects];
}

- (void)addCategoryScore:(id)a3
{
  id v4 = a3;
  -[GEOSnapScoreSegment _readCategoryScores]((uint64_t)self);
  -[GEOSnapScoreSegment _addNoFlagsCategoryScore:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsCategoryScore:(uint64_t)a1
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

- (unint64_t)categoryScoresCount
{
  -[GEOSnapScoreSegment _readCategoryScores]((uint64_t)self);
  categoryScores = self->_categoryScores;

  return [(NSMutableArray *)categoryScores count];
}

- (id)categoryScoreAtIndex:(unint64_t)a3
{
  -[GEOSnapScoreSegment _readCategoryScores]((uint64_t)self);
  categoryScores = self->_categoryScores;

  return (id)[(NSMutableArray *)categoryScores objectAtIndex:a3];
}

+ (Class)categoryScoreType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributes
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
        GEOSnapScoreSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)attributes
{
  -[GEOSnapScoreSegment _readAttributes]((uint64_t)self);
  attributes = self->_attributes;

  return attributes;
}

- (void)setAttributes:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  attributes = self->_attributes;
  self->_attributes = v4;
}

- (void)clearAttributes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  attributes = self->_attributes;

  [(NSMutableArray *)attributes removeAllObjects];
}

- (void)addAttribute:(id)a3
{
  id v4 = a3;
  -[GEOSnapScoreSegment _readAttributes]((uint64_t)self);
  -[GEOSnapScoreSegment _addNoFlagsAttribute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsAttribute:(uint64_t)a1
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

- (unint64_t)attributesCount
{
  -[GEOSnapScoreSegment _readAttributes]((uint64_t)self);
  attributes = self->_attributes;

  return [(NSMutableArray *)attributes count];
}

- (id)attributeAtIndex:(unint64_t)a3
{
  -[GEOSnapScoreSegment _readAttributes]((uint64_t)self);
  attributes = self->_attributes;

  return (id)[(NSMutableArray *)attributes objectAtIndex:a3];
}

+ (Class)attributeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSnapScoreSegment;
  id v4 = [(GEOSnapScoreSegment *)&v8 description];
  id v5 = [(GEOSnapScoreSegment *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSnapScoreSegment _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        objc_super v6 = @"geoId";
      }
      else {
        objc_super v6 = @"geo_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = [(id)a1 pointOnLine];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"pointOnLine";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"point_on_line";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      LODWORD(v11) = *(_DWORD *)(a1 + 68);
      v12 = [NSNumber numberWithFloat:v11];
      if (a2) {
        v13 = @"overallScore";
      }
      else {
        v13 = @"overall_score";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"categoryScore";
      }
      else {
        v22 = @"category_score";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if (*(void *)(a1 + 24))
    {
      v23 = [(id)a1 attributes];
      [v4 setObject:v23 forKey:@"attribute"];
    }
    v24 = *(void **)(a1 + 16);
    if (v24)
    {
      v25 = [v24 dictionaryRepresentation];
      v26 = v25;
      if (a2)
      {
        v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __49__GEOSnapScoreSegment__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v28 = v27;
        id v32 = v28;
        [v26 enumerateKeysAndObjectsUsingBlock:v31];
        id v29 = v28;

        v26 = v29;
      }
      [v4 setObject:v26 forKey:@"Unknown Fields"];
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
  return -[GEOSnapScoreSegment _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOSnapScoreSegment__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSnapScoreSegment)initWithDictionary:(id)a3
{
  return (GEOSnapScoreSegment *)-[GEOSnapScoreSegment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"geoId";
      }
      else {
        objc_super v6 = @"geo_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setGeoId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        objc_super v8 = @"pointOnLine";
      }
      else {
        objc_super v8 = @"point_on_line";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setPointOnLine:v11];
      }
      if (a3) {
        v13 = @"overallScore";
      }
      else {
        v13 = @"overall_score";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 floatValue];
        objc_msgSend(a1, "setOverallScore:");
      }

      if (a3) {
        id v15 = @"categoryScore";
      }
      else {
        id v15 = @"category_score";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v40 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [GEOScoreCategory alloc];
                if (a3) {
                  uint64_t v24 = [(GEOScoreCategory *)v23 initWithJSON:v22];
                }
                else {
                  uint64_t v24 = [(GEOScoreCategory *)v23 initWithDictionary:v22];
                }
                v25 = (void *)v24;
                [a1 addCategoryScore:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v19);
        }
      }
      v26 = [v5 objectForKeyedSubscript:@"attribute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v36 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v33 = (void *)[v32 copy];
                [a1 addAttribute:v33];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v29);
        }
      }
    }
  }

  return a1;
}

- (GEOSnapScoreSegment)initWithJSON:(id)a3
{
  return (GEOSnapScoreSegment *)-[GEOSnapScoreSegment _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_6921;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6922;
    }
    GEOSnapScoreSegmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOSnapScoreSegmentCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSnapScoreSegmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSnapScoreSegmentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
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
    [(GEOSnapScoreSegment *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_pointOnLine) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteFloatField();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_categoryScores;
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

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_attributes;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOSnapScoreSegment _readPointOnLine]((uint64_t)self);
  pointOnLine = self->_pointOnLine;

  return [(GEOLatLng *)pointOnLine hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOSnapScoreSegment *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 14) = self->_readerMarkPos;
  *((_DWORD *)v12 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v12[5] = self->_geoId;
    *((unsigned char *)v12 + 72) |= 1u;
  }
  if (self->_pointOnLine) {
    objc_msgSend(v12, "setPointOnLine:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v12 + 17) = LODWORD(self->_overallScore);
    *((unsigned char *)v12 + 72) |= 2u;
  }
  if ([(GEOSnapScoreSegment *)self categoryScoresCount])
  {
    [v12 clearCategoryScores];
    unint64_t v4 = [(GEOSnapScoreSegment *)self categoryScoresCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSnapScoreSegment *)self categoryScoreAtIndex:i];
        [v12 addCategoryScore:v7];
      }
    }
  }
  if ([(GEOSnapScoreSegment *)self attributesCount])
  {
    [v12 clearAttributes];
    unint64_t v8 = [(GEOSnapScoreSegment *)self attributesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOSnapScoreSegment *)self attributeAtIndex:j];
        [v12 addAttribute:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSnapScoreSegmentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSnapScoreSegment *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_geoId;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v9 = [(GEOLatLng *)self->_pointOnLine copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(float *)(v5 + 68) = self->_overallScore;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = self->_categoryScores;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCategoryScore:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_attributes;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [(id)v5 addAttribute:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  long long v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOSnapScoreSegment *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 72);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_geoId != *((void *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_19;
  }
  pointOnLine = self->_pointOnLine;
  if ((unint64_t)pointOnLine | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](pointOnLine, "isEqual:"))
    {
LABEL_19:
      char v10 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_overallScore != *((float *)v4 + 17)) {
      goto LABEL_19;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  categoryScores = self->_categoryScores;
  if ((unint64_t)categoryScores | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](categoryScores, "isEqual:"))
  {
    goto LABEL_19;
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 3)) {
    char v10 = -[NSMutableArray isEqual:](attributes, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  [(GEOSnapScoreSegment *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_geoId;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOLatLng *)self->_pointOnLine hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    float overallScore = self->_overallScore;
    double v7 = overallScore;
    if (overallScore < 0.0) {
      double v7 = -overallScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = v4 ^ v3 ^ v5;
  uint64_t v11 = [(NSMutableArray *)self->_categoryScores hash];
  return v10 ^ v11 ^ [(NSMutableArray *)self->_attributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 72))
  {
    self->_geoId = *((void *)v4 + 5);
    *(unsigned char *)&self->_flags |= 1u;
  }
  pointOnLine = self->_pointOnLine;
  uint64_t v6 = *((void *)v4 + 6);
  if (pointOnLine)
  {
    if (v6) {
      -[GEOLatLng mergeFrom:](pointOnLine, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOSnapScoreSegment setPointOnLine:](self, "setPointOnLine:");
  }
  if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    self->_float overallScore = *((float *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(GEOSnapScoreSegment *)self addCategoryScore:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[GEOSnapScoreSegment addAttribute:](self, "addAttribute:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOSnapScoreSegmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6926);
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
  *(unsigned char *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSnapScoreSegment *)self readAll:0];
    [(GEOLatLng *)self->_pointOnLine clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_categoryScores;
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
  objc_storeStrong((id *)&self->_pointOnLine, 0);
  objc_storeStrong((id *)&self->_categoryScores, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end