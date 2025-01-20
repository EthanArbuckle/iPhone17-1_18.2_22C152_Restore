@interface IDSRegistrationOperationGetDependentRegistrationsMetric
- (BOOL)success;
- (IDSRegistrationOperationGetDependentRegistrationsMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationType:(unsigned int)a7 genericError:(id)a8 URLError:(id)a9 POSIXError:(id)a10;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)POSIXError;
- (NSNumber)URLError;
- (NSNumber)genericError;
- (NSString)guid;
- (NSString)name;
- (unsigned)connectionType;
- (unsigned)registrationError;
- (unsigned)resultCode;
@end

@implementation IDSRegistrationOperationGetDependentRegistrationsMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationOperationGetDependentRegistrations";
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

  v43 = objc_msgSend_genericError(self, v40, v41, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"genericError", v43);
  }

  v47 = objc_msgSend_URLError(self, v44, v45, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"URLError", v47);
  }

  v51 = objc_msgSend_POSIXError(self, v48, v49, v50);
  if (v51) {
    CFDictionarySetValue(v3, @"POSIXError", v51);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationOperationGetDependentRegistrationsMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationType:(unsigned int)a7 genericError:(id)a8 URLError:(id)a9 POSIXError:(id)a10
{
  id v23 = a3;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)IDSRegistrationOperationGetDependentRegistrationsMetric;
  uint64_t v18 = [(IDSRegistrationOperationGetDependentRegistrationsMetric *)&v24 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    v19->_success = a4;
    v19->_connectionType = a5;
    v19->_resultCode = a6;
    v19->_registrationError = a7;
    objc_storeStrong((id *)&v19->_genericError, a8);
    objc_storeStrong((id *)&v19->_URLError, a9);
    objc_storeStrong((id *)&v19->_POSIXError, a10);
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
  objc_storeStrong((id *)&self->_guid, 0);
}

@end