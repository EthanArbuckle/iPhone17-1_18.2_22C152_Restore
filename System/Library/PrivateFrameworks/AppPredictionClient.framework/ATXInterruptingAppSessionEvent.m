@interface ATXInterruptingAppSessionEvent
+ (BOOL)supportsSecureCoding;
- (ATXInterruptingAppSessionEvent)initWithCoder:(id)a3;
- (ATXInterruptingAppSessionEvent)initWithInterruptingBundleID:(id)a3 interruptedBundleID:(id)a4 eventStartTime:(id)a5 eventEndTime:(id)a6 interruptingCategory:(unint64_t)a7 interruptedCategory:(unint64_t)a8;
- (NSDate)endTime;
- (NSDate)eventTime;
- (NSDate)startTime;
- (NSString)bundleID;
- (NSString)interruptedBundleID;
- (NSString)interruptingBundleID;
- (unint64_t)interruptedCategory;
- (unint64_t)interruptingCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInterruptingAppSessionEvent

- (ATXInterruptingAppSessionEvent)initWithInterruptingBundleID:(id)a3 interruptedBundleID:(id)a4 eventStartTime:(id)a5 eventEndTime:(id)a6 interruptingCategory:(unint64_t)a7 interruptedCategory:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXInterruptingAppSessionEvent;
  v18 = [(ATXInterruptingAppSessionEvent *)&v24 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    interruptingBundleID = v18->_interruptingBundleID;
    v18->_interruptingBundleID = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    interruptedBundleID = v18->_interruptedBundleID;
    v18->_interruptedBundleID = (NSString *)v21;

    objc_storeStrong((id *)&v18->_startTime, a5);
    objc_storeStrong((id *)&v18->_endTime, a6);
    v18->_interruptingCategory = a7;
    v18->_interruptedCategory = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(ATXInterruptingAppSessionEvent *)self interruptingBundleID];
  [v8 encodeObject:v4 forKey:@"interruptingBundleID"];

  v5 = [(ATXInterruptingAppSessionEvent *)self interruptedBundleID];
  [v8 encodeObject:v5 forKey:@"interruptedBundleID"];

  v6 = [(ATXInterruptingAppSessionEvent *)self startTime];
  [v8 encodeObject:v6 forKey:@"startTime"];

  v7 = [(ATXInterruptingAppSessionEvent *)self endTime];
  [v8 encodeObject:v7 forKey:@"endTime"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXInterruptingAppSessionEvent interruptingCategory](self, "interruptingCategory"), @"interruptingCategory");
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXInterruptingAppSessionEvent interruptedCategory](self, "interruptedCategory"), @"interruptedCategory");
}

- (ATXInterruptingAppSessionEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interruptingBundleID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interruptedBundleID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"interruptingCategory"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"interruptedCategory"];

  v11 = [(ATXInterruptingAppSessionEvent *)self initWithInterruptingBundleID:v5 interruptedBundleID:v6 eventStartTime:v7 eventEndTime:v8 interruptingCategory:v9 interruptedCategory:v10];
  return v11;
}

- (NSDate)eventTime
{
  return self->_startTime;
}

- (NSString)bundleID
{
  return self->_interruptingBundleID;
}

- (NSString)interruptingBundleID
{
  return self->_interruptingBundleID;
}

- (NSString)interruptedBundleID
{
  return self->_interruptedBundleID;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (unint64_t)interruptingCategory
{
  return self->_interruptingCategory;
}

- (unint64_t)interruptedCategory
{
  return self->_interruptedCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_interruptedBundleID, 0);

  objc_storeStrong((id *)&self->_interruptingBundleID, 0);
}

@end