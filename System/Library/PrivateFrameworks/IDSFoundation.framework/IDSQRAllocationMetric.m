@interface IDSQRAllocationMetric
- (IDSQRAllocationMetric)initWithDuration:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (NSString)topic;
- (unint64_t)duration;
- (unsigned)hasRecipientAccepted;
- (unsigned)payloadSize;
- (unsigned)result;
@end

@implementation IDSQRAllocationMetric

- (NSString)name
{
  return (NSString *)@"QRAllocation";
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
  uint64_t v16 = objc_msgSend_result(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"result", v19);
  }

  v20 = NSNumber;
  uint64_t hasRecipientAccepted = objc_msgSend_hasRecipientAccepted(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithUnsignedInt_(v20, v25, hasRecipientAccepted, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"hasRecipientAccepted", v27);
  }

  v28 = NSNumber;
  uint64_t v32 = objc_msgSend_payloadSize(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithUnsignedInt_(v28, v33, v32, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"payloadSize", v35);
  }

  v39 = objc_msgSend_topic(self, v36, v37, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"topic", v39);
  }

  v43 = objc_msgSend_service(self, v40, v41, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"service", v43);
  }

  return (NSDictionary *)v3;
}

- (IDSQRAllocationMetric)initWithDuration:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)IDSQRAllocationMetric;
  v17 = [(IDSQRAllocationMetric *)&v20 init];
  double v18 = v17;
  if (v17)
  {
    v17->_duration = a3;
    v17->_result = a4;
    v17->_uint64_t hasRecipientAccepted = a5;
    v17->_payloadSize = a6;
    objc_storeStrong((id *)&v17->_topic, a7);
    objc_storeStrong((id *)&v18->_service, a8);
  }

  return v18;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)hasRecipientAccepted
{
  return self->_hasRecipientAccepted;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end