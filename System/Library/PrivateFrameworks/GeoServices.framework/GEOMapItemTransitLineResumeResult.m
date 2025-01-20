@interface GEOMapItemTransitLineResumeResult
- (BOOL)blocked;
- (GEOTransitDepartureSequence)departureSequence;
- (NSDate)earliestNextDepartureDate;
- (void)setBlocked:(BOOL)a3;
- (void)setDepartureSequence:(id)a3;
- (void)setEarliestNextDepartureDate:(id)a3;
@end

@implementation GEOMapItemTransitLineResumeResult

- (BOOL)blocked
{
  return self->_blocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_blocked = a3;
}

- (GEOTransitDepartureSequence)departureSequence
{
  return self->_departureSequence;
}

- (void)setDepartureSequence:(id)a3
{
}

- (NSDate)earliestNextDepartureDate
{
  return self->_earliestNextDepartureDate;
}

- (void)setEarliestNextDepartureDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestNextDepartureDate, 0);

  objc_storeStrong((id *)&self->_departureSequence, 0);
}

@end