@interface ATXContext
+ (BOOL)supportsSecureCoding;
+ (id)defaultTimeWindowForContextType:(unint64_t)a3;
- (ATXContext)initWithCoder:(id)a3;
- (ATXContext)initWithContextType:(unint64_t)a3 location:(id)a4 timeWindow:(id)a5;
- (CLLocation)location;
- (NSDateInterval)timeWindow;
- (unint64_t)contextType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXContext

- (ATXContext)initWithContextType:(unint64_t)a3 location:(id)a4 timeWindow:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXContext;
  v11 = [(ATXContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_contextType = a3;
    objc_storeStrong((id *)&v11->_location, a4);
    objc_storeStrong((id *)&v12->_timeWindow, a5);
  }

  return v12;
}

+ (id)defaultTimeWindowForContextType:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1234.0];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = objc_opt_new();
  [v6 setDay:0];
  if (a3 == 2)
  {
    uint64_t v9 = 3;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    if (a3 != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = 15;
  }
  [v6 setHour:v9];
  id v10 = [v5 startOfDayForDate:v4];
  v7 = [v5 dateByAddingComponents:v6 toDate:v10 options:0];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 duration:28800.0];
LABEL_6:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXContext contextType](self, "contextType"), @"contextTypeKey");
  v5 = [(ATXContext *)self location];
  [v4 encodeObject:v5 forKey:@"contextLocationKey"];

  id v6 = [(ATXContext *)self timeWindow];
  [v4 encodeObject:v6 forKey:@"contextTimeWindowKey"];
}

- (ATXContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"contextTypeKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextLocationKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextTimeWindowKey"];

  v8 = [(ATXContext *)self initWithContextType:v5 location:v6 timeWindow:v7];
  return v8;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (NSDateInterval)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeWindow, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end