@interface AFMetrics
+ (BOOL)supportsSecureCoding;
- (AFMetrics)initWithCoder:(id)a3;
- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 duration:(id)a5;
- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 eventInfo:(id)a5 duration:(id)a6;
- (NSDictionary)eventInfo;
- (NSNumber)duration;
- (NSString)originalCommandId;
- (double)_roundDouble:(double)a3 toSignificantDigits:(unint64_t)a4;
- (id)aceMetrics;
- (id)categoryString;
- (id)description;
- (int64_t)category;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDuration:(id)a3;
- (void)setEventInfo:(id)a3;
- (void)setOriginalCommandId:(id)a3;
@end

@implementation AFMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_originalCommandId, 0);
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setEventInfo:(id)a3
{
}

- (NSDictionary)eventInfo
{
  return self->_eventInfo;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setOriginalCommandId:(id)a3
{
}

- (NSString)originalCommandId
{
  return self->_originalCommandId;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)AFMetrics;
  v4 = [(AFMetrics *)&v11 description];
  v5 = [(AFMetrics *)self originalCommandId];
  v6 = [(AFMetrics *)self categoryString];
  v7 = [(AFMetrics *)self duration];
  v8 = [(AFMetrics *)self eventInfo];
  v9 = [v3 stringWithFormat:@"%@ - originalCommandId: %@, category: %@, duration: %@, eventInfo: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)categoryString
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t category = self->_category;
  if (category <= 8) {
    return off_1E5928288[category];
  }
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[AFMetrics categoryString]";
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Invalid AFMetrics category", (uint8_t *)&v5, 0xCu);
  }
  return &stru_1EEE35D28;
}

- (double)_roundDouble:(double)a3 toSignificantDigits:(unint64_t)a4
{
  double result = 0.0;
  if (a3 != 0.0 && a4 != 0)
  {
    double v8 = log10(fabs(a3));
    double v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * a3) / v9;
  }
  return result;
}

- (id)aceMetrics
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F96888]);
  v4 = [(AFMetrics *)self originalCommandId];
  [v3 setOriginalCommandId:v4];

  int v5 = [(AFMetrics *)self categoryString];
  [v3 setCategory:v5];

  v6 = [(AFMetrics *)self eventInfo];
  [v3 setEventInformation:v6];

  uint64_t v7 = [(AFMetrics *)self duration];
  double v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    -[AFMetrics _roundDouble:toSignificantDigits:](self, "_roundDouble:toSignificantDigits:", 2);
    v13 = @"Duration";
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", fmin(v9, 3600.0));
    v14[0] = v10;
    objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  [v3 setTimings:v11];

  return v3;
}

- (AFMetrics)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFMetrics;
  int v5 = [(AFMetrics *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalCommandId"];
    originalCommandId = v5->_originalCommandId;
    v5->_originalCommandId = (NSString *)v6;

    v5->_unint64_t category = [v4 decodeIntegerForKey:@"_category"];
    double v8 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_eventInfo"];
    eventInfo = v5->_eventInfo;
    v5->_eventInfo = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_duration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originalCommandId = self->_originalCommandId;
  id v5 = a3;
  [v5 encodeObject:originalCommandId forKey:@"_originalCommandId"];
  [v5 encodeInteger:self->_category forKey:@"_category"];
  [v5 encodeObject:self->_eventInfo forKey:@"_eventInfo"];
  [v5 encodeObject:self->_duration forKey:@"_duration"];
}

- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 eventInfo:(id)a5 duration:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AFMetrics;
  uint64_t v13 = [(AFMetrics *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    originalCommandId = v13->_originalCommandId;
    v13->_originalCommandId = (NSString *)v14;

    v13->_unint64_t category = a4;
    uint64_t v16 = [v11 copy];
    eventInfo = v13->_eventInfo;
    v13->_eventInfo = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_duration, a6);
  }

  return v13;
}

- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 duration:(id)a5
{
  return [(AFMetrics *)self initWithOriginalCommandId:a3 category:a4 eventInfo:0 duration:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end