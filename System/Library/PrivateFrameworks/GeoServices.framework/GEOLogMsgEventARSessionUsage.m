@interface GEOLogMsgEventARSessionUsage
+ (BOOL)isValid:(id)a3;
+ (Class)arElementDetailsType;
+ (Class)thermalPressureType;
+ (Class)vlfLocalizationResultsType;
- (BOOL)didLocalize;
- (BOOL)hasDidLocalize;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasSessionTimeMs;
- (BOOL)hasTimeRoundedToHour;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventARSessionUsage)init;
- (GEOLogMsgEventARSessionUsage)initWithData:(id)a3;
- (GEOLogMsgEventARSessionUsage)initWithDictionary:(id)a3;
- (GEOLogMsgEventARSessionUsage)initWithJSON:(id)a3;
- (NSMutableArray)arElementDetails;
- (NSMutableArray)thermalPressures;
- (NSMutableArray)vlfLocalizationResults;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arElementDetailsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)thermalPressureAtIndex:(unint64_t)a3;
- (id)vlfLocalizationResultsAtIndex:(unint64_t)a3;
- (unint64_t)arElementDetailsCount;
- (unint64_t)hash;
- (unint64_t)thermalPressuresCount;
- (unint64_t)vlfLocalizationResultsCount;
- (unsigned)sessionTimeMs;
- (unsigned)timeRoundedToHour;
- (void)_addNoFlagsArElementDetails:(uint64_t)a1;
- (void)_addNoFlagsThermalPressure:(uint64_t)a1;
- (void)_addNoFlagsVlfLocalizationResults:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArElementDetails;
- (void)_readThermalPressures;
- (void)_readVlfLocalizationResults;
- (void)addArElementDetails:(id)a3;
- (void)addThermalPressure:(id)a3;
- (void)addVlfLocalizationResults:(id)a3;
- (void)clearArElementDetails;
- (void)clearThermalPressures;
- (void)clearVlfLocalizationResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArElementDetails:(id)a3;
- (void)setDidLocalize:(BOOL)a3;
- (void)setHasDidLocalize:(BOOL)a3;
- (void)setHasSessionTimeMs:(BOOL)a3;
- (void)setHasTimeRoundedToHour:(BOOL)a3;
- (void)setSessionTimeMs:(unsigned int)a3;
- (void)setThermalPressures:(id)a3;
- (void)setTimeRoundedToHour:(unsigned int)a3;
- (void)setVlfLocalizationResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventARSessionUsage

- (unint64_t)vlfLocalizationResultsCount
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  vlfLocalizationResults = self->_vlfLocalizationResults;

  return [(NSMutableArray *)vlfLocalizationResults count];
}

- (void)_readVlfLocalizationResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVlfLocalizationResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)thermalPressureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  thermalPressures = self->_thermalPressures;

  return (id)[(NSMutableArray *)thermalPressures objectAtIndex:a3];
}

- (void)_readThermalPressures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThermalPressures_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventARSessionUsage;
  v4 = [(GEOLogMsgEventARSessionUsage *)&v8 description];
  v5 = [(GEOLogMsgEventARSessionUsage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (GEOLogMsgEventARSessionUsage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventARSessionUsage;
  v2 = [(GEOLogMsgEventARSessionUsage *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventARSessionUsage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventARSessionUsage;
  id v3 = [(GEOLogMsgEventARSessionUsage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSMutableArray)vlfLocalizationResults
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  vlfLocalizationResults = self->_vlfLocalizationResults;

  return vlfLocalizationResults;
}

- (void)setVlfLocalizationResults:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  vlfLocalizationResults = self->_vlfLocalizationResults;
  self->_vlfLocalizationResults = v4;
}

- (void)clearVlfLocalizationResults
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  vlfLocalizationResults = self->_vlfLocalizationResults;

  [(NSMutableArray *)vlfLocalizationResults removeAllObjects];
}

- (void)addVlfLocalizationResults:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsVlfLocalizationResults:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsVlfLocalizationResults:(uint64_t)a1
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

- (id)vlfLocalizationResultsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  vlfLocalizationResults = self->_vlfLocalizationResults;

  return (id)[(NSMutableArray *)vlfLocalizationResults objectAtIndex:a3];
}

+ (Class)vlfLocalizationResultsType
{
  return (Class)objc_opt_class();
}

- (void)_readArElementDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArElementDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)arElementDetails
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  arElementDetails = self->_arElementDetails;

  return arElementDetails;
}

- (void)setArElementDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  arElementDetails = self->_arElementDetails;
  self->_arElementDetails = v4;
}

- (void)clearArElementDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  arElementDetails = self->_arElementDetails;

  [(NSMutableArray *)arElementDetails removeAllObjects];
}

- (void)addArElementDetails:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsArElementDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsArElementDetails:(uint64_t)a1
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

- (unint64_t)arElementDetailsCount
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  arElementDetails = self->_arElementDetails;

  return [(NSMutableArray *)arElementDetails count];
}

- (id)arElementDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  arElementDetails = self->_arElementDetails;

  return (id)[(NSMutableArray *)arElementDetails objectAtIndex:a3];
}

+ (Class)arElementDetailsType
{
  return (Class)objc_opt_class();
}

- (unsigned)sessionTimeMs
{
  return self->_sessionTimeMs;
}

- (void)setSessionTimeMs:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_sessionTimeMs = a3;
}

- (void)setHasSessionTimeMs:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasSessionTimeMs
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)didLocalize
{
  return self->_didLocalize;
}

- (void)setDidLocalize:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_didLocalize = a3;
}

- (void)setHasDidLocalize:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDidLocalize
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setTimeRoundedToHour:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_timeRoundedToHour = a3;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeRoundedToHour
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (NSMutableArray)thermalPressures
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  thermalPressures = self->_thermalPressures;

  return thermalPressures;
}

- (void)setThermalPressures:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  thermalPressures = self->_thermalPressures;
  self->_thermalPressures = v4;
}

- (void)clearThermalPressures
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  thermalPressures = self->_thermalPressures;

  [(NSMutableArray *)thermalPressures removeAllObjects];
}

- (void)addThermalPressure:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsThermalPressure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsThermalPressure:(uint64_t)a1
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

- (unint64_t)thermalPressuresCount
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  thermalPressures = self->_thermalPressures;

  return [(NSMutableArray *)thermalPressures count];
}

+ (Class)thermalPressureType
{
  return (Class)objc_opt_class();
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventARSessionUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_54;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v49 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"vlfLocalizationResults";
    }
    else {
      v13 = @"vlf_localization_results";
    }
    [v4 setObject:v5 forKey:v13];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v15 = *(id *)(a1 + 16);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          v21 = [v20 dictionaryRepresentation];
          }
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v17);
    }

    if (a2) {
      v22 = @"arElementDetails";
    }
    else {
      v22 = @"ar_element_details";
    }
    [v4 setObject:v14 forKey:v22];
  }
  char v23 = *(unsigned char *)(a1 + 64);
  if (v23)
  {
    v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
    if (a2) {
      v37 = @"sessionTimeMs";
    }
    else {
      v37 = @"session_time_ms";
    }
    [v4 setObject:v36 forKey:v37];

    char v23 = *(unsigned char *)(a1 + 64);
    if ((v23 & 4) == 0)
    {
LABEL_34:
      if ((v23 & 2) == 0) {
        goto LABEL_39;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)(a1 + 64) & 4) == 0)
  {
    goto LABEL_34;
  }
  v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
  if (a2) {
    v39 = @"didLocalize";
  }
  else {
    v39 = @"did_localize";
  }
  [v4 setObject:v38 forKey:v39];

  if ((*(unsigned char *)(a1 + 64) & 2) != 0)
  {
LABEL_35:
    v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
    if (a2) {
      v25 = @"timeRoundedToHour";
    }
    else {
      v25 = @"time_rounded_to_hour";
    }
    [v4 setObject:v24 forKey:v25];
  }
LABEL_39:
  if ([*(id *)(a1 + 24) count])
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v27 = *(id *)(a1 + 24);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v40 + 1) + 8 * k);
          if (a2) {
            [v32 jsonRepresentation];
          }
          else {
          v33 = objc_msgSend(v32, "dictionaryRepresentation", (void)v40);
          }
          objc_msgSend(v26, "addObject:", v33, (void)v40);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v29);
    }

    if (a2) {
      v34 = @"thermalPressure";
    }
    else {
      v34 = @"thermal_pressure";
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v34, (void)v40);
  }
LABEL_54:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventARSessionUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventARSessionUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventARSessionUsage *)-[GEOLogMsgEventARSessionUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"vlfLocalizationResults";
      }
      else {
        id v6 = @"vlf_localization_results";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v46 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v56 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOVLFLocalizationResults alloc];
                if (a3) {
                  uint64_t v15 = [(GEOVLFLocalizationResults *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOVLFLocalizationResults *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [a1 addVlfLocalizationResults:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v61 count:16];
          }
          while (v10);
        }

        id v5 = v46;
      }

      if (a3) {
        uint64_t v17 = @"arElementDetails";
      }
      else {
        uint64_t v17 = @"ar_element_details";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v52 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = [GEOARElementDetails alloc];
                if (a3) {
                  uint64_t v26 = [(GEOARElementDetails *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOARElementDetails *)v25 initWithDictionary:v24];
                }
                id v27 = (void *)v26;
                [a1 addArElementDetails:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v21);
        }

        id v5 = v46;
      }

      if (a3) {
        uint64_t v28 = @"sessionTimeMs";
      }
      else {
        uint64_t v28 = @"session_time_ms";
      }
      uint64_t v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSessionTimeMs:", objc_msgSend(v29, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v30 = @"didLocalize";
      }
      else {
        uint64_t v30 = @"did_localize";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDidLocalize:", objc_msgSend(v31, "BOOLValue"));
      }

      if (a3) {
        v32 = @"timeRoundedToHour";
      }
      else {
        v32 = @"time_rounded_to_hour";
      }
      v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v33, "unsignedIntValue"));
      }

      if (a3) {
        v34 = @"thermalPressure";
      }
      else {
        v34 = @"thermal_pressure";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v48;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v47 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v42 = [GEOARSessionThermalPressure alloc];
                if (a3) {
                  uint64_t v43 = [(GEOARSessionThermalPressure *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOARSessionThermalPressure *)v42 initWithDictionary:v41];
                }
                long long v44 = (void *)v43;
                [a1 addThermalPressure:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
          }
          while (v38);
        }

        id v5 = v46;
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventARSessionUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventARSessionUsage *)-[GEOLogMsgEventARSessionUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_1767;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1768;
    }
    GEOLogMsgEventARSessionUsageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventARSessionUsageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventARSessionUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventARSessionUsageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
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
    [(GEOLogMsgEventARSessionUsage *)self readAll:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = self->_vlfLocalizationResults;
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
    uint64_t v10 = self->_arElementDetails;
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

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_thermalPressures;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_vlfLocalizationResults;
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
  uint64_t v17 = (id *)a3;
  [(GEOLogMsgEventARSessionUsage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 10) = self->_readerMarkPos;
  *((_DWORD *)v17 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEventARSessionUsage *)self vlfLocalizationResultsCount])
  {
    [v17 clearVlfLocalizationResults];
    unint64_t v4 = [(GEOLogMsgEventARSessionUsage *)self vlfLocalizationResultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventARSessionUsage *)self vlfLocalizationResultsAtIndex:i];
        [v17 addVlfLocalizationResults:v7];
      }
    }
  }
  if ([(GEOLogMsgEventARSessionUsage *)self arElementDetailsCount])
  {
    [v17 clearArElementDetails];
    unint64_t v8 = [(GEOLogMsgEventARSessionUsage *)self arElementDetailsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOLogMsgEventARSessionUsage *)self arElementDetailsAtIndex:j];
        [v17 addArElementDetails:v11];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_11;
    }
LABEL_21:
    *((unsigned char *)v17 + 60) = self->_didLocalize;
    *((unsigned char *)v17 + 64) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *((_DWORD *)v17 + 13) = self->_sessionTimeMs;
  *((unsigned char *)v17 + 64) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_21;
  }
LABEL_11:
  if ((flags & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v17 + 14) = self->_timeRoundedToHour;
    *((unsigned char *)v17 + 64) |= 2u;
  }
LABEL_13:
  if ([(GEOLogMsgEventARSessionUsage *)self thermalPressuresCount])
  {
    [v17 clearThermalPressures];
    unint64_t v13 = [(GEOLogMsgEventARSessionUsage *)self thermalPressuresCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOLogMsgEventARSessionUsage *)self thermalPressureAtIndex:k];
        [v17 addThermalPressure:v16];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
      GEOLogMsgEventARSessionUsageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventARSessionUsage *)self readAll:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v9 = self->_vlfLocalizationResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVlfLocalizationResults:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v14 = self->_arElementDetails;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addArElementDetails:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_sessionTimeMs;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_21:
      if ((flags & 2) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_21;
  }
  *(unsigned char *)(v5 + 60) = self->_didLocalize;
  *(unsigned char *)(v5 + 64) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 56) = self->_timeRoundedToHour;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
LABEL_23:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_thermalPressures;
  uint64_t v20 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v8);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * k), "copyWithZone:", a3, (void)v25);
        [(id)v5 addThermalPressure:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  [(GEOLogMsgEventARSessionUsage *)self readAll:1];
  [v4 readAll:1];
  vlfLocalizationResults = self->_vlfLocalizationResults;
  if ((unint64_t)vlfLocalizationResults | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](vlfLocalizationResults, "isEqual:")) {
      goto LABEL_26;
    }
  }
  arElementDetails = self->_arElementDetails;
  if ((unint64_t)arElementDetails | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](arElementDetails, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_sessionTimeMs != *((_DWORD *)v4 + 13)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) != 0)
    {
      if (self->_didLocalize)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_19;
      }
    }
LABEL_26:
    char v8 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 64) & 4) != 0) {
    goto LABEL_26;
  }
LABEL_19:
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_timeRoundedToHour != *((_DWORD *)v4 + 14)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  thermalPressures = self->_thermalPressures;
  if ((unint64_t)thermalPressures | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](thermalPressures, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventARSessionUsage *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_vlfLocalizationResults hash];
  uint64_t v4 = [(NSMutableArray *)self->_arElementDetails hash];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_thermalPressures hash];
  }
  uint64_t v5 = 2654435761 * self->_sessionTimeMs;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_didLocalize;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_timeRoundedToHour;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_thermalPressures hash];
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
        [(GEOLogMsgEventARSessionUsage *)self addVlfLocalizationResults:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = *((id *)v4 + 2);
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
        [(GEOLogMsgEventARSessionUsage *)self addArElementDetails:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  char v15 = *((unsigned char *)v4 + 64);
  if (v15)
  {
    self->_sessionTimeMs = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
    char v15 = *((unsigned char *)v4 + 64);
    if ((v15 & 4) == 0)
    {
LABEL_17:
      if ((v15 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) == 0)
  {
    goto LABEL_17;
  }
  self->_didLocalize = *((unsigned char *)v4 + 60);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_18:
    self->_timeRoundedToHour = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_19:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOLogMsgEventARSessionUsage addThermalPressure:](self, "addThermalPressure:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfLocalizationResults, 0);
  objc_storeStrong((id *)&self->_thermalPressures, 0);
  objc_storeStrong((id *)&self->_arElementDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end