@interface GEORPFeedbackBusinessHours
+ (BOOL)isValid:(id)a3;
- (BOOL)hasComments;
- (BOOL)hasEnd;
- (BOOL)hasHoursType;
- (BOOL)hasStart;
- (BOOL)hasWeeklyHours;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDHours)weeklyHours;
- (GEORPFeedbackBusinessHours)init;
- (GEORPFeedbackBusinessHours)initWithData:(id)a3;
- (GEORPFeedbackBusinessHours)initWithDictionary:(id)a3;
- (GEORPFeedbackBusinessHours)initWithJSON:(id)a3;
- (NSString)comments;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hoursTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsHoursType:(id)a3;
- (int)hoursType;
- (unint64_t)end;
- (unint64_t)hash;
- (unint64_t)start;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readComments;
- (void)_readWeeklyHours;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComments:(id)a3;
- (void)setEnd:(unint64_t)a3;
- (void)setHasEnd:(BOOL)a3;
- (void)setHasHoursType:(BOOL)a3;
- (void)setHasStart:(BOOL)a3;
- (void)setHoursType:(int)a3;
- (void)setStart:(unint64_t)a3;
- (void)setWeeklyHours:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackBusinessHours

- (GEORPFeedbackBusinessHours)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackBusinessHours;
  v2 = [(GEORPFeedbackBusinessHours *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackBusinessHours)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackBusinessHours;
  v3 = [(GEORPFeedbackBusinessHours *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWeeklyHours
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
        GEORPFeedbackBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWeeklyHours_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasWeeklyHours
{
  return self->_weeklyHours != 0;
}

- (GEOPDHours)weeklyHours
{
  -[GEORPFeedbackBusinessHours _readWeeklyHours]((uint64_t)self);
  weeklyHours = self->_weeklyHours;

  return weeklyHours;
}

- (void)setWeeklyHours:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_weeklyHours, a3);
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStart
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)end
{
  return self->_end;
}

- (void)setEnd:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasEnd
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readComments
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
        GEORPFeedbackBusinessHoursReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComments_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasComments
{
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPFeedbackBusinessHours _readComments]((uint64_t)self);
  comments = self->_comments;

  return comments;
}

- (void)setComments:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (int)hoursType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_hoursType;
  }
  else {
    return 0;
  }
}

- (void)setHoursType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_hoursType = a3;
}

- (void)setHasHoursType:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHoursType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)hoursTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = (void *)*((void *)&off_1E53EC6C0 + a3);
  }

  return v3;
}

- (int)StringAsHoursType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_HOURS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_HOURS_NORMAL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_HOURS_SPECIAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_HOURS_TEMPORARY_CLOSURE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_HOURS_PERMANENT_CLOSURE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackBusinessHours;
  int v4 = [(GEORPFeedbackBusinessHours *)&v8 description];
  v5 = [(GEORPFeedbackBusinessHours *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackBusinessHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 weeklyHours];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"weeklyHours";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"weekly_hours";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 64);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v10 forKey:@"start"];

      char v9 = *(unsigned char *)(a1 + 64);
    }
    if (v9)
    {
      v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v11 forKey:@"end"];
    }
    v12 = [(id)a1 comments];
    if (v12) {
      [v4 setObject:v12 forKey:@"comments"];
    }

    if ((*(unsigned char *)(a1 + 64) & 4) != 0)
    {
      uint64_t v13 = *(int *)(a1 + 60);
      if (v13 >= 5)
      {
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      }
      else
      {
        v14 = (void *)*((void *)&off_1E53EC6C0 + v13);
      }
      if (a2) {
        v15 = @"hoursType";
      }
      else {
        v15 = @"hours_type";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEORPFeedbackBusinessHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackBusinessHours)initWithDictionary:(id)a3
{
  return (GEORPFeedbackBusinessHours *)-[GEORPFeedbackBusinessHours _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"weeklyHours";
      }
      else {
        objc_super v6 = @"weekly_hours";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDHours alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDHours *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDHours *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setWeeklyHours:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"start"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStart:", objc_msgSend(v11, "unsignedLongLongValue"));
      }

      v12 = [v5 objectForKeyedSubscript:@"end"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEnd:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      uint64_t v13 = [v5 objectForKeyedSubscript:@"comments"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setComments:v14];
      }
      if (a3) {
        v15 = @"hoursType";
      }
      else {
        v15 = @"hours_type";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if ([v17 isEqualToString:@"FEEDBACK_HOURS_UNKNOWN"])
        {
          uint64_t v18 = 0;
        }
        else if ([v17 isEqualToString:@"FEEDBACK_HOURS_NORMAL"])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:@"FEEDBACK_HOURS_SPECIAL"])
        {
          uint64_t v18 = 2;
        }
        else if ([v17 isEqualToString:@"FEEDBACK_HOURS_TEMPORARY_CLOSURE"])
        {
          uint64_t v18 = 3;
        }
        else if ([v17 isEqualToString:@"FEEDBACK_HOURS_PERMANENT_CLOSURE"])
        {
          uint64_t v18 = 4;
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v18 = [v16 intValue];
      }
      [a1 setHoursType:v18];
      goto LABEL_36;
    }
  }
LABEL_37:

  return a1;
}

- (GEORPFeedbackBusinessHours)initWithJSON:(id)a3
{
  return (GEORPFeedbackBusinessHours *)-[GEORPFeedbackBusinessHours _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_219;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_220;
    }
    GEORPFeedbackBusinessHoursReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDHours *)self->_weeklyHours readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackBusinessHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackBusinessHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackBusinessHoursIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackBusinessHours *)self readAll:0];
    if (self->_weeklyHours) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_comments) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPFeedbackBusinessHours *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_weeklyHours) {
    objc_msgSend(v6, "setWeeklyHours:");
  }
  char flags = (char)self->_flags;
  id v5 = v6;
  if ((flags & 2) != 0)
  {
    v6[4] = self->_start;
    *((unsigned char *)v6 + 64) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v6[3] = self->_end;
    *((unsigned char *)v6 + 64) |= 1u;
  }
  if (self->_comments)
  {
    objc_msgSend(v6, "setComments:");
    id v5 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_hoursType;
    *((unsigned char *)v5 + 64) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPFeedbackBusinessHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPFeedbackBusinessHours *)self readAll:0];
  id v9 = [(GEOPDHours *)self->_weeklyHours copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_start;
    *(unsigned char *)(v5 + 64) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 24) = self->_end;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_comments copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_hoursType;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEORPFeedbackBusinessHours *)self readAll:1];
  [v4 readAll:1];
  weeklyHours = self->_weeklyHours;
  if ((unint64_t)weeklyHours | *((void *)v4 + 5))
  {
    if (!-[GEOPDHours isEqual:](weeklyHours, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 64);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_start != *((void *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_end != *((void *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_21;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](comments, "isEqual:"))
    {
LABEL_21:
      BOOL v9 = 0;
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 64);
  }
  BOOL v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_hoursType != *((_DWORD *)v4 + 15)) {
      goto LABEL_21;
    }
    BOOL v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPFeedbackBusinessHours *)self readAll:1];
  unint64_t v3 = [(GEOPDHours *)self->_weeklyHours hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_start;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_end;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_comments hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_hoursType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unint64_t *)a3;
  [v8 readAll:0];
  weeklyHours = self->_weeklyHours;
  unint64_t v5 = v8[5];
  if (weeklyHours)
  {
    if (v5) {
      -[GEOPDHours mergeFrom:](weeklyHours, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackBusinessHours setWeeklyHours:](self, "setWeeklyHours:");
  }
  NSUInteger v6 = v8;
  char v7 = *((unsigned char *)v8 + 64);
  if ((v7 & 2) != 0)
  {
    self->_start = v8[4];
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v8 + 64);
  }
  if (v7)
  {
    self->_end = v8[3];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v8[2])
  {
    -[GEORPFeedbackBusinessHours setComments:](self, "setComments:");
    NSUInteger v6 = v8;
  }
  if ((v6[8] & 4) != 0)
  {
    self->_hoursType = *((_DWORD *)v6 + 15);
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyHours, 0);
  objc_storeStrong((id *)&self->_comments, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end