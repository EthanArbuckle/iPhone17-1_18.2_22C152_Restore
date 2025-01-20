@interface GEORestrictionInfo
+ (BOOL)isValid:(id)a3;
+ (Class)restrictionDetailsType;
- (BOOL)hasEffectiveTimeRange;
- (BOOL)hasSubTitleString;
- (BOOL)hasTitleString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)effectiveTimeRange;
- (GEOFormattedString)subTitleString;
- (GEOFormattedString)titleString;
- (GEORestrictionInfo)init;
- (GEORestrictionInfo)initWithData:(id)a3;
- (GEORestrictionInfo)initWithDictionary:(id)a3;
- (GEORestrictionInfo)initWithJSON:(id)a3;
- (NSMutableArray)restrictionDetails;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)restrictionDetailsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)restrictionDetailsCount;
- (void)_addNoFlagsRestrictionDetails:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEffectiveTimeRange;
- (void)_readRestrictionDetails;
- (void)_readSubTitleString;
- (void)_readTitleString;
- (void)addRestrictionDetails:(id)a3;
- (void)clearRestrictionDetails;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEffectiveTimeRange:(id)a3;
- (void)setRestrictionDetails:(id)a3;
- (void)setSubTitleString:(id)a3;
- (void)setTitleString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORestrictionInfo

- (GEORestrictionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORestrictionInfo;
  v2 = [(GEORestrictionInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORestrictionInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORestrictionInfo;
  v3 = [(GEORestrictionInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitleString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORestrictionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitleString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitleString
{
  return self->_titleString != 0;
}

- (GEOFormattedString)titleString
{
  -[GEORestrictionInfo _readTitleString]((uint64_t)self);
  titleString = self->_titleString;

  return titleString;
}

- (void)setTitleString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (void)_readSubTitleString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORestrictionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubTitleString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSubTitleString
{
  return self->_subTitleString != 0;
}

- (GEOFormattedString)subTitleString
{
  -[GEORestrictionInfo _readSubTitleString]((uint64_t)self);
  subTitleString = self->_subTitleString;

  return subTitleString;
}

- (void)setSubTitleString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_subTitleString, a3);
}

- (void)_readEffectiveTimeRange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORestrictionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEffectiveTimeRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasEffectiveTimeRange
{
  return self->_effectiveTimeRange != 0;
}

- (GEOFormattedString)effectiveTimeRange
{
  -[GEORestrictionInfo _readEffectiveTimeRange]((uint64_t)self);
  effectiveTimeRange = self->_effectiveTimeRange;

  return effectiveTimeRange;
}

- (void)setEffectiveTimeRange:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_effectiveTimeRange, a3);
}

- (void)_readRestrictionDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORestrictionInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRestrictionDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)restrictionDetails
{
  -[GEORestrictionInfo _readRestrictionDetails]((uint64_t)self);
  restrictionDetails = self->_restrictionDetails;

  return restrictionDetails;
}

- (void)setRestrictionDetails:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  restrictionDetails = self->_restrictionDetails;
  self->_restrictionDetails = v4;
}

- (void)clearRestrictionDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  restrictionDetails = self->_restrictionDetails;

  [(NSMutableArray *)restrictionDetails removeAllObjects];
}

- (void)addRestrictionDetails:(id)a3
{
  id v4 = a3;
  -[GEORestrictionInfo _readRestrictionDetails]((uint64_t)self);
  -[GEORestrictionInfo _addNoFlagsRestrictionDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsRestrictionDetails:(uint64_t)a1
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

- (unint64_t)restrictionDetailsCount
{
  -[GEORestrictionInfo _readRestrictionDetails]((uint64_t)self);
  restrictionDetails = self->_restrictionDetails;

  return [(NSMutableArray *)restrictionDetails count];
}

- (id)restrictionDetailsAtIndex:(unint64_t)a3
{
  -[GEORestrictionInfo _readRestrictionDetails]((uint64_t)self);
  restrictionDetails = self->_restrictionDetails;

  return (id)[(NSMutableArray *)restrictionDetails objectAtIndex:a3];
}

+ (Class)restrictionDetailsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORestrictionInfo;
  id v4 = [(GEORestrictionInfo *)&v8 description];
  id v5 = [(GEORestrictionInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORestrictionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 titleString];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"titleString";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"title_string";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 subTitleString];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"subTitleString";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"sub_title_string";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 effectiveTimeRange];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"effectiveTimeRange";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"effective_time_range";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v20);
      }

      if (a2) {
        v25 = @"restrictionDetails";
      }
      else {
        v25 = @"restriction_details";
      }
      [v4 setObject:v17 forKey:v25];
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
        v33[2] = __48__GEORestrictionInfo__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORestrictionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORestrictionInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORestrictionInfo)initWithDictionary:(id)a3
{
  return (GEORestrictionInfo *)-[GEORestrictionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"titleString";
      }
      else {
        objc_super v6 = @"title_string";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setTitleString:v9];
      }
      if (a3) {
        v11 = @"subTitleString";
      }
      else {
        v11 = @"sub_title_string";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setSubTitleString:v14];
      }
      if (a3) {
        v16 = @"effectiveTimeRange";
      }
      else {
        v16 = @"effective_time_range";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithDictionary:v17];
        }
        uint64_t v20 = (void *)v19;
        [a1 setEffectiveTimeRange:v19];
      }
      if (a3) {
        uint64_t v21 = @"restrictionDetails";
      }
      else {
        uint64_t v21 = @"restriction_details";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v29 = [GEORestrictionDetails alloc];
                if (a3) {
                  uint64_t v30 = [(GEORestrictionDetails *)v29 initWithJSON:v28];
                }
                else {
                  uint64_t v30 = [(GEORestrictionDetails *)v29 initWithDictionary:v28];
                }
                id v31 = (void *)v30;
                [a1 addRestrictionDetails:v30];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v25);
        }

        id v5 = v33;
      }
    }
  }

  return a1;
}

- (GEORestrictionInfo)initWithJSON:(id)a3
{
  return (GEORestrictionInfo *)-[GEORestrictionInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_4951;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_4952;
    }
    GEORestrictionInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORestrictionInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORestrictionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORestrictionInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORestrictionInfoIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORestrictionInfo *)self readAll:0];
    if (self->_titleString) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_subTitleString) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_effectiveTimeRange) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_restrictionDetails;
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

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORestrictionInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_titleString) {
    objc_msgSend(v8, "setTitleString:");
  }
  if (self->_subTitleString) {
    objc_msgSend(v8, "setSubTitleString:");
  }
  if (self->_effectiveTimeRange) {
    objc_msgSend(v8, "setEffectiveTimeRange:");
  }
  if ([(GEORestrictionInfo *)self restrictionDetailsCount])
  {
    [v8 clearRestrictionDetails];
    unint64_t v4 = [(GEORestrictionInfo *)self restrictionDetailsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORestrictionInfo *)self restrictionDetailsAtIndex:i];
        [v8 addRestrictionDetails:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      GEORestrictionInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORestrictionInfo *)self readAll:0];
  id v8 = [(GEOFormattedString *)self->_titleString copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  id v10 = [(GEOFormattedString *)self->_subTitleString copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOFormattedString *)self->_effectiveTimeRange copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v14 = self->_restrictionDetails;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [(id)v5 addRestrictionDetails:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORestrictionInfo *)self readAll:1],
         [v4 readAll:1],
         titleString = self->_titleString,
         !((unint64_t)titleString | v4[6]))
     || -[GEOFormattedString isEqual:](titleString, "isEqual:"))
    && ((subTitleString = self->_subTitleString, !((unint64_t)subTitleString | v4[5]))
     || -[GEOFormattedString isEqual:](subTitleString, "isEqual:"))
    && ((effectiveTimeRange = self->_effectiveTimeRange, !((unint64_t)effectiveTimeRange | v4[3]))
     || -[GEOFormattedString isEqual:](effectiveTimeRange, "isEqual:")))
  {
    restrictionDetails = self->_restrictionDetails;
    if ((unint64_t)restrictionDetails | v4[4]) {
      char v9 = -[NSMutableArray isEqual:](restrictionDetails, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEORestrictionInfo *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_titleString hash];
  unint64_t v4 = [(GEOFormattedString *)self->_subTitleString hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_effectiveTimeRange hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_restrictionDetails hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  titleString = self->_titleString;
  id v6 = v4[6];
  if (titleString)
  {
    if (v6) {
      -[GEOFormattedString mergeFrom:](titleString, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORestrictionInfo setTitleString:](self, "setTitleString:");
  }
  subTitleString = self->_subTitleString;
  id v8 = v4[5];
  if (subTitleString)
  {
    if (v8) {
      -[GEOFormattedString mergeFrom:](subTitleString, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORestrictionInfo setSubTitleString:](self, "setSubTitleString:");
  }
  effectiveTimeRange = self->_effectiveTimeRange;
  id v10 = v4[3];
  if (effectiveTimeRange)
  {
    if (v10) {
      -[GEOFormattedString mergeFrom:](effectiveTimeRange, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORestrictionInfo setEffectiveTimeRange:](self, "setEffectiveTimeRange:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4[4];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEORestrictionInfo addRestrictionDetails:](self, "addRestrictionDetails:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
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
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORestrictionInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4956);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORestrictionInfo *)self readAll:0];
    [(GEOFormattedString *)self->_titleString clearUnknownFields:1];
    [(GEOFormattedString *)self->_subTitleString clearUnknownFields:1];
    [(GEOFormattedString *)self->_effectiveTimeRange clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_restrictionDetails;
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
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_subTitleString, 0);
  objc_storeStrong((id *)&self->_restrictionDetails, 0);
  objc_storeStrong((id *)&self->_effectiveTimeRange, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end