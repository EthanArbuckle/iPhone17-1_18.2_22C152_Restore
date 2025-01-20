@interface CALNTriggeredEventNotificationResponseData
+ (BOOL)supportsSecureCoding;
- (CALNTriggeredEventNotificationResponseData)initWithCoder:(id)a3;
- (CALNTriggeredEventNotificationResponseData)initWithHypothesis:(id)a3 lastFireTimeOfAlertOffsetFromTravelTime:(id)a4;
- (EKTravelEngineHypothesis)hypothesis;
- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNTriggeredEventNotificationResponseData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNTriggeredEventNotificationResponseData)initWithHypothesis:(id)a3 lastFireTimeOfAlertOffsetFromTravelTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNTriggeredEventNotificationResponseData;
  v9 = [(CALNTriggeredEventNotificationResponseData *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hypothesis, a3);
    uint64_t v11 = [v8 copy];
    lastFireTimeOfAlertOffsetFromTravelTime = v10->_lastFireTimeOfAlertOffsetFromTravelTime;
    v10->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v11;
  }
  return v10;
}

- (CALNTriggeredEventNotificationResponseData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hypothesis"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFireTimeOfAlertOffsetFromTravelTime"];

  id v7 = [(CALNTriggeredEventNotificationResponseData *)self initWithHypothesis:v5 lastFireTimeOfAlertOffsetFromTravelTime:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CALNTriggeredEventNotificationResponseData *)self hypothesis];
  [v4 encodeObject:v5 forKey:@"hypothesis"];

  id v6 = [(CALNTriggeredEventNotificationResponseData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  [v4 encodeObject:v6 forKey:@"lastFireTimeOfAlertOffsetFromTravelTime"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNTriggeredEventNotificationResponseData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  id v6 = [(CALNTriggeredEventNotificationResponseData *)self hypothesis];
  id v7 = [v3 stringWithFormat:@"<%@: %p>(lastFireTimeOfAlertOffsetFromTravelTime = %@, hypothesis = %@)", v4, self, v5, v6];

  return v7;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
}

@end