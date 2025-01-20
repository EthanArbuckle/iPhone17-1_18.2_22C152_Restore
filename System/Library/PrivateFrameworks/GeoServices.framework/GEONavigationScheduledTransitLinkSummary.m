@interface GEONavigationScheduledTransitLinkSummary
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLineID;
- (BOOL)hasScheduledArrival;
- (BOOL)hasScheduledDeparture;
- (BOOL)hasStopFrom;
- (BOOL)hasStopTo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONavigationScheduledTransitLinkSummary)init;
- (GEONavigationScheduledTransitLinkSummary)initWithData:(id)a3;
- (GEONavigationScheduledTransitLinkSummary)initWithDictionary:(id)a3;
- (GEONavigationScheduledTransitLinkSummary)initWithJSON:(id)a3;
- (GEONavigationScheduledTransitLinkSummary)initWithTransitTripRouteStep:(id)a3 originSummary:(id)a4 destinationSummary:(id)a5;
- (GEONavigationTransitStopSummary)stopFrom;
- (GEONavigationTransitStopSummary)stopTo;
- (double)scheduledArrival;
- (double)scheduledDeparture;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)lineID;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readStopFrom;
- (void)_readStopTo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasLineID:(BOOL)a3;
- (void)setHasScheduledArrival:(BOOL)a3;
- (void)setHasScheduledDeparture:(BOOL)a3;
- (void)setLineID:(unint64_t)a3;
- (void)setScheduledArrival:(double)a3;
- (void)setScheduledDeparture:(double)a3;
- (void)setStopFrom:(id)a3;
- (void)setStopTo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigationScheduledTransitLinkSummary

- (GEONavigationScheduledTransitLinkSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  v2 = [(GEONavigationScheduledTransitLinkSummary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONavigationScheduledTransitLinkSummary)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  v3 = [(GEONavigationScheduledTransitLinkSummary *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)lineID
{
  return self->_lineID;
}

- (void)setLineID:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_lineID = a3;
}

- (void)setHasLineID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLineID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)scheduledDeparture
{
  return self->_scheduledDeparture;
}

- (void)setScheduledDeparture:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_scheduledDeparture = a3;
}

- (void)setHasScheduledDeparture:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasScheduledDeparture
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)scheduledArrival
{
  return self->_scheduledArrival;
}

- (void)setScheduledArrival:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_scheduledArrival = a3;
}

- (void)setHasScheduledArrival:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasScheduledArrival
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readStopFrom
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
        GEONavigationScheduledTransitLinkSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopFrom_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStopFrom
{
  return self->_stopFrom != 0;
}

- (GEONavigationTransitStopSummary)stopFrom
{
  -[GEONavigationScheduledTransitLinkSummary _readStopFrom]((uint64_t)self);
  stopFrom = self->_stopFrom;

  return stopFrom;
}

- (void)setStopFrom:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_stopFrom, a3);
}

- (void)_readStopTo
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
        GEONavigationScheduledTransitLinkSummaryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopTo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStopTo
{
  return self->_stopTo != 0;
}

- (GEONavigationTransitStopSummary)stopTo
{
  -[GEONavigationScheduledTransitLinkSummary _readStopTo]((uint64_t)self);
  stopTo = self->_stopTo;

  return stopTo;
}

- (void)setStopTo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_stopTo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  v4 = [(GEONavigationScheduledTransitLinkSummary *)&v8 description];
  v5 = [(GEONavigationScheduledTransitLinkSummary *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationScheduledTransitLinkSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 68);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 68) & 4) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    v10 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    [v4 setObject:v10 forKey:@"scheduledDeparture"];

    if ((*(unsigned char *)(a1 + 68) & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
  [v4 setObject:v9 forKey:@"lineID"];

  char v5 = *(unsigned char *)(a1 + 68);
  if ((v5 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"scheduledArrival"];
  }
LABEL_6:
  objc_super v7 = [(id)a1 stopFrom];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    v11 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v11 forKey:@"stopFrom"];
  }
  v12 = [(id)a1 stopTo];
  v13 = v12;
  if (v12)
  {
    if (a2) {
      [v12 jsonRepresentation];
    }
    else {
    v14 = [v12 dictionaryRepresentation];
    }
    [v4 setObject:v14 forKey:@"stopTo"];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavigationScheduledTransitLinkSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationScheduledTransitLinkSummary)initWithDictionary:(id)a3
{
  return (GEONavigationScheduledTransitLinkSummary *)-[GEONavigationScheduledTransitLinkSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"lineID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineID:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      objc_super v7 = [v5 objectForKeyedSubscript:@"scheduledDeparture"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setScheduledDeparture:");
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"scheduledArrival"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        objc_msgSend(a1, "setScheduledArrival:");
      }

      v9 = [v5 objectForKeyedSubscript:@"stopFrom"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEONavigationTransitStopSummary alloc];
        if (a3) {
          uint64_t v11 = [(GEONavigationTransitStopSummary *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEONavigationTransitStopSummary *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setStopFrom:v11];
      }
      v13 = [v5 objectForKeyedSubscript:@"stopTo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEONavigationTransitStopSummary alloc];
        if (a3) {
          uint64_t v15 = [(GEONavigationTransitStopSummary *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEONavigationTransitStopSummary *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setStopTo:v15];
      }
    }
  }

  return a1;
}

- (GEONavigationScheduledTransitLinkSummary)initWithJSON:(id)a3
{
  return (GEONavigationScheduledTransitLinkSummary *)-[GEONavigationScheduledTransitLinkSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_416;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_417;
    }
    GEONavigationScheduledTransitLinkSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEONavigationTransitStopSummary *)self->_stopFrom readAll:1];
    [(GEONavigationTransitStopSummary *)self->_stopTo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationScheduledTransitLinkSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationScheduledTransitLinkSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 0x38) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONavigationScheduledTransitLinkSummary *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_12:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if ((flags & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_stopFrom) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stopTo) {
    PBDataWriterWriteSubmessage();
  }
LABEL_15:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEONavigationScheduledTransitLinkSummary _readStopFrom]((uint64_t)self);
  if ([(GEONavigationTransitStopSummary *)self->_stopFrom hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEONavigationScheduledTransitLinkSummary _readStopTo]((uint64_t)self);
  stopTo = self->_stopTo;

  return [(GEONavigationTransitStopSummary *)stopTo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEONavigationScheduledTransitLinkSummary *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    v6[2] = self->_lineID;
    *((unsigned char *)v6 + 68) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v6[4] = *(id *)&self->_scheduledDeparture;
  *((unsigned char *)v6 + 68) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v6[3] = *(id *)&self->_scheduledArrival;
    *((unsigned char *)v6 + 68) |= 2u;
  }
LABEL_5:
  if (self->_stopFrom)
  {
    objc_msgSend(v6, "setStopFrom:");
    v4 = v6;
  }
  if (self->_stopTo)
  {
    objc_msgSend(v6, "setStopTo:");
    v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEONavigationScheduledTransitLinkSummary *)self readAll:0];
    char flags = (char)self->_flags;
    if (flags)
    {
      *(void *)(v5 + 16) = self->_lineID;
      *(unsigned char *)(v5 + 68) |= 1u;
      char flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          id v10 = [(GEONavigationTransitStopSummary *)self->_stopFrom copyWithZone:a3];
          uint64_t v11 = *(void **)(v5 + 40);
          *(void *)(v5 + 40) = v10;

          id v12 = [(GEONavigationTransitStopSummary *)self->_stopTo copyWithZone:a3];
          id v8 = *(id *)(v5 + 48);
          *(void *)(v5 + 48) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(double *)(v5 + 24) = self->_scheduledArrival;
        *(unsigned char *)(v5 + 68) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_scheduledDeparture;
    *(unsigned char *)(v5 + 68) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEONavigationScheduledTransitLinkSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEONavigationScheduledTransitLinkSummary *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_lineID != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_scheduledDeparture != *((double *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_scheduledArrival != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_21;
  }
  stopFrom = self->_stopFrom;
  if ((unint64_t)stopFrom | *((void *)v4 + 5)
    && !-[GEONavigationTransitStopSummary isEqual:](stopFrom, "isEqual:"))
  {
    goto LABEL_21;
  }
  stopTo = self->_stopTo;
  if ((unint64_t)stopTo | *((void *)v4 + 6)) {
    char v7 = -[GEONavigationTransitStopSummary isEqual:](stopTo, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  [(GEONavigationScheduledTransitLinkSummary *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    unint64_t v4 = 2654435761u * self->_lineID;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double scheduledDeparture = self->_scheduledDeparture;
  double v6 = -scheduledDeparture;
  if (scheduledDeparture >= 0.0) {
    double v6 = self->_scheduledDeparture;
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
LABEL_11:
  if ((flags & 2) != 0)
  {
    double scheduledArrival = self->_scheduledArrival;
    double v12 = -scheduledArrival;
    if (scheduledArrival >= 0.0) {
      double v12 = self->_scheduledArrival;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v15 = v9 ^ v4 ^ v10 ^ [(GEONavigationTransitStopSummary *)self->_stopFrom hash];
  return v15 ^ [(GEONavigationTransitStopSummary *)self->_stopTo hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  unint64_t v4 = v10;
  char v5 = *((unsigned char *)v10 + 68);
  if (v5)
  {
    self->_lineID = *((void *)v10 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v10 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v10 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double scheduledDeparture = *((double *)v10 + 4);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v10 + 68) & 2) != 0)
  {
LABEL_4:
    self->_double scheduledArrival = *((double *)v10 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
  stopFrom = self->_stopFrom;
  uint64_t v7 = *((void *)v10 + 5);
  if (stopFrom)
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEONavigationTransitStopSummary mergeFrom:](stopFrom, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_14;
    }
    -[GEONavigationScheduledTransitLinkSummary setStopFrom:](self, "setStopFrom:");
  }
  unint64_t v4 = v10;
LABEL_14:
  stopTo = self->_stopTo;
  uint64_t v9 = v4[6];
  if (stopTo)
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEONavigationTransitStopSummary mergeFrom:](stopTo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_20;
    }
    -[GEONavigationScheduledTransitLinkSummary setStopTo:](self, "setStopTo:");
  }
  unint64_t v4 = v10;
LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTo, 0);
  objc_storeStrong((id *)&self->_stopFrom, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEONavigationScheduledTransitLinkSummary)initWithTransitTripRouteStep:(id)a3 originSummary:(id)a4 destinationSummary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(GEONavigationScheduledTransitLinkSummary *)self init];
  if (v11)
  {
    double v12 = [v8 transitLine];
    -[GEONavigationScheduledTransitLinkSummary setLineID:](v11, "setLineID:", [v12 muid]);

    long double v13 = [v8 departureTime];
    [v13 timeIntervalSinceReferenceDate];
    -[GEONavigationScheduledTransitLinkSummary setScheduledDeparture:](v11, "setScheduledDeparture:");

    double v14 = [v8 arrivalTime];
    [v14 timeIntervalSinceReferenceDate];
    -[GEONavigationScheduledTransitLinkSummary setScheduledArrival:](v11, "setScheduledArrival:");

    [(GEONavigationScheduledTransitLinkSummary *)v11 setStopFrom:v9];
    [(GEONavigationScheduledTransitLinkSummary *)v11 setStopTo:v10];
    unint64_t v15 = v11;
  }

  return v11;
}

@end