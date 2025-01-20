@interface ATXPredictionTimeContext
- (ATXPredictionTimeContext)initWithDate:(id)a3;
- (ATXPredictionTimeContext)initWithProto:(id)a3;
- (ATXPredictionTimeContext)initWithProtoData:(id)a3;
- (BOOL)dateInWeekend;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionTimeContext:(id)a3;
- (NSDate)date;
- (id)description;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (int)dayOfWeek;
- (int)timeOfDay;
- (void)setDate:(id)a3;
@end

@implementation ATXPredictionTimeContext

- (ATXPredictionTimeContext)initWithDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXPredictionTimeContext;
  v5 = [(ATXPredictionTimeContext *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ATXPredictionTimeContext *)v5 setDate:v4];
  }

  return v6;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteDate];
  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v9 = [v4 currentCalendar];
  v6 = [v9 components:544 fromDate:v5];
  [v5 timeIntervalSince1970];
  self->_absoluteDate = v7;
  self->_dayOfWeek = [v6 weekday] - 1;
  self->_timeOfDay = [v6 hour];
  char v8 = [v9 isDateInWeekend:v5];

  self->_dateInWeekend = v8;
}

- (id)description
{
  v2 = [(ATXPredictionTimeContext *)self jsonDict];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDict
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"date";
  v3 = NSNumber;
  id v4 = [(ATXPredictionTimeContext *)self date];
  [v4 timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v3, "numberWithDouble:");
  v12[0] = v5;
  v11[1] = @"dayOfWeek";
  v6 = [NSNumber numberWithInt:self->_dayOfWeek];
  v12[1] = v6;
  v11[2] = @"timeOfDay";
  double v7 = [NSNumber numberWithInt:self->_timeOfDay];
  v12[2] = v7;
  v11[3] = @"dateInWeekend";
  char v8 = [NSNumber numberWithBool:self->_dateInWeekend];
  v12[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (ATXPredictionTimeContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBPredictionTimeContext alloc] initWithData:v4];

    self = [(ATXPredictionTimeContext *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXPredictionTimeContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXPredictionTimeContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionTimeContext initWithProto:]((uint64_t)self, v12);
    }

    goto LABEL_7;
  }
  id v5 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v6 = v4;
  id v7 = [v5 alloc];
  [v6 date];
  double v9 = v8;

  v10 = (void *)[v7 initWithTimeIntervalSince1970:v9];
  self = [(ATXPredictionTimeContext *)self initWithDate:v10];

  v11 = self;
LABEL_8:

  return v11;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setDate:self->_absoluteDate];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionTimeContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionTimeContext *)self isEqualToATXPredictionTimeContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionTimeContext:(id)a3
{
  id v4 = (double *)a3;
  double v5 = self->_absoluteDate - v4[1];
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  BOOL v6 = v5 <= 2.22044605e-16
    && self->_dayOfWeek == *((_DWORD *)v4 + 5)
    && self->_timeOfDay == *((_DWORD *)v4 + 6)
    && self->_dateInWeekend == *((unsigned __int8 *)v4 + 16);

  return v6;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
}

- (BOOL)dateInWeekend
{
  return self->_dateInWeekend;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionTimeContext proto", (uint8_t *)&v5, 0xCu);
}

@end