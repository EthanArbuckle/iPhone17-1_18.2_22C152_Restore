@interface _GEOTimeRange
- (BOOL)contains:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (_GEOTimeRange)initWithPBTimeRange:(GEOPBTransitTimeRange)a3;
- (_GEOTimeRange)initWithPDTimeRange:(GEOPDTimeRange)a3;
- (double)duration;
- (double)startTime;
@end

@implementation _GEOTimeRange

- (_GEOTimeRange)initWithPBTimeRange:(GEOPBTransitTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has = a3._has;
  uint64_t v4 = *(void *)&a3._duration;
  v6.receiver = self;
  v6.super_class = (Class)_GEOTimeRange;
  result = [(_GEOTimeRange *)&v6 init];
  if (result)
  {
    *(void *)&result->_pbTimeRange._duration = v4;
    result->_pbTimeRange._$B85216D09A238EDB5177F50F3CAD2EB5 has = has;
    result->_usePB = 1;
  }
  return result;
}

- (_GEOTimeRange)initWithPDTimeRange:(GEOPDTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has = a3._has;
  uint64_t v4 = *(void *)&a3._duration;
  v6.receiver = self;
  v6.super_class = (Class)_GEOTimeRange;
  result = [(_GEOTimeRange *)&v6 init];
  if (result)
  {
    *(void *)&result->_pdTimeRange._duration = v4;
    result->_pdTimeRange._$B85216D09A238EDB5177F50F3CAD2EB5 has = has;
    result->_usePB = 0;
  }
  return result;
}

- (double)startTime
{
  uint64_t v3 = 12;
  if (!self->_usePB) {
    uint64_t v3 = 24;
  }
  LODWORD(v2) = *(_DWORD *)((char *)&self->super.isa + v3);
  return (double)v2;
}

- (double)duration
{
  uint64_t v3 = 8;
  if (!self->_usePB) {
    uint64_t v3 = 20;
  }
  LODWORD(v2) = *(_DWORD *)((char *)&self->super.isa + v3);
  return (double)v2;
}

- (NSDate)startDate
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(_GEOTimeRange *)self startTime];

  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (NSDate)endDate
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(_GEOTimeRange *)self startTime];
  double v5 = v4;
  [(_GEOTimeRange *)self duration];
  double v7 = v5 + v6;

  return (NSDate *)[v3 dateWithTimeIntervalSinceReferenceDate:v7];
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  double v5 = [(_GEOTimeRange *)self endDate];
  uint64_t v6 = [v5 compare:v4];

  if (v6 == -1)
  {
    BOOL v8 = 0;
  }
  else
  {
    double v7 = [(_GEOTimeRange *)self startDate];
    BOOL v8 = [v7 compare:v4] != 1;
  }
  return v8;
}

@end