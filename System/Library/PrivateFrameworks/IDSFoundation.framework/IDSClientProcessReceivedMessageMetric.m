@interface IDSClientProcessReceivedMessageMetric
- (IDSClientProcessReceivedMessageMetric)initWithServiceIdentifier:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)serviceIdentifier;
- (unint64_t)deltaTime;
- (unint64_t)messageSize;
- (unint64_t)priority;
@end

@implementation IDSClientProcessReceivedMessageMetric

- (NSString)name
{
  return (NSString *)@"IDSClientProcessReceivedMessage";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_serviceIdentifier(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"serviceIdentifier", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_messageSize(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithUnsignedLongLong_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"messageSize", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_deltaTime(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"deltaTime", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_priority(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"priority", v31);
  }

  return (NSDictionary *)v3;
}

- (IDSClientProcessReceivedMessageMetric)initWithServiceIdentifier:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSClientProcessReceivedMessageMetric;
  uint64_t v12 = [(IDSClientProcessReceivedMessageMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceIdentifier, a3);
    v13->_messageSize = a4;
    v13->_deltaTime = a5;
    v13->_priority = a6;
  }

  return v13;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)deltaTime
{
  return self->_deltaTime;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end