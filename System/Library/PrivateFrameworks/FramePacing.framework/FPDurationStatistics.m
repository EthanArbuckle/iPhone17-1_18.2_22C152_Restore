@interface FPDurationStatistics
- (FPDurationStatistics)init;
- (double)averageMs;
- (double)averageNs;
- (double)averageSec;
- (double)internalMinSec;
- (double)maxMs;
- (double)maxNs;
- (double)maxSec;
- (double)minMs;
- (double)minNs;
- (double)minSec;
- (double)stddevMs;
- (double)stddevNs;
- (double)stddevSec;
- (double)totalDurationMs;
- (double)totalDurationNs;
- (double)totalDurationSec;
- (double)totalDurationSecSquared;
- (unsigned)count;
- (void)addDurationSec:(double)a3;
- (void)reset;
- (void)setTotalDurationSec:(double)a3;
- (void)setTotalDurationSecSquared:(double)a3;
@end

@implementation FPDurationStatistics

- (void)reset
{
  self->_count = 0;
  self->_totalDurationSecSquared = 0.0;
  self->_internalMinSec = 1.79769313e308;
  self->_maxSec = 0.0;
  self->_totalDurationSec = 0.0;
}

- (double)stddevMs
{
  [(FPDurationStatistics *)self stddevSec];
  return v2 * 1000.0;
}

- (double)minMs
{
  [(FPDurationStatistics *)self minSec];
  return v2 * 1000.0;
}

- (double)minSec
{
  [(FPDurationStatistics *)self internalMinSec];
  if (v3 == 1.79769313e308) {
    return 0.0;
  }

  [(FPDurationStatistics *)self internalMinSec];
  return result;
}

- (double)maxMs
{
  [(FPDurationStatistics *)self maxSec];
  return v2 * 1000.0;
}

- (double)averageSec
{
  if (![(FPDurationStatistics *)self count]) {
    return 0.0;
  }
  [(FPDurationStatistics *)self totalDurationSec];
  return v3 / (double)[(FPDurationStatistics *)self count];
}

- (double)stddevSec
{
  if ([(FPDurationStatistics *)self count] < 2) {
    return 0.0;
  }
  [(FPDurationStatistics *)self totalDurationSecSquared];
  double v5 = v4;
  [(FPDurationStatistics *)self totalDurationSec];
  double v7 = v6;
  [(FPDurationStatistics *)self totalDurationSec];
  return sqrt((v5 - v7 * v8 / (double)[(FPDurationStatistics *)self count])/ (double)[(FPDurationStatistics *)self count]);
}

- (unsigned)count
{
  return self->_count;
}

- (double)averageMs
{
  [(FPDurationStatistics *)self averageSec];
  return v2 * 1000.0;
}

- (double)totalDurationSec
{
  return self->_totalDurationSec;
}

- (double)totalDurationSecSquared
{
  return self->_totalDurationSecSquared;
}

- (void)addDurationSec:(double)a3
{
  if (a3 != -1.0 && a3 >= 0.0)
  {
    ++self->_count;
    [(FPDurationStatistics *)self internalMinSec];
    if (v5 >= a3) {
      double v5 = a3;
    }
    self->_internalMinSec = v5;
    [(FPDurationStatistics *)self maxSec];
    if (v6 < a3) {
      double v6 = a3;
    }
    double totalDurationSecSquared = self->_totalDurationSecSquared;
    double v8 = self->_totalDurationSec + a3;
    self->_maxSec = v6;
    self->_totalDurationSec = v8;
    self->_double totalDurationSecSquared = totalDurationSecSquared + a3 * a3;
  }
}

- (double)internalMinSec
{
  return self->_internalMinSec;
}

- (double)maxSec
{
  return self->_maxSec;
}

- (FPDurationStatistics)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPDurationStatistics;
  double result = [(FPDurationStatistics *)&v3 init];
  if (result) {
    result->_internalMinSec = 1.79769313e308;
  }
  return result;
}

- (double)minNs
{
  [(FPDurationStatistics *)self minSec];
  return v2 * 1000000000.0;
}

- (double)maxNs
{
  [(FPDurationStatistics *)self maxSec];
  return v2 * 1000000000.0;
}

- (double)averageNs
{
  [(FPDurationStatistics *)self averageSec];
  return v2 * 1000000000.0;
}

- (double)stddevNs
{
  [(FPDurationStatistics *)self stddevSec];
  return v2 * 1000000000.0;
}

- (double)totalDurationNs
{
  [(FPDurationStatistics *)self totalDurationSec];
  return v2 * 1000000000.0;
}

- (double)totalDurationMs
{
  [(FPDurationStatistics *)self totalDurationSec];
  return v2 * 1000.0;
}

- (void)setTotalDurationSec:(double)a3
{
  self->_totalDurationSec = a3;
}

- (void)setTotalDurationSecSquared:(double)a3
{
  self->_double totalDurationSecSquared = a3;
}

@end