@interface OSAStabilityRate
- (NSNumber)MTBF;
- (OSAStabilityRate)initWithAppUptime:(double)a3 crashCount:(unint64_t)a4;
- (double)uptime;
- (unint64_t)crashCount;
@end

@implementation OSAStabilityRate

- (OSAStabilityRate)initWithAppUptime:(double)a3 crashCount:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)OSAStabilityRate;
  v6 = [(OSAStabilityRate *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_uptime = a3;
    v6->_crashCount = a4;
    if (a4)
    {
      uint64_t v8 = +[NSNumber numberWithDouble:a3 / (double)a4];
      MTBF = v7->_MTBF;
      v7->_MTBF = (NSNumber *)v8;
    }
  }
  return v7;
}

- (double)uptime
{
  return self->_uptime;
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (NSNumber)MTBF
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end