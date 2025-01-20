@interface GEOLogMsgEventDailyUseSummary
+ (BOOL)isValid:(id)a3;
+ (Class)useEventsType;
- (BOOL)hasFirstEventDate;
- (BOOL)hasFirstEventTimeRoundedToHour;
- (BOOL)hasSummaryDate;
- (BOOL)hasSummaryPeriod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventDailyUseSummary)init;
- (GEOLogMsgEventDailyUseSummary)initWithData:(id)a3;
- (GEOLogMsgEventDailyUseSummary)initWithDictionary:(id)a3;
- (GEOLogMsgEventDailyUseSummary)initWithJSON:(id)a3;
- (NSMutableArray)useEvents;
- (NSString)summaryDate;
- (double)firstEventDate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)summaryPeriodAsString:(int)a3;
- (id)useEventsAtIndex:(unint64_t)a3;
- (int)StringAsSummaryPeriod:(id)a3;
- (int)summaryPeriod;
- (unint64_t)firstEventTimeRoundedToHour;
- (unint64_t)hash;
- (unint64_t)useEventsCount;
- (void)_addNoFlagsUseEvents:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSummaryDate;
- (void)_readUseEvents;
- (void)addUseEvents:(id)a3;
- (void)clearUseEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFirstEventDate:(double)a3;
- (void)setFirstEventTimeRoundedToHour:(unint64_t)a3;
- (void)setHasFirstEventDate:(BOOL)a3;
- (void)setHasFirstEventTimeRoundedToHour:(BOOL)a3;
- (void)setHasSummaryPeriod:(BOOL)a3;
- (void)setSummaryDate:(id)a3;
- (void)setSummaryPeriod:(int)a3;
- (void)setUseEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventDailyUseSummary

- (void)copyTo:(id)a3
{
  v10 = (id *)a3;
  [(GEOLogMsgEventDailyUseSummary *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEventDailyUseSummary *)self useEventsCount])
  {
    [v10 clearUseEvents];
    unint64_t v4 = [(GEOLogMsgEventDailyUseSummary *)self useEventsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [(GEOLogMsgEventDailyUseSummary *)self useEventsAtIndex:i];
        [v10 addUseEvents:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  v9 = v10;
  if (flags)
  {
    v10[2] = *(id *)&self->_firstEventDate;
    *((unsigned char *)v10 + 64) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  v10[3] = self->_firstEventTimeRoundedToHour;
  *((unsigned char *)v10 + 64) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v10 + 15) = self->_summaryPeriod;
    *((unsigned char *)v10 + 64) |= 4u;
  }
LABEL_9:
  if (self->_summaryDate)
  {
    objc_msgSend(v10, "setSummaryDate:");
    v9 = v10;
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_51;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_51;
  }
  if (a3) {
    v6 = @"useEvents";
  }
  else {
    v6 = @"use_events";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v5;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [GEODailyUseSummaryUseEvent alloc];
            if (a3) {
              uint64_t v15 = [(GEODailyUseSummaryUseEvent *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEODailyUseSummaryUseEvent *)v14 initWithDictionary:v13];
            }
            v16 = (void *)v15;
            [a1 addUseEvents:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v5 = v29;
  }

  if (a3) {
    v17 = @"firstEventDate";
  }
  else {
    v17 = @"first_event_date";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 doubleValue];
    objc_msgSend(a1, "setFirstEventDate:");
  }

  if (a3) {
    v19 = @"firstEventTimeRoundedToHour";
  }
  else {
    v19 = @"first_event_time_rounded_to_hour";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFirstEventTimeRoundedToHour:", objc_msgSend(v20, "unsignedLongLongValue"));
  }

  if (a3) {
    v21 = @"summaryPeriod";
  }
  else {
    v21 = @"summary_period";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"UseSummaryPeriod_UNSPECIFIED"])
    {
      uint64_t v24 = 0;
    }
    else if ([v23 isEqualToString:@"UseSummaryPeriod_DAILY"])
    {
      uint64_t v24 = 1;
    }
    else if ([v23 isEqualToString:@"UseSummaryPeriod_MONTHLY"])
    {
      uint64_t v24 = 2;
    }
    else
    {
      uint64_t v24 = 0;
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v22 intValue];
LABEL_44:
    [a1 setSummaryPeriod:v24];
  }

  if (a3) {
    v25 = @"summaryDate";
  }
  else {
    v25 = @"summary_date";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[v26 copy];
    [a1 setSummaryDate:v27];
  }
LABEL_51:

  return a1;
}

- (GEOLogMsgEventDailyUseSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  v2 = [(GEOLogMsgEventDailyUseSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventDailyUseSummary)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  v3 = [(GEOLogMsgEventDailyUseSummary *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readUseEvents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDailyUseSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUseEvents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)useEvents
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  useEvents = self->_useEvents;

  return useEvents;
}

- (void)setUseEvents:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  useEvents = self->_useEvents;
  self->_useEvents = v4;
}

- (void)clearUseEvents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  useEvents = self->_useEvents;

  [(NSMutableArray *)useEvents removeAllObjects];
}

- (void)addUseEvents:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  -[GEOLogMsgEventDailyUseSummary _addNoFlagsUseEvents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsUseEvents:(uint64_t)a1
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

- (unint64_t)useEventsCount
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  useEvents = self->_useEvents;

  return [(NSMutableArray *)useEvents count];
}

- (id)useEventsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  useEvents = self->_useEvents;

  return (id)[(NSMutableArray *)useEvents objectAtIndex:a3];
}

+ (Class)useEventsType
{
  return (Class)objc_opt_class();
}

- (double)firstEventDate
{
  return self->_firstEventDate;
}

- (void)setFirstEventDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_firstEventDate = a3;
}

- (void)setHasFirstEventDate:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasFirstEventDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unint64_t)firstEventTimeRoundedToHour
{
  return self->_firstEventTimeRoundedToHour;
}

- (void)setFirstEventTimeRoundedToHour:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_firstEventTimeRoundedToHour = a3;
}

- (void)setHasFirstEventTimeRoundedToHour:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFirstEventTimeRoundedToHour
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)summaryPeriod
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_summaryPeriod;
  }
  else {
    return 0;
  }
}

- (void)setSummaryPeriod:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_summaryPeriod = a3;
}

- (void)setHasSummaryPeriod:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSummaryPeriod
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)summaryPeriodAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7850[a3];
  }

  return v3;
}

- (int)StringAsSummaryPeriod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UseSummaryPeriod_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UseSummaryPeriod_DAILY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UseSummaryPeriod_MONTHLY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSummaryDate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDailyUseSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSummaryDate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSummaryDate
{
  return self->_summaryDate != 0;
}

- (NSString)summaryDate
{
  -[GEOLogMsgEventDailyUseSummary _readSummaryDate]((uint64_t)self);
  summaryDate = self->_summaryDate;

  return summaryDate;
}

- (void)setSummaryDate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_summaryDate, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  int v4 = [(GEOLogMsgEventDailyUseSummary *)&v8 description];
  id v5 = [(GEOLogMsgEventDailyUseSummary *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDailyUseSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_42;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 40) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    if (a2) {
      uint64_t v13 = @"useEvents";
    }
    else {
      uint64_t v13 = @"use_events";
    }
    [v4 setObject:v5 forKey:v13];
  }
  char v14 = *(unsigned char *)(a1 + 64);
  if ((v14 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 64) & 2) == 0) {
      goto LABEL_19;
    }
LABEL_25:
    v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v18 = @"firstEventTimeRoundedToHour";
    }
    else {
      v18 = @"first_event_time_rounded_to_hour";
    }
    [v4 setObject:v17 forKey:v18];

    if ((*(unsigned char *)(a1 + 64) & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }
  uint64_t v15 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v16 = @"firstEventDate";
  }
  else {
    v16 = @"first_event_date";
  }
  [v4 setObject:v15 forKey:v16];

  char v14 = *(unsigned char *)(a1 + 64);
  if ((v14 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_19:
  if ((v14 & 4) != 0)
  {
LABEL_29:
    uint64_t v19 = *(int *)(a1 + 60);
    if (v19 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E53F7850[v19];
    }
    if (a2) {
      v21 = @"summaryPeriod";
    }
    else {
      v21 = @"summary_period";
    }
    [v4 setObject:v20 forKey:v21];
  }
LABEL_36:
  v22 = [(id)a1 summaryDate];
  if (v22)
  {
    if (a2) {
      id v23 = @"summaryDate";
    }
    else {
      id v23 = @"summary_date";
    }
    [v4 setObject:v22 forKey:v23];
  }

LABEL_42:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDailyUseSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDailyUseSummary)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDailyUseSummary *)-[GEOLogMsgEventDailyUseSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEventDailyUseSummary)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDailyUseSummary *)-[GEOLogMsgEventDailyUseSummary _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_2092;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2093;
    }
    GEOLogMsgEventDailyUseSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgEventDailyUseSummaryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDailyUseSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDailyUseSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    [(GEOLogMsgEventDailyUseSummary *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_useEvents;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_summaryDate) {
      PBDataWriterWriteStringField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventDailyUseSummary *)self readAll:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = self->_useEvents;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
          [(id)v5 addUseEvents:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    char flags = (char)self->_flags;
    if (flags)
    {
      *(double *)(v5 + 16) = self->_firstEventDate;
      *(unsigned char *)(v5 + 64) |= 1u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0)
        {
LABEL_16:
          uint64_t v15 = -[NSString copyWithZone:](self->_summaryDate, "copyWithZone:", a3, (void)v17);
          id v8 = *(id *)(v5 + 32);
          *(void *)(v5 + 32) = v15;
          goto LABEL_17;
        }
LABEL_15:
        *(_DWORD *)(v5 + 60) = self->_summaryPeriod;
        *(unsigned char *)(v5 + 64) |= 4u;
        goto LABEL_16;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(void *)(v5 + 24) = self->_firstEventTimeRoundedToHour;
    *(unsigned char *)(v5 + 64) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventDailyUseSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOLogMsgEventDailyUseSummary *)self readAll:1];
  [v4 readAll:1];
  useEvents = self->_useEvents;
  if ((unint64_t)useEvents | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](useEvents, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_firstEventDate != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_firstEventTimeRoundedToHour != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_summaryPeriod != *((_DWORD *)v4 + 15)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_21;
  }
  summaryDate = self->_summaryDate;
  if ((unint64_t)summaryDate | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](summaryDate, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventDailyUseSummary *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_useEvents hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double firstEventDate = self->_firstEventDate;
    double v7 = -firstEventDate;
    if (firstEventDate >= 0.0) {
      double v7 = self->_firstEventDate;
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
  if ((flags & 2) != 0)
  {
    unint64_t v10 = 2654435761u * self->_firstEventTimeRoundedToHour;
    if ((flags & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v11 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ [(NSString *)self->_summaryDate hash];
  }
  unint64_t v10 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_summaryPeriod;
  return v5 ^ v3 ^ v10 ^ v11 ^ [(NSString *)self->_summaryDate hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEventDailyUseSummary addUseEvents:](self, "addUseEvents:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 64);
  if (v10)
  {
    self->_double firstEventDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v4 + 64);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_firstEventTimeRoundedToHour = *((void *)v4 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_11:
    self->_summaryPeriod = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 4)) {
    -[GEOLogMsgEventDailyUseSummary setSummaryDate:](self, "setSummaryDate:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useEvents, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end