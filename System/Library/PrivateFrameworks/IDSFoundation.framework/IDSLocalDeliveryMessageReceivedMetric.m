@interface IDSLocalDeliveryMessageReceivedMetric
- (BOOL)isFromDefaultPairedDevice;
- (IDSLocalDeliveryMessageReceivedMetric)initWithService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (unint64_t)linkType;
- (unint64_t)messageSize;
- (unint64_t)priority;
@end

@implementation IDSLocalDeliveryMessageReceivedMetric

- (NSString)name
{
  return (NSString *)@"LocalDeliveryMessageReceived";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_service(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_isFromDefaultPairedDevice(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"isFromDefaultPairedDevice", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_messageSize(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"messageSize", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_linkType(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"linkType", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_priority(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"priority", v39);
  }

  return (NSDictionary *)v3;
}

- (IDSLocalDeliveryMessageReceivedMetric)initWithService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSLocalDeliveryMessageReceivedMetric;
  double v14 = [(IDSLocalDeliveryMessageReceivedMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    v15->_isFromDefaultPairedDevice = a4;
    v15->_messageSize = a5;
    v15->_linkType = a6;
    v15->_priority = a7;
  }

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isFromDefaultPairedDevice
{
  return self->_isFromDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end