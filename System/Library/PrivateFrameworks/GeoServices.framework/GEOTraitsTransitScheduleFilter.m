@interface GEOTraitsTransitScheduleFilter
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHighFrequencyFilter;
- (BOOL)hasLowFrequencyFilter;
- (BOOL)hasOperatingHoursRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTraitsTransitScheduleFilter)init;
- (GEOTraitsTransitScheduleFilter)initWithData:(id)a3;
- (GEOTraitsTransitScheduleFilter)initWithDictionary:(id)a3;
- (GEOTraitsTransitScheduleFilter)initWithJSON:(id)a3;
- (GEOTraitsTransitScheduleModeFilter)highFrequencyFilter;
- (GEOTraitsTransitScheduleModeFilter)lowFrequencyFilter;
- (GEOTraitsTransitScheduleTimeRange)operatingHoursRange;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHighFrequencyFilter;
- (void)_readLowFrequencyFilter;
- (void)_readOperatingHoursRange;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHighFrequencyFilter:(id)a3;
- (void)setLowFrequencyFilter:(id)a3;
- (void)setOperatingHoursRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTraitsTransitScheduleFilter

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTraitsTransitScheduleFilter *)self readAll:0];
    id v8 = [(GEOTraitsTransitScheduleModeFilter *)self->_highFrequencyFilter copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOTraitsTransitScheduleModeFilter *)self->_lowFrequencyFilter copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    id v12 = [(GEOTraitsTransitScheduleTimeRange *)self->_operatingHoursRange copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTraitsTransitScheduleFilterReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_3854;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3855;
    }
    GEOTraitsTransitScheduleFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOTraitsTransitScheduleModeFilter *)self->_highFrequencyFilter readAll:1];
    [(GEOTraitsTransitScheduleModeFilter *)self->_lowFrequencyFilter readAll:1];
    [(GEOTraitsTransitScheduleTimeRange *)self->_operatingHoursRange readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOTraitsTransitScheduleFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTraitsTransitScheduleFilter;
  v2 = [(GEOTraitsTransitScheduleFilter *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTraitsTransitScheduleModeFilter)lowFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readLowFrequencyFilter]((uint64_t)self);
  lowFrequencyFilter = self->_lowFrequencyFilter;

  return lowFrequencyFilter;
}

- (void)_readLowFrequencyFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLowFrequencyFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOTraitsTransitScheduleModeFilter)highFrequencyFilter
{
  -[GEOTraitsTransitScheduleFilter _readHighFrequencyFilter]((uint64_t)self);
  highFrequencyFilter = self->_highFrequencyFilter;

  return highFrequencyFilter;
}

- (void)_readHighFrequencyFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHighFrequencyFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)setOperatingHoursRange:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_operatingHoursRange, a3);
}

- (GEOTraitsTransitScheduleTimeRange)operatingHoursRange
{
  -[GEOTraitsTransitScheduleFilter _readOperatingHoursRange]((uint64_t)self);
  operatingHoursRange = self->_operatingHoursRange;

  return operatingHoursRange;
}

- (void)_readOperatingHoursRange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTraitsTransitScheduleFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOperatingHoursRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLowFrequencyFilter
{
  return self->_lowFrequencyFilter != 0;
}

- (BOOL)hasHighFrequencyFilter
{
  return self->_highFrequencyFilter != 0;
}

- (BOOL)hasOperatingHoursRange
{
  return self->_operatingHoursRange != 0;
}

- (void)setLowFrequencyFilter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_lowFrequencyFilter, a3);
}

- (void)setHighFrequencyFilter:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_highFrequencyFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingHoursRange, 0);
  objc_storeStrong((id *)&self->_lowFrequencyFilter, 0);
  objc_storeStrong((id *)&self->_highFrequencyFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTraitsTransitScheduleFilter *)self readAll:0];
    if (self->_highFrequencyFilter) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_lowFrequencyFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_operatingHoursRange)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (GEOTraitsTransitScheduleFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTraitsTransitScheduleFilter;
  id v3 = [(GEOTraitsTransitScheduleFilter *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTraitsTransitScheduleFilter;
  v4 = [(GEOTraitsTransitScheduleFilter *)&v8 description];
  id v5 = [(GEOTraitsTransitScheduleFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTraitsTransitScheduleFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 highFrequencyFilter];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"highFrequencyFilter";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"high_frequency_filter";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 lowFrequencyFilter];
    id v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        id v12 = @"lowFrequencyFilter";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        id v12 = @"low_frequency_filter";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 operatingHoursRange];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"operatingHoursRange";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"operating_hours_range";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = (void *)a1[2];
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __60__GEOTraitsTransitScheduleFilter__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOTraitsTransitScheduleFilter _dictionaryRepresentation:](self, 1);
}

void __60__GEOTraitsTransitScheduleFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOTraitsTransitScheduleFilter)initWithDictionary:(id)a3
{
  return (GEOTraitsTransitScheduleFilter *)-[GEOTraitsTransitScheduleFilter _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"highFrequencyFilter";
      }
      else {
        objc_super v6 = @"high_frequency_filter";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOTraitsTransitScheduleModeFilter alloc];
        if (a3) {
          uint64_t v9 = [(GEOTraitsTransitScheduleModeFilter *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOTraitsTransitScheduleModeFilter *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setHighFrequencyFilter:v9];
      }
      if (a3) {
        v11 = @"lowFrequencyFilter";
      }
      else {
        v11 = @"low_frequency_filter";
      }
      id v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOTraitsTransitScheduleModeFilter alloc];
        if (a3) {
          uint64_t v14 = [(GEOTraitsTransitScheduleModeFilter *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOTraitsTransitScheduleModeFilter *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setLowFrequencyFilter:v14];
      }
      if (a3) {
        v16 = @"operatingHoursRange";
      }
      else {
        v16 = @"operating_hours_range";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOTraitsTransitScheduleTimeRange alloc];
        if (a3) {
          uint64_t v19 = [(GEOTraitsTransitScheduleTimeRange *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOTraitsTransitScheduleTimeRange *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setOperatingHoursRange:v19];
      }
    }
  }

  return a1;
}

- (GEOTraitsTransitScheduleFilter)initWithJSON:(id)a3
{
  return (GEOTraitsTransitScheduleFilter *)-[GEOTraitsTransitScheduleFilter _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTraitsTransitScheduleFilterIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTraitsTransitScheduleFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTraitsTransitScheduleFilter *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_highFrequencyFilter) {
    objc_msgSend(v5, "setHighFrequencyFilter:");
  }
  if (self->_lowFrequencyFilter) {
    objc_msgSend(v5, "setLowFrequencyFilter:");
  }
  v4 = v5;
  if (self->_operatingHoursRange)
  {
    objc_msgSend(v5, "setOperatingHoursRange:");
    v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTraitsTransitScheduleFilter *)self readAll:1],
         [v4 readAll:1],
         highFrequencyFilter = self->_highFrequencyFilter,
         !((unint64_t)highFrequencyFilter | v4[3]))
     || -[GEOTraitsTransitScheduleModeFilter isEqual:](highFrequencyFilter, "isEqual:"))
    && ((lowFrequencyFilter = self->_lowFrequencyFilter, !((unint64_t)lowFrequencyFilter | v4[4]))
     || -[GEOTraitsTransitScheduleModeFilter isEqual:](lowFrequencyFilter, "isEqual:")))
  {
    operatingHoursRange = self->_operatingHoursRange;
    if ((unint64_t)operatingHoursRange | v4[5]) {
      char v8 = -[GEOTraitsTransitScheduleTimeRange isEqual:](operatingHoursRange, "isEqual:");
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
  [(GEOTraitsTransitScheduleFilter *)self readAll:1];
  unint64_t v3 = [(GEOTraitsTransitScheduleModeFilter *)self->_highFrequencyFilter hash];
  unint64_t v4 = [(GEOTraitsTransitScheduleModeFilter *)self->_lowFrequencyFilter hash] ^ v3;
  return v4 ^ [(GEOTraitsTransitScheduleTimeRange *)self->_operatingHoursRange hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  highFrequencyFilter = self->_highFrequencyFilter;
  uint64_t v5 = v10[3];
  if (highFrequencyFilter)
  {
    if (v5) {
      -[GEOTraitsTransitScheduleModeFilter mergeFrom:](highFrequencyFilter, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTraitsTransitScheduleFilter setHighFrequencyFilter:](self, "setHighFrequencyFilter:");
  }
  lowFrequencyFilter = self->_lowFrequencyFilter;
  uint64_t v7 = v10[4];
  if (lowFrequencyFilter)
  {
    if (v7) {
      -[GEOTraitsTransitScheduleModeFilter mergeFrom:](lowFrequencyFilter, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOTraitsTransitScheduleFilter setLowFrequencyFilter:](self, "setLowFrequencyFilter:");
  }
  operatingHoursRange = self->_operatingHoursRange;
  uint64_t v9 = v10[5];
  if (operatingHoursRange)
  {
    if (v9) {
      -[GEOTraitsTransitScheduleTimeRange mergeFrom:](operatingHoursRange, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOTraitsTransitScheduleFilter setOperatingHoursRange:](self, "setOperatingHoursRange:");
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTraitsTransitScheduleFilterReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3859);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTraitsTransitScheduleFilter *)self readAll:0];
    [(GEOTraitsTransitScheduleModeFilter *)self->_highFrequencyFilter clearUnknownFields:1];
    [(GEOTraitsTransitScheduleModeFilter *)self->_lowFrequencyFilter clearUnknownFields:1];
    operatingHoursRange = self->_operatingHoursRange;
    [(GEOTraitsTransitScheduleTimeRange *)operatingHoursRange clearUnknownFields:1];
  }
}

@end