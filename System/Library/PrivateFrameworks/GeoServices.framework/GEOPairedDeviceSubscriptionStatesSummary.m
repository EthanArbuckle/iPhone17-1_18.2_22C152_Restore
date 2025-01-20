@interface GEOPairedDeviceSubscriptionStatesSummary
+ (BOOL)isValid:(id)a3;
+ (Class)subscriptionStatesType;
- (BOOL)hasIsUpdateAvailable;
- (BOOL)hasLastUpdatedTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdateAvailable;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceSubscriptionStatesSummary)initWithDictionary:(id)a3;
- (GEOPairedDeviceSubscriptionStatesSummary)initWithJSON:(id)a3;
- (NSMutableDictionary)subscriptionStates;
- (PBUnknownFields)unknownFields;
- (double)lastUpdatedTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)subscriptionStatesForKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)subscriptionStatesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearSubscriptionStates;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)enumerateSubscriptionStatesUsingBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsUpdateAvailable:(BOOL)a3;
- (void)setHasLastUpdatedTimestamp:(BOOL)a3;
- (void)setIsUpdateAvailable:(BOOL)a3;
- (void)setLastUpdatedTimestamp:(double)a3;
- (void)setSubscriptionStates:(id)a3;
- (void)setSubscriptionStatesValue:(id)a3 forKey:(id)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceSubscriptionStatesSummary

- (NSMutableDictionary)subscriptionStates
{
  return self->_subscriptionStates;
}

- (void)setSubscriptionStates:(id)a3
{
}

- (void)clearSubscriptionStates
{
}

- (void)setSubscriptionStatesValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  subscriptionStates = self->_subscriptionStates;
  if (!subscriptionStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_subscriptionStates;
    self->_subscriptionStates = v8;

    subscriptionStates = self->_subscriptionStates;
  }
  [(NSMutableDictionary *)subscriptionStates setObject:v10 forKey:v6];
}

- (id)subscriptionStatesForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_subscriptionStates objectForKey:a3];
}

- (void)enumerateSubscriptionStatesUsingBlock:(id)a3
{
}

- (unint64_t)subscriptionStatesCount
{
  return [(NSMutableDictionary *)self->_subscriptionStates count];
}

+ (Class)subscriptionStatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)isUpdateAvailable
{
  return self->_isUpdateAvailable;
}

- (void)setIsUpdateAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isUpdateAvailable = a3;
}

- (void)setHasIsUpdateAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsUpdateAvailable
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (void)setLastUpdatedTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_lastUpdatedTimestamp = a3;
}

- (void)setHasLastUpdatedTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLastUpdatedTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceSubscriptionStatesSummary;
  v4 = [(GEOPairedDeviceSubscriptionStatesSummary *)&v8 description];
  v5 = [(GEOPairedDeviceSubscriptionStatesSummary *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceSubscriptionStatesSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 24) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      id v6 = *(void **)(a1 + 24);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53ED398;
      id v24 = v5;
      char v25 = a2;
      id v7 = v5;
      [v6 enumerateKeysAndObjectsUsingBlock:v23];
      if (a2) {
        objc_super v8 = @"subscriptionStates";
      }
      else {
        objc_super v8 = @"subscription_states";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 36);
    if ((v9 & 2) != 0)
    {
      id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
      if (a2) {
        v11 = @"isUpdateAvailable";
      }
      else {
        v11 = @"is_update_available";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 36);
    }
    if (v9)
    {
      v12 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v13 = @"lastUpdatedTimestamp";
      }
      else {
        v13 = @"last_updated_timestamp";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke_2;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceSubscriptionStatesSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a2;
  if (v5) {
    [a3 jsonRepresentation];
  }
  else {
  id v7 = [a3 dictionaryRepresentation];
  }
  [v4 setObject:v7 forKey:v6];
}

void __70__GEOPairedDeviceSubscriptionStatesSummary__dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPairedDeviceSubscriptionStatesSummary)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceSubscriptionStatesSummary *)-[GEOPairedDeviceSubscriptionStatesSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1 && (v27 = (void *)[a1 init]) != 0)
  {
    if (a3) {
      id v6 = @"subscriptionStates";
    }
    else {
      id v6 = @"subscription_states";
    }
    id v7 = [v5 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v25 = a3;
      id v26 = v5;
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
      char v9 = (void *)v27[3];
      v27[3] = v8;

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v24 = v7;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, v24);
            v17 = (void *)v27[3];
            id v18 = [[GEOPairedDeviceSubscriptionStateSummary alloc] initWithDictionary:v16];
            [v17 setObject:v18 forKey:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v12);
      }

      id v5 = v26;
      a3 = v25;
      id v7 = v24;
    }

    if (a3) {
      id v19 = @"isUpdateAvailable";
    }
    else {
      id v19 = @"is_update_available";
    }
    v20 = objc_msgSend(v5, "objectForKeyedSubscript:", v19, v24);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v27, "setIsUpdateAvailable:", objc_msgSend(v20, "BOOLValue"));
    }

    if (a3) {
      v21 = @"lastUpdatedTimestamp";
    }
    else {
      v21 = @"last_updated_timestamp";
    }
    id v22 = [v5 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 doubleValue];
      objc_msgSend(v27, "setLastUpdatedTimestamp:");
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (GEOPairedDeviceSubscriptionStatesSummary)initWithJSON:(id)a3
{
  return (GEOPairedDeviceSubscriptionStatesSummary *)-[GEOPairedDeviceSubscriptionStatesSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceSubscriptionStatesSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceSubscriptionStatesSummaryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  subscriptionStates = self->_subscriptionStates;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__GEOPairedDeviceSubscriptionStatesSummary_writeTo___block_invoke;
  v8[3] = &unk_1E53ED3C0;
  id v6 = v4;
  id v9 = v6;
  [(NSMutableDictionary *)subscriptionStates enumerateKeysAndObjectsUsingBlock:v8];

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteDoubleField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
}

uint64_t __52__GEOPairedDeviceSubscriptionStatesSummary_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  PBDataWriterWriteSubmessage();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPairedDeviceSubscriptionStatesSummary *)self readAll:0];
  if ([(GEOPairedDeviceSubscriptionStatesSummary *)self subscriptionStatesCount])
  {
    [v4 clearSubscriptionStates];
    if (!*((void *)v4 + 3))
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = (void *)*((void *)v4 + 3);
      *((void *)v4 + 3) = v5;
    }
    subscriptionStates = self->_subscriptionStates;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__GEOPairedDeviceSubscriptionStatesSummary_copyTo___block_invoke;
    v9[3] = &unk_1E53ED3C0;
    id v10 = v4;
    [(NSMutableDictionary *)subscriptionStates enumerateKeysAndObjectsUsingBlock:v9];
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_isUpdateAvailable;
    *((unsigned char *)v4 + 36) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v4 + 2) = *(void *)&self->_lastUpdatedTimestamp;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

void __51__GEOPairedDeviceSubscriptionStatesSummary_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(NSMutableDictionary *)self->_subscriptionStates count])
  {
    [(id)v5 clearSubscriptionStates];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v6;

    subscriptionStates = self->_subscriptionStates;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__GEOPairedDeviceSubscriptionStatesSummary_copyWithZone___block_invoke;
    v11[3] = &unk_1E53ED3E8;
    uint64_t v13 = a3;
    id v12 = (id)v5;
    [(NSMutableDictionary *)subscriptionStates enumerateKeysAndObjectsUsingBlock:v11];
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_isUpdateAvailable;
    *(unsigned char *)(v5 + 36) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 16) = self->_lastUpdatedTimestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

void __57__GEOPairedDeviceSubscriptionStatesSummary_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = (id)[a3 copyWithZone:v5];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOPairedDeviceSubscriptionStatesSummary *)self readAll:1];
  [v4 readAll:1];
  subscriptionStates = self->_subscriptionStates;
  if ((unint64_t)subscriptionStates | *((void *)v4 + 3))
  {
    if (!-[NSMutableDictionary isEqual:](subscriptionStates, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_isUpdateAvailable)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  BOOL v6 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_lastUpdatedTimestamp != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceSubscriptionStatesSummary *)self readAll:1];
  uint64_t v3 = [(NSMutableDictionary *)self->_subscriptionStates hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isUpdateAvailable;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double lastUpdatedTimestamp = self->_lastUpdatedTimestamp;
  double v6 = -lastUpdatedTimestamp;
  if (lastUpdatedTimestamp >= 0.0) {
    double v6 = self->_lastUpdatedTimestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  if (*((void *)v8 + 3))
  {
    subscriptionStates = self->_subscriptionStates;
    if (subscriptionStates)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](subscriptionStates, "addEntriesFromDictionary:");
    }
    else
    {
      uint64_t v5 = (NSMutableDictionary *)[*((id *)v8 + 3) copy];
      double v6 = self->_subscriptionStates;
      self->_subscriptionStates = v5;
    }
  }
  char v7 = *((unsigned char *)v8 + 36);
  if ((v7 & 2) != 0)
  {
    self->_isUpdateAvailable = *((unsigned char *)v8 + 32);
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v8 + 36);
  }
  if (v7)
  {
    self->_double lastUpdatedTimestamp = *((double *)v8 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceSubscriptionStatesSummary *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v6 = [(NSMutableDictionary *)self->_subscriptionStates allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) clearUnknownFields:1];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStates, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end