@interface IDSWiProxConnectionSuccessMetric
- (IDSWiProxConnectionSuccessMetric)initWithDuration:(unint64_t)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unint64_t)duration;
@end

@implementation IDSWiProxConnectionSuccessMetric

- (NSString)name
{
  return (NSString *)@"WiProxConnectionSuccess";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_duration(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"duration", v11);
  }

  return (NSDictionary *)v3;
}

- (IDSWiProxConnectionSuccessMetric)initWithDuration:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSWiProxConnectionSuccessMetric;
  result = [(IDSWiProxConnectionSuccessMetric *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

- (unint64_t)duration
{
  return self->_duration;
}

@end