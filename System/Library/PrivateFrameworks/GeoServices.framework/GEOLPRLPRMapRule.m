@interface GEOLPRLPRMapRule
+ (BOOL)isValid:(id)a3;
+ (Class)targetCharType;
+ (Class)valueMappingType;
- (BOOL)hasMrLicensePlateStructure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLPRMapRule)init;
- (GEOLPRLPRMapRule)initWithData:(id)a3;
- (GEOLPRLPRMapRule)initWithDictionary:(id)a3;
- (GEOLPRLPRMapRule)initWithJSON:(id)a3;
- (GEOLPRLicensePlateStructure)mrLicensePlateStructure;
- (NSMutableArray)targetChars;
- (NSMutableArray)valueMappings;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)targetCharAtIndex:(unint64_t)a3;
- (id)valueMappingAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)plateTypeIndexesCount;
- (unint64_t)targetCharsCount;
- (unint64_t)valueMappingsCount;
- (unsigned)plateTypeIndexes;
- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3;
- (void)_addNoFlagsTargetChar:(uint64_t)a1;
- (void)_addNoFlagsValueMapping:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMrLicensePlateStructure;
- (void)_readPlateTypeIndexes;
- (void)_readTargetChars;
- (void)_readValueMappings;
- (void)addPlateTypeIndexes:(unsigned int)a3;
- (void)addTargetChar:(id)a3;
- (void)addValueMapping:(id)a3;
- (void)clearPlateTypeIndexes;
- (void)clearTargetChars;
- (void)clearValueMappings;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMrLicensePlateStructure:(id)a3;
- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTargetChars:(id)a3;
- (void)setValueMappings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLPRMapRule

- (GEOLPRLPRMapRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRMapRule;
  v2 = [(GEOLPRLPRMapRule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRMapRule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRMapRule;
  v3 = [(GEOLPRLPRMapRule *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOLPRLPRMapRule;
  [(GEOLPRLPRMapRule *)&v3 dealloc];
}

- (void)_readPlateTypeIndexes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags_325);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
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
  *(unsigned char *)&self->_flags |= 0x10u;

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
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRMapRule _readPlateTypeIndexes]((uint64_t)self);
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
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_plateTypeIndexes, a3, a4);
}

- (void)_readTargetChars
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTargetChars_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)targetChars
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  targetChars = self->_targetChars;

  return targetChars;
}

- (void)setTargetChars:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  targetChars = self->_targetChars;
  self->_targetChars = v4;
}

- (void)clearTargetChars
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  targetChars = self->_targetChars;

  [(NSMutableArray *)targetChars removeAllObjects];
}

- (void)addTargetChar:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  -[GEOLPRLPRMapRule _addNoFlagsTargetChar:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsTargetChar:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)targetCharsCount
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  targetChars = self->_targetChars;

  return [(NSMutableArray *)targetChars count];
}

- (id)targetCharAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  targetChars = self->_targetChars;

  return (id)[(NSMutableArray *)targetChars objectAtIndex:a3];
}

+ (Class)targetCharType
{
  return (Class)objc_opt_class();
}

- (void)_readValueMappings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValueMappings_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)valueMappings
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  valueMappings = self->_valueMappings;

  return valueMappings;
}

- (void)setValueMappings:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  valueMappings = self->_valueMappings;
  self->_valueMappings = v4;
}

- (void)clearValueMappings
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  valueMappings = self->_valueMappings;

  [(NSMutableArray *)valueMappings removeAllObjects];
}

- (void)addValueMapping:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  -[GEOLPRLPRMapRule _addNoFlagsValueMapping:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsValueMapping:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)valueMappingsCount
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  valueMappings = self->_valueMappings;

  return [(NSMutableArray *)valueMappings count];
}

- (id)valueMappingAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  valueMappings = self->_valueMappings;

  return (id)[(NSMutableArray *)valueMappings objectAtIndex:a3];
}

+ (Class)valueMappingType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLPRMapRule;
  id v4 = [(GEOLPRLPRMapRule *)&v8 description];
  id v5 = [(GEOLPRLPRMapRule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRMapRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
    if ([*(id *)(a1 + 48) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v8 = *(id *)(a1 + 48);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"targetChar";
      }
      else {
        v15 = @"target_char";
      }
      [v4 setObject:v7 forKey:v15];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v17 = *(id *)(a1 + 56);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = objc_msgSend(v22, "dictionaryRepresentation", (void)v30);
            }
            objc_msgSend(v16, "addObject:", v23, (void)v30);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"valueMapping";
      }
      else {
        v24 = @"value_mapping";
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v24, (void)v30);
    }
    v25 = [(id)a1 mrLicensePlateStructure];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"mrLicensePlateStructure";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"mr_license_plate_structure";
      }
      [v4 setObject:v27 forKey:v28];
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
  return -[GEOLPRLPRMapRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRMapRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRMapRule *)-[GEOLPRLPRMapRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
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
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v52 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue"));
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"targetChar";
      }
      else {
        v14 = @"target_char";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      id v42 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v48 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = [GEOLPRTargetChar alloc];
                if (a3) {
                  uint64_t v23 = [(GEOLPRTargetChar *)v22 initWithJSON:v21];
                }
                else {
                  uint64_t v23 = [(GEOLPRTargetChar *)v22 initWithDictionary:v21];
                }
                v24 = (void *)v23;
                [a1 addTargetChar:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v18);
        }

        id v5 = v42;
      }

      if (a3) {
        v25 = @"valueMapping";
      }
      else {
        v25 = @"value_mapping";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v44;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v44 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v33 = [GEOLPRValueMapping alloc];
                if (a3) {
                  uint64_t v34 = [(GEOLPRValueMapping *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEOLPRValueMapping *)v33 initWithDictionary:v32];
                }
                long long v35 = (void *)v34;
                [a1 addValueMapping:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v29);
        }

        id v5 = v42;
      }

      if (a3) {
        long long v36 = @"mrLicensePlateStructure";
      }
      else {
        long long v36 = @"mr_license_plate_structure";
      }
      long long v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = [GEOLPRLicensePlateStructure alloc];
        if (a3) {
          uint64_t v39 = [(GEOLPRLicensePlateStructure *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEOLPRLicensePlateStructure *)v38 initWithDictionary:v37];
        }
        uint64_t v40 = (void *)v39;
        [a1 setMrLicensePlateStructure:v39];
      }
    }
  }

  return a1;
}

- (GEOLPRLPRMapRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRMapRule *)-[GEOLPRLPRMapRule _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_345;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_346;
    }
    GEOLPRLPRMapRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLPRMapRuleCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRMapRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRMapRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLPRMapRuleIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLPRMapRule *)self readAll:0];
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
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_targetChars;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_valueMappings;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    if (self->_mrLicensePlateStructure) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v15 = (id *)a3;
  [(GEOLPRLPRMapRule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRLPRMapRule *)self plateTypeIndexesCount])
  {
    [v15 clearPlateTypeIndexes];
    unint64_t v4 = [(GEOLPRLPRMapRule *)self plateTypeIndexesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v15, "addPlateTypeIndexes:", -[GEOLPRLPRMapRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if ([(GEOLPRLPRMapRule *)self targetCharsCount])
  {
    [v15 clearTargetChars];
    unint64_t v7 = [(GEOLPRLPRMapRule *)self targetCharsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOLPRLPRMapRule *)self targetCharAtIndex:j];
        [v15 addTargetChar:v10];
      }
    }
  }
  if ([(GEOLPRLPRMapRule *)self valueMappingsCount])
  {
    [v15 clearValueMappings];
    unint64_t v11 = [(GEOLPRLPRMapRule *)self valueMappingsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        v14 = [(GEOLPRLPRMapRule *)self valueMappingAtIndex:k];
        [v15 addValueMapping:v14];
      }
    }
  }
  if (self->_mrLicensePlateStructure) {
    objc_msgSend(v15, "setMrLicensePlateStructure:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRLPRMapRuleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLPRMapRule *)self readAll:0];
  PBRepeatedUInt32Copy();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_targetChars;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v5 addTargetChar:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = self->_valueMappings;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [v5 addValueMapping:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOLPRLicensePlateStructure *)self->_mrLicensePlateStructure copyWithZone:a3];
  long long v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLPRLPRMapRule *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt32IsEqual())
    && ((targetChars = self->_targetChars, !((unint64_t)targetChars | v4[6]))
     || -[NSMutableArray isEqual:](targetChars, "isEqual:"))
    && ((valueMappings = self->_valueMappings, !((unint64_t)valueMappings | v4[7]))
     || -[NSMutableArray isEqual:](valueMappings, "isEqual:")))
  {
    mrLicensePlateStructure = self->_mrLicensePlateStructure;
    if ((unint64_t)mrLicensePlateStructure | v4[5]) {
      char v8 = -[GEOLPRLicensePlateStructure isEqual:](mrLicensePlateStructure, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOLPRLPRMapRule *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_targetChars hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_valueMappings hash];
  return v4 ^ v5 ^ [(GEOLPRLicensePlateStructure *)self->_mrLicensePlateStructure hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 plateTypeIndexesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOLPRLPRMapRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", [v4 plateTypeIndexesAtIndex:i]);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOLPRLPRMapRule *)self addTargetChar:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v4[7];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOLPRLPRMapRule addValueMapping:](self, "addValueMapping:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  mrLicensePlateStructure = self->_mrLicensePlateStructure;
  id v19 = v4[5];
  if (mrLicensePlateStructure)
  {
    if (v19) {
      -[GEOLPRLicensePlateStructure mergeFrom:](mrLicensePlateStructure, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOLPRLPRMapRule setMrLicensePlateStructure:](self, "setMrLicensePlateStructure:");
  }
}

- (void)_readMrLicensePlateStructure
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMrLicensePlateStructure_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMrLicensePlateStructure
{
  return self->_mrLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)mrLicensePlateStructure
{
  -[GEOLPRLPRMapRule _readMrLicensePlateStructure]((uint64_t)self);
  mrLicensePlateStructure = self->_mrLicensePlateStructure;

  return mrLicensePlateStructure;
}

- (void)setMrLicensePlateStructure:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_mrLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMappings, 0);
  objc_storeStrong((id *)&self->_targetChars, 0);
  objc_storeStrong((id *)&self->_mrLicensePlateStructure, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end