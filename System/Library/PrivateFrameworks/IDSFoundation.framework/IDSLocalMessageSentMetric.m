@interface IDSLocalMessageSentMetric
- (BOOL)isToDefaultPairedDevice;
- (IDSLocalMessageSentMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(int64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7;
- (NSCopying)awdRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (int64_t)messageSize;
- (int64_t)priority;
- (unint64_t)linkType;
- (unsigned)awdIdentifier;
@end

@implementation IDSLocalMessageSentMetric

- (IDSLocalMessageSentMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(int64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7
{
  id v12 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IDSLocalMessageSentMetric;
  v15 = [(IDSLocalMessageSentMetric *)&v20 init];
  if (v15)
  {
    uint64_t v17 = objc_msgSend_copy(v12, v13, v14, v16);
    service = v15->_service;
    v15->_service = (NSString *)v17;

    v15->_isToDefaultPairedDevice = a4;
    v15->_messageSize = a5;
    v15->_linkType = a6;
    v15->_priority = a7;
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)@"LocalMessageSent";
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

  double v16 = NSNumber;
  uint64_t v20 = objc_msgSend_messageSize(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
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
  v39 = objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"priority", v39);
  }

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555908;
}

- (NSCopying)awdRepresentation
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  v7 = objc_msgSend_service(self, v4, v5, v6);
  objc_msgSend_setService_(v3, v8, (uint64_t)v7, v9);

  unsigned int v13 = objc_msgSend_isToDefaultPairedDevice(self, v10, v11, v12);
  objc_msgSend_setIsToDefaultPairedDevice_(v3, v14, v13, v15);
  uint64_t v19 = objc_msgSend_messageSize(self, v16, v17, v18);
  objc_msgSend_setMessageSize_(v3, v20, v19, v21);
  uint64_t v25 = objc_msgSend_linkType(self, v22, v23, v24);
  objc_msgSend_setLinkType_(v3, v26, v25, v27);
  uint64_t v31 = objc_msgSend_priority(self, v28, v29, v30);
  objc_msgSend_setPriority_(v3, v32, v31, v33);
  return (NSCopying *)v3;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (int64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end