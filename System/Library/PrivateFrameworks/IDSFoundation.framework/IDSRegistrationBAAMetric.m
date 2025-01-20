@interface IDSRegistrationBAAMetric
- (BOOL)success;
- (IDSRegistrationBAAMetric)initWithSuccess:(BOOL)a3 error:(id)a4 deviceID:(id)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSError)error;
- (NSString)description;
- (NSString)deviceID;
- (NSString)name;
- (unsigned)rtcType;
@end

@implementation IDSRegistrationBAAMetric

- (IDSRegistrationBAAMetric)initWithSuccess:(BOOL)a3 error:(id)a4 deviceID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSRegistrationBAAMetric;
  v11 = [(IDSRegistrationBAAMetric *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_deviceID, a5);
  }

  return v12;
}

- (NSString)description
{
  v5 = NSString;
  v6 = objc_msgSend_name(self, a2, v2, v3);
  if (objc_msgSend_success(self, v7, v8, v9)) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  objc_super v14 = objc_msgSend_error(self, v10, v11, v12);
  v18 = objc_msgSend_deviceID(self, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"%@: <success: %@, error: %@, deviceID: %@>", v20, v6, v13, v14, v18);

  return (NSString *)v21;
}

- (NSString)name
{
  return (NSString *)@"BAASuccess";
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_success(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_numberWithBool_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"Success", v11);
  }

  v15 = objc_msgSend_error(self, v12, v13, v14);

  if (v15)
  {
    v19 = objc_msgSend_error(self, v16, v17, v18);
    v23 = objc_msgSend_domain(v19, v20, v21, v22);

    if (v23) {
      CFDictionarySetValue(v3, @"ErrorDomain", v23);
    }

    v24 = NSNumber;
    v28 = objc_msgSend_error(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_code(v28, v29, v30, v31);
    v35 = objc_msgSend_numberWithInteger_(v24, v33, v32, v34);

    if (v35) {
      CFDictionarySetValue(v3, @"ErrorCode", v35);
    }
  }
  v36 = objc_msgSend_deviceID(self, v16, v17, v18);
  if (v36) {
    CFDictionarySetValue(v3, @"DeviceID", v36);
  }

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationBAA;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end