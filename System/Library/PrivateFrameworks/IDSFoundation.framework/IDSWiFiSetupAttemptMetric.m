@interface IDSWiFiSetupAttemptMetric
- (IDSWiFiSetupAttemptMetric)initWithAttemptType:(unint64_t)a3 msDuration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSString)client;
- (NSString)name;
- (unint64_t)attemptType;
- (unint64_t)msDuration;
- (unint64_t)result;
@end

@implementation IDSWiFiSetupAttemptMetric

- (NSString)name
{
  return (NSString *)@"WiFiSetupAttempt";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_attemptType(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithUnsignedLongLong_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"attemptType", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_msDuration(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"msDuration", v19);
  }

  v20 = NSNumber;
  uint64_t v24 = objc_msgSend_result(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"result", v27);
  }

  v31 = objc_msgSend_client(self, v28, v29, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"client", v31);
  }

  return (NSDictionary *)v3;
}

- (IDSWiFiSetupAttemptMetric)initWithAttemptType:(unint64_t)a3 msDuration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IDSWiFiSetupAttemptMetric;
  v12 = [(IDSWiFiSetupAttemptMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_attemptType = a3;
    v12->_msDuration = a4;
    v12->_result = a5;
    objc_storeStrong((id *)&v12->_client, a6);
  }

  return v13;
}

- (unint64_t)attemptType
{
  return self->_attemptType;
}

- (unint64_t)msDuration
{
  return self->_msDuration;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSString)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end