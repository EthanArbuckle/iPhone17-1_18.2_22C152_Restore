@interface IDSOTRSessionNegotiationMetric
- (IDSOTRSessionNegotiationMetric)initWithService:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (unint64_t)duration;
- (unint64_t)priority;
- (unsigned)result;
@end

@implementation IDSOTRSessionNegotiationMetric

- (NSString)name
{
  return (NSString *)@"OTRSessionNegotiation";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  service = self->_service;
  if (service) {
    CFDictionarySetValue(v3, @"service", service);
  }
  v8 = NSNumber;
  uint64_t v9 = objc_msgSend_priority(self, v4, (uint64_t)service, v5);
  v12 = objc_msgSend_numberWithUnsignedLongLong_(v8, v10, v9, v11);
  if (v12) {
    CFDictionarySetValue(v6, @"priority", v12);
  }

  v13 = NSNumber;
  uint64_t v17 = objc_msgSend_duration(self, v14, v15, v16);
  v20 = objc_msgSend_numberWithUnsignedLongLong_(v13, v18, v17, v19);
  if (v20) {
    CFDictionarySetValue(v6, @"duration", v20);
  }

  v21 = NSNumber;
  uint64_t v25 = objc_msgSend_result(self, v22, v23, v24);
  v28 = objc_msgSend_numberWithUnsignedInt_(v21, v26, v25, v27);
  if (v28) {
    CFDictionarySetValue(v6, @"result", v28);
  }

  return (NSDictionary *)v6;
}

- (IDSOTRSessionNegotiationMetric)initWithService:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSOTRSessionNegotiationMetric;
  v12 = [(IDSOTRSessionNegotiationMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    v13->_priority = a4;
    v13->_duration = a5;
    v13->_result = a6;
  }

  return v13;
}

- (NSString)service
{
  return self->_service;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (void).cxx_destruct
{
}

@end