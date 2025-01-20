@interface IDSWiProxDidConnectToPeerMetric
- (IDSWiProxDidConnectToPeerMetric)initWithDuration:(unint64_t)a3 resultCode:(unint64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unint64_t)duration;
- (unint64_t)resultCode;
@end

@implementation IDSWiProxDidConnectToPeerMetric

- (NSString)name
{
  return (NSString *)@"WiProxDidConnectToPeer";
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

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_resultCode(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"resultCode", v19);
  }

  return (NSDictionary *)v3;
}

- (IDSWiProxDidConnectToPeerMetric)initWithDuration:(unint64_t)a3 resultCode:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSWiProxDidConnectToPeerMetric;
  result = [(IDSWiProxDidConnectToPeerMetric *)&v7 init];
  if (result)
  {
    result->_duration = a3;
    result->_resultCode = a4;
  }
  return result;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)resultCode
{
  return self->_resultCode;
}

@end