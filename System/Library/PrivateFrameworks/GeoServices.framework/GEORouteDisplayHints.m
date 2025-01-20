@interface GEORouteDisplayHints
+ (BOOL)isValid:(id)a3;
- (BOOL)hasShowTransitSchedules;
- (BOOL)hasTransitSurchargeOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)showTransitSchedules;
- (GEORequestOptions)transitSurchargeOptions;
- (GEORouteDisplayHints)init;
- (GEORouteDisplayHints)initWithData:(id)a3;
- (GEORouteDisplayHints)initWithDictionary:(id)a3;
- (GEORouteDisplayHints)initWithJSON:(id)a3;
- (NSArray)prioritizationOptions;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)availablePaymentTypesAsString:(int)a3;
- (id)availablePrioritizationsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAvailablePaymentTypes:(id)a3;
- (int)StringAsAvailablePrioritizations:(id)a3;
- (int)availablePaymentTypeAtIndex:(unint64_t)a3;
- (int)availablePaymentTypes;
- (int)availablePrioritizationAtIndex:(unint64_t)a3;
- (int)availablePrioritizations;
- (unint64_t)availablePaymentTypesCount;
- (unint64_t)availablePrioritizationsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAvailablePaymentTypes;
- (void)_readAvailablePrioritizations;
- (void)_readTransitSurchargeOptions;
- (void)addAvailablePaymentType:(int)a3;
- (void)addAvailablePrioritization:(int)a3;
- (void)clearAvailablePaymentTypes;
- (void)clearAvailablePrioritizations;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAvailablePaymentTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAvailablePrioritizations:(int *)a3 count:(unint64_t)a4;
- (void)setHasShowTransitSchedules:(BOOL)a3;
- (void)setShowTransitSchedules:(BOOL)a3;
- (void)setTransitSurchargeOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteDisplayHints

- (NSArray)prioritizationOptions
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount"));
  if ([(GEORouteDisplayHints *)self availablePrioritizationsCount])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(NSNumber, "numberWithInt:", -[GEORouteDisplayHints availablePrioritizationAtIndex:](self, "availablePrioritizationAtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(GEORouteDisplayHints *)self availablePrioritizationsCount]);
  }

  return (NSArray *)v3;
}

- (GEORouteDisplayHints)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteDisplayHints;
  v2 = [(GEORouteDisplayHints *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEORouteDisplayHints)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteDisplayHints;
  v3 = [(GEORouteDisplayHints *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORouteDisplayHints;
  [(GEORouteDisplayHints *)&v3 dealloc];
}

- (BOOL)showTransitSchedules
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 1) == 0 || self->_showTransitSchedules;
}

- (void)setShowTransitSchedules:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_showTransitSchedules = a3;
}

- (void)setHasShowTransitSchedules:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasShowTransitSchedules
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAvailablePrioritizations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvailablePrioritizations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)availablePrioritizationsCount
{
  return self->_availablePrioritizations.count;
}

- (int)availablePrioritizations
{
  return self->_availablePrioritizations.list;
}

- (void)clearAvailablePrioritizations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addAvailablePrioritization:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)availablePrioritizationAtIndex:(unint64_t)a3
{
  -[GEORouteDisplayHints _readAvailablePrioritizations]((uint64_t)self);
  p_availablePrioritizations = &self->_availablePrioritizations;
  unint64_t count = self->_availablePrioritizations.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_availablePrioritizations->list[a3];
}

- (void)setAvailablePrioritizations:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_availablePrioritizations, a3, a4);
}

- (id)availablePrioritizationsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F5850[a3];
  }

  return v3;
}

- (int)StringAsAvailablePrioritizations:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRAVEL_TIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAvailablePaymentTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvailablePaymentTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)availablePaymentTypesCount
{
  return self->_availablePaymentTypes.count;
}

- (int)availablePaymentTypes
{
  return self->_availablePaymentTypes.list;
}

- (void)clearAvailablePaymentTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedInt32Clear();
}

- (void)addAvailablePaymentType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (int)availablePaymentTypeAtIndex:(unint64_t)a3
{
  -[GEORouteDisplayHints _readAvailablePaymentTypes]((uint64_t)self);
  p_availablePaymentTypes = &self->_availablePaymentTypes;
  unint64_t count = self->_availablePaymentTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_availablePaymentTypes->list[a3];
}

- (void)setAvailablePaymentTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147390](&self->_availablePaymentTypes, a3, a4);
}

- (id)availablePaymentTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"PAYMENT_TYPE_IC_CARD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"PAYMENT_TYPE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsAvailablePaymentTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
  }

  return v4;
}

- (void)_readTransitSurchargeOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitSurchargeOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTransitSurchargeOptions
{
  return self->_transitSurchargeOptions != 0;
}

- (GEORequestOptions)transitSurchargeOptions
{
  -[GEORouteDisplayHints _readTransitSurchargeOptions]((uint64_t)self);
  transitSurchargeOptions = self->_transitSurchargeOptions;

  return transitSurchargeOptions;
}

- (void)setTransitSurchargeOptions:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_transitSurchargeOptions, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteDisplayHints;
  int v4 = [(GEORouteDisplayHints *)&v8 description];
  v5 = [(GEORouteDisplayHints *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteDisplayHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 96))
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      if (a2) {
        objc_super v6 = @"showTransitSchedules";
      }
      else {
        objc_super v6 = @"show_transit_schedules";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 56))
    {
      objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v8 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = *(int *)(*v8 + 4 * v9);
          if (v10 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = off_1E53F5850[v10];
          }
          [v7 addObject:v11];

          ++v9;
          objc_super v8 = (void *)(a1 + 48);
        }
        while (v9 < *(void *)(a1 + 56));
      }
      if (a2) {
        v12 = @"availablePrioritization";
      }
      else {
        v12 = @"available_prioritization";
      }
      [v4 setObject:v7 forKey:v12];
    }
    if (*(void *)(a1 + 32))
    {
      int v30 = a2;
      v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v14 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = *(unsigned int *)(*v14 + 4 * v15);
          if (v16)
          {
            if (v16 == 1)
            {
              v17 = @"PAYMENT_TYPE_IC_CARD";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v17 = @"PAYMENT_TYPE_UNKNOWN";
          }
          [v13 addObject:v17];

          ++v15;
          v14 = (void *)(a1 + 24);
        }
        while (v15 < *(void *)(a1 + 32));
      }
      a2 = v30;
      if (v30) {
        v18 = @"availablePaymentType";
      }
      else {
        v18 = @"available_payment_type";
      }
      [v4 setObject:v13 forKey:v18];
    }
    v19 = [(id)a1 transitSurchargeOptions];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"transitSurchargeOptions";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"transit_surcharge_options";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __50__GEORouteDisplayHints__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v27 = v26;
        id v32 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v31];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteDisplayHints _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORouteDisplayHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORouteDisplayHints)initWithDictionary:(id)a3
{
  return (GEORouteDisplayHints *)-[GEORouteDisplayHints _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        objc_super v7 = @"showTransitSchedules";
      }
      else {
        objc_super v7 = @"show_transit_schedules";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setShowTransitSchedules:", objc_msgSend(v8, "BOOLValue"));
      }

      if (a3) {
        unint64_t v9 = @"availablePrioritization";
      }
      else {
        unint64_t v9 = @"available_prioritization";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      id v36 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v34 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (!v12) {
          goto LABEL_33;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v42;
        while (1)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v17 = v16;
              if ([v17 isEqualToString:@"TRANSIT_PRIORITIZE_DEFAULT"])
              {
                uint64_t v18 = 0;
              }
              else if ([v17 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRAVEL_TIME"])
              {
                uint64_t v18 = 1;
              }
              else if ([v17 isEqualToString:@"TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT"])
              {
                uint64_t v18 = 2;
              }
              else if ([v17 isEqualToString:@"TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE"])
              {
                uint64_t v18 = 3;
              }
              else
              {
                uint64_t v18 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v18 = [v16 intValue];
            }
            [v6 addAvailablePrioritization:v18];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (!v13)
          {
LABEL_33:

            id v5 = v36;
            id v10 = v34;
            break;
          }
        }
      }

      if (a3) {
        v19 = @"availablePaymentType";
      }
      else {
        v19 = @"available_payment_type";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v35 = v20;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (!v22) {
          goto LABEL_53;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        while (1)
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = v26;
              if ([v27 isEqualToString:@"PAYMENT_TYPE_UNKNOWN"]) {
                uint64_t v28 = 0;
              }
              else {
                uint64_t v28 = [v27 isEqualToString:@"PAYMENT_TYPE_IC_CARD"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v28 = [v26 intValue];
            }
            [v6 addAvailablePaymentType:v28];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (!v23)
          {
LABEL_53:

            id v5 = v36;
            v20 = v35;
            break;
          }
        }
      }

      if (a3) {
        v29 = @"transitSurchargeOptions";
      }
      else {
        v29 = @"transit_surcharge_options";
      }
      int v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [GEORequestOptions alloc];
        if (v31) {
          id v32 = (void *)-[GEORequestOptions _initWithDictionary:isJSON:]((uint64_t)v31, v30, a3);
        }
        else {
          id v32 = 0;
        }
        [v6 setTransitSurchargeOptions:v32];
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEORouteDisplayHints)initWithJSON:(id)a3
{
  return (GEORouteDisplayHints *)-[GEORouteDisplayHints _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1241_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1242_0;
    }
    GEORouteDisplayHintsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteDisplayHintsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteDisplayHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORouteDisplayHints *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_availablePrioritizations.count)
    {
      PBDataWriterPlaceMark();
      if (self->_availablePrioritizations.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v6;
        }
        while (v6 < self->_availablePrioritizations.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_availablePaymentTypes.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_availablePaymentTypes.count);
    }
    if (self->_transitSurchargeOptions) {
      PBDataWriterWriteSubmessage();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEORouteDisplayHints *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 20) = self->_readerMarkPos;
  *((_DWORD *)v10 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v10 + 92) = self->_showTransitSchedules;
    *((unsigned char *)v10 + 96) |= 1u;
  }
  if ([(GEORouteDisplayHints *)self availablePrioritizationsCount])
  {
    [v10 clearAvailablePrioritizations];
    unint64_t v4 = [(GEORouteDisplayHints *)self availablePrioritizationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addAvailablePrioritization:", -[GEORouteDisplayHints availablePrioritizationAtIndex:](self, "availablePrioritizationAtIndex:", i));
    }
  }
  if ([(GEORouteDisplayHints *)self availablePaymentTypesCount])
  {
    [v10 clearAvailablePaymentTypes];
    unint64_t v7 = [(GEORouteDisplayHints *)self availablePaymentTypesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addAvailablePaymentType:", -[GEORouteDisplayHints availablePaymentTypeAtIndex:](self, "availablePaymentTypeAtIndex:", j));
    }
  }
  if (self->_transitSurchargeOptions) {
    objc_msgSend(v10, "setTransitSurchargeOptions:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteDisplayHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteDisplayHints *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 92) = self->_showTransitSchedules;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  id v9 = [(GEORequestOptions *)self->_transitSurchargeOptions copyWithZone:a3];
  id v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  id v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEORouteDisplayHints *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 96))
    {
      if (self->_showTransitSchedules)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 96)) {
    goto LABEL_14;
  }
LABEL_10:
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_14;
  }
  transitSurchargeOptions = self->_transitSurchargeOptions;
  if ((unint64_t)transitSurchargeOptions | *((void *)v4 + 9)) {
    char v6 = -[GEORequestOptions isEqual:](transitSurchargeOptions, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEORouteDisplayHints *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_showTransitSchedules;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  uint64_t v5 = v4 ^ PBRepeatedInt32Hash();
  return v5 ^ [(GEORequestOptions *)self->_transitSurchargeOptions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v12 = (BOOL *)a3;
  [v12 readAll:0];
  if (v12[96])
  {
    self->_showTransitSchedules = v12[92];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v12 availablePrioritizationsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORouteDisplayHints addAvailablePrioritization:](self, "addAvailablePrioritization:", [v12 availablePrioritizationAtIndex:i]);
  }
  uint64_t v7 = [v12 availablePaymentTypesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEORouteDisplayHints addAvailablePaymentType:](self, "addAvailablePaymentType:", [v12 availablePaymentTypeAtIndex:j]);
  }
  transitSurchargeOptions = self->_transitSurchargeOptions;
  id v11 = (void *)*((void *)v12 + 9);
  if (transitSurchargeOptions)
  {
    if (v11) {
      -[GEORequestOptions mergeFrom:]((uint64_t)transitSurchargeOptions, v11);
    }
  }
  else if (v11)
  {
    transitSurchargeOptions = (GEORequestOptions *)[(GEORouteDisplayHints *)self setTransitSurchargeOptions:*((void *)v12 + 9)];
  }

  MEMORY[0x1F4181820](transitSurchargeOptions);
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORouteDisplayHintsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1246);
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
  *(unsigned char *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteDisplayHints *)self readAll:0];
    transitSurchargeOptions = self->_transitSurchargeOptions;
    -[GEORequestOptions clearUnknownFields:]((uint64_t)transitSurchargeOptions, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSurchargeOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end