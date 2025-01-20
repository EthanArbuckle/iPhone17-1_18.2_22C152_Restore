@interface IDSRegistrationOperationRegisterMetric
- (BOOL)isHeartbeatRegister;
- (BOOL)success;
- (IDSRegistrationOperationRegisterMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationType:(unsigned int)a7 isHeartbeatRegister:(BOOL)a8 heartbeatDelay:(id)a9 genericError:(id)a10 URLError:(id)a11 POSIXError:(id)a12;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)POSIXError;
- (NSNumber)URLError;
- (NSNumber)genericError;
- (NSNumber)heartbeatDelay;
- (NSString)guid;
- (NSString)name;
- (unsigned)connectionType;
- (unsigned)registrationError;
- (unsigned)resultCode;
@end

@implementation IDSRegistrationOperationRegisterMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationOperationRegister";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_success(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"success", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_connectionType(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"connectionType", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_resultCode(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"resultCode", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_registrationError(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedInt_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"registrationError", v39);
  }

  v40 = NSNumber;
  uint64_t isHeartbeatRegister = objc_msgSend_isHeartbeatRegister(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithBool_(v40, v45, isHeartbeatRegister, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"isHeartbeatRegister", v47);
  }

  v51 = objc_msgSend_heartbeatDelay(self, v48, v49, v50);
  if (v51) {
    CFDictionarySetValue(v3, @"heartbeatDelay", v51);
  }

  v55 = objc_msgSend_genericError(self, v52, v53, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"genericError", v55);
  }

  v59 = objc_msgSend_URLError(self, v56, v57, v58);
  if (v59) {
    CFDictionarySetValue(v3, @"URLError", v59);
  }

  v63 = objc_msgSend_POSIXError(self, v60, v61, v62);
  if (v63) {
    CFDictionarySetValue(v3, @"POSIXError", v63);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationOperationRegisterMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationType:(unsigned int)a7 isHeartbeatRegister:(BOOL)a8 heartbeatDelay:(id)a9 genericError:(id)a10 URLError:(id)a11 POSIXError:(id)a12
{
  id v26 = a3;
  id v25 = a9;
  id v15 = a10;
  id v16 = a11;
  id v17 = a12;
  v27.receiver = self;
  v27.super_class = (Class)IDSRegistrationOperationRegisterMetric;
  uint64_t v18 = [(IDSRegistrationOperationRegisterMetric *)&v27 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    v19->_success = a4;
    v19->_connectionType = a5;
    v19->_resultCode = a6;
    v19->_registrationError = a7;
    v19->_uint64_t isHeartbeatRegister = a8;
    objc_storeStrong((id *)&v19->_heartbeatDelay, a9);
    objc_storeStrong((id *)&v19->_genericError, a10);
    objc_storeStrong((id *)&v19->_URLError, a11);
    objc_storeStrong((id *)&v19->_POSIXError, a12);
  }

  return v19;
}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (BOOL)isHeartbeatRegister
{
  return self->_isHeartbeatRegister;
}

- (NSNumber)heartbeatDelay
{
  return self->_heartbeatDelay;
}

- (NSNumber)genericError
{
  return self->_genericError;
}

- (NSNumber)URLError
{
  return self->_URLError;
}

- (NSNumber)POSIXError
{
  return self->_POSIXError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_POSIXError, 0);
  objc_storeStrong((id *)&self->_URLError, 0);
  objc_storeStrong((id *)&self->_genericError, 0);
  objc_storeStrong((id *)&self->_heartbeatDelay, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end