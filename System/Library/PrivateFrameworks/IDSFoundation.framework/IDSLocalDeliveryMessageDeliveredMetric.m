@interface IDSLocalDeliveryMessageDeliveredMetric
- (BOOL)isToDefaultPairedDevice;
- (IDSLocalDeliveryMessageDeliveredMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (unint64_t)RTT;
- (unint64_t)deliveryError;
- (unint64_t)linkType;
- (unint64_t)messageSize;
- (unint64_t)priority;
@end

@implementation IDSLocalDeliveryMessageDeliveredMetric

- (NSString)name
{
  return (NSString *)@"IDSLocalDeliveryMessageDelivered";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_service(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_isToDefaultPairedDevice(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"isToDefaultPairedDevice", v15);
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
  uint64_t v36 = objc_msgSend_deliveryError(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"deliveryError", v39);
  }

  v40 = NSNumber;
  uint64_t v44 = objc_msgSend_RTT(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithUnsignedLongLong_(v40, v45, v44, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"RTT", v47);
  }

  v48 = NSNumber;
  uint64_t v52 = objc_msgSend_priority(self, v49, v50, v51);
  v55 = objc_msgSend_numberWithUnsignedLongLong_(v48, v53, v52, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"priority", v55);
  }

  return (NSDictionary *)v3;
}

- (IDSLocalDeliveryMessageDeliveredMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9
{
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IDSLocalDeliveryMessageDeliveredMetric;
  v17 = [(IDSLocalDeliveryMessageDeliveredMetric *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_service, a3);
    v18->_isToDefaultPairedDevice = a4;
    v18->_messageSize = a5;
    v18->_linkType = a6;
    v18->_deliveryError = a7;
    v18->_RTT = a8;
    v18->_priority = a9;
  }

  return v18;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)deliveryError
{
  return self->_deliveryError;
}

- (unint64_t)RTT
{
  return self->_RTT;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end