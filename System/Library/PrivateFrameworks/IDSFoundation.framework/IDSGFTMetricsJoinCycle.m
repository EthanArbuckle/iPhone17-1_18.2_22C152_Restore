@interface IDSGFTMetricsJoinCycle
- (IDSGFTMetricsJoinCycle)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6;
- (void)decryptedBlobOverQUIC:(id)a3;
- (void)localDidJoin;
- (void)localDidJoinAtTime:(double)a3;
- (void)receivedAllocateResponseAtTime:(double)a3;
- (void)receivedKMOverPush;
- (void)receivedKMOverPushViaCache;
- (void)receivedKMOverPushViaCacheAtTime:(double)a3;
- (void)receivedKMOverQR;
- (void)receivedKMOverQUIC;
- (void)receivedPreKeyOverPush;
- (void)receivedPreKeyOverQUIC;
- (void)receivedUnverifiedKMOverQUIC;
- (void)remoteDidBecomeActive;
- (void)remoteDidJoin;
- (void)requestedKM;
@end

@implementation IDSGFTMetricsJoinCycle

- (IDSGFTMetricsJoinCycle)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)IDSGFTMetricsJoinCycle;
  result = [(IDSGFTMetricsReferencePoint *)&v7 initWithFromType:a3 fromUniqueID:a4 anonymizer:a5 templateDictionary:a6];
  if (result) {
    result->_remoteActiveTime = -1.0;
  }
  return result;
}

- (void)receivedAllocateResponseAtTime:(double)a3
{
}

- (void)localDidJoin
{
  objc_msgSend_event_(self, a2, @"lj", v2);
}

- (void)localDidJoinAtTime:(double)a3
{
}

- (void)remoteDidJoin
{
  objc_msgSend_event_(self, a2, @"rj", v2);
}

- (void)remoteDidBecomeActive
{
  if (self->_remoteActiveTime < 0.0)
  {
    double v4 = ids_monotonic_time();
    self->_remoteActiveTime = v4;
    objc_msgSend_event_(self, v3, @"ra", v4);
  }
}

- (void)receivedKMOverQR
{
  objc_msgSend_event_(self, a2, @"km-qr", v2);
}

- (void)receivedKMOverPush
{
  objc_msgSend_event_(self, a2, @"km-push", v2);
}

- (void)receivedKMOverPushViaCache
{
  objc_msgSend_event_(self, a2, @"km-push-cache", v2);
}

- (void)receivedKMOverPushViaCacheAtTime:(double)a3
{
}

- (void)receivedKMOverQUIC
{
  objc_msgSend_event_(self, a2, @"km-quic", v2);
}

- (void)receivedUnverifiedKMOverQUIC
{
  objc_msgSend_event_(self, a2, @"km-quic-uv", v2);
}

- (void)requestedKM
{
  objc_msgSend_event_(self, a2, @"req-km", v2);
}

- (void)receivedPreKeyOverPush
{
  objc_msgSend_event_(self, a2, @"pk-push", v2);
}

- (void)receivedPreKeyOverQUIC
{
  objc_msgSend_event_(self, a2, @"pk-quic", v2);
}

- (void)decryptedBlobOverQUIC:(id)a3
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"%@-quic", v3, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);
}

@end