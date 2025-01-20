@interface ATXUsageInsightsInferredModeEvent
+ (BOOL)supportsSecureCoding;
- (ATXUsageInsightsInferredModeEvent)initWithATXMode:(unint64_t)a3 startTime:(id)a4 endTime:(id)a5;
- (ATXUsageInsightsInferredModeEvent)initWithCoder:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (unint64_t)atxMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUsageInsightsInferredModeEvent

- (ATXUsageInsightsInferredModeEvent)initWithATXMode:(unint64_t)a3 startTime:(id)a4 endTime:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXUsageInsightsInferredModeEvent;
  v11 = [(ATXUsageInsightsInferredModeEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_atxMode = a3;
    objc_storeStrong((id *)&v11->_startTime, a4);
    objc_storeStrong((id *)&v12->_endTime, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXUsageInsightsInferredModeEvent atxMode](self, "atxMode"), @"atxMode");
  v5 = [(ATXUsageInsightsInferredModeEvent *)self startTime];
  [v4 encodeObject:v5 forKey:@"startTime"];

  id v6 = [(ATXUsageInsightsInferredModeEvent *)self endTime];
  [v4 encodeObject:v6 forKey:@"endTime"];
}

- (ATXUsageInsightsInferredModeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"atxMode"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];

  v8 = [(ATXUsageInsightsInferredModeEvent *)self initWithATXMode:v5 startTime:v6 endTime:v7];
  return v8;
}

- (unint64_t)atxMode
{
  return self->_atxMode;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end