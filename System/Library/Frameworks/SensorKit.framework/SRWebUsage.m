@interface SRWebUsage
+ (BOOL)supportsSecureCoding;
+ (SRWebUsage)webUsageWithTotalUsageTime:(double)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSTimeInterval)totalUsageTime;
- (SRWebUsage)initWithCoder:(id)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setTotalUsageTime:(double)a3;
@end

@implementation SRWebUsage

+ (SRWebUsage)webUsageWithTotalUsageTime:(double)a3
{
  v4 = objc_alloc_init(SRWebUsage);
  [(SRWebUsage *)v4 setTotalUsageTime:a3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 495, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [(SRWebUsage *)self totalUsageTime];

  objc_msgSend(a3, "encodeDouble:forKey:", @"totalUsageTime");
}

- (SRWebUsage)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 500, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v9.receiver = self;
  v9.super_class = (Class)SRWebUsage;
  v6 = [(SRWebUsage *)&v9 init];
  if (v6)
  {
    [a3 decodeDoubleForKey:@"totalUsageTime"];
    v6->_totalUsageTime = v7;
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SRWebUsage;
  [(SRWebUsage *)&v2 dealloc];
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
  double totalUsageTime = self->_totalUsageTime;
  [a3 totalUsageTime];
  return totalUsageTime == v6;
}

- (id)sr_dictionaryRepresentation
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"totalUsageTime";
  v4[0] = [NSNumber numberWithDouble:self->_totalUsageTime];
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ {totalUsageTime: %f}", NSStringFromClass(v4), *(void *)&self->_totalUsageTime];
}

- (NSTimeInterval)totalUsageTime
{
  return self->_totalUsageTime;
}

- (void)setTotalUsageTime:(double)a3
{
  self->_double totalUsageTime = a3;
}

@end