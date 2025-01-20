@interface BCSHoursMessage
+ (Class)timeRangeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)timeRanges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)daysAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timeRangeAtIndex:(unint64_t)a3;
- (int)StringAsDays:(id)a3;
- (int)dayAtIndex:(unint64_t)a3;
- (int)days;
- (unint64_t)daysCount;
- (unint64_t)hash;
- (unint64_t)timeRangesCount;
- (void)addDay:(int)a3;
- (void)addTimeRange:(id)a3;
- (void)clearDays;
- (void)clearTimeRanges;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDays:(int *)a3 count:(unint64_t)a4;
- (void)setTimeRanges:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSHoursMessage

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)BCSHoursMessage;
  [(BCSHoursMessage *)&v3 dealloc];
}

- (unint64_t)daysCount
{
  return self->_days.count;
}

- (int)days
{
  return self->_days.list;
}

- (void)clearDays
{
}

- (void)addDay:(int)a3
{
}

- (int)dayAtIndex:(unint64_t)a3
{
  p_days = &self->_days;
  unint64_t count = self->_days.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_days->list[a3];
}

- (void)setDays:(int *)a3 count:(unint64_t)a4
{
}

- (id)daysAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_264249938[a3 - 1];
  }

  return v3;
}

- (int)StringAsDays:(id)a3
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
  else if ([v3 isEqualToString:@"EVERYDAY"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)clearTimeRanges
{
}

- (void)addTimeRange:(id)a3
{
  id v4 = a3;
  timeRanges = self->_timeRanges;
  id v8 = v4;
  if (!timeRanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_timeRanges;
    self->_timeRanges = v6;

    id v4 = v8;
    timeRanges = self->_timeRanges;
  }
  [(NSMutableArray *)timeRanges addObject:v4];
}

- (unint64_t)timeRangesCount
{
  return [(NSMutableArray *)self->_timeRanges count];
}

- (id)timeRangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_timeRanges objectAtIndex:a3];
}

+ (Class)timeRangeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSHoursMessage;
  id v4 = [(BCSHoursMessage *)&v8 description];
  v5 = [(BCSHoursMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  p_days = &self->_days;
  if (self->_days.count)
  {
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (self->_days.count)
    {
      unint64_t v6 = 0;
      do
      {
        unsigned int v7 = p_days->list[v6] - 1;
        if (v7 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_days->list[v6]);
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_super v8 = off_264249938[v7];
        }
        [v5 addObject:v8];

        ++v6;
      }
      while (v6 < self->_days.count);
    }
    [v3 setObject:v5 forKey:@"day"];
  }
  if ([(NSMutableArray *)self->_timeRanges count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_timeRanges, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_timeRanges;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"time_range"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BCSHoursMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_days.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_days.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_timeRanges;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v11 = a3;
  if ([(BCSHoursMessage *)self daysCount])
  {
    [v11 clearDays];
    unint64_t v4 = [(BCSHoursMessage *)self daysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addDay:", -[BCSHoursMessage dayAtIndex:](self, "dayAtIndex:", i));
    }
  }
  if ([(BCSHoursMessage *)self timeRangesCount])
  {
    [v11 clearTimeRanges];
    unint64_t v7 = [(BCSHoursMessage *)self timeRangesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(BCSHoursMessage *)self timeRangeAtIndex:j];
        [v11 addTimeRange:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v6 = self->_timeRanges;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addTimeRange:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && PBRepeatedInt32IsEqual())
  {
    timeRanges = self->_timeRanges;
    if ((unint64_t)timeRanges | v4[4]) {
      char v6 = -[NSMutableArray isEqual:](timeRanges, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  return [(NSMutableArray *)self->_timeRanges hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  uint64_t v5 = [v4 daysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[BCSHoursMessage addDay:](self, "addDay:", [v4 dayAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[4];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[BCSHoursMessage addTimeRange:](self, "addTimeRange:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSMutableArray)timeRanges
{
  return self->_timeRanges;
}

- (void)setTimeRanges:(id)a3
{
}

- (void).cxx_destruct
{
}

@end