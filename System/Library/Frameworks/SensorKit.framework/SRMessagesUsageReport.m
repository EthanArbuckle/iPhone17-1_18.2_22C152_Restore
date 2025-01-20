@interface SRMessagesUsageReport
+ (BOOL)supportsSecureCoding;
+ (SRMessagesUsageReport)usageReportWithInterval:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSInteger)totalIncomingMessages;
- (NSInteger)totalOutgoingMessages;
- (NSInteger)totalUniqueContacts;
- (NSMutableSet)uniqueContacts;
- (NSString)description;
- (NSTimeInterval)duration;
- (SRMessagesUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRMessagesUsageReport)initWithCoder:(id)a3;
- (double)startTime;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalIncomingMessages:(int64_t)a3;
- (void)setTotalOutgoingMessages:(int64_t)a3;
- (void)setUniqueContacts:(id)a3;
@end

@implementation SRMessagesUsageReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 609, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeInteger:self->_totalOutgoingMessages forKey:@"totalOutgoingMsg"];
  [a3 encodeInteger:self->_totalIncomingMessages forKey:@"totalIncomingMsg"];
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRMessagesUsageReport totalUniqueContacts](self, "totalUniqueContacts"), @"totalUniqueContacts");
  double duration = self->_duration;

  [a3 encodeDouble:@"duration" forKey:duration];
}

- (SRMessagesUsageReport)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 621, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v10.receiver = self;
  v10.super_class = (Class)SRMessagesUsageReport;
  v6 = [(SRMessagesUsageReport *)&v10 init];
  if (v6)
  {
    [a3 decodeDoubleForKey:@"startTime"];
    v6->_startTime = v7;
    [a3 decodeDoubleForKey:@"duration"];
    v6->_double duration = v8;
    v6->_totalOutgoingMessages = [a3 decodeIntegerForKey:@"totalOutgoingMsg"];
    v6->_totalIncomingMessages = [a3 decodeIntegerForKey:@"totalIncomingMsg"];
    v6->_totalUniqueContacts = [a3 decodeIntegerForKey:@"totalUniqueContacts"];
  }
  return v6;
}

- (void)dealloc
{
  [(SRMessagesUsageReport *)self setUniqueContacts:0];
  v3.receiver = self;
  v3.super_class = (Class)SRMessagesUsageReport;
  [(SRMessagesUsageReport *)&v3 dealloc];
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SRMessagesUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRMessagesUsageReport;
    double v7 = [(SRMessagesUsageReport *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
      if (v8)
      {
        v9 = (void *)v8;

        return (SRMessagesUsageReport *)v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

+ (SRMessagesUsageReport)usageReportWithInterval:(id)a3
{
  v4 = objc_alloc_init(SRMessagesUsageReport);
  objc_msgSend((id)objc_msgSend(a3, "startDate"), "srAbsoluteTime");
  -[SRMessagesUsageReport setStartTime:](v4, "setStartTime:");
  [a3 duration];
  -[SRMessagesUsageReport setDuration:](v4, "setDuration:");
  -[SRMessagesUsageReport setUniqueContacts:](v4, "setUniqueContacts:", [MEMORY[0x263EFF9C0] set]);

  return v4;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(SRMessagesUsageReport *)self startTime];
  uint64_t v7 = v6;
  [(SRMessagesUsageReport *)self duration];
  return (NSString *)[v3 stringWithFormat:@"%@ {Start time: %f, duration: %f, totalUniqueContacts: %lu, totalIncomingMessages: %lu, totalOutgoingMessages: %lu}", v5, v7, v8, -[SRMessagesUsageReport totalUniqueContacts](self, "totalUniqueContacts"), -[SRMessagesUsageReport totalIncomingMessages](self, "totalIncomingMessages"), -[SRMessagesUsageReport totalOutgoingMessages](self, "totalOutgoingMessages")];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  double duration = self->_duration;
  [a3 duration];
  if (duration != v6) {
    return 0;
  }
  int64_t totalOutgoingMessages = self->_totalOutgoingMessages;
  if (totalOutgoingMessages != [a3 totalOutgoingMessages]) {
    return 0;
  }
  int64_t totalIncomingMessages = self->_totalIncomingMessages;
  if (totalIncomingMessages != [a3 totalIncomingMessages]) {
    return 0;
  }
  NSInteger v9 = [(SRMessagesUsageReport *)self totalUniqueContacts];
  return v9 == [a3 totalUniqueContacts];
}

- (id)sr_dictionaryRepresentation
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = @"duration";
  v5[0] = [NSNumber numberWithDouble:self->_duration];
  v4[1] = @"totalOutgoingMsg";
  v5[1] = [NSNumber numberWithInteger:self->_totalOutgoingMessages];
  v4[2] = @"totalIncomingMsg";
  v5[2] = [NSNumber numberWithInteger:self->_totalIncomingMessages];
  v4[3] = @"totalUniqueContacts";
  v5[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRMessagesUsageReport totalUniqueContacts](self, "totalUniqueContacts"));
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

- (NSInteger)totalUniqueContacts
{
  uniqueContacts = self->_uniqueContacts;
  if (uniqueContacts) {
    return [(NSMutableSet *)uniqueContacts count];
  }
  else {
    return self->_totalUniqueContacts;
  }
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSInteger)totalOutgoingMessages
{
  return self->_totalOutgoingMessages;
}

- (void)setTotalOutgoingMessages:(int64_t)a3
{
  self->_int64_t totalOutgoingMessages = a3;
}

- (NSInteger)totalIncomingMessages
{
  return self->_totalIncomingMessages;
}

- (void)setTotalIncomingMessages:(int64_t)a3
{
  self->_int64_t totalIncomingMessages = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableSet)uniqueContacts
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUniqueContacts:(id)a3
{
}

@end