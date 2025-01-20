@interface IDSWiProxDidSendDataMetric
- (IDSWiProxDidSendDataMetric)initWithResultCode:(unint64_t)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (unint64_t)resultCode;
@end

@implementation IDSWiProxDidSendDataMetric

- (NSString)name
{
  return (NSString *)@"WiProxDidSendData";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_resultCode(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"resultCode", v11);
  }

  return (NSDictionary *)v3;
}

- (IDSWiProxDidSendDataMetric)initWithResultCode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSWiProxDidSendDataMetric;
  result = [(IDSWiProxDidSendDataMetric *)&v5 init];
  if (result) {
    result->_resultCode = a3;
  }
  return result;
}

- (unint64_t)resultCode
{
  return self->_resultCode;
}

@end