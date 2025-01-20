@interface SRPhoneUsageReport
+ (BOOL)supportsSecureCoding;
+ (SRPhoneUsageReport)usageReportWithInterval:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSInteger)totalIncomingCalls;
- (NSInteger)totalOutgoingCalls;
- (NSInteger)totalUniqueContacts;
- (NSMutableSet)uniqueContacts;
- (NSString)description;
- (NSTimeInterval)duration;
- (NSTimeInterval)totalPhoneCallDuration;
- (SRPhoneUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRPhoneUsageReport)initWithCoder:(id)a3;
- (double)startTime;
- (id)binarySampleRepresentation;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setTotalIncomingCalls:(int64_t)a3;
- (void)setTotalOutgoingCalls:(int64_t)a3;
- (void)setTotalPhoneCallDuration:(double)a3;
- (void)setUniqueContacts:(id)a3;
@end

@implementation SRPhoneUsageReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 717, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeDouble:@"duration" forKey:self->_duration];
  [a3 encodeInteger:self->_totalOutgoingCalls forKey:@"totalOutgoingCall"];
  [a3 encodeInteger:self->_totalIncomingCalls forKey:@"totalIncomingCall"];
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRPhoneUsageReport totalUniqueContacts](self, "totalUniqueContacts"), @"totalUniqueContacts");
  double totalPhoneCallDuration = self->_totalPhoneCallDuration;

  [a3 encodeDouble:@"totalCallDuration" forKey:totalPhoneCallDuration];
}

- (SRPhoneUsageReport)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 728, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v11.receiver = self;
  v11.super_class = (Class)SRPhoneUsageReport;
  v6 = [(SRPhoneUsageReport *)&v11 init];
  if (v6)
  {
    [a3 decodeDoubleForKey:@"startTime"];
    v6->_startTime = v7;
    [a3 decodeDoubleForKey:@"duration"];
    v6->_duration = v8;
    v6->_totalOutgoingCalls = [a3 decodeIntegerForKey:@"totalOutgoingCall"];
    v6->_totalIncomingCalls = [a3 decodeIntegerForKey:@"totalIncomingCall"];
    v6->_totalUniqueContacts = [a3 decodeIntegerForKey:@"totalUniqueContacts"];
    [a3 decodeDoubleForKey:@"totalCallDuration"];
    v6->_double totalPhoneCallDuration = v9;
  }
  return v6;
}

- (void)dealloc
{
  [(SRPhoneUsageReport *)self setUniqueContacts:0];
  v3.receiver = self;
  v3.super_class = (Class)SRPhoneUsageReport;
  [(SRPhoneUsageReport *)&v3 dealloc];
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SRPhoneUsageReport)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRPhoneUsageReport;
    double v7 = [(SRPhoneUsageReport *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
      if (v8)
      {
        double v9 = (void *)v8;

        return (SRPhoneUsageReport *)v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

+ (SRPhoneUsageReport)usageReportWithInterval:(id)a3
{
  v4 = objc_alloc_init(SRPhoneUsageReport);
  objc_msgSend((id)objc_msgSend(a3, "startDate"), "srAbsoluteTime");
  -[SRPhoneUsageReport setStartTime:](v4, "setStartTime:");
  [a3 duration];
  -[SRPhoneUsageReport setDuration:](v4, "setDuration:");
  -[SRPhoneUsageReport setUniqueContacts:](v4, "setUniqueContacts:", [MEMORY[0x263EFF9C0] set]);

  return v4;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(SRPhoneUsageReport *)self startTime];
  uint64_t v7 = v6;
  [(SRPhoneUsageReport *)self duration];
  uint64_t v9 = v8;
  [(SRPhoneUsageReport *)self totalPhoneCallDuration];
  return (NSString *)[v3 stringWithFormat:@"%@ {Start time: %f, duration: %f, totalPhoneCallDuration: %f, totalUniqueContacts: %lu, totalIncomingCalls: %lu, totalOutgoingCalls: %lu}", v5, v7, v9, v10, -[SRPhoneUsageReport totalUniqueContacts](self, "totalUniqueContacts"), -[SRPhoneUsageReport totalIncomingCalls](self, "totalIncomingCalls"), -[SRPhoneUsageReport totalOutgoingCalls](self, "totalOutgoingCalls")];
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
  int64_t totalOutgoingCalls = self->_totalOutgoingCalls;
  if (totalOutgoingCalls != [a3 totalOutgoingCalls]) {
    return 0;
  }
  int64_t totalIncomingCalls = self->_totalIncomingCalls;
  if (totalIncomingCalls != [a3 totalIncomingCalls]) {
    return 0;
  }
  NSInteger v9 = [(SRPhoneUsageReport *)self totalUniqueContacts];
  if (v9 != [a3 totalUniqueContacts]) {
    return 0;
  }
  double totalPhoneCallDuration = self->_totalPhoneCallDuration;
  [a3 totalPhoneCallDuration];
  return totalPhoneCallDuration == v11;
}

- (id)sr_dictionaryRepresentation
{
  v5[5] = *MEMORY[0x263EF8340];
  v4[0] = @"duration";
  v5[0] = [NSNumber numberWithDouble:self->_duration];
  v4[1] = @"totalOutgoingCall";
  v5[1] = [NSNumber numberWithInteger:self->_totalOutgoingCalls];
  v4[2] = @"totalIncomingCall";
  v5[2] = [NSNumber numberWithInteger:self->_totalIncomingCalls];
  v4[3] = @"totalUniqueContacts";
  v5[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[SRPhoneUsageReport totalUniqueContacts](self, "totalUniqueContacts"));
  v4[4] = @"totalCallDuration";
  v5[4] = [NSNumber numberWithDouble:self->_totalPhoneCallDuration];
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSInteger)totalOutgoingCalls
{
  return self->_totalOutgoingCalls;
}

- (void)setTotalOutgoingCalls:(int64_t)a3
{
  self->_int64_t totalOutgoingCalls = a3;
}

- (NSInteger)totalIncomingCalls
{
  return self->_totalIncomingCalls;
}

- (void)setTotalIncomingCalls:(int64_t)a3
{
  self->_int64_t totalIncomingCalls = a3;
}

- (NSTimeInterval)totalPhoneCallDuration
{
  return self->_totalPhoneCallDuration;
}

- (void)setTotalPhoneCallDuration:(double)a3
{
  self->_double totalPhoneCallDuration = a3;
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
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUniqueContacts:(id)a3
{
}

@end