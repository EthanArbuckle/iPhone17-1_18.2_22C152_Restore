@interface FMFSchedule
+ (BOOL)supportsSecureCoding;
+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4;
+ (id)_dayStringForDayOfWeek:(int64_t)a3;
+ (id)_stringForDaysOfWeek:(int64_t)a3;
+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4;
+ (id)localizedDaysOfWeekStringFor:(int64_t)a3;
+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4;
+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5;
+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4;
- (BOOL)isCurrentAt:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FMFSchedule)initWithCoder:(id)a3;
- (FMFSchedule)initWithDictionary:(id)a3;
- (NSCalendar)_gregorian;
- (NSDictionary)dictionary;
- (NSString)localizedDaysOfWeekString;
- (NSString)localizedEndTimeString;
- (NSString)localizedStartTimeString;
- (NSString)validityError;
- (NSTimeZone)timeZone;
- (id)_daysOfWeek;
- (id)_endDateForStartDate:(id)a3;
- (id)_nextStartDateOnDayOfWeek:(int64_t)a3 from:(id)a4 options:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nextStartDateFrom:(id)a3 options:(unint64_t)a4;
- (id)nextStartOrEndDateFrom:(id)a3;
- (id)previousStartDateFrom:(id)a3;
- (int64_t)daysOfWeek;
- (unint64_t)endHour;
- (unint64_t)endMin;
- (unint64_t)hash;
- (unint64_t)spanDays;
- (unint64_t)startHour;
- (unint64_t)startMin;
- (void)encodeWithCoder:(id)a3;
- (void)setDaysOfWeek:(int64_t)a3;
- (void)setEndHour:(unint64_t)a3;
- (void)setEndMin:(unint64_t)a3;
- (void)setSpanDays:(unint64_t)a3;
- (void)setStartHour:(unint64_t)a3;
- (void)setStartMin:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation FMFSchedule

- (FMFSchedule)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(FMFSchedule *)self init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"startHour"];
      -[FMFSchedule setStartHour:](v5, "setStartHour:", [v6 unsignedIntegerValue]);

      v7 = [v4 objectForKeyedSubscript:@"startMin"];
      -[FMFSchedule setStartMin:](v5, "setStartMin:", [v7 unsignedIntegerValue]);

      v8 = [v4 objectForKeyedSubscript:@"endHour"];
      -[FMFSchedule setEndHour:](v5, "setEndHour:", [v8 unsignedIntegerValue]);

      v9 = [v4 objectForKeyedSubscript:@"endMin"];
      -[FMFSchedule setEndMin:](v5, "setEndMin:", [v9 unsignedIntegerValue]);

      v10 = [v4 objectForKeyedSubscript:@"spanDays"];
      -[FMFSchedule setSpanDays:](v5, "setSpanDays:", [v10 unsignedIntegerValue]);

      v11 = [v4 objectForKeyedSubscript:@"daysOfWeek"];
      -[FMFSchedule setDaysOfWeek:](v5, "setDaysOfWeek:", [v11 unsignedIntegerValue] & 0x7F);

      v12 = (void *)MEMORY[0x263EFFA18];
      v13 = [v4 objectForKeyedSubscript:@"fenceTz"];
      v14 = [v12 timeZoneWithName:v13];
      [(FMFSchedule *)v5 setTimeZone:v14];

      v15 = [(FMFSchedule *)v5 validityError];
      if (v15)
      {
        v16 = LogCategory_Daemon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[FMFSchedule initWithDictionary:]((uint64_t)v15, v16);
        }

        v5 = 0;
      }
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v18 = LogCategory_Daemon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[FMFSchedule initWithDictionary:](v18);
    }

    v17 = 0;
  }

  return v17;
}

- (NSString)validityError
{
  if (![(FMFSchedule *)self daysOfWeek]) {
    return (NSString *)@"invalid daysOfWeek: FMFDaysOfWeekNone";
  }
  if ([(FMFSchedule *)self startHour] == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSString *)@"unspecified startHour";
  }
  if ([(FMFSchedule *)self startMin] == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSString *)@"unspecified startMin";
  }
  if ([(FMFSchedule *)self endHour] == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSString *)@"unspecified endHour";
  }
  if ([(FMFSchedule *)self endMin] == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSString *)@"unspecified endMin";
  }
  if ([(FMFSchedule *)self spanDays] == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSString *)@"unspecified spanDays";
  }
  id v4 = [(FMFSchedule *)self timeZone];

  if (v4) {
    return 0;
  }
  else {
    return (NSString *)@"unspecified timeZone";
  }
}

- (NSDictionary)dictionary
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FMFSchedule startHour](self, "startHour"));
  [v3 setObject:v4 forKeyedSubscript:@"startHour"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FMFSchedule startMin](self, "startMin"));
  [v3 setObject:v5 forKeyedSubscript:@"startMin"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FMFSchedule endHour](self, "endHour"));
  [v3 setObject:v6 forKeyedSubscript:@"endHour"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FMFSchedule endMin](self, "endMin"));
  [v3 setObject:v7 forKeyedSubscript:@"endMin"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FMFSchedule spanDays](self, "spanDays"));
  [v3 setObject:v8 forKeyedSubscript:@"spanDays"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[FMFSchedule daysOfWeek](self, "daysOfWeek"));
  [v3 setObject:v9 forKeyedSubscript:@"daysOfWeek"];

  v10 = [(FMFSchedule *)self timeZone];
  v11 = [v10 name];
  [v3 setObject:v11 forKeyedSubscript:@"fenceTz"];

  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (FMFSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMFSchedule *)self init];
  if (v5)
  {
    -[FMFSchedule setStartHour:](v5, "setStartHour:", [v4 decodeIntegerForKey:@"startHour"]);
    -[FMFSchedule setStartMin:](v5, "setStartMin:", [v4 decodeIntegerForKey:@"startMin"]);
    -[FMFSchedule setEndHour:](v5, "setEndHour:", [v4 decodeIntegerForKey:@"endHour"]);
    -[FMFSchedule setEndMin:](v5, "setEndMin:", [v4 decodeIntegerForKey:@"endMin"]);
    -[FMFSchedule setSpanDays:](v5, "setSpanDays:", [v4 decodeIntegerForKey:@"spanDays"]);
    -[FMFSchedule setDaysOfWeek:](v5, "setDaysOfWeek:", [v4 decodeIntegerForKey:@"daysOfWeek"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fenceTz"];
    v7 = [MEMORY[0x263EFFA18] timeZoneWithName:v6];
    [(FMFSchedule *)v5 setTimeZone:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t startHour = self->_startHour;
  id v5 = a3;
  [v5 encodeInteger:startHour forKey:@"startHour"];
  [v5 encodeInteger:self->_startMin forKey:@"startMin"];
  [v5 encodeInteger:self->_endHour forKey:@"endHour"];
  [v5 encodeInteger:self->_endMin forKey:@"endMin"];
  [v5 encodeInteger:self->_daysOfWeek forKey:@"daysOfWeek"];
  [v5 encodeInteger:self->_spanDays forKey:@"spanDays"];
  id v7 = [(FMFSchedule *)self timeZone];
  v6 = [v7 name];
  [v5 encodeObject:v6 forKey:@"fenceTz"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setStartHour:self->_startHour];
  [v4 setStartMin:self->_startMin];
  [v4 setEndHour:self->_endHour];
  [v4 setEndMin:self->_endMin];
  [v4 setDaysOfWeek:self->_daysOfWeek];
  [v4 setSpanDays:self->_spanDays];
  id v5 = (void *)[(NSTimeZone *)self->_timeZone copy];
  [v4 setTimeZone:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(FMFSchedule *)self startHour];
    if (v6 == [v5 startHour]
      && (unint64_t v7 = -[FMFSchedule startMin](self, "startMin"), v7 == [v5 startMin])
      && (unint64_t v8 = -[FMFSchedule endMin](self, "endMin"), v8 == [v5 endMin])
      && (unint64_t v9 = -[FMFSchedule endHour](self, "endHour"), v9 == [v5 endHour])
      && (int64_t v10 = -[FMFSchedule daysOfWeek](self, "daysOfWeek"), v10 == [v5 daysOfWeek])
      && (unint64_t v11 = -[FMFSchedule spanDays](self, "spanDays"), v11 == [v5 spanDays]))
    {
      v12 = [(FMFSchedule *)self timeZone];
      v13 = [v5 timeZone];
      char v14 = [v12 isEqualToTimeZone:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FMFSchedule *)self startHour];
  unint64_t v4 = [(FMFSchedule *)self startMin] ^ v3;
  unint64_t v5 = [(FMFSchedule *)self endHour];
  unint64_t v6 = v4 ^ v5 ^ [(FMFSchedule *)self endMin];
  int64_t v7 = [(FMFSchedule *)self daysOfWeek];
  unint64_t v8 = v7 ^ [(FMFSchedule *)self spanDays];
  unint64_t v9 = [(FMFSchedule *)self timeZone];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isCurrentAt:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(FMFSchedule *)self nextStartDateFrom:v4 options:4];
  if (v5)
  {
    unint64_t v6 = [(FMFSchedule *)self _endDateForStartDate:v5];
    BOOL v7 = [v5 compare:v4] == -1 && objc_msgSend(v4, "compare:", v6) == -1;
  }
  else
  {
    BOOL v7 = 0;
  }
  unint64_t v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    unint64_t v11 = "-[FMFSchedule isCurrentAt:]";
    __int16 v12 = 1024;
    BOOL v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "%s: %d at: %@", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

- (id)nextStartOrEndDateFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FMFSchedule *)self nextStartDateFrom:v4 options:4];
  if (v5)
  {
    unint64_t v6 = [(FMFSchedule *)self _endDateForStartDate:v5];
    if (v6 && [v4 compare:v6] == -1)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [(FMFSchedule *)self nextStartDateFrom:v4 options:0];
    }
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)previousStartDateFrom:(id)a3
{
  return [(FMFSchedule *)self nextStartDateFrom:a3 options:4];
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(FMFSchedule *)self startHour];
  unint64_t v6 = [(FMFSchedule *)self startMin];
  unint64_t v7 = [(FMFSchedule *)self endHour];
  unint64_t v8 = [(FMFSchedule *)self endMin];
  unint64_t v9 = [(FMFSchedule *)self spanDays];
  int v10 = [(FMFSchedule *)self _daysOfWeek];
  unint64_t v11 = [(FMFSchedule *)self timeZone];
  __int16 v12 = [v3 stringWithFormat:@"<%@ sH=%ld sM=%ld eH=%ld eM=%ld spanDays=%ld dOW=%@, tZ=%@>", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)_endDateForStartDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  unint64_t v6 = [(FMFSchedule *)self timeZone];
  [v5 setTimeZone:v6];

  objc_msgSend(v5, "setHour:", -[FMFSchedule endHour](self, "endHour"));
  objc_msgSend(v5, "setMinute:", -[FMFSchedule endMin](self, "endMin"));
  unint64_t v7 = [(FMFSchedule *)self _gregorian];
  unint64_t v8 = [v7 nextDateAfterDate:v4 matchingComponents:v5 options:1024];

  if (v8)
  {
    unint64_t v9 = [(FMFSchedule *)self spanDays];
    int v10 = [(FMFSchedule *)self _gregorian];
    unint64_t v11 = v9 - ([v10 isDate:v8 inSameDayAsDate:v4] ^ 1);

    if ((v11 & 0x8000000000000000) != 0)
    {
      __int16 v14 = LogCategory_Daemon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[FMFSchedule _endDateForStartDate:]((uint64_t)self, v14);
      }
    }
    else if (v11)
    {
      do
      {
        __int16 v12 = v8;
        BOOL v13 = [(FMFSchedule *)self _gregorian];
        unint64_t v8 = [v13 nextDateAfterDate:v8 matchingComponents:v5 options:1024];

        if (v11 < 2) {
          break;
        }
        --v11;
      }
      while (v8);
    }
  }

  return v8;
}

- (id)_daysOfWeek
{
  if (_daysOfWeek_onceToken != -1) {
    dispatch_once(&_daysOfWeek_onceToken, &__block_literal_global);
  }
  unint64_t v3 = [(id)_daysOfWeek_daysOfWeekMap allKeys];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__FMFSchedule__daysOfWeek__block_invoke_78;
  v6[3] = &unk_263FE6EB8;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "fm_filter:", v6);

  return v4;
}

void __26__FMFSchedule__daysOfWeek__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26BEEAD10;
  v2[1] = &unk_26BEEAD40;
  v3[0] = &unk_26BEEAD28;
  v3[1] = &unk_26BEEAD58;
  v2[2] = &unk_26BEEAD70;
  v2[3] = &unk_26BEEADA0;
  v3[2] = &unk_26BEEAD88;
  v3[3] = &unk_26BEEADB8;
  v2[4] = &unk_26BEEADD0;
  v2[5] = &unk_26BEEAE00;
  v3[4] = &unk_26BEEADE8;
  v3[5] = &unk_26BEEAE18;
  v2[6] = &unk_26BEEAE30;
  v3[6] = &unk_26BEEAE48;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)_daysOfWeek_daysOfWeekMap;
  _daysOfWeek_daysOfWeekMap = v0;
}

BOOL __26__FMFSchedule__daysOfWeek__block_invoke_78(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [(id)_daysOfWeek_daysOfWeekMap objectForKeyedSubscript:a2];
  uint64_t v4 = [v3 integerValue];

  return ([*(id *)(a1 + 32) daysOfWeek] & v4) != 0;
}

- (id)nextStartDateFrom:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(FMFSchedule *)self _daysOfWeek];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__FMFSchedule_nextStartDateFrom_options___block_invoke;
  v13[3] = &unk_263FE6EE0;
  v13[4] = self;
  id v14 = v6;
  unint64_t v15 = a4;
  id v8 = v6;
  unint64_t v9 = objc_msgSend(v7, "fm_map:", v13);

  if ((a4 & 4) != 0) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = [(id)objc_opt_class() firstDateFromDates:v9 order:v10];

  return v11;
}

uint64_t __41__FMFSchedule_nextStartDateFrom_options___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = (void *)a1[4];
  uint64_t v4 = [a2 integerValue];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];

  return [v3 _nextStartDateOnDayOfWeek:v4 from:v5 options:v6];
}

- (id)_nextStartDateOnDayOfWeek:(int64_t)a3 from:(id)a4 options:(unint64_t)a5
{
  id v8 = a4;
  unint64_t v9 = objc_opt_new();
  uint64_t v10 = [(FMFSchedule *)self timeZone];
  [v9 setTimeZone:v10];

  objc_msgSend(v9, "setHour:", -[FMFSchedule startHour](self, "startHour"));
  objc_msgSend(v9, "setMinute:", -[FMFSchedule startMin](self, "startMin"));
  [v9 setWeekday:a3];
  unint64_t v11 = [(FMFSchedule *)self _gregorian];
  __int16 v12 = [v11 nextDateAfterDate:v8 matchingComponents:v9 options:a5 | 0x400];

  return v12;
}

+ (id)firstDateFromDates:(id)a3 order:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v8 || [*(id *)(*((void *)&v14 + 1) + 8 * i) compare:v8] == a4)
        {
          id v12 = v11;

          id v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSCalendar)_gregorian
{
  gregorian = self->_gregorian;
  if (!gregorian)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    id v5 = [(FMFSchedule *)self timeZone];
    [(NSCalendar *)v4 setTimeZone:v5];

    uint64_t v6 = self->_gregorian;
    self->_gregorian = v4;

    gregorian = self->_gregorian;
  }

  return gregorian;
}

- (unint64_t)startHour
{
  return self->_startHour;
}

- (void)setStartHour:(unint64_t)a3
{
  self->_unint64_t startHour = a3;
}

- (unint64_t)startMin
{
  return self->_startMin;
}

- (void)setStartMin:(unint64_t)a3
{
  self->_startMin = a3;
}

- (int64_t)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setDaysOfWeek:(int64_t)a3
{
  self->_daysOfWeek = a3;
}

- (unint64_t)endHour
{
  return self->_endHour;
}

- (void)setEndHour:(unint64_t)a3
{
  self->_endHour = a3;
}

- (unint64_t)endMin
{
  return self->_endMin;
}

- (void)setEndMin:(unint64_t)a3
{
  self->_endMin = a3;
}

- (unint64_t)spanDays
{
  return self->_spanDays;
}

- (void)setSpanDays:(unint64_t)a3
{
  self->_spanDays = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_gregorian, 0);
}

+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v8 = [v7 components:62 fromDate:v6];
  [v8 setHour:a3];
  [v8 setMinute:a4];
  uint64_t v9 = [v7 dateFromComponents:v8];

  return v9;
}

+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4
{
  id v12 = (void (**)(void))a4;
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v6 = [v5 firstWeekday];
  uint64_t v7 = 0;
  uint64_t v8 = ((unint64_t)(v6 + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  unint64_t v9 = v6 + 6 - 7 * ((v8 + ((unint64_t)(v6 + 6 - v8) >> 1)) >> 2);
  unint64_t v10 = v9;
  do
  {
    if (v10 > 6) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_20ADB0A58[v10];
    }
    if ((v11 & a3) != 0) {
      v12[2]();
    }
    if (v10 < 6) {
      ++v10;
    }
    else {
      unint64_t v10 = 0;
    }
    ++v7;
  }
  while (v10 != v9);
}

+ (id)_dayStringForDayOfWeek:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = v4;
  uint64_t v6 = &stru_26BEE3E40;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 2;
        break;
      case 32:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 1;
        break;
      case 64:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        break;
      default:
        goto LABEL_14;
    }
LABEL_13:
    uint64_t v6 = [v7 objectAtIndexedSubscript:v9];
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 6;
        goto LABEL_13;
      case 2:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 5;
        goto LABEL_13;
      case 4:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 4;
        goto LABEL_13;
      case 8:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 3;
        goto LABEL_13;
      default:
        break;
    }
  }
LABEL_14:

  return v6;
}

+ (id)_stringForDaysOfWeek:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 127)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = [v4 localizedStringForKey:@"DAYSLIST_EVERY_DAY" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
    }
    else
    {
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x2020000000;
      v38[3] = 0x7FFFFFFFFFFFFFFFLL;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v37[3] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 1;
      uint64_t v7 = objc_opt_new();
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __46__FMFSchedule_NSString___stringForDaysOfWeek___block_invoke;
      v27 = &unk_263FE77E8;
      id v32 = a1;
      id v8 = v7;
      id v28 = v8;
      v29 = v38;
      v30 = v37;
      v31 = &v33;
      [a1 _enumerateDaysOfWeekInFMFDaysOfWeek:a3 callback:&v24];
      switch([v8 count])
      {
        case 1:
          uint64_t v9 = NSString;
          unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_1" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
          id v12 = [v8 objectAtIndexedSubscript:0];
          objc_msgSend(v9, "stringWithFormat:", v11, v12);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 2:
          BOOL v13 = NSString;
          if (*((unsigned char *)v34 + 24))
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v10 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_2" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
          }
          else
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v10 localizedStringForKey:@"DAYSLIST_2" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
          uint64_t v11 = };
          id v12 = [v8 objectAtIndexedSubscript:0];
          long long v15 = [v8 objectAtIndexedSubscript:1];
          objc_msgSend(v13, "stringWithFormat:", v11, v12, v15);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        case 3:
          long long v14 = NSString;
          if (*((unsigned char *)v34 + 24))
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_3" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:2];
            [v8 objectAtIndexedSubscript:1];
          }
          else
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_3" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:1];
            [v8 objectAtIndexedSubscript:2];
          long long v17 = };
          objc_msgSend(v14, "stringWithFormat:", v11, v12, v15, v17);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        case 4:
          long long v16 = NSString;
          if (*((unsigned char *)v34 + 24))
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_4" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:3];
            long long v17 = [v8 objectAtIndexedSubscript:1];
            [v8 objectAtIndexedSubscript:2];
          }
          else
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_4" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:1];
            long long v17 = [v8 objectAtIndexedSubscript:2];
            [v8 objectAtIndexedSubscript:3];
          uint64_t v19 = };
          objc_msgSend(v16, "stringWithFormat:", v11, v12, v15, v17, v19);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 5:
          v18 = NSString;
          if (*((unsigned char *)v34 + 24))
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_5" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:4];
            long long v17 = [v8 objectAtIndexedSubscript:1];
            uint64_t v19 = [v8 objectAtIndexedSubscript:2];
            [v8 objectAtIndexedSubscript:3];
          }
          else
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_5" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:1];
            long long v17 = [v8 objectAtIndexedSubscript:2];
            uint64_t v19 = [v8 objectAtIndexedSubscript:3];
            [v8 objectAtIndexedSubscript:4];
          v21 = };
          objc_msgSend(v18, "stringWithFormat:", v11, v12, v15, v17, v19, v21);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 6:
          v20 = NSString;
          if (*((unsigned char *)v34 + 24))
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_6" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:5];
            long long v17 = [v8 objectAtIndexedSubscript:1];
            uint64_t v19 = [v8 objectAtIndexedSubscript:2];
            v21 = [v8 objectAtIndexedSubscript:3];
            [v8 objectAtIndexedSubscript:4];
          }
          else
          {
            unint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v10 localizedStringForKey:@"DAYSLIST_6" value:&stru_26BEE3E40 table:@"Localizable-TINKER"];
            id v12 = [v8 objectAtIndexedSubscript:0];
            long long v15 = [v8 objectAtIndexedSubscript:1];
            long long v17 = [v8 objectAtIndexedSubscript:2];
            uint64_t v19 = [v8 objectAtIndexedSubscript:3];
            v21 = [v8 objectAtIndexedSubscript:4];
            [v8 objectAtIndexedSubscript:5];
          v22 = };
          objc_msgSend(v20, "stringWithFormat:", v11, v12, v15, v17, v19, v21, v22, v24, v25, v26, v27);
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_28:
LABEL_29:

LABEL_30:
LABEL_31:

LABEL_32:
          break;
        default:
          id v5 = &stru_26BEE3E40;
          break;
      }

      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v38, 8);
    }
  }
  else
  {
    id v5 = &stru_26BEE3E40;
  }

  return v5;
}

void __46__FMFSchedule_NSString___stringForDaysOfWeek___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 64) _dayStringForDayOfWeek:a2];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v5 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v5 + 24) = a3;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1 != a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
}

+ (id)localizedDaysOfWeekStringFor:(int64_t)a3
{
  return +[FMFSchedule _stringForDaysOfWeek:a3];
}

- (NSString)localizedDaysOfWeekString
{
  int64_t v2 = [(FMFSchedule *)self daysOfWeek];

  return (NSString *)+[FMFSchedule localizedDaysOfWeekStringFor:v2];
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  id v6 = +[FMFSchedule _dateFromHour:a3 andMinute:a4];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08790] localizedStringFromDate:v6 dateStyle:0 timeStyle:a5];
  }
  else
  {
    uint64_t v7 = &stru_26BEE3E40;
  }

  return v7;
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  return +[FMFSchedule localizedTimeStringForHour:a3 andMinute:a4 timeStyle:1];
}

- (NSString)localizedStartTimeString
{
  unint64_t v3 = [(FMFSchedule *)self startHour];
  unint64_t v4 = [(FMFSchedule *)self startMin];

  return (NSString *)+[FMFSchedule localizedTimeStringForHour:v3 andMinute:v4];
}

- (NSString)localizedEndTimeString
{
  unint64_t v3 = [(FMFSchedule *)self endHour];
  unint64_t v4 = [(FMFSchedule *)self endMin];

  return (NSString *)+[FMFSchedule localizedTimeStringForHour:v3 andMinute:v4];
}

- (void)initWithDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20AD87000, log, OS_LOG_TYPE_FAULT, "nil scheduleDict", v1, 2u);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_20AD87000, a2, OS_LOG_TYPE_FAULT, "validityError: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_endDateForStartDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_20AD87000, a2, OS_LOG_TYPE_FAULT, "%@: spanDays should have been >= 0", (uint8_t *)&v2, 0xCu);
}

@end