@interface IDSMagnetDataCorruptionRecoveryTimeInMsMetric
- (IDSMagnetDataCorruptionRecoveryTimeInMsMetric)initWithRecoveryTime:(int64_t)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (int64_t)recoveryTime;
@end

@implementation IDSMagnetDataCorruptionRecoveryTimeInMsMetric

- (NSString)name
{
  return (NSString *)@"IDSMagnetDataCorruptionRecoveryTimeInMs";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_recoveryTime(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithLongLong_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"recoveryTime", v11);
  }

  return (NSDictionary *)v3;
}

- (IDSMagnetDataCorruptionRecoveryTimeInMsMetric)initWithRecoveryTime:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSMagnetDataCorruptionRecoveryTimeInMsMetric;
  result = [(IDSMagnetDataCorruptionRecoveryTimeInMsMetric *)&v5 init];
  if (result) {
    result->_recoveryTime = a3;
  }
  return result;
}

- (int64_t)recoveryTime
{
  return self->_recoveryTime;
}

@end