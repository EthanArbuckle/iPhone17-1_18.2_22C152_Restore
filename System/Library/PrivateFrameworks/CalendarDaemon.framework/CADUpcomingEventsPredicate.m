@interface CADUpcomingEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithLimit:(int)a3;
- (CADUpcomingEventsPredicate)initWithCoder:(id)a3;
- (CADUpcomingEventsPredicate)initWithLimit:(int)a3;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
- (int)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADUpcomingEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADUpcomingEventsPredicate)initWithLimit:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADUpcomingEventsPredicate;
  result = [(CADUpcomingEventsPredicate *)&v5 init];
  if (result) {
    result->_limit = a3;
  }
  return result;
}

+ (id)predicateWithLimit:(int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithLimit:*(void *)&a3];
  return v3;
}

- (CADUpcomingEventsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADUpcomingEventsPredicate;
  objc_super v5 = [(CADUpcomingEventsPredicate *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_limit = [v4 decodeIntForKey:@"limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADUpcomingEventsPredicate;
  id v4 = a3;
  [(CADUpcomingEventsPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", self->_limit, @"limit", v5.receiver, v5.super_class);
}

- (id)predicateFormat
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(limit: %d)", v5, self->_limit];

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CalFilterCreateWithDatabaseShowingAll();
  if (!v4) {
    return 0;
  }
  objc_super v5 = (const void *)v4;
  uint64_t v6 = CalDatabaseCopyEventOccurrenceCache();
  if (v6)
  {
    objc_super v7 = (const void *)v6;
    v8 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
    [v8 timeIntervalSinceReferenceDate];
    [(CADUpcomingEventsPredicate *)self limit];
    v9 = (void *)CalEventOccurrenceCacheCopyEventOccurrencesAfterDate();
    v10 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)MEMORY[0x1E4F28ED0];
      v12 = v10;
      v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CADUpcomingEventsPredicate limit](self, "limit"));
      int v16 = 138412802;
      v17 = v13;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_DEBUG, "Gathered [%@] upcoming event occurrences after date [%@] and up to limit [%@]", (uint8_t *)&v16, 0x20u);
    }
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

- (int)limit
{
  return self->_limit;
}

@end