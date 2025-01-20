@interface IDSCommandNiceGroupSessionRTCMetric
- (BOOL)success;
- (IDSCommandNiceGroupSessionRTCMetric)initWithCommand:(int64_t)a3 success:(BOOL)a4 errorDomain:(id)a5 errorCode:(int64_t)a6 retryCount:(int64_t)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSString)errorDomain;
- (NSString)name;
- (int64_t)command;
- (int64_t)errorCode;
- (int64_t)retryCount;
- (unsigned)rtcType;
@end

@implementation IDSCommandNiceGroupSessionRTCMetric

- (NSString)name
{
  return (NSString *)@"IDSCommandNiceGroupSessionRTC";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_command(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"command", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_success(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithBool_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"success", v19);
  }

  v23 = objc_msgSend_errorDomain(self, v20, v21, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"errorDomain", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_errorCode(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"errorCode", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_retryCount(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"retryCount", v39);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeIDSCommandNiceGroupSessionRTC;
}

- (IDSCommandNiceGroupSessionRTCMetric)initWithCommand:(int64_t)a3 success:(BOOL)a4 errorDomain:(id)a5 errorCode:(int64_t)a6 retryCount:(int64_t)a7
{
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSCommandNiceGroupSessionRTCMetric;
  uint64_t v14 = [(IDSCommandNiceGroupSessionRTCMetric *)&v17 init];
  double v15 = v14;
  if (v14)
  {
    v14->_command = a3;
    v14->_success = a4;
    objc_storeStrong((id *)&v14->_errorDomain, a5);
    v15->_errorCode = a6;
    v15->_retryCount = a7;
  }

  return v15;
}

- (int64_t)command
{
  return self->_command;
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
}

@end