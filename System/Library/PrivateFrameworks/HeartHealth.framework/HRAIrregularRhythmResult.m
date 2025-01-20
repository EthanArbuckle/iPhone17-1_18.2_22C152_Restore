@interface HRAIrregularRhythmResult
- (BOOL)tachogramShouldBeRequested;
- (BOOL)userShouldBeAlerted;
- (NSDictionary)metricsForCoreAnalytics;
- (NSMutableSet)negativeUUIDs;
- (NSMutableSet)positiveUUIDs;
- (NSMutableSet)uuidsForNextCycle;
- (void)setMetricsForCoreAnalytics:(id)a3;
- (void)setNegativeUUIDs:(id)a3;
- (void)setPositiveUUIDs:(id)a3;
- (void)setTachogramShouldBeRequested:(BOOL)a3;
- (void)setUserShouldBeAlerted:(BOOL)a3;
- (void)setUuidsForNextCycle:(id)a3;
@end

@implementation HRAIrregularRhythmResult

- (BOOL)tachogramShouldBeRequested
{
  return self->_tachogramShouldBeRequested;
}

- (void)setTachogramShouldBeRequested:(BOOL)a3
{
  self->_tachogramShouldBeRequested = a3;
}

- (BOOL)userShouldBeAlerted
{
  return self->_userShouldBeAlerted;
}

- (void)setUserShouldBeAlerted:(BOOL)a3
{
  self->_userShouldBeAlerted = a3;
}

- (NSMutableSet)uuidsForNextCycle
{
  return self->_uuidsForNextCycle;
}

- (void)setUuidsForNextCycle:(id)a3
{
}

- (NSMutableSet)negativeUUIDs
{
  return self->_negativeUUIDs;
}

- (void)setNegativeUUIDs:(id)a3
{
}

- (NSMutableSet)positiveUUIDs
{
  return self->_positiveUUIDs;
}

- (void)setPositiveUUIDs:(id)a3
{
}

- (NSDictionary)metricsForCoreAnalytics
{
  return self->_metricsForCoreAnalytics;
}

- (void)setMetricsForCoreAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_positiveUUIDs, 0);
  objc_storeStrong((id *)&self->_negativeUUIDs, 0);

  objc_storeStrong((id *)&self->_uuidsForNextCycle, 0);
}

@end