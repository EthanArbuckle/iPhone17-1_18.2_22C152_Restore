@interface GEOLPRLPRConvertRule
+ (BOOL)isValid:(id)a3;
+ (Class)fillRuleType;
+ (Class)mapRuleType;
+ (Class)pickupRuleType;
- (BOOL)hasValidEndTime;
- (BOOL)hasValidStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLPRConvertRule)init;
- (GEOLPRLPRConvertRule)initWithData:(id)a3;
- (GEOLPRLPRConvertRule)initWithDictionary:(id)a3;
- (GEOLPRLPRConvertRule)initWithJSON:(id)a3;
- (NSMutableArray)fillRules;
- (NSMutableArray)mapRules;
- (NSMutableArray)pickupRules;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fillRuleAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)mapRuleAtIndex:(unint64_t)a3;
- (id)pickupRuleAtIndex:(unint64_t)a3;
- (unint64_t)fillRulesCount;
- (unint64_t)hash;
- (unint64_t)mapRulesCount;
- (unint64_t)pickupRulesCount;
- (unsigned)validEndTime;
- (unsigned)validStartTime;
- (void)_addNoFlagsFillRule:(uint64_t)a1;
- (void)_addNoFlagsMapRule:(uint64_t)a1;
- (void)_addNoFlagsPickupRule:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFillRules;
- (void)_readMapRules;
- (void)_readPickupRules;
- (void)addFillRule:(id)a3;
- (void)addMapRule:(id)a3;
- (void)addPickupRule:(id)a3;
- (void)clearFillRules;
- (void)clearMapRules;
- (void)clearPickupRules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFillRules:(id)a3;
- (void)setHasValidEndTime:(BOOL)a3;
- (void)setHasValidStartTime:(BOOL)a3;
- (void)setMapRules:(id)a3;
- (void)setPickupRules:(id)a3;
- (void)setValidEndTime:(unsigned int)a3;
- (void)setValidStartTime:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLPRConvertRule

- (GEOLPRLPRConvertRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRConvertRule;
  v2 = [(GEOLPRLPRConvertRule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRConvertRule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRConvertRule;
  v3 = [(GEOLPRLPRConvertRule *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPickupRules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPickupRules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)pickupRules
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  pickupRules = self->_pickupRules;

  return pickupRules;
}

- (void)setPickupRules:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  pickupRules = self->_pickupRules;
  self->_pickupRules = v4;
}

- (void)clearPickupRules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  pickupRules = self->_pickupRules;

  [(NSMutableArray *)pickupRules removeAllObjects];
}

- (void)addPickupRule:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsPickupRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsPickupRule:(uint64_t)a1
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

- (unint64_t)pickupRulesCount
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  pickupRules = self->_pickupRules;

  return [(NSMutableArray *)pickupRules count];
}

- (id)pickupRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  pickupRules = self->_pickupRules;

  return (id)[(NSMutableArray *)pickupRules objectAtIndex:a3];
}

+ (Class)pickupRuleType
{
  return (Class)objc_opt_class();
}

- (void)_readMapRules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)mapRules
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  mapRules = self->_mapRules;

  return mapRules;
}

- (void)setMapRules:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  mapRules = self->_mapRules;
  self->_mapRules = v4;
}

- (void)clearMapRules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  mapRules = self->_mapRules;

  [(NSMutableArray *)mapRules removeAllObjects];
}

- (void)addMapRule:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsMapRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsMapRule:(uint64_t)a1
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

- (unint64_t)mapRulesCount
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  mapRules = self->_mapRules;

  return [(NSMutableArray *)mapRules count];
}

- (id)mapRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  mapRules = self->_mapRules;

  return (id)[(NSMutableArray *)mapRules objectAtIndex:a3];
}

+ (Class)mapRuleType
{
  return (Class)objc_opt_class();
}

- (void)_readFillRules
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFillRules_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)fillRules
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  fillRules = self->_fillRules;

  return fillRules;
}

- (void)setFillRules:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  fillRules = self->_fillRules;
  self->_fillRules = v4;
}

- (void)clearFillRules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  fillRules = self->_fillRules;

  [(NSMutableArray *)fillRules removeAllObjects];
}

- (void)addFillRule:(id)a3
{
  id v4 = a3;
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsFillRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsFillRule:(uint64_t)a1
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

- (unint64_t)fillRulesCount
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  fillRules = self->_fillRules;

  return [(NSMutableArray *)fillRules count];
}

- (id)fillRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  fillRules = self->_fillRules;

  return (id)[(NSMutableArray *)fillRules objectAtIndex:a3];
}

+ (Class)fillRuleType
{
  return (Class)objc_opt_class();
}

- (unsigned)validStartTime
{
  return self->_validStartTime;
}

- (void)setValidStartTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_validStartTime = a3;
}

- (void)setHasValidStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasValidStartTime
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)validEndTime
{
  return self->_validEndTime;
}

- (void)setValidEndTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_validEndTime = a3;
}

- (void)setHasValidEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasValidEndTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLPRConvertRule;
  id v4 = [(GEOLPRLPRConvertRule *)&v8 description];
  id v5 = [(GEOLPRLPRConvertRule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRConvertRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v47 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"pickupRule";
      }
      else {
        v13 = @"pickup_rule";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v15 = *(id *)(a1 + 24);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v43 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"mapRule";
      }
      else {
        v22 = @"map_rule";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v24 = *(id *)(a1 + 16);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v38 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = objc_msgSend(v29, "dictionaryRepresentation", (void)v38);
            }
            objc_msgSend(v23, "addObject:", v30, (void)v38);
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"fillRule";
      }
      else {
        v31 = @"fill_rule";
      }
      objc_msgSend(v4, "setObject:forKey:", v23, v31, (void)v38);
    }
    char v32 = *(unsigned char *)(a1 + 60);
    if ((v32 & 2) != 0)
    {
      v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        v34 = @"validStartTime";
      }
      else {
        v34 = @"valid_start_time";
      }
      [v4 setObject:v33 forKey:v34];

      char v32 = *(unsigned char *)(a1 + 60);
    }
    if (v32)
    {
      v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v36 = @"validEndTime";
      }
      else {
        v36 = @"valid_end_time";
      }
      [v4 setObject:v35 forKey:v36];
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
  return -[GEOLPRLPRConvertRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRConvertRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRConvertRule *)-[GEOLPRLPRConvertRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"pickupRule";
      }
      else {
        id v6 = @"pickup_rule";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v44 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v54 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOLPRLPRPickupRule alloc];
                if (a3) {
                  uint64_t v15 = [(GEOLPRLPRPickupRule *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOLPRLPRPickupRule *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addPickupRule:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
          }
          while (v10);
        }

        id v5 = v44;
      }

      if (a3) {
        uint64_t v17 = @"mapRule";
      }
      else {
        uint64_t v17 = @"map_rule";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v50 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v25 = [GEOLPRLPRMapRule alloc];
                if (a3) {
                  uint64_t v26 = [(GEOLPRLPRMapRule *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOLPRLPRMapRule *)v25 initWithDictionary:v24];
                }
                uint64_t v27 = (void *)v26;
                [a1 addMapRule:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v21);
        }

        id v5 = v44;
      }

      if (a3) {
        v28 = @"fillRule";
      }
      else {
        v28 = @"fill_rule";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v46;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v46 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v36 = [GEOLPRLPRFillRule alloc];
                if (a3) {
                  uint64_t v37 = [(GEOLPRLPRFillRule *)v36 initWithJSON:v35];
                }
                else {
                  uint64_t v37 = [(GEOLPRLPRFillRule *)v36 initWithDictionary:v35];
                }
                long long v38 = (void *)v37;
                [a1 addFillRule:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v32);
        }

        id v5 = v44;
      }

      if (a3) {
        long long v39 = @"validStartTime";
      }
      else {
        long long v39 = @"valid_start_time";
      }
      long long v40 = [v5 objectForKeyedSubscript:v39];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setValidStartTime:", objc_msgSend(v40, "unsignedIntValue"));
      }

      if (a3) {
        long long v41 = @"validEndTime";
      }
      else {
        long long v41 = @"valid_end_time";
      }
      long long v42 = [v5 objectForKeyedSubscript:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setValidEndTime:", objc_msgSend(v42, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLPRLPRConvertRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRConvertRule *)-[GEOLPRLPRConvertRule _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_167;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_168;
    }
    GEOLPRLPRConvertRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLPRConvertRuleCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRConvertRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRConvertRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLPRConvertRuleIsDirty((uint64_t)self) & 1) == 0)
  {
    id v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLPRConvertRule *)self readAll:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = self->_pickupRules;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v7);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = self->_mapRules;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v11);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = self->_fillRules;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v15);
    }

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = (id *)a3;
  [(GEOLPRLPRConvertRule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 10) = self->_readerMarkPos;
  *((_DWORD *)v17 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRLPRConvertRule *)self pickupRulesCount])
  {
    [v17 clearPickupRules];
    unint64_t v4 = [(GEOLPRLPRConvertRule *)self pickupRulesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLPRLPRConvertRule *)self pickupRuleAtIndex:i];
        [v17 addPickupRule:v7];
      }
    }
  }
  if ([(GEOLPRLPRConvertRule *)self mapRulesCount])
  {
    [v17 clearMapRules];
    unint64_t v8 = [(GEOLPRLPRConvertRule *)self mapRulesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLPRLPRConvertRule *)self mapRuleAtIndex:j];
        [v17 addMapRule:v11];
      }
    }
  }
  if ([(GEOLPRLPRConvertRule *)self fillRulesCount])
  {
    [v17 clearFillRules];
    unint64_t v12 = [(GEOLPRLPRConvertRule *)self fillRulesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOLPRLPRConvertRule *)self fillRuleAtIndex:k];
        [v17 addFillRule:v15];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v17 + 14) = self->_validStartTime;
    *((unsigned char *)v17 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v17 + 13) = self->_validEndTime;
    *((unsigned char *)v17 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
      GEOLPRLPRConvertRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLPRConvertRule *)self readAll:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v9 = self->_pickupRules;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPickupRule:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = self->_mapRules;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addMapRule:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = self->_fillRules;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (void)v26);
        [(id)v5 addFillRule:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_validStartTime;
    *(unsigned char *)(v5 + 60) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_validEndTime;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEOLPRLPRConvertRule *)self readAll:1];
  [v4 readAll:1];
  pickupRules = self->_pickupRules;
  if ((unint64_t)pickupRules | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](pickupRules, "isEqual:")) {
      goto LABEL_17;
    }
  }
  mapRules = self->_mapRules;
  if ((unint64_t)mapRules | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mapRules, "isEqual:")) {
      goto LABEL_17;
    }
  }
  fillRules = self->_fillRules;
  if ((unint64_t)fillRules | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](fillRules, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_validStartTime != *((_DWORD *)v4 + 14)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_validEndTime != *((_DWORD *)v4 + 13)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLPRLPRConvertRule *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_pickupRules hash];
  uint64_t v4 = [(NSMutableArray *)self->_mapRules hash];
  uint64_t v5 = [(NSMutableArray *)self->_fillRules hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_validStartTime;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_validEndTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOLPRLPRConvertRule *)self addPickupRule:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOLPRLPRConvertRule *)self addMapRule:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOLPRLPRConvertRule addFillRule:](self, "addFillRule:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  char v20 = *((unsigned char *)v4 + 60);
  if ((v20 & 2) != 0)
  {
    self->_validStartTime = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
    char v20 = *((unsigned char *)v4 + 60);
  }
  if (v20)
  {
    self->_validEndTime = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickupRules, 0);
  objc_storeStrong((id *)&self->_mapRules, 0);
  objc_storeStrong((id *)&self->_fillRules, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end