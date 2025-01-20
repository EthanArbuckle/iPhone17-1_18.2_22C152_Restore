@interface IDSGFTMetricsMembershipChange
- (IDSGFTMetricsMembershipChange)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6;
- (double)referenceTime;
- (void)receivedKMOverPushFromToken:(id)a3;
- (void)receivedKMOverPushViaCacheForToken:(id)a3;
- (void)receivedKMOverPushViaCacheForToken:(id)a3 atTime:(double)a4;
- (void)receivedKMOverQRFromToken:(id)a3;
- (void)receivedKMOverQUICFromToken:(id)a3;
- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3;
- (void)sendRatchetedKMtoAVCForToken:(id)a3;
@end

@implementation IDSGFTMetricsMembershipChange

- (IDSGFTMetricsMembershipChange)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)IDSGFTMetricsMembershipChange;
  v6 = [(IDSGFTMetricsReferencePoint *)&v10 initWithFromType:a3 fromUniqueID:a4 anonymizer:a5 templateDictionary:a6];
  if (v6)
  {
    double v7 = ids_monotonic_time();
    v6->_referenceTime = v7;
    objc_msgSend_event_uniqueID_time_(v6, v8, @"mc", v7, @"IDSGFTMetricsWildcard");
  }
  return v6;
}

- (double)referenceTime
{
  return self->_referenceTime;
}

- (void)receivedKMOverQRFromToken:(id)a3
{
}

- (void)receivedKMOverPushFromToken:(id)a3
{
}

- (void)receivedKMOverPushViaCacheForToken:(id)a3
{
}

- (void)receivedKMOverPushViaCacheForToken:(id)a3 atTime:(double)a4
{
}

- (void)receivedKMOverQUICFromToken:(id)a3
{
}

- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3
{
}

- (void)sendRatchetedKMtoAVCForToken:(id)a3
{
}

@end