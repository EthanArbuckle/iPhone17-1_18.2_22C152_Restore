@interface IDSNoteMessageReceivedMetric
- (BOOL)fromStorage;
- (IDSNoteMessageReceivedMetric)initWithService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)accountType;
- (NSString)name;
- (NSString)service;
- (double)localTimeDelta;
- (double)serverTimestamp;
@end

@implementation IDSNoteMessageReceivedMetric

- (NSString)name
{
  return (NSString *)@"IDSNoteMessageReceived";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_service(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service", v7);
  }

  v11 = objc_msgSend_accountType(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"accountType", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_fromStorage(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"fromStorage", v19);
  }

  v20 = NSNumber;
  objc_msgSend_serverTimestamp(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithDouble_(v20, v24, v25, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"serverTimestamp", v27);
  }

  v28 = NSNumber;
  objc_msgSend_localTimeDelta(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithDouble_(v28, v32, v33, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"localTimeDelta", v35);
  }

  return (NSDictionary *)v3;
}

- (IDSNoteMessageReceivedMetric)initWithService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IDSNoteMessageReceivedMetric;
  double v15 = [(IDSNoteMessageReceivedMetric *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_service, a3);
    objc_storeStrong((id *)&v16->_accountType, a4);
    v16->_fromStorage = a5;
    v16->_serverTimestamp = a6;
    v16->_localTimeDelta = a7;
  }

  return v16;
}

- (NSString)service
{
  return self->_service;
}

- (NSNumber)accountType
{
  return self->_accountType;
}

- (BOOL)fromStorage
{
  return self->_fromStorage;
}

- (double)serverTimestamp
{
  return self->_serverTimestamp;
}

- (double)localTimeDelta
{
  return self->_localTimeDelta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end