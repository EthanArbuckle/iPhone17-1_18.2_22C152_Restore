@interface ATXUsageInsightsPhubbingEvent
+ (BOOL)supportsSecureCoding;
- (ATXUsageInsightsPhubbingEvent)initWithCoder:(id)a3;
- (ATXUsageInsightsPhubbingEvent)initWithRelationshipType:(id)a3 startTime:(id)a4 endTime:(id)a5 duration:(double)a6 appSessions:(id)a7;
- (NSArray)appSessions;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)relationshipType;
- (double)duration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUsageInsightsPhubbingEvent

- (ATXUsageInsightsPhubbingEvent)initWithRelationshipType:(id)a3 startTime:(id)a4 endTime:(id)a5 duration:(double)a6 appSessions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ATXUsageInsightsPhubbingEvent;
  v16 = [(ATXUsageInsightsPhubbingEvent *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    relationshipType = v16->_relationshipType;
    v16->_relationshipType = (NSString *)v17;

    objc_storeStrong((id *)&v16->_startTime, a4);
    objc_storeStrong((id *)&v16->_endTime, a5);
    v16->_duration = a6;
    uint64_t v19 = [v15 copy];
    appSessions = v16->_appSessions;
    v16->_appSessions = (NSArray *)v19;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXUsageInsightsPhubbingEvent *)self relationshipType];
  [v4 encodeObject:v5 forKey:@"relationshipType"];

  v6 = [(ATXUsageInsightsPhubbingEvent *)self startTime];
  [v4 encodeObject:v6 forKey:@"startTime"];

  v7 = [(ATXUsageInsightsPhubbingEvent *)self endTime];
  [v4 encodeObject:v7 forKey:@"endTime"];

  [(ATXUsageInsightsPhubbingEvent *)self duration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"duration");
  id v8 = [(ATXUsageInsightsPhubbingEvent *)self appSessions];
  [v4 encodeObject:v8 forKey:@"appSessions"];
}

- (ATXUsageInsightsPhubbingEvent)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relationshipType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
  [v4 decodeDoubleForKey:@"duration"];
  double v9 = v8;
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v12 = [v10 setWithArray:v11];
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"appSessions"];

  id v14 = [(ATXUsageInsightsPhubbingEvent *)self initWithRelationshipType:v5 startTime:v6 endTime:v7 duration:v13 appSessions:v9];
  return v14;
}

- (NSString)relationshipType
{
  return self->_relationshipType;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSArray)appSessions
{
  return self->_appSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_relationshipType, 0);
}

@end