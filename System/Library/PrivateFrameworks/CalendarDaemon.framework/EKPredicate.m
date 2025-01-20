@interface EKPredicate
+ (BOOL)supportsSecureCoding;
- (EKPredicate)initWithCalendars:(id)a3;
- (EKPredicate)initWithCoder:(id)a3;
- (NSArray)calendars;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)title;
- (id)calendarRowIDsForDatabaseID:(int)a3;
- (id)databasesToQuery;
- (id)predicateFormat;
- (id)restrictedCalendarRowIDsForDatabaseID:(int)a3;
- (void)createCalendarMaps;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendars:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setRestrictedCalendarRowIDs:(id)a3 forDatabaseID:(int)a4;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation EKPredicate

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (id)restrictedCalendarRowIDsForDatabaseID:(int)a3
{
  databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)databaseToRestrictedCalendarRowIDs objectForKeyedSubscript:v4];

  return v5;
}

- (id)databasesToQuery
{
  [(EKPredicate *)self createCalendarMaps];
  databaseToCalendarRowIDs = self->_databaseToCalendarRowIDs;
  return databaseToCalendarRowIDs;
}

- (id)calendarRowIDsForDatabaseID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(EKPredicate *)self createCalendarMaps];
  databaseToCalendarRowIDs = self->_databaseToCalendarRowIDs;
  v6 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
  v7 = [(NSDictionary *)databaseToCalendarRowIDs objectForKeyedSubscript:v6];

  return v7;
}

- (void)createCalendarMaps
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_calendars;
  v4 = v3;
  if (!self->_databaseToCalendarRowIDs && [(NSArray *)v3 count])
  {
    v16 = self;
    v5 = (NSDictionary *)objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "databaseID"));
          id v13 = [(NSDictionary *)v5 objectForKeyedSubscript:v12];
          if (!v13)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [(NSDictionary *)v5 setObject:v13 forKeyedSubscript:v12];
          }
          v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "entityID"));
          [v13 addObject:v14];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    databaseToCalendarRowIDs = v16->_databaseToCalendarRowIDs;
    v16->_databaseToCalendarRowIDs = v5;
  }
}

- (void)setRestrictedCalendarRowIDs:(id)a3 forDatabaseID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  if (!databaseToRestrictedCalendarRowIDs)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = self->_databaseToRestrictedCalendarRowIDs;
    self->_databaseToRestrictedCalendarRowIDs = v7;

    databaseToRestrictedCalendarRowIDs = self->_databaseToRestrictedCalendarRowIDs;
  }
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  [(NSMutableDictionary *)databaseToRestrictedCalendarRowIDs setObject:v10 forKeyedSubscript:v9];
}

- (NSArray)calendars
{
  return self->_calendars;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKPredicate;
  id v4 = a3;
  [(EKPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_calendars, @"calendars", v5.receiver, v5.super_class);
}

uint64_t __33__EKPredicate_initWithCalendars___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVirtual] ^ 1;
}

- (EKPredicate)initWithCalendars:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPredicate;
  objc_super v5 = [(EKPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 CalFilter:&__block_literal_global_22];
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;
  }
  return v5;
}

- (void)setStartDate:(id)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (EKPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPredicate;
  objc_super v5 = [(EKPredicate *)&v9 initWithCoder:v4];
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_5);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder____whitelistedClasses_0 forKey:@"calendars"];
    calendars = v5->_calendars;
    v5->_calendars = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_databaseToRestrictedCalendarRowIDs, 0);
  objc_storeStrong((id *)&self->_databaseToCalendarRowIDs, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __29__EKPredicate_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  initWithCoder____whitelistedClasses_0 = v3;
  return MEMORY[0x1F41817F8](v3);
}

- (id)predicateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  id v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [v3 stringFromDate:self->_startDate];
  uint64_t v8 = [v3 stringFromDate:self->_endDate];
  objc_super v9 = [(EKPredicate *)self calendars];
  id v10 = +[CADPredicate conciseCalendarList:v9];
  v11 = [v4 stringWithFormat:@"%@ start:%@; end:%@; cals:%@", v6, v7, v8, v10];

  return v11;
}

- (void)setCalendars:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

@end