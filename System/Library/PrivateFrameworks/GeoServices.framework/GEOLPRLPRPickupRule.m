@interface GEOLPRLPRPickupRule
+ (BOOL)isValid:(id)a3;
+ (Class)pickupCharType;
- (BOOL)hasPrLicensePlateStructure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLPRPickupRule)init;
- (GEOLPRLPRPickupRule)initWithData:(id)a3;
- (GEOLPRLPRPickupRule)initWithDictionary:(id)a3;
- (GEOLPRLPRPickupRule)initWithJSON:(id)a3;
- (GEOLPRLicensePlateStructure)prLicensePlateStructure;
- (NSMutableArray)pickupChars;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pickupCharAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pickupCharsCount;
- (unint64_t)plateTypeIndexesCount;
- (unsigned)plateTypeIndexes;
- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3;
- (void)_addNoFlagsPickupChar:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPickupChars;
- (void)_readPlateTypeIndexes;
- (void)_readPrLicensePlateStructure;
- (void)addPickupChar:(id)a3;
- (void)addPlateTypeIndexes:(unsigned int)a3;
- (void)clearPickupChars;
- (void)clearPlateTypeIndexes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPickupChars:(id)a3;
- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPrLicensePlateStructure:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLPRPickupRule

- (GEOLPRLPRPickupRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRPickupRule;
  v2 = [(GEOLPRLPRPickupRule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRPickupRule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRPickupRule;
  v3 = [(GEOLPRLPRPickupRule *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRLPRPickupRule;
  [(GEOLPRLPRPickupRule *)&v3 dealloc];
}

- (void)_readPlateTypeIndexes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRPickupRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags_381);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)plateTypeIndexesCount
{
  return self->_plateTypeIndexes.count;
}

- (unsigned)plateTypeIndexes
{
  return self->_plateTypeIndexes.list;
}

- (void)clearPlateTypeIndexes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addPlateTypeIndexes:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRPickupRule _readPlateTypeIndexes]((uint64_t)self);
  p_plateTypeIndexes = &self->_plateTypeIndexes;
  unint64_t count = self->_plateTypeIndexes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_plateTypeIndexes->list[a3];
}

- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_plateTypeIndexes, a3, a4);
}

- (void)_readPickupChars
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
        GEOLPRLPRPickupRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPickupChars_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)pickupChars
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  pickupChars = self->_pickupChars;

  return pickupChars;
}

- (void)setPickupChars:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  pickupChars = self->_pickupChars;
  self->_pickupChars = v4;
}

- (void)clearPickupChars
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  pickupChars = self->_pickupChars;

  [(NSMutableArray *)pickupChars removeAllObjects];
}

- (void)addPickupChar:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  -[GEOLPRLPRPickupRule _addNoFlagsPickupChar:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsPickupChar:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)pickupCharsCount
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  pickupChars = self->_pickupChars;

  return [(NSMutableArray *)pickupChars count];
}

- (id)pickupCharAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRPickupRule _readPickupChars]((uint64_t)self);
  pickupChars = self->_pickupChars;

  return (id)[(NSMutableArray *)pickupChars objectAtIndex:a3];
}

+ (Class)pickupCharType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLPRPickupRule;
  id v4 = [(GEOLPRLPRPickupRule *)&v8 description];
  id v5 = [(GEOLPRLPRPickupRule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRPickupRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"plateTypeIndexes";
      }
      else {
        objc_super v6 = @"plate_type_indexes";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 40) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v21);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v21);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"pickupChar";
      }
      else {
        v15 = @"pickup_char";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v21);
    }
    v16 = [(id)a1 prLicensePlateStructure];
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"prLicensePlateStructure";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"pr_license_plate_structure";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEOLPRLPRPickupRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRPickupRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRPickupRule *)-[GEOLPRLPRPickupRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"plateTypeIndexes";
      }
      else {
        objc_super v6 = @"plate_type_indexes";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v31 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue"));
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v10);
        }

        id v5 = v31;
      }

      if (a3) {
        v14 = @"pickupChar";
      }
      else {
        v14 = @"pickup_char";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v22 = [GEOLPRTargetChar alloc];
                if (a3) {
                  uint64_t v23 = [(GEOLPRTargetChar *)v22 initWithJSON:v21];
                }
                else {
                  uint64_t v23 = [(GEOLPRTargetChar *)v22 initWithDictionary:v21];
                }
                long long v24 = (void *)v23;
                [a1 addPickupChar:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v18);
        }

        id v5 = v31;
      }

      if (a3) {
        v25 = @"prLicensePlateStructure";
      }
      else {
        v25 = @"pr_license_plate_structure";
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEOLPRLicensePlateStructure alloc];
        if (a3) {
          uint64_t v28 = [(GEOLPRLicensePlateStructure *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOLPRLicensePlateStructure *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setPrLicensePlateStructure:v28];
      }
    }
  }

  return a1;
}

- (GEOLPRLPRPickupRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRPickupRule *)-[GEOLPRLPRPickupRule _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_394_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_395_0;
    }
    GEOLPRLPRPickupRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLPRPickupRuleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRPickupRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRPickupRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOLPRLPRPickupRuleIsDirty((uint64_t)self))
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
    [(GEOLPRLPRPickupRule *)self readAll:0];
    if (self->_plateTypeIndexes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_plateTypeIndexes.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_pickupChars;
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

    if (self->_prLicensePlateStructure) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEOLPRLPRPickupRule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRLPRPickupRule *)self plateTypeIndexesCount])
  {
    [v11 clearPlateTypeIndexes];
    unint64_t v4 = [(GEOLPRLPRPickupRule *)self plateTypeIndexesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPlateTypeIndexes:", -[GEOLPRLPRPickupRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if ([(GEOLPRLPRPickupRule *)self pickupCharsCount])
  {
    [v11 clearPickupChars];
    unint64_t v7 = [(GEOLPRLPRPickupRule *)self pickupCharsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOLPRLPRPickupRule *)self pickupCharAtIndex:j];
        [v11 addPickupChar:v10];
      }
    }
  }
  if (self->_prLicensePlateStructure) {
    objc_msgSend(v11, "setPrLicensePlateStructure:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRLPRPickupRuleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLPRPickupRule *)self readAll:0];
  PBRepeatedUInt32Copy();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v8 = self->_pickupChars;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addPickupChar:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOLPRLicensePlateStructure *)self->_prLicensePlateStructure copyWithZone:a3];
  long long v14 = (void *)v5[6];
  v5[6] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLPRLPRPickupRule *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt32IsEqual())
    && ((pickupChars = self->_pickupChars, !((unint64_t)pickupChars | v4[5]))
     || -[NSMutableArray isEqual:](pickupChars, "isEqual:")))
  {
    prLicensePlateStructure = self->_prLicensePlateStructure;
    if ((unint64_t)prLicensePlateStructure | v4[6]) {
      char v7 = -[GEOLPRLicensePlateStructure isEqual:](prLicensePlateStructure, "isEqual:");
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
  [(GEOLPRLPRPickupRule *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_pickupChars hash] ^ v3;
  return v4 ^ [(GEOLPRLicensePlateStructure *)self->_prLicensePlateStructure hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 plateTypeIndexesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOLPRLPRPickupRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", [v4 plateTypeIndexesAtIndex:i]);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v4[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOLPRLPRPickupRule addPickupChar:](self, "addPickupChar:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  prLicensePlateStructure = self->_prLicensePlateStructure;
  id v14 = v4[6];
  if (prLicensePlateStructure)
  {
    if (v14) {
      -[GEOLPRLicensePlateStructure mergeFrom:](prLicensePlateStructure, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOLPRLPRPickupRule setPrLicensePlateStructure:](self, "setPrLicensePlateStructure:");
  }
}

- (void)_readPrLicensePlateStructure
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
        GEOLPRLPRPickupRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrLicensePlateStructure_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPrLicensePlateStructure
{
  return self->_prLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)prLicensePlateStructure
{
  -[GEOLPRLPRPickupRule _readPrLicensePlateStructure]((uint64_t)self);
  prLicensePlateStructure = self->_prLicensePlateStructure;

  return prLicensePlateStructure;
}

- (void)setPrLicensePlateStructure:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_prLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prLicensePlateStructure, 0);
  objc_storeStrong((id *)&self->_pickupChars, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end