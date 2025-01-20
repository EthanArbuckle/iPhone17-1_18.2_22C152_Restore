@interface GEOLPRTimeCondition
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRTimeCondition)init;
- (GEOLPRTimeCondition)initWithData:(id)a3;
- (GEOLPRTimeCondition)initWithDictionary:(id)a3;
- (GEOLPRTimeCondition)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dayOfWeeksAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDayOfWeeks:(id)a3;
- (int)dayOfWeekAtIndex:(unint64_t)a3;
- (int)dayOfWeeks;
- (unint64_t)dayOfMonthsCount;
- (unint64_t)dayOfWeeksCount;
- (unint64_t)hash;
- (unsigned)dayOfMonthAtIndex:(unint64_t)a3;
- (unsigned)dayOfMonths;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDayOfMonths;
- (void)_readDayOfWeeks;
- (void)addDayOfMonth:(unsigned int)a3;
- (void)addDayOfWeek:(int)a3;
- (void)clearDayOfMonths;
- (void)clearDayOfWeeks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDayOfMonths:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDayOfWeeks:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRTimeCondition

- (GEOLPRTimeCondition)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRTimeCondition;
  v2 = [(GEOLPRTimeCondition *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRTimeCondition)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRTimeCondition;
  v3 = [(GEOLPRTimeCondition *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRTimeCondition;
  [(GEOLPRTimeCondition *)&v3 dealloc];
}

- (void)_readDayOfWeeks
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
        GEOLPRTimeConditionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDayOfWeeks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)dayOfWeeksCount
{
  return self->_dayOfWeeks.count;
}

- (int)dayOfWeeks
{
  return self->_dayOfWeeks.list;
}

- (void)clearDayOfWeeks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedInt32Clear();
}

- (void)addDayOfWeek:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (int)dayOfWeekAtIndex:(unint64_t)a3
{
  -[GEOLPRTimeCondition _readDayOfWeeks]((uint64_t)self);
  p_dayOfWeeks = &self->_dayOfWeeks;
  unint64_t count = self->_dayOfWeeks.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_dayOfWeeks->list[a3];
}

- (void)setDayOfWeeks:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147390](&self->_dayOfWeeks, a3, a4);
}

- (id)dayOfWeeksAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DDB48[a3 - 1];
  }

  return v3;
}

- (int)StringAsDayOfWeeks:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readDayOfMonths
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
        GEOLPRTimeConditionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDayOfMonths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)dayOfMonthsCount
{
  return self->_dayOfMonths.count;
}

- (unsigned)dayOfMonths
{
  return self->_dayOfMonths.list;
}

- (void)clearDayOfMonths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  PBRepeatedUInt32Clear();
}

- (void)addDayOfMonth:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (unsigned)dayOfMonthAtIndex:(unint64_t)a3
{
  -[GEOLPRTimeCondition _readDayOfMonths]((uint64_t)self);
  p_dayOfMonths = &self->_dayOfMonths;
  unint64_t count = self->_dayOfMonths.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_dayOfMonths->list[a3];
}

- (void)setDayOfMonths:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;

  MEMORY[0x1F4147400](&self->_dayOfMonths, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRTimeCondition;
  int v4 = [(GEOLPRTimeCondition *)&v8 description];
  v5 = [(GEOLPRTimeCondition *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRTimeCondition _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[6])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = a1 + 5;
      if (a1[6])
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(unsigned int *)(*v6 + 4 * v7);
          if ((v8 - 1) >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53DDB48[(int)v8 - 1];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = a1 + 5;
        }
        while (v7 < a1[6]);
      }
      if (a2) {
        v10 = @"dayOfWeek";
      }
      else {
        v10 = @"day_of_week";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if (a1[3])
    {
      v11 = PBRepeatedUInt32NSArray();
      if (a2) {
        v12 = @"dayOfMonth";
      }
      else {
        v12 = @"day_of_month";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEOLPRTimeCondition _dictionaryRepresentation:](self, 1);
}

- (GEOLPRTimeCondition)initWithDictionary:(id)a3
{
  return (GEOLPRTimeCondition *)-[GEOLPRTimeCondition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    objc_super v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"dayOfWeek";
      }
      else {
        unint64_t v7 = @"day_of_week";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v26 = a3;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (!v10) {
          goto LABEL_34;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v32;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if ([v15 isEqualToString:@"SUNDAY"])
              {
                uint64_t v16 = 1;
              }
              else if ([v15 isEqualToString:@"MONDAY"])
              {
                uint64_t v16 = 2;
              }
              else if ([v15 isEqualToString:@"TUESDAY"])
              {
                uint64_t v16 = 3;
              }
              else if ([v15 isEqualToString:@"WEDNESDAY"])
              {
                uint64_t v16 = 4;
              }
              else if ([v15 isEqualToString:@"THURSDAY"])
              {
                uint64_t v16 = 5;
              }
              else if ([v15 isEqualToString:@"FRIDAY"])
              {
                uint64_t v16 = 6;
              }
              else if ([v15 isEqualToString:@"SATURDAY"])
              {
                uint64_t v16 = 7;
              }
              else
              {
                uint64_t v16 = 1;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v16 = [v14 intValue];
            }
            [v6 addDayOfWeek:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (!v11)
          {
LABEL_34:

            a3 = v26;
            break;
          }
        }
      }

      if (a3) {
        v17 = @"dayOfMonth";
      }
      else {
        v17 = @"day_of_month";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v28 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v6, "addDayOfMonth:", objc_msgSend(v24, "unsignedIntValue"));
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v21);
        }
      }
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (GEOLPRTimeCondition)initWithJSON:(id)a3
{
  return (GEOLPRTimeCondition *)-[GEOLPRTimeCondition _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_728;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_729;
    }
    GEOLPRTimeConditionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRTimeConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRTimeConditionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    id v5 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRTimeCondition *)self readAll:0];
    id v5 = v11;
    if (self->_dayOfWeeks.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v11;
        ++v6;
      }
      while (v6 < self->_dayOfWeeks.count);
    }
    p_dayOfMonths = &self->_dayOfMonths;
    if (p_dayOfMonths->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v11;
        ++v8;
      }
      while (v8 < p_dayOfMonths->count);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = (id *)a3;
  [(GEOLPRTimeCondition *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRTimeCondition *)self dayOfWeeksCount])
  {
    [v10 clearDayOfWeeks];
    unint64_t v4 = [(GEOLPRTimeCondition *)self dayOfWeeksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addDayOfWeek:", -[GEOLPRTimeCondition dayOfWeekAtIndex:](self, "dayOfWeekAtIndex:", i));
    }
  }
  if ([(GEOLPRTimeCondition *)self dayOfMonthsCount])
  {
    [v10 clearDayOfMonths];
    unint64_t v7 = [(GEOLPRTimeCondition *)self dayOfMonthsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addDayOfMonth:", -[GEOLPRTimeCondition dayOfMonthAtIndex:](self, "dayOfMonthAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v6 = reader;
  objc_sync_enter(v6);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRTimeCondition *)self readAll:0];
    PBRepeatedInt32Copy();
    PBRepeatedUInt32Copy();
    return v4;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLPRTimeConditionReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLPRTimeCondition *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedInt32IsEqual()))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOLPRTimeCondition *)self readAll:1];
  uint64_t v2 = PBRepeatedInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 dayOfWeeksCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLPRTimeCondition addDayOfWeek:](self, "addDayOfWeek:", [v10 dayOfWeekAtIndex:i]);
  }
  uint64_t v7 = [v10 dayOfMonthsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[GEOLPRTimeCondition addDayOfMonth:](self, "addDayOfMonth:", [v10 dayOfMonthAtIndex:j]);
  }
}

- (void).cxx_destruct
{
}

@end