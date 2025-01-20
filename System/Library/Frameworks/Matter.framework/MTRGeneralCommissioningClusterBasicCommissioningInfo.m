@interface MTRGeneralCommissioningClusterBasicCommissioningInfo
- (MTRGeneralCommissioningClusterBasicCommissioningInfo)init;
- (NSNumber)failSafeExpiryLengthSeconds;
- (NSNumber)maxCumulativeFailsafeSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFailSafeExpiryLengthSeconds:(NSNumber *)failSafeExpiryLengthSeconds;
- (void)setMaxCumulativeFailsafeSeconds:(NSNumber *)maxCumulativeFailsafeSeconds;
@end

@implementation MTRGeneralCommissioningClusterBasicCommissioningInfo

- (MTRGeneralCommissioningClusterBasicCommissioningInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRGeneralCommissioningClusterBasicCommissioningInfo;
  v2 = [(MTRGeneralCommissioningClusterBasicCommissioningInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    failSafeExpiryLengthSeconds = v2->_failSafeExpiryLengthSeconds;
    v2->_failSafeExpiryLengthSeconds = (NSNumber *)&unk_26F9C8620;

    maxCumulativeFailsafeSeconds = v3->_maxCumulativeFailsafeSeconds;
    v3->_maxCumulativeFailsafeSeconds = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralCommissioningClusterBasicCommissioningInfo);
  objc_super v7 = objc_msgSend_failSafeExpiryLengthSeconds(self, v5, v6);
  objc_msgSend_setFailSafeExpiryLengthSeconds_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_maxCumulativeFailsafeSeconds(self, v9, v10);
  objc_msgSend_setMaxCumulativeFailsafeSeconds_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: failSafeExpiryLengthSeconds:%@; maxCumulativeFailsafeSeconds:%@; >",
    v5,
    self->_failSafeExpiryLengthSeconds,
  objc_super v7 = self->_maxCumulativeFailsafeSeconds);

  return v7;
}

- (NSNumber)failSafeExpiryLengthSeconds
{
  return self->_failSafeExpiryLengthSeconds;
}

- (void)setFailSafeExpiryLengthSeconds:(NSNumber *)failSafeExpiryLengthSeconds
{
}

- (NSNumber)maxCumulativeFailsafeSeconds
{
  return self->_maxCumulativeFailsafeSeconds;
}

- (void)setMaxCumulativeFailsafeSeconds:(NSNumber *)maxCumulativeFailsafeSeconds
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCumulativeFailsafeSeconds, 0);

  objc_storeStrong((id *)&self->_failSafeExpiryLengthSeconds, 0);
}

@end