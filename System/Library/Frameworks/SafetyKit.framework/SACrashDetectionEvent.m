@interface SACrashDetectionEvent
+ (BOOL)supportsSecureCoding;
+ (double)crashDetectionEventTimeout;
- (BOOL)isNotified;
- (CLLocation)location;
- (NSDate)date;
- (NSDate)timeOfResolution;
- (SACrashDetectionEvent)initWithCoder:(id)a3;
- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6;
- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6 isNotified:(BOOL)a7;
- (SACrashDetectionEventResponse)response;
- (double)elapsed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsNotified:(BOOL)a3;
@end

@implementation SACrashDetectionEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SACrashDetectionEvent;
  v14 = [(SACrashDetectionEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    objc_storeStrong((id *)&v15->_timeOfResolution, a4);
    v15->_response = a5;
    objc_storeStrong((id *)&v15->_location, a6);
    v15->_isNotified = 0;
  }

  return v15;
}

- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6 isNotified:(BOOL)a7
{
  result = [(SACrashDetectionEvent *)self initWithTimeOfDetection:a3 timeOfResolution:a4 response:a5 location:a6];
  if (result) {
    result->_isNotified = a7;
  }
  return result;
}

- (SACrashDetectionEvent)initWithCoder:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 decodeDoubleForKey:@"kSACrashDetectionEventTimeOfDetection"];
  v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  id v8 = objc_alloc(MEMORY[0x263EFF910]);
  [v5 decodeDoubleForKey:@"kSACrashDetectionEventTimeOfResolution"];
  v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
  uint64_t v10 = [v5 decodeIntegerForKey:@"kSACrashDetectionEventResponse"];
  id v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kSACrashDetectionEventLocation"];
  uint64_t v12 = [v5 decodeBoolForKey:@"kSACrashDetectionEventIsNotified"];

  id v13 = [(SACrashDetectionEvent *)self initWithTimeOfDetection:v7 timeOfResolution:v9 response:v10 location:v11 isNotified:v12];
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  date = self->_date;
  int64_t response = self->_response;
  location = self->_location;
  timeOfResolution = self->_timeOfResolution;
  BOOL isNotified = self->_isNotified;

  return (id)[v4 initWithTimeOfDetection:date timeOfResolution:timeOfResolution response:response location:location isNotified:isNotified];
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [(NSDate *)date timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kSACrashDetectionEventTimeOfDetection");
  [(NSDate *)self->_timeOfResolution timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kSACrashDetectionEventTimeOfResolution");
  [v5 encodeInteger:self->_response forKey:@"kSACrashDetectionEventResponse"];
  [v5 encodeObject:self->_location forKey:@"kSACrashDetectionEventLocation"];
  [v5 encodeBool:self->_isNotified forKey:@"kSACrashDetectionEventIsNotified"];
}

- (double)elapsed
{
  v2 = [(SACrashDetectionEvent *)self date];
  [v2 timeIntervalSinceNow];
  double v4 = -v3;

  return v4;
}

- (id)description
{
  double v3 = NSString;
  double v4 = [(SACrashDetectionEvent *)self date];
  SACrashDetectionEventResponse v5 = [(SACrashDetectionEvent *)self response];
  id v6 = [(SACrashDetectionEvent *)self location];
  v7 = [v3 stringWithFormat:@"SACrashDetectionEvent - date: %@, response: %ld, location: %@, notified: %d", v4, v5, v6, -[SACrashDetectionEvent isNotified](self, "isNotified")];

  return v7;
}

+ (double)crashDetectionEventTimeout
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  double v3 = [v2 valueForKey:@"SACrashDetectionEventTimeout"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3600.0;
  }

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (SACrashDetectionEventResponse)response
{
  return self->_response;
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)isNotified
{
  return self->_isNotified;
}

- (void)setIsNotified:(BOOL)a3
{
  self->_BOOL isNotified = a3;
}

- (NSDate)timeOfResolution
{
  return self->_timeOfResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfResolution, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end