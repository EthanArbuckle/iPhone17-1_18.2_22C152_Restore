@interface CLKCurrentTimeTextProvider
+ (BOOL)supportsSecureCoding;
+ (id)textProviderWithTimeZone:(id)a3;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (CLKCurrentTimeTextProvider)init;
- (CLKCurrentTimeTextProvider)initWithCoder:(id)a3;
- (NSDate)overrideDate;
- (id)JSONObjectRepresentation;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_sessionCacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_updateFrequency;
- (unint64_t)hash;
- (void)_endSession;
- (void)_startSessionWithDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideDate:(id)a3;
@end

@implementation CLKCurrentTimeTextProvider

- (CLKCurrentTimeTextProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKCurrentTimeTextProvider;
  return (CLKCurrentTimeTextProvider *)[(CLKTextProvider *)&v3 initPrivate];
}

+ (id)textProviderWithTimeZone:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CLKCurrentTimeTextProvider);
  [(CLKTimeTextProvider *)v4 setTimeZone:v3];

  [(CLKTextProvider *)v4 setTimeTravelUpdateFrequency:2];
  v4->_calendarUnits = 96;

  return v4;
}

- (int64_t)_updateFrequency
{
  return self->_overrideDate == 0;
}

- (void)_startSessionWithDate:(id)a3
{
  v4 = (NSDate *)a3;
  v5 = v4;
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    v11 = v4;
    v7 = overrideDate;

    v5 = v7;
  }
  v12 = v5;
  [(CLKTimeTextProvider *)self setDate:v5];
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  v9 = [v8 components:self->_calendarUnits fromDate:v12];
  sessionComponents = self->_sessionComponents;
  self->_sessionComponents = v9;

  self->_sessionInProgress = 1;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CLKCurrentTimeTextProvider;
  v4 = [(CLKTimeTextProvider *)&v6 _sessionAttributedTextForIndex:a3 withStyle:a4];

  return v4;
}

- (id)_sessionCacheKey
{
  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    v4 = [MEMORY[0x263F089D8] string];
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSDateComponents valueForComponent:](self->_sessionComponents, "valueForComponent:", 32));
    [v4 appendFormat:@"%@%@", @"hr", v5];

    objc_super v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSDateComponents valueForComponent:](self->_sessionComponents, "valueForComponent:", 64));
    [v4 appendFormat:@"%@%@", @"min", v6];

    if (self->_overrideDate) {
      v7 = @"override";
    }
    else {
      v7 = @"no_override";
    }
    [v4 appendFormat:@"%@", v7];
    v8 = self->_sessionCacheKey;
    self->_sessionCacheKey = (NSString *)v4;

    sessionCacheKey = self->_sessionCacheKey;
  }

  return sessionCacheKey;
}

- (void)_endSession
{
  v4.receiver = self;
  v4.super_class = (Class)CLKCurrentTimeTextProvider;
  [(CLKTextProvider *)&v4 _endSession];
  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;

  self->_sessionInProgress = 0;
}

- (BOOL)_validate
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLKCurrentTimeTextProvider;
  objc_super v4 = [(CLKTimeTextProvider *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4 != self)
  {
    v4->_calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v4->_overrideDate, self->_overrideDate);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKCurrentTimeTextProvider;
  if ([(CLKTimeTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (void *)self->_calendarUnits == v4[21])
  {
    char v5 = CLKEqualObjects(self->_overrideDate, v4[25]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentTimeTextProvider;
  id v3 = (char *)[(CLKTimeTextProvider *)&v5 hash] + 4 * self->_calendarUnits;
  return (unint64_t)&v3[16 * [(NSDate *)self->_overrideDate hash]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKCurrentTimeTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKCurrentTimeTextProvider;
  objc_super v5 = [(CLKTimeTextProvider *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_calendarUnits = [v4 decodeIntegerForKey:@"_units"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideDate"];
    overrideDate = v5->_overrideDate;
    v5->_overrideDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKCurrentTimeTextProvider;
  id v4 = a3;
  [(CLKTimeTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_calendarUnits, @"_units", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_overrideDate forKey:@"_overrideDate"];
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKCurrentTimeTextProvider;
  objc_super v5 = [(CLKTimeTextProvider *)&v8 _initWithJSONObjectRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"calendarUnits"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", @"calendarUnits", v6 format];
    }
    v5[21] = (int)[v6 intValue];
    [v5 setTimeTravelUpdateFrequency:2];
  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)CLKCurrentTimeTextProvider;
  id v3 = [(CLKTimeTextProvider *)&v6 JSONObjectRepresentation];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_calendarUnits];
  [v3 setObject:v4 forKeyedSubscript:@"calendarUnits"];

  return v3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);

  objc_storeStrong((id *)&self->_sessionComponents, 0);
}

@end