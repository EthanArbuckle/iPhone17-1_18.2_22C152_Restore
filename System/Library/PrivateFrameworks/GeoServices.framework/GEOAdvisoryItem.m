@interface GEOAdvisoryItem
+ (BOOL)isValid:(id)a3;
+ (Class)analyticsMessageValueType;
- (BOOL)hasAdvisoryCard;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIncidentIndex;
- (BOOL)hasTransitIncidentIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoryCard)advisoryCard;
- (GEOAdvisoryItem)init;
- (GEOAdvisoryItem)initWithData:(id)a3;
- (GEOAdvisoryItem)initWithDictionary:(id)a3;
- (GEOAdvisoryItem)initWithJSON:(id)a3;
- (NSMutableArray)analyticsMessageValues;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)analyticsMessageValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)analyticsMessageValuesCount;
- (unint64_t)hash;
- (unsigned)incidentIndex;
- (unsigned)transitIncidentIndex;
- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdvisoryCard;
- (void)_readAnalyticsMessageValues;
- (void)addAnalyticsMessageValue:(id)a3;
- (void)clearAnalyticsMessageValues;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisoryCard:(id)a3;
- (void)setAnalyticsMessageValues:(id)a3;
- (void)setHasIncidentIndex:(BOOL)a3;
- (void)setHasTransitIncidentIndex:(BOOL)a3;
- (void)setIncidentIndex:(unsigned int)a3;
- (void)setTransitIncidentIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAdvisoryItem

- (GEOAdvisoryItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAdvisoryItem;
  v2 = [(GEOAdvisoryItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAdvisoryItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAdvisoryItem;
  v3 = [(GEOAdvisoryItem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAdvisoryCard
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
        GEOAdvisoryItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoryCard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAdvisoryCard
{
  return self->_advisoryCard != 0;
}

- (GEOAdvisoryCard)advisoryCard
{
  -[GEOAdvisoryItem _readAdvisoryCard]((uint64_t)self);
  advisoryCard = self->_advisoryCard;

  return advisoryCard;
}

- (void)setAdvisoryCard:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_advisoryCard, a3);
}

- (unsigned)incidentIndex
{
  return self->_incidentIndex;
}

- (void)setIncidentIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_incidentIndex = a3;
}

- (void)setHasIncidentIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasIncidentIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)transitIncidentIndex
{
  return self->_transitIncidentIndex;
}

- (void)setTransitIncidentIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_transitIncidentIndex = a3;
}

- (void)setHasTransitIncidentIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransitIncidentIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readAnalyticsMessageValues
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
        GEOAdvisoryItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsMessageValues_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)analyticsMessageValues
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return analyticsMessageValues;
}

- (void)setAnalyticsMessageValues:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  analyticsMessageValues = self->_analyticsMessageValues;
  self->_analyticsMessageValues = v4;
}

- (void)clearAnalyticsMessageValues
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  analyticsMessageValues = self->_analyticsMessageValues;

  [(NSMutableArray *)analyticsMessageValues removeAllObjects];
}

- (void)addAnalyticsMessageValue:(id)a3
{
  id v4 = a3;
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  -[GEOAdvisoryItem _addNoFlagsAnalyticsMessageValue:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsAnalyticsMessageValue:(uint64_t)a1
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

- (unint64_t)analyticsMessageValuesCount
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return [(NSMutableArray *)analyticsMessageValues count];
}

- (id)analyticsMessageValueAtIndex:(unint64_t)a3
{
  -[GEOAdvisoryItem _readAnalyticsMessageValues]((uint64_t)self);
  analyticsMessageValues = self->_analyticsMessageValues;

  return (id)[(NSMutableArray *)analyticsMessageValues objectAtIndex:a3];
}

+ (Class)analyticsMessageValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAdvisoryItem;
  id v4 = [(GEOAdvisoryItem *)&v8 description];
  id v5 = [(GEOAdvisoryItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAdvisoryItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 advisoryCard];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"advisoryCard";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"advisory_card";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 60);
    if (v9)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v11 = @"incidentIndex";
      }
      else {
        v11 = @"incident_index";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 60);
    }
    if ((v9 & 2) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
      if (a2) {
        v13 = @"transitIncidentIndex";
      }
      else {
        v13 = @"transit_incident_index";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if (*(void *)(a1 + 32))
    {
      v14 = [(id)a1 analyticsMessageValues];
      if (a2) {
        v15 = @"analyticsMessageValue";
      }
      else {
        v15 = @"analytics_message_value";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__GEOAdvisoryItem__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOAdvisoryItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOAdvisoryItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAdvisoryItem)initWithDictionary:(id)a3
{
  return (GEOAdvisoryItem *)-[GEOAdvisoryItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"advisoryCard";
      }
      else {
        objc_super v6 = @"advisory_card";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOAdvisoryCard alloc];
        if (a3) {
          uint64_t v9 = [(GEOAdvisoryCard *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOAdvisoryCard *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setAdvisoryCard:v9];
      }
      if (a3) {
        v11 = @"incidentIndex";
      }
      else {
        v11 = @"incident_index";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIncidentIndex:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        v13 = @"transitIncidentIndex";
      }
      else {
        v13 = @"transit_incident_index";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitIncidentIndex:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        v15 = @"analyticsMessageValue";
      }
      else {
        v15 = @"analytics_message_value";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = objc_msgSend(v22, "copy", (void)v25);
                [a1 addAnalyticsMessageValue:v23];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v19);
        }
      }
    }
  }

  return a1;
}

- (GEOAdvisoryItem)initWithJSON:(id)a3
{
  return (GEOAdvisoryItem *)-[GEOAdvisoryItem _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_371;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_372;
    }
    GEOAdvisoryItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOAdvisoryCard *)self->_advisoryCard readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAdvisoryItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAdvisoryItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAdvisoryItemIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
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
    [(GEOAdvisoryItem *)self readAll:0];
    if (self->_advisoryCard) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_analyticsMessageValues;
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
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOAdvisoryItem _readAdvisoryCard]((uint64_t)self);
  advisoryCard = self->_advisoryCard;

  return [(GEOAdvisoryCard *)advisoryCard hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOAdvisoryItem *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_advisoryCard) {
    objc_msgSend(v9, "setAdvisoryCard:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v9 + 13) = self->_incidentIndex;
    *((unsigned char *)v9 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 14) = self->_transitIncidentIndex;
    *((unsigned char *)v9 + 60) |= 2u;
  }
  if ([(GEOAdvisoryItem *)self analyticsMessageValuesCount])
  {
    [v9 clearAnalyticsMessageValues];
    unint64_t v5 = [(GEOAdvisoryItem *)self analyticsMessageValuesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOAdvisoryItem *)self analyticsMessageValueAtIndex:i];
        [v9 addAnalyticsMessageValue:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAdvisoryItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAdvisoryItem *)self readAll:0];
  id v9 = [(GEOAdvisoryCard *)self->_advisoryCard copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 52) = self->_incidentIndex;
    *(unsigned char *)(v5 + 60) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_transitIncidentIndex;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_analyticsMessageValues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v5 addAnalyticsMessageValue:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOAdvisoryItem *)self readAll:1];
  [v4 readAll:1];
  advisoryCard = self->_advisoryCard;
  if ((unint64_t)advisoryCard | *((void *)v4 + 3))
  {
    if (!-[GEOAdvisoryCard isEqual:](advisoryCard, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_transitIncidentIndex != *((_DWORD *)v4 + 14)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  analyticsMessageValues = self->_analyticsMessageValues;
  if ((unint64_t)analyticsMessageValues | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](analyticsMessageValues, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAdvisoryItem *)self readAll:1];
  unint64_t v3 = [(GEOAdvisoryCard *)self->_advisoryCard hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_incidentIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_analyticsMessageValues hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_transitIncidentIndex;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_analyticsMessageValues hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  advisoryCard = self->_advisoryCard;
  uint64_t v6 = *((void *)v4 + 3);
  if (advisoryCard)
  {
    if (v6) {
      -[GEOAdvisoryCard mergeFrom:](advisoryCard, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOAdvisoryItem setAdvisoryCard:](self, "setAdvisoryCard:");
  }
  char v7 = *((unsigned char *)v4 + 60);
  if (v7)
  {
    self->_incidentIndex = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if ((v7 & 2) != 0)
  {
    self->_transitIncidentIndex = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOAdvisoryItem addAnalyticsMessageValue:](self, "addAnalyticsMessageValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOAdvisoryItemReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_376);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAdvisoryItem *)self readAll:0];
    advisoryCard = self->_advisoryCard;
    [(GEOAdvisoryCard *)advisoryCard clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_advisoryCard, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end